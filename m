Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.14254.1595516709748778876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 08:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=miT1TmuH;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id dg28so4765351edb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AWnYOV8UCJASgrmoUW5sCHD/yuaIrCaFWTTql9p1Zb0=;
        b=miT1TmuHVCLcoo05nBFzLdA2HH62c7UK+gg7S56XhbM0/gLrtDgAL8yHm8Jr/p/Jp5
         j/IReBLc/sZVJHUAddfidPJ+zU+pUiJUWN+dILNLdMLH6+q3H5ubSFIttEzirsW2H40N
         Ce99XixQr+Nnvjki0jtJqna3Yfu1GM5SnrhTwyMChgC0uXGQLgF8t8YZjgtzOx4Kr+Hm
         ybWOuUNGo+dir7KUi7OMDtDwaS7OAR8Q3wI7ZxYm2vMMF5RIeYAQUE8qYg6imnOwoh0n
         U76+3VjKIjpjZUOgpCOwJZdu5U5d0zu62mBibkbpiGWCpRCGXF7zDWXvG8OWVBs54OVx
         6UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AWnYOV8UCJASgrmoUW5sCHD/yuaIrCaFWTTql9p1Zb0=;
        b=auXYLtonp0x7mns1P2Xdiztzh//uobZXSAvvjemr5E10kfrjca4obLJI9Fzlg9TdrK
         mOF/4KrpRG9BSpHiuocxSK03ZwgztG7d5UOU8fRzV13e73ufAaXtZeeOETfjgSOeFjqs
         7J0z7W48jk85mxeoefp2zVYf15mxmImiGX3xIx6a1yJazjtnqwGwERzYjxegL1J3nYqU
         U9kIgXA+fyH5W9TBoOkkpGqq+4/4nz93oSJEEuh5Gwnz4nc0dmzmAy4Djk0RoWvIPPj1
         I/amt+mLnuE2v1bLNUKFZ+4ldy1+9PwYtiA3kQdeQPQjnsSdkuIOxcLNKuhfQoUNQ1uE
         cOxA==
X-Gm-Message-State: AOAM5311kleR3vFrt7UUdTLBwY2UxJVMwuzggrABIM3eFE/fUA0Bc1cW
	dCqJvfkWvqSd2Hd66UrIX5+wOr20NHoo93lXnXk=
X-Google-Smtp-Source: ABdhPJzE6zismsixzWI5cSFYKew+UgXJ7ugAhlbSRK0106PN35UmUEPPf1USjNXfWPbhHvEI+gMO3iPSb/O+ggQR4qg=
X-Received: by 2002:a05:6402:1614:: with SMTP id f20mr4408606edv.129.1595516707743;
 Thu, 23 Jul 2020 08:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
 <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
 <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
 <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com>
 <CAD0U-hK0upC8OpXCU_FsHt_46gmcfMKO32Y2zjVKf-d27dviFw@mail.gmail.com>
 <CADkTA4M895FfQer_n4-5TF5ycq9g5nsmaHWqzCHiBCQwd4oR2w@mail.gmail.com> <CAD0U-h+Cc94LdVMGpGR8Cn0hBcr0YQSefv=+7XhgXXym6TAufg@mail.gmail.com>
In-Reply-To: <CAD0U-h+Cc94LdVMGpGR8Cn0hBcr0YQSefv=+7XhgXXym6TAufg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 23 Jul 2020 11:04:56 -0400
Message-ID: <CADkTA4Ord_XFE3nTFCOTp=hzRQWbUtyJbZEA9G4BWnZG7G2+Tg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 9:38 AM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
> Hi Bruce,
>
> On Thu, 23 Jul 2020 at 13:27, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>>
>> On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin <ryan.harkin@linaro.org> wr=
ote:
>> >
>> > Hi Bruce, Steve,
>> >
>> > Thanks for your replies and the help.
>> >
>> > On Thu, 23 Jul 2020 at 04:33, Steve Sakoman <steve@sakoman.com> wrote=
:
>> >>
>> >> On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>> >> >
>> >> > On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@linaro.or=
g> wrote:
>> >> > >
>> >> > > Just an FYI, but when this was submitted, my imx7s-warp builds b=
egan to fail when building linux-fslc from meta-freescale / meta-freescale-=
3rdparty.
>> >> > >
>> >> > > I'm not sure why yet, I've only discovered the problem, but I th=
ought I'd report it in case anyone else sees the problem.
>> >> > >
>> >> >
>> >> > Someone already sent a dunfell backport request for a follow up pa=
tch to this.
>> >> >
>> >> > It went to the poky list, but I just replied to it and copied oe-c=
ore.
>> >>
>> >> Both patches are already in dunfell!
>> >>
>> >> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&i=
d=3D7ecc81baeacaa1149a4947791200e8819c3df677
>> >> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&i=
d=3D11089e06bfb3d0defb52825ffba978d085385569
>> >
>> >
>> > Yes, they are present. I guess I should have checked the error messag=
es more closely during git bisect rather than stopping as soon as the build=
 failed.
>> >
>> > After Bruce's 7ecc81baea patch, I see this error:
>> >
>> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_metadata:=
 Could not locate BSP definition for imx7s-warp/standard and no defconfig w=
as provided
>> >
>> > Then, after 11089e06bf, I see the error I originally posted from my C=
I job, but reproduced here from a local build:
>> >
>> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme:=
 Execution of '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/i=
mx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/t=
emp/run.do_kernel_configme.31899' failed with exit code 1:
>> > WARNING: exit code 1 from a shell command.
>> >
>> > ERROR: Logfile of failure stored in: /data/warp7/workspace-dunfell/bu=
ild-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.4=
6+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899
>> > Log data follows:
>> > | DEBUG: Executing python function extend_recipe_sysroot
>> > | NOTE: Direct dependencies are ['/data/warp7/workspace-dunfell/build=
-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc=
-cross_arm-9.2.bb:do_populate_sysroot', 'virtual:native:/data/warp7/workspa=
ce-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-exten=
ded/bc/bc_1.07.1.bb:do_populate_sysroot', '/data/warp7/workspace-dunfell/bu=
ild-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/=
binutils-cross_2.34.bb:do_populate_sysroot', 'virtual:native:/data/warp7/wo=
rkspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-=
devtools/bison/bison_3.5.3.bb:do_populate_sysroot', '/data/warp7/workspace-=
dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools=
/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/data/warp7/workspace-du=
nfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kernel/ker=
n-tools/kern-tools-native_git.bb:do_populate_sysroot', 'virtual:native:/dat=
a/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/met=
a/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
>> > | NOTE: Installed into sysroot: []
>> > | NOTE: Skipping as already exists in sysroot: ['gcc-cross-arm', 'bc-=
native', 'binutils-cross-arm', 'bison-native', 'quilt-native', 'kern-tools-=
native', 'patch-native', 'readline-native', 'flex-native', 'automake-native=
', 'texinfo-dummy-native', 'autoconf-native', 'libtool-native', 'gnu-config=
-native', 'xz-native', 'gettext-minimal-native', 'libmpc-native', 'gmp-nati=
ve', 'zlib-native', 'mpfr-native', 'linux-libc-headers', 'attr-native', 'nc=
urses-native', 'm4-native', 'pkgconfig-native']
>> > | DEBUG: Python function extend_recipe_sysroot finished
>> > | DEBUG: Executing shell function do_kernel_configme
>> > | WARNING: exit code 1 from a shell command.
>> > | ERROR: Execution of '/data/warp7/workspace-dunfell/build-rpb/tmp-rp=
b-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+3=
8d6c3525e-r0/temp/run.do_kernel_configme.31899' failed with exit code 1:
>> > | WARNING: exit code 1 from a shell command.
>> >
>> > I haven't yet looked at what these patches do, but I'm expecting ther=
e's something to update in the linux-fslc recipe, unless there's another is=
sue in the defconfig patches.
>> >
>>
>> We've had multiple reports that with those patches the linux-fslc
>> recipe is building. So something else may be going on in your setup.
>
>
> That's reassuring.
>
>>
>> If you have a set of layers and build steps, can you send them to me ?
>> I can spin up a local build and see if I get the same behaviour.
>
>
> Thanks for the offer. I'm based on Linaro's "OE-RPB" setup.
>
> My own layer is quite simple:
> https://git.linaro.org/people/ryan.harkin/meta-warp7.git/log/?h=3Ddunfel=
l
>
> I mostly provide a new image definition and a simple u-boot patch to cha=
nge the console UART for our CI system. I don't have a kernel recipe overla=
ying linux-fslc.
>
> My basic steps to clone and build are:
> --------------------------
> mkdir /data/warp7/workspace-dunfell
> cd /data/warp7/workspace-dunfell
> repo init -u \
> https://git.linaro.org/people/ryan.harkin/oe-rpb-manifest.git \
> -b dunfell
> repo sync
>
> # link in shared downloads and sstate-cache
> ln -s /linaro/oe-rpb/downloads . && ln -s /linaro/oe-rpb/sstate-cache .
>
> export MACHINE=3Dimx7s-warp ; export DISTRO=3Drpb ; . setup-environment
> bitbake warp7-console-image
> --------------------------
>

I'm spinning up a build now (but as usual, I'm fighting some
infrastructure issues and can't get repo to install).

Steve mentioned two patches ... but can you also confirm that:
[kernel-yocto: account for extracted defconfig in elements check] is
in the branch you are building ?

Bruce


> Right now, I've pinned oo-core to my last known working build from befor=
e your recent defconfig patch, so you'll want to go into layer/openembedded=
-core and checkout the latest commits.
>
> For reference, my pinned commit:
> cabaf5654d  2020-07-06  iso-codes: switch upstream branch master -> main=
                [Hongxu Jia]
>
> Local testing tells me that the repo works fine for me all the way up to=
 just before your commit, at this point:
> 2399fdf98a  2020-07-03  classes/archive: do_configure should not depend =
on do_ar_p..    [Joshua Watt]
>
> I'm building on an Ubuntu 18.04 host locally.
>
> Regards,
> Ryan.
>
>
>>
>>
>> Bruce
>>
>> > Regards,
>> > Ryan.
>> >
>> >
>> >
>> >
>> >
>> >
>> >>
>> >>
>> >>
>> >> Steve
>> >>
>> >> > > Here's a link to my failing build for reference:
>> >> > > https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=
=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/consoleText
>> >> > >
>> >> > > And a snippet from the failure:
>> >> > >
>> >> > > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_conf=
igme: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linu=
x-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_con=
figme.7123' failed with exit code 1:
>> >> > > WARNING: exit code 1 from a shell command.
>> >> > >
>> >> > > ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-glibc=
/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c352=
5e-r0/temp/log.do_kernel_configme.7123
>> >> > > Log data follows:
>> >> > > | DEBUG: Executing python function extend_recipe_sysroot
>> >> > > | NOTE: Direct dependencies are ['virtual:native:/srv/oe/build/c=
onf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.=
bb:do_populate_sysroot', '/srv/oe/build/conf/../../layers/openembedded-core=
/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroo=
t', '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtool=
s/binutils/binutils-cross_2.34.bb:do_populate_sysroot', '/srv/oe/build/conf=
/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.=
66.bb:do_populate_sysroot', 'virtual:native:/srv/oe/build/conf/../../layers=
/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_s=
ysroot', 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/=
meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', '/srv/oe/build/=
conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cros=
s_arm-9.2.bb:do_populate_sysroot']
>> >> > > | NOTE: Installed into sysroot: []
>> >> > > | NOTE: Skipping as already exists in sysroot: ['bison-native', =
'kern-tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-native', =
'bc-native', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native', 'gnu-c=
onfig-native', 'readline-native', 'libtool-native', 'automake-native', 'aut=
oconf-native', 'xz-native', 'linux-libc-headers', 'gmp-native', 'libmpc-nat=
ive', 'mpfr-native', 'zlib-native', 'gettext-minimal-native', 'attr-native'=
, 'm4-native', 'ncurses-native', 'pkgconfig-native']
>> >> > > | DEBUG: Python function extend_recipe_sysroot finished
>> >> > > | DEBUG: Executing shell function do_kernel_configme
>> >> > > | WARNING: exit code 1 from a shell command.
>> >> > > | ERROR: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_wa=
rp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run=
.do_kernel_configme.7123' failed with exit code 1:
>> >> > > | WARNING: exit code 1 from a shell command.
>> >> > > |
>> >> > > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task do=
_kernel_configme: Failed
>> >> > > ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/reci=
pes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exit cod=
e '1'
>> >> > >
>> >> > >
>> >> > >
>> >> > > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com> w=
rote:
>> >> > >>
>> >> > >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfield@g=
mail.com> wrote:
>> >> > >> >
>> >> > >> > We have a fixup patch for this one in test right now, so we d=
on't want
>> >> > >> > this patch, without the follow up.
>> >> > >> >
>> >> > >> > But this is useful for dunfell, since it was an unexpected be=
haviour
>> >> > >> > that needed to be fixed.
>> >> > >>
>> >> > >> Thanks, I'll drop this patch from the pull request and include =
it
>> >> > >> along with the fixup patch in next week's patch set.
>> >> > >>
>> >> > >> Steve
>> >> > >>
>> >> > >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.=
com> wrote:
>> >> > >> > >
>> >> > >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >> > >> > >
>> >> > >> > > It is uncommon that a BSP definition and a defconfig are us=
ed in
>> >> > >> > > a single configuration. That being said, it is a valid way =
to
>> >> > >> > > organize kernel configuration meta data.
>> >> > >> > >
>> >> > >> > > When a defconfig is used, either on the src_uri or from in
>> >> > >> > > the kernel tree, it is normally expected that it is the bas=
eline,
>> >> > >> > > with all options applied on top of it.
>> >> > >> > >
>> >> > >> > > With this commit, we detect either type of defconfig and en=
sure
>> >> > >> > > that it is used first, followed by the fragments in their
>> >> > >> > > previous order. This allows existing configuration stacks t=
o
>> >> > >> > > remain the same, while ensuring that a defconfig combined s=
tack
>> >> > >> > > works as expected.
>> >> > >> > >
>> >> > >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >> > >> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundati=
on.org>
>> >> > >> > > (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400=
ae9caedf)
>> >> > >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> >> > >> > > ---
>> >> > >> > >  meta/classes/kernel-yocto.bbclass | 33 +++++++++++++++++++=
+-----------
>> >> > >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
>> >> > >> > >
>> >> > >> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/class=
es/kernel-yocto.bbclass
>> >> > >> > > index 5bc627066e..41d8620e67 100644
>> >> > >> > > --- a/meta/classes/kernel-yocto.bbclass
>> >> > >> > > +++ b/meta/classes/kernel-yocto.bbclass
>> >> > >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
>> >> > >> > >                         else
>> >> > >> > >                                 cp -f ${S}/arch/${ARCH}/con=
figs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
>> >> > >> > >                         fi
>> >> > >> > > -                       sccs=3D"${WORKDIR}/defconfig"
>> >> > >> > > +                       in_tree_defconfig=3D"${WORKDIR}/def=
config"
>> >> > >> > >                 else
>> >> > >> > >                         bbfatal "A KBUILD_DEFCONFIG '${KBUI=
LD_DEFCONFIG}' was specified, but not present in the source tree"
>> >> > >> > >                 fi
>> >> > >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
>> >> > >> > >         patches=3D"${@" ".join(find_patches(d,''))}"
>> >> > >> > >         feat_dirs=3D"${@" ".join(find_kernel_feature_dirs(d=
))}"
>> >> > >> > >
>> >> > >> > > -       # a quick check to make sure we don't have duplicat=
e defconfigs
>> >> > >> > > -       # If there's a defconfig in the SRC_URI, did we als=
o have one from
>> >> > >> > > -       # the KBUILD_DEFCONFIG processing above ?
>> >> > >> > > -       if [ -n "$sccs" ]; then
>> >> > >> > > -           # we did have a defconfig from above. remove an=
y that might be in the src_uri
>> >> > >> > > -           sccs_from_src_uri=3D$(echo $sccs_from_src_uri |=
 awk '{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> >> > >> > > +       # a quick check to make sure we don't have duplicat=
e defconfigs If
>> >> > >> > > +       # there's a defconfig in the SRC_URI, did we also h=
ave one from the
>> >> > >> > > +       # KBUILD_DEFCONFIG processing above ?
>> >> > >> > > +       src_uri_defconfig=3D$(echo $sccs_from_src_uri | awk=
 '{ if ($0=3D=3D"defconfig") { print $0 } }' RS=3D' ')
>> >> > >> > > +       # drop and defconfig's from the src_uri variable, w=
e captured it just above here if it existed
>> >> > >> > > +       sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk=
 '{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> >> > >> > > +       if [ -n "$in_tree_defconfig" ]; then
>> >> > >> > > +               sccs_defconfig=3D$in_tree_defconfig
>> >> > >> > > +               if [ -n "$src_uri_defconfig" ]; then
>> >> > >> > > +                       bbwarn "[NOTE]: defconfig was suppl=
ied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
>> >> > >> > > +               fi
>> >> > >> > > +       else
>> >> > >> > > +               # if we didn't have an in-tree one, make ou=
r defconfig the one
>> >> > >> > > +               # from the src_uri. Note: there may not hav=
e been one from the
>> >> > >> > > +               # src_uri, so this can be an empty variable=
.
>> >> > >> > > +               sccs_defconfig=3D$src_uri_defconfig
>> >> > >> > >         fi
>> >> > >> > > -       sccs=3D"$sccs $sccs_from_src_uri"
>> >> > >> > > +       sccs=3D"$sccs_from_src_uri"
>> >> > >> > >
>> >> > >> > >         # check for feature directories/repos/branches that=
 were part of the
>> >> > >> > >         # SRC_URI. If they were supplied, we convert them i=
nto include directives
>> >> > >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
>> >> > >> > >         # expand kernel features into their full path equiv=
alents
>> >> > >> > >         bsp_definition=3D$(spp ${includes} --find -DKMACHIN=
E=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})
>> >> > >> > >         if [ -z "$bsp_definition" ]; then
>> >> > >> > > -               echo "$sccs" | grep -q defconfig
>> >> > >> > > -               if [ $? -ne 0 ]; then
>> >> > >> > > +               if [ -z "$sccs_defconfig" ]; then
>> >> > >> > >                         bbfatal_log "Could not locate BSP d=
efinition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provide=
d"
>> >> > >> > >                 fi
>> >> > >> > > -
>> >> > >> > > +       else
>> >> > >> > >                 # if the bsp definition has "define KMETA_E=
XTERNAL_BSP t",
>> >> > >> > >                 # then we need to set a flag that will inst=
ruct the next
>> >> > >> > >                 # steps to use the BSP as both configuratio=
n and patches.
>> >> > >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
>> >> > >> > >         elements=3D"`echo -n ${bsp_definition} ${sccs} ${pa=
tches} ${KERNEL_FEATURES}`"
>> >> > >> > >         if [ -n "${elements}" ]; then
>> >> > >> > >                 echo "${bsp_definition}" > ${S}/${meta_dir}=
/bsp_definition
>> >> > >> > > -               scc --force -o ${S}/${meta_dir}:cfg,merge,m=
eta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>> >> > >> > > +               scc --force -o ${S}/${meta_dir}:cfg,merge,m=
eta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEA=
TURES}
>> >> > >> > >                 if [ $? -ne 0 ]; then
>> >> > >> > >                         bbfatal_log "Could not generate con=
figuration queue for ${KMACHINE}."
>> >> > >> > >                 fi
>> >> > >> > > --
>> >> > >> > > 2.17.1
>> >> > >> > >
>> >> > >> > >
>> >> > >> >
>> >> > >> >
>> >> > >> >
>> >> > >> > --
>> >> > >> > - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await
>> >> > >> > thee at its end
>> >> > >> > - "Use the force Harry" - Gandalf, Star Trek II
>> >> > >>=20
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
>> >> > thee at its end
>> >> > - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
