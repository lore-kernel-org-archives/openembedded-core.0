Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.3838.1595469540020983634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 18:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K3lOAwxF;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a1so4635374ejg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 18:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YsuP38jcX0ijFj5has/nNvXt9kW2K35AQ3rOH4aVaF4=;
        b=K3lOAwxFBK4PEZcLAt1ORjPDA33rzysBqKs/LZni1uQbw1OrQZ9/V6ee8seLtMuIqo
         6X5PiYpAfMad2x0vbwe+daGt/ZPGMrYbdCbWClgzcCRanMV1jl6OalmzEhQCsYY9YMI9
         qRpx52EjhRbreAgjM8vP677GVTnlGHBYYtk+paqjsEVrnMbYHlci58Q+SsbLuKqoTeWm
         sR5jNaXha99x+MqvOfRgjACRRNq45XyjIkwwQl7QqNasRfLvQGoEGVIF+8ixWkDL9WPO
         vw0JmHg4S/oxXTdNVNTHid15xGz1RBA6i9EVGCwUR2tv1+gOXNJ7ZAw+hX7GsDJFVPgF
         lWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YsuP38jcX0ijFj5has/nNvXt9kW2K35AQ3rOH4aVaF4=;
        b=Oiqt23E7x4/7tKpEic+TB7/BeWP5acAGQIgZXBhmO1hArqyFdchpy/ZA7Mztsa6gmt
         3/fq0hvjoN3s8zIb4dFX4pMOJ2ZAHnAYUBEi/mGBTzCnkn6t4ajpVgX+2s4l2vy0Z0G/
         sR8JMYBO2xYTLfjKQzTP0h/WVw77wmQNa4DSyDXqH7GRIvr48igtkCO2K+HGtY1H1gCb
         zbUTLJqaek0O7sF6EVs5M6H4X88Y1m9MfFWFuEMBJJkJMc1pxpwdxS7u307LH8rsmqG1
         uSSc0op8ltKs5boWFT/rlnLqWlTKjxATPyX5tv2wjay7uX3mtdJ/SaW7zj9PZgjjNzpN
         UUFQ==
X-Gm-Message-State: AOAM532uODEdSlPV1pGCJnJ6JerWhaQgtsDeD3QGvH0PklaEx3z+2b7B
	kihDQxjW+IvN38WQl/Oh6jAx19HOZ2kUni8ngmI=
X-Google-Smtp-Source: ABdhPJyS4r9VcwoWUtiVF/Z2uerMANzzdI9gRWG5bejh/srYIvn1JBBamOjk1e4vwssOxGHw3jKWZh9GvDgdFm/AYJM=
X-Received: by 2002:a17:907:205c:: with SMTP id pg28mr2173732ejb.22.1595469538436;
 Wed, 22 Jul 2020 18:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com> <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
In-Reply-To: <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 22 Jul 2020 21:58:47 -0400
Message-ID: <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
> Just an FYI, but when this was submitted, my imx7s-warp builds began to =
fail when building linux-fslc from meta-freescale / meta-freescale-3rdparty=
.
>
> I'm not sure why yet, I've only discovered the problem, but I thought I'=
d report it in case anyone else sees the problem.
>

Someone already sent a dunfell backport request for a follow up patch to t=
his.

It went to the poky list, but I just replied to it and copied oe-core.

Bruce


Bruce

> Here's a link to my failing build for reference:
> https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=3Drpb,MAC=
HINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/consoleText
>
> And a snippet from the failure:
>
> ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme: Ex=
ecution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueab=
i/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.71=
23' failed with exit code 1:
> WARNING: exit code 1 from a shell command.
>
> ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-glibc/work/im=
x7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/te=
mp/log.do_kernel_configme.7123
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['virtual:native:/srv/oe/build/conf/../.=
./layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_po=
pulate_sysroot', '/srv/oe/build/conf/../../layers/openembedded-core/meta/re=
cipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot', '/sr=
v/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/binuti=
ls/binutils-cross_2.34.bb:do_populate_sysroot', '/srv/oe/build/conf/../../l=
ayers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do=
_populate_sysroot', 'virtual:native:/srv/oe/build/conf/../../layers/openemb=
edded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',=
 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/rec=
ipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', '/srv/oe/build/conf/../=
../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.=
2.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['bison-native', 'kern-to=
ols-native', 'binutils-cross-arm', 'quilt-native', 'patch-native', 'bc-nati=
ve', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native', 'gnu-config-na=
tive', 'readline-native', 'libtool-native', 'automake-native', 'autoconf-na=
tive', 'xz-native', 'linux-libc-headers', 'gmp-native', 'libmpc-native', 'm=
pfr-native', 'zlib-native', 'gettext-minimal-native', 'attr-native', 'm4-na=
tive', 'ncurses-native', 'pkgconfig-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_kernel_configme
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linar=
o-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kern=
el_configme.7123' failed with exit code 1:
> | WARNING: exit code 1 from a shell command.
> |
> NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task do_kernel_=
configme: Failed
> ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/recipes-kern=
el/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exit code '1'
>
>
>
> On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com> wrote:
>>
>> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
>> >
>> > We have a fixup patch for this one in test right now, so we don't wan=
t
>> > this patch, without the follow up.
>> >
>> > But this is useful for dunfell, since it was an unexpected behaviour
>> > that needed to be fixed.
>>
>> Thanks, I'll drop this patch from the pull request and include it
>> along with the fixup patch in next week's patch set.
>>
>> Steve
>>
>> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com> wro=
te:
>> > >
>> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > >
>> > > It is uncommon that a BSP definition and a defconfig are used in
>> > > a single configuration. That being said, it is a valid way to
>> > > organize kernel configuration meta data.
>> > >
>> > > When a defconfig is used, either on the src_uri or from in
>> > > the kernel tree, it is normally expected that it is the baseline,
>> > > with all options applied on top of it.
>> > >
>> > > With this commit, we detect either type of defconfig and ensure
>> > > that it is used first, followed by the fragments in their
>> > > previous order. This allows existing configuration stacks to
>> > > remain the same, while ensuring that a defconfig combined stack
>> > > works as expected.
>> > >
>> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > > (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9caedf=
)
>> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> > > ---
>> > >  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++++++-------=
----
>> > >  1 file changed, 21 insertions(+), 12 deletions(-)
>> > >
>> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kerne=
l-yocto.bbclass
>> > > index 5bc627066e..41d8620e67 100644
>> > > --- a/meta/classes/kernel-yocto.bbclass
>> > > +++ b/meta/classes/kernel-yocto.bbclass
>> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
>> > >                         else
>> > >                                 cp -f ${S}/arch/${ARCH}/configs/${K=
BUILD_DEFCONFIG} ${WORKDIR}/defconfig
>> > >                         fi
>> > > -                       sccs=3D"${WORKDIR}/defconfig"
>> > > +                       in_tree_defconfig=3D"${WORKDIR}/defconfig"
>> > >                 else
>> > >                         bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCO=
NFIG}' was specified, but not present in the source tree"
>> > >                 fi
>> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
>> > >         patches=3D"${@" ".join(find_patches(d,''))}"
>> > >         feat_dirs=3D"${@" ".join(find_kernel_feature_dirs(d))}"
>> > >
>> > > -       # a quick check to make sure we don't have duplicate defcon=
figs
>> > > -       # If there's a defconfig in the SRC_URI, did we also have o=
ne from
>> > > -       # the KBUILD_DEFCONFIG processing above ?
>> > > -       if [ -n "$sccs" ]; then
>> > > -           # we did have a defconfig from above. remove any that m=
ight be in the src_uri
>> > > -           sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk '{ =
if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> > > +       # a quick check to make sure we don't have duplicate defcon=
figs If
>> > > +       # there's a defconfig in the SRC_URI, did we also have one =
from the
>> > > +       # KBUILD_DEFCONFIG processing above ?
>> > > +       src_uri_defconfig=3D$(echo $sccs_from_src_uri | awk '{ if (=
$0=3D=3D"defconfig") { print $0 } }' RS=3D' ')
>> > > +       # drop and defconfig's from the src_uri variable, we captur=
ed it just above here if it existed
>> > > +       sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk '{ if (=
$0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> > > +       if [ -n "$in_tree_defconfig" ]; then
>> > > +               sccs_defconfig=3D$in_tree_defconfig
>> > > +               if [ -n "$src_uri_defconfig" ]; then
>> > > +                       bbwarn "[NOTE]: defconfig was supplied both=
 via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
>> > > +               fi
>> > > +       else
>> > > +               # if we didn't have an in-tree one, make our defcon=
fig the one
>> > > +               # from the src_uri. Note: there may not have been o=
ne from the
>> > > +               # src_uri, so this can be an empty variable.
>> > > +               sccs_defconfig=3D$src_uri_defconfig
>> > >         fi
>> > > -       sccs=3D"$sccs $sccs_from_src_uri"
>> > > +       sccs=3D"$sccs_from_src_uri"
>> > >
>> > >         # check for feature directories/repos/branches that were pa=
rt of the
>> > >         # SRC_URI. If they were supplied, we convert them into incl=
ude directives
>> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
>> > >         # expand kernel features into their full path equivalents
>> > >         bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KM=
ACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})
>> > >         if [ -z "$bsp_definition" ]; then
>> > > -               echo "$sccs" | grep -q defconfig
>> > > -               if [ $? -ne 0 ]; then
>> > > +               if [ -z "$sccs_defconfig" ]; then
>> > >                         bbfatal_log "Could not locate BSP definitio=
n for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
>> > >                 fi
>> > > -
>> > > +       else
>> > >                 # if the bsp definition has "define KMETA_EXTERNAL_=
BSP t",
>> > >                 # then we need to set a flag that will instruct the=
 next
>> > >                 # steps to use the BSP as both configuration and pa=
tches.
>> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
>> > >         elements=3D"`echo -n ${bsp_definition} ${sccs} ${patches} $=
{KERNEL_FEATURES}`"
>> > >         if [ -n "${elements}" ]; then
>> > >                 echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_def=
inition
>> > > -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${in=
cludes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>> > > +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${in=
cludes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
>> > >                 if [ $? -ne 0 ]; then
>> > >                         bbfatal_log "Could not generate configurati=
on queue for ${KMACHINE}."
>> > >                 fi
>> > > --
>> > > 2.17.1
>> > >
>> > >
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>>=20



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
