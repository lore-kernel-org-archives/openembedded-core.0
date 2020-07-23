Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.10977.1595507245127461615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 05:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ri/Dcc/X;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a1so6151138ejg.12
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mi2dT2ViIUX/iXuaKychHJSLFdp73AIYMP/IaM6YdU0=;
        b=Ri/Dcc/X9X+/bi6HIMbLZ/Jyq+rgQZaBNcBTbF/jOBZ3dfudbm13qNko9sSy3sK4SP
         lrCK+4hyjVIMByZb4ao9EJObmRpsXIDGxZBrXSfJrIPHvwrCr7JavZOR/SiAKCcXLsbq
         avd2HM6AopFF4u0A04vT4uYOYpX5weYgLsjZb4673nauC+/dWM8RPCaC4uOwS1EylSJs
         UnChHsKR9qCdbpc+IM1btBXa8V/BeP2URQtWlA7UNL6vinSgKLOo5XzELyp2DasoSHPU
         N28Yey7E9R8Jw/IBnP3vo4MrWlYV7xxxerT3TDLAAVS94pE+aE1u4+ITEk1ge2oQX00P
         MA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mi2dT2ViIUX/iXuaKychHJSLFdp73AIYMP/IaM6YdU0=;
        b=oot0AROaOz+9oxacngBfsf7qQkRi7azkgB0Xjfrz/qWUmZDHd0jUpUNGiHPx4VyQyq
         wsGRdWg1WCKKvWCUguauJqyMVDitIusIbtkcoRe9ibvQUUl/K9YlTRzEKV8hH4csI/SJ
         ed7ySfyPODSXXXKL/y178VRljC28OnUBzyEQCrgzzk1dQphIjjWwkvfTulCU3oARsnHP
         f0PcJIUPMROvMKUni8SXm/Suiu2ch8uCRpFn73aoJ6yRu7QAzXvKwgqOdkPZsDOOePV/
         laf+92/uNOCVskvj2LMMyzVRYbDhSErjEZI6kr3Lh+edIqe9KKwv9gW6tAJ2UtkgPsKL
         4rhQ==
X-Gm-Message-State: AOAM530pVybTGGv0zUk6oaGYaBL8q0wW59U8AWPDFhDoOwK5Pxl4exKg
	vqE+AsqXPQUD+YuzGPvedlI/3TBl+VLMAyx44iY=
X-Google-Smtp-Source: ABdhPJx7xf17DN1XfDmFi2x8yEIJ7vhFiYJnYTMFQsGLAiitTL+E5zUeXCO2SQ09mFI41ZRESYgPJg93JJ9U5KHcolc=
X-Received: by 2002:a17:906:3685:: with SMTP id a5mr3871285ejc.298.1595507243339;
 Thu, 23 Jul 2020 05:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
 <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
 <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
 <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com> <CAD0U-hK0upC8OpXCU_FsHt_46gmcfMKO32Y2zjVKf-d27dviFw@mail.gmail.com>
In-Reply-To: <CAD0U-hK0upC8OpXCU_FsHt_46gmcfMKO32Y2zjVKf-d27dviFw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 23 Jul 2020 08:27:11 -0400
Message-ID: <CADkTA4M895FfQer_n4-5TF5ycq9g5nsmaHWqzCHiBCQwd4oR2w@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
> Hi Bruce, Steve,
>
> Thanks for your replies and the help.
>
> On Thu, 23 Jul 2020 at 04:33, Steve Sakoman <steve@sakoman.com> wrote:
>>
>> On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
>> >
>> > On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@linaro.org> =
wrote:
>> > >
>> > > Just an FYI, but when this was submitted, my imx7s-warp builds bega=
n to fail when building linux-fslc from meta-freescale / meta-freescale-3rd=
party.
>> > >
>> > > I'm not sure why yet, I've only discovered the problem, but I thoug=
ht I'd report it in case anyone else sees the problem.
>> > >
>> >
>> > Someone already sent a dunfell backport request for a follow up patch=
 to this.
>> >
>> > It went to the poky list, but I just replied to it and copied oe-core=
.
>>
>> Both patches are already in dunfell!
>>
>> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=
=3D7ecc81baeacaa1149a4947791200e8819c3df677
>> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=
=3D11089e06bfb3d0defb52825ffba978d085385569
>
>
> Yes, they are present. I guess I should have checked the error messages =
more closely during git bisect rather than stopping as soon as the build fa=
iled.
>
> After Bruce's 7ecc81baea patch, I see this error:
>
> ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_metadata: Co=
uld not locate BSP definition for imx7s-warp/standard and no defconfig was =
provided
>
> Then, after 11089e06bf, I see the error I originally posted from my CI j=
ob, but reproduced here from a local build:
>
> ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme: Ex=
ecution of '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7=
s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp=
/run.do_kernel_configme.31899' failed with exit code 1:
> WARNING: exit code 1 from a shell command.
>
> ERROR: Logfile of failure stored in: /data/warp7/workspace-dunfell/build=
-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+g=
itAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/data/warp7/workspace-dunfell/build-rp=
b/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cr=
oss_arm-9.2.bb:do_populate_sysroot', 'virtual:native:/data/warp7/workspace-=
dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-extended=
/bc/bc_1.07.1.bb:do_populate_sysroot', '/data/warp7/workspace-dunfell/build=
-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/bin=
utils-cross_2.34.bb:do_populate_sysroot', 'virtual:native:/data/warp7/works=
pace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-dev=
tools/bison/bison_3.5.3.bb:do_populate_sysroot', '/data/warp7/workspace-dun=
fell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/qu=
ilt/quilt-native_0.66.bb:do_populate_sysroot', '/data/warp7/workspace-dunfe=
ll/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-t=
ools/kern-tools-native_git.bb:do_populate_sysroot', 'virtual:native:/data/w=
arp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/r=
ecipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['gcc-cross-arm', 'bc-nat=
ive', 'binutils-cross-arm', 'bison-native', 'quilt-native', 'kern-tools-nat=
ive', 'patch-native', 'readline-native', 'flex-native', 'automake-native', =
'texinfo-dummy-native', 'autoconf-native', 'libtool-native', 'gnu-config-na=
tive', 'xz-native', 'gettext-minimal-native', 'libmpc-native', 'gmp-native'=
, 'zlib-native', 'mpfr-native', 'linux-libc-headers', 'attr-native', 'ncurs=
es-native', 'm4-native', 'pkgconfig-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_kernel_configme
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-g=
libc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6=
c3525e-r0/temp/run.do_kernel_configme.31899' failed with exit code 1:
> | WARNING: exit code 1 from a shell command.
>
> I haven't yet looked at what these patches do, but I'm expecting there's=
 something to update in the linux-fslc recipe, unless there's another issue=
 in the defconfig patches.
>

We've had multiple reports that with those patches the linux-fslc
recipe is building. So something else may be going on in your setup.

If you have a set of layers and build steps, can you send them to me ?
I can spin up a local build and see if I get the same behaviour.

Bruce

> Regards,
> Ryan.
>
>
>
>
>
>
>>
>>
>>
>> Steve
>>
>> > > Here's a link to my failing build for reference:
>> > > https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=3Drp=
b,MACHINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/consoleText
>> > >
>> > > And a snippet from the failure:
>> > >
>> > > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configm=
e: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-g=
nueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_config=
me.7123' failed with exit code 1:
>> > > WARNING: exit code 1 from a shell command.
>> > >
>> > > ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-glibc/wo=
rk/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-=
r0/temp/log.do_kernel_configme.7123
>> > > Log data follows:
>> > > | DEBUG: Executing python function extend_recipe_sysroot
>> > > | NOTE: Direct dependencies are ['virtual:native:/srv/oe/build/conf=
/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:=
do_populate_sysroot', '/srv/oe/build/conf/../../layers/openembedded-core/me=
ta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',=
 '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/b=
inutils/binutils-cross_2.34.bb:do_populate_sysroot', '/srv/oe/build/conf/..=
/../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.=
bb:do_populate_sysroot', 'virtual:native:/srv/oe/build/conf/../../layers/op=
enembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysr=
oot', 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/met=
a/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', '/srv/oe/build/con=
f/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_a=
rm-9.2.bb:do_populate_sysroot']
>> > > | NOTE: Installed into sysroot: []
>> > > | NOTE: Skipping as already exists in sysroot: ['bison-native', 'ke=
rn-tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-native', 'bc=
-native', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native', 'gnu-conf=
ig-native', 'readline-native', 'libtool-native', 'automake-native', 'autoco=
nf-native', 'xz-native', 'linux-libc-headers', 'gmp-native', 'libmpc-native=
', 'mpfr-native', 'zlib-native', 'gettext-minimal-native', 'attr-native', '=
m4-native', 'ncurses-native', 'pkgconfig-native']
>> > > | DEBUG: Python function extend_recipe_sysroot finished
>> > > | DEBUG: Executing shell function do_kernel_configme
>> > > | WARNING: exit code 1 from a shell command.
>> > > | ERROR: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-=
linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do=
_kernel_configme.7123' failed with exit code 1:
>> > > | WARNING: exit code 1 from a shell command.
>> > > |
>> > > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task do_ke=
rnel_configme: Failed
>> > > ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/recipes=
-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exit code '=
1'
>> > >
>> > >
>> > >
>> > > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com> wrot=
e:
>> > >>
>> > >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>> > >> >
>> > >> > We have a fixup patch for this one in test right now, so we don'=
t want
>> > >> > this patch, without the follow up.
>> > >> >
>> > >> > But this is useful for dunfell, since it was an unexpected behav=
iour
>> > >> > that needed to be fixed.
>> > >>
>> > >> Thanks, I'll drop this patch from the pull request and include it
>> > >> along with the fixup patch in next week's patch set.
>> > >>
>> > >> Steve
>> > >>
>> > >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com=
> wrote:
>> > >> > >
>> > >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > >> > >
>> > >> > > It is uncommon that a BSP definition and a defconfig are used =
in
>> > >> > > a single configuration. That being said, it is a valid way to
>> > >> > > organize kernel configuration meta data.
>> > >> > >
>> > >> > > When a defconfig is used, either on the src_uri or from in
>> > >> > > the kernel tree, it is normally expected that it is the baseli=
ne,
>> > >> > > with all options applied on top of it.
>> > >> > >
>> > >> > > With this commit, we detect either type of defconfig and ensur=
e
>> > >> > > that it is used first, followed by the fragments in their
>> > >> > > previous order. This allows existing configuration stacks to
>> > >> > > remain the same, while ensuring that a defconfig combined stac=
k
>> > >> > > works as expected.
>> > >> > >
>> > >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > >> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.=
org>
>> > >> > > (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9=
caedf)
>> > >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> > >> > > ---
>> > >> > >  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++++++--=
---------
>> > >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
>> > >> > >
>> > >> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/=
kernel-yocto.bbclass
>> > >> > > index 5bc627066e..41d8620e67 100644
>> > >> > > --- a/meta/classes/kernel-yocto.bbclass
>> > >> > > +++ b/meta/classes/kernel-yocto.bbclass
>> > >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
>> > >> > >                         else
>> > >> > >                                 cp -f ${S}/arch/${ARCH}/config=
s/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
>> > >> > >                         fi
>> > >> > > -                       sccs=3D"${WORKDIR}/defconfig"
>> > >> > > +                       in_tree_defconfig=3D"${WORKDIR}/defcon=
fig"
>> > >> > >                 else
>> > >> > >                         bbfatal "A KBUILD_DEFCONFIG '${KBUILD_=
DEFCONFIG}' was specified, but not present in the source tree"
>> > >> > >                 fi
>> > >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
>> > >> > >         patches=3D"${@" ".join(find_patches(d,''))}"
>> > >> > >         feat_dirs=3D"${@" ".join(find_kernel_feature_dirs(d))}=
"
>> > >> > >
>> > >> > > -       # a quick check to make sure we don't have duplicate d=
efconfigs
>> > >> > > -       # If there's a defconfig in the SRC_URI, did we also h=
ave one from
>> > >> > > -       # the KBUILD_DEFCONFIG processing above ?
>> > >> > > -       if [ -n "$sccs" ]; then
>> > >> > > -           # we did have a defconfig from above. remove any t=
hat might be in the src_uri
>> > >> > > -           sccs_from_src_uri=3D$(echo $sccs_from_src_uri | aw=
k '{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> > >> > > +       # a quick check to make sure we don't have duplicate d=
efconfigs If
>> > >> > > +       # there's a defconfig in the SRC_URI, did we also have=
 one from the
>> > >> > > +       # KBUILD_DEFCONFIG processing above ?
>> > >> > > +       src_uri_defconfig=3D$(echo $sccs_from_src_uri | awk '{=
 if ($0=3D=3D"defconfig") { print $0 } }' RS=3D' ')
>> > >> > > +       # drop and defconfig's from the src_uri variable, we c=
aptured it just above here if it existed
>> > >> > > +       sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk '{=
 if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> > >> > > +       if [ -n "$in_tree_defconfig" ]; then
>> > >> > > +               sccs_defconfig=3D$in_tree_defconfig
>> > >> > > +               if [ -n "$src_uri_defconfig" ]; then
>> > >> > > +                       bbwarn "[NOTE]: defconfig was supplied=
 both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
>> > >> > > +               fi
>> > >> > > +       else
>> > >> > > +               # if we didn't have an in-tree one, make our d=
efconfig the one
>> > >> > > +               # from the src_uri. Note: there may not have b=
een one from the
>> > >> > > +               # src_uri, so this can be an empty variable.
>> > >> > > +               sccs_defconfig=3D$src_uri_defconfig
>> > >> > >         fi
>> > >> > > -       sccs=3D"$sccs $sccs_from_src_uri"
>> > >> > > +       sccs=3D"$sccs_from_src_uri"
>> > >> > >
>> > >> > >         # check for feature directories/repos/branches that we=
re part of the
>> > >> > >         # SRC_URI. If they were supplied, we convert them into=
 include directives
>> > >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
>> > >> > >         # expand kernel features into their full path equivale=
nts
>> > >> > >         bsp_definition=3D$(spp ${includes} --find -DKMACHINE=
=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})
>> > >> > >         if [ -z "$bsp_definition" ]; then
>> > >> > > -               echo "$sccs" | grep -q defconfig
>> > >> > > -               if [ $? -ne 0 ]; then
>> > >> > > +               if [ -z "$sccs_defconfig" ]; then
>> > >> > >                         bbfatal_log "Could not locate BSP defi=
nition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
>> > >> > >                 fi
>> > >> > > -
>> > >> > > +       else
>> > >> > >                 # if the bsp definition has "define KMETA_EXTE=
RNAL_BSP t",
>> > >> > >                 # then we need to set a flag that will instruc=
t the next
>> > >> > >                 # steps to use the BSP as both configuration a=
nd patches.
>> > >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
>> > >> > >         elements=3D"`echo -n ${bsp_definition} ${sccs} ${patch=
es} ${KERNEL_FEATURES}`"
>> > >> > >         if [ -n "${elements}" ]; then
>> > >> > >                 echo "${bsp_definition}" > ${S}/${meta_dir}/bs=
p_definition
>> > >> > > -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta=
 ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>> > >> > > +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta=
 ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATUR=
ES}
>> > >> > >                 if [ $? -ne 0 ]; then
>> > >> > >                         bbfatal_log "Could not generate config=
uration queue for ${KMACHINE}."
>> > >> > >                 fi
>> > >> > > --
>> > >> > > 2.17.1
>> > >> > >
>> > >> > >
>> > >> >
>> > >> >
>> > >> >
>> > >> > --
>> > >> > - Thou shalt not follow the NULL pointer, for chaos and madness =
await
>> > >> > thee at its end
>> > >> > - "Use the force Harry" - Gandalf, Star Trek II
>> > >>=20
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
