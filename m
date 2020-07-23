Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.12447.1595511512583529520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 06:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D4m8rUqw;
 spf=pass (domain: linaro.org, ip: 209.85.222.175, mailfrom: ryan.harkin@linaro.org)
Received: by mail-qk1-f175.google.com with SMTP id 11so5348357qkn.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9gD7fkqkcFd998RtQnfFz+PvT344FIFaML2FE2ychP0=;
        b=D4m8rUqwP2WJC1fkWK5CwREyUjVtaiWlM1jnKGV4ueyVBzZVF0R1pZ4LtygAfMd+xO
         HhGdZVuqLOck9+H1sT2dmjxqpoQsHSGXF/BbohenDp/4Peq7rsElECK4YGOrk582FXE2
         BUgzqMBjaBlJ5i4cpmfYnUgh80T0Uo0IC0IGh3dwSw2ONiivn1KmYRulBvavLg7KbPgs
         AyIuAV+LhbbTPNYB+iH8067wi5dISfY5bOEwyLOGoub44hDHpKUv8yoZFtJKMOiNBYYL
         fHn+Rc1zqKe4J/fJbrolHDKmd1VnvK5FblsDaZYd+F1Ozunyq7DkrDBj8V1JgN6DNbHO
         tp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9gD7fkqkcFd998RtQnfFz+PvT344FIFaML2FE2ychP0=;
        b=fRcFsoHlhU8PMnFxv4/9xk6YYvVB9uOlPWaygy8YQ63bMvh/5OXZNhCDWWYzW/JcmY
         oGq5FAwsi6boshHdu+Roh/Ua0ausxuoDr4sjK/dixiJzEAJ10lM+ywtpKGWzp/rWMza6
         wUPlFogjt67ZL2QVoA73ezF1DmHnHAepFJaPsLynF/g/73bjazijo+yjJKE1JUNmD3po
         bjSIj7mw+5y2b0zi9QmmlzYgal0kbwwRlMSWSzFEzsMpq3o7Y9AnTcIe2i2MVD2SU691
         PG17ehF+5J6FLxGMFaA1nc4w5MSNQD+4105QRLJcCwHbgDkH0XMWaT4w8ZPwMhSloC09
         r1fQ==
X-Gm-Message-State: AOAM5314N6CyPhGtRkf1gk6rhelATu825sg68EIBEW9xWlVXDxG/00Ok
	uPPUVGcIFbp7CPkRpYshZwrYOMLX7qbYR7v+rwKzqQ==
X-Google-Smtp-Source: ABdhPJxVc57CxBIMQ0HwiY5n+xJfrZmtDztUKNod+yoWQN8/W8aY8OMgg3tFc5yAl739c6LwyQoHdMPOLS/LhbXiE3Q=
X-Received: by 2002:a05:620a:9d0:: with SMTP id y16mr5242437qky.353.1595511511632;
 Thu, 23 Jul 2020 06:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
 <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
 <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
 <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com>
 <CAD0U-hK0upC8OpXCU_FsHt_46gmcfMKO32Y2zjVKf-d27dviFw@mail.gmail.com> <CADkTA4M895FfQer_n4-5TF5ycq9g5nsmaHWqzCHiBCQwd4oR2w@mail.gmail.com>
In-Reply-To: <CADkTA4M895FfQer_n4-5TF5ycq9g5nsmaHWqzCHiBCQwd4oR2w@mail.gmail.com>
From: "Ryan Harkin" <ryan.harkin@linaro.org>
Date: Thu, 23 Jul 2020 14:38:20 +0100
Message-ID: <CAD0U-h+Cc94LdVMGpGR8Cn0hBcr0YQSefv=+7XhgXXym6TAufg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e2e58705ab1bf8b9"

--000000000000e2e58705ab1bf8b9
Content-Type: text/plain; charset="UTF-8"

Hi Bruce,

On Thu, 23 Jul 2020 at 13:27, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >
> > Hi Bruce, Steve,
> >
> > Thanks for your replies and the help.
> >
> > On Thu, 23 Jul 2020 at 04:33, Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >> >
> >> > On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >> > >
> >> > > Just an FYI, but when this was submitted, my imx7s-warp builds
> began to fail when building linux-fslc from meta-freescale /
> meta-freescale-3rdparty.
> >> > >
> >> > > I'm not sure why yet, I've only discovered the problem, but I
> thought I'd report it in case anyone else sees the problem.
> >> > >
> >> >
> >> > Someone already sent a dunfell backport request for a follow up patch
> to this.
> >> >
> >> > It went to the poky list, but I just replied to it and copied oe-core.
> >>
> >> Both patches are already in dunfell!
> >>
> >>
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=7ecc81baeacaa1149a4947791200e8819c3df677
> >>
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=11089e06bfb3d0defb52825ffba978d085385569
> >
> >
> > Yes, they are present. I guess I should have checked the error messages
> more closely during git bisect rather than stopping as soon as the build
> failed.
> >
> > After Bruce's 7ecc81baea patch, I see this error:
> >
> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_metadata:
> Could not locate BSP definition for imx7s-warp/standard and no defconfig
> was provided
> >
> > Then, after 11089e06bf, I see the error I originally posted from my CI
> job, but reproduced here from a local build:
> >
> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme:
> Execution of
> '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.31899'
> failed with exit code 1:
> > WARNING: exit code 1 from a shell command.
> >
> > ERROR: Logfile of failure stored in:
> /data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899
> > Log data follows:
> > | DEBUG: Executing python function extend_recipe_sysroot
> > | NOTE: Direct dependencies are
> ['/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:do_populate_sysroot',
> 'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot',
> '/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot',
> 'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot',
> '/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
> '/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
> 'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:
> do_populate_sysroot']
> > | NOTE: Installed into sysroot: []
> > | NOTE: Skipping as already exists in sysroot: ['gcc-cross-arm',
> 'bc-native', 'binutils-cross-arm', 'bison-native', 'quilt-native',
> 'kern-tools-native', 'patch-native', 'readline-native', 'flex-native',
> 'automake-native', 'texinfo-dummy-native', 'autoconf-native',
> 'libtool-native', 'gnu-config-native', 'xz-native',
> 'gettext-minimal-native', 'libmpc-native', 'gmp-native', 'zlib-native',
> 'mpfr-native', 'linux-libc-headers', 'attr-native', 'ncurses-native',
> 'm4-native', 'pkgconfig-native']
> > | DEBUG: Python function extend_recipe_sysroot finished
> > | DEBUG: Executing shell function do_kernel_configme
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Execution of
> '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.31899'
> failed with exit code 1:
> > | WARNING: exit code 1 from a shell command.
> >
> > I haven't yet looked at what these patches do, but I'm expecting there's
> something to update in the linux-fslc recipe, unless there's another issue
> in the defconfig patches.
> >
>
> We've had multiple reports that with those patches the linux-fslc
> recipe is building. So something else may be going on in your setup.
>

That's reassuring.


> If you have a set of layers and build steps, can you send them to me ?
> I can spin up a local build and see if I get the same behaviour.
>

Thanks for the offer. I'm based on Linaro's "OE-RPB" setup.

My own layer is quite simple:
https://git.linaro.org/people/ryan.harkin/meta-warp7.git/log/?h=dunfell

I mostly provide a new image definition and a simple u-boot patch to change
the console UART for our CI system. I don't have a kernel recipe overlaying
linux-fslc.

My basic steps to clone and build are:
--------------------------
mkdir /data/warp7/workspace-dunfell
cd /data/warp7/workspace-dunfell
repo init -u \
https://git.linaro.org/people/ryan.harkin/oe-rpb-manifest.git \
-b dunfell
repo sync

# link in shared downloads and sstate-cache
ln -s /linaro/oe-rpb/downloads . && ln -s /linaro/oe-rpb/sstate-cache .

export MACHINE=imx7s-warp ; export DISTRO=rpb ; . setup-environment
bitbake warp7-console-image
--------------------------

Right now, I've pinned oo-core to my last known working build from before
your recent defconfig patch, so you'll want to go into
layer/openembedded-core and checkout the latest commits.

For reference, my pinned commit:
cabaf5654d  2020-07-06  iso-codes: switch upstream branch master -> main
             [Hongxu Jia]

Local testing tells me that the repo works fine for me all the way up to
just before your commit, at this point:
2399fdf98a  2020-07-03  classes/archive: do_configure should not depend on
do_ar_p..    [Joshua Watt]

I'm building on an Ubuntu 18.04 host locally.

Regards,
Ryan.



>
> Bruce
>
> > Regards,
> > Ryan.
> >
> >
> >
> >
> >
> >
> >>
> >>
> >>
> >> Steve
> >>
> >> > > Here's a link to my failing build for reference:
> >> > >
> https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=rpb,MACHINE=imx7s-warp,label=docker-buster-amd64/consoleText
> >> > >
> >> > > And a snippet from the failure:
> >> > >
> >> > > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0
> do_kernel_configme: Execution of
> '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
> failed with exit code 1:
> >> > > WARNING: exit code 1 from a shell command.
> >> > >
> >> > > ERROR: Logfile of failure stored in:
> /srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.7123
> >> > > Log data follows:
> >> > > | DEBUG: Executing python function extend_recipe_sysroot
> >> > > | NOTE: Direct dependencies are
> ['virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
> 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:
> do_populate_sysroot']
> >> > > | NOTE: Installed into sysroot: []
> >> > > | NOTE: Skipping as already exists in sysroot: ['bison-native',
> 'kern-tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-native',
> 'bc-native', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native',
> 'gnu-config-native', 'readline-native', 'libtool-native',
> 'automake-native', 'autoconf-native', 'xz-native', 'linux-libc-headers',
> 'gmp-native', 'libmpc-native', 'mpfr-native', 'zlib-native',
> 'gettext-minimal-native', 'attr-native', 'm4-native', 'ncurses-native',
> 'pkgconfig-native']
> >> > > | DEBUG: Python function extend_recipe_sysroot finished
> >> > > | DEBUG: Executing shell function do_kernel_configme
> >> > > | WARNING: exit code 1 from a shell command.
> >> > > | ERROR: Execution of
> '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
> failed with exit code 1:
> >> > > | WARNING: exit code 1 from a shell command.
> >> > > |
> >> > > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task
> do_kernel_configme: Failed
> >> > > ERROR: Task
> (/srv/oe/build/conf/../../layers/meta-freescale/recipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme)
> failed with exit code '1'
> >> > >
> >> > >
> >> > >
> >> > > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com>
> wrote:
> >> > >>
> >> > >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >> > >> >
> >> > >> > We have a fixup patch for this one in test right now, so we
> don't want
> >> > >> > this patch, without the follow up.
> >> > >> >
> >> > >> > But this is useful for dunfell, since it was an unexpected
> behaviour
> >> > >> > that needed to be fixed.
> >> > >>
> >> > >> Thanks, I'll drop this patch from the pull request and include it
> >> > >> along with the fixup patch in next week's patch set.
> >> > >>
> >> > >> Steve
> >> > >>
> >> > >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com>
> wrote:
> >> > >> > >
> >> > >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > >> > >
> >> > >> > > It is uncommon that a BSP definition and a defconfig are used
> in
> >> > >> > > a single configuration. That being said, it is a valid way to
> >> > >> > > organize kernel configuration meta data.
> >> > >> > >
> >> > >> > > When a defconfig is used, either on the src_uri or from in
> >> > >> > > the kernel tree, it is normally expected that it is the
> baseline,
> >> > >> > > with all options applied on top of it.
> >> > >> > >
> >> > >> > > With this commit, we detect either type of defconfig and ensure
> >> > >> > > that it is used first, followed by the fragments in their
> >> > >> > > previous order. This allows existing configuration stacks to
> >> > >> > > remain the same, while ensuring that a defconfig combined stack
> >> > >> > > works as expected.
> >> > >> > >
> >> > >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > >> > > Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org>
> >> > >> > > (cherry picked from commit
> e6845327b69396d843a2f3c4c3ac9400ae9caedf)
> >> > >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> > >> > > ---
> >> > >> > >  meta/classes/kernel-yocto.bbclass | 33
> ++++++++++++++++++++-----------
> >> > >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
> >> > >> > >
> >> > >> > > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> >> > >> > > index 5bc627066e..41d8620e67 100644
> >> > >> > > --- a/meta/classes/kernel-yocto.bbclass
> >> > >> > > +++ b/meta/classes/kernel-yocto.bbclass
> >> > >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
> >> > >> > >                         else
> >> > >> > >                                 cp -f
> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> >> > >> > >                         fi
> >> > >> > > -                       sccs="${WORKDIR}/defconfig"
> >> > >> > > +
>  in_tree_defconfig="${WORKDIR}/defconfig"
> >> > >> > >                 else
> >> > >> > >                         bbfatal "A KBUILD_DEFCONFIG
> '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
> >> > >> > >                 fi
> >> > >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
> >> > >> > >         patches="${@" ".join(find_patches(d,''))}"
> >> > >> > >         feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
> >> > >> > >
> >> > >> > > -       # a quick check to make sure we don't have duplicate
> defconfigs
> >> > >> > > -       # If there's a defconfig in the SRC_URI, did we also
> have one from
> >> > >> > > -       # the KBUILD_DEFCONFIG processing above ?
> >> > >> > > -       if [ -n "$sccs" ]; then
> >> > >> > > -           # we did have a defconfig from above. remove any
> that might be in the src_uri
> >> > >> > > -           sccs_from_src_uri=$(echo $sccs_from_src_uri | awk
> '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> >> > >> > > +       # a quick check to make sure we don't have duplicate
> defconfigs If
> >> > >> > > +       # there's a defconfig in the SRC_URI, did we also have
> one from the
> >> > >> > > +       # KBUILD_DEFCONFIG processing above ?
> >> > >> > > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{
> if ($0=="defconfig") { print $0 } }' RS=' ')
> >> > >> > > +       # drop and defconfig's from the src_uri variable, we
> captured it just above here if it existed
> >> > >> > > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{
> if ($0!="defconfig") { print $0 } }' RS=' ')
> >> > >> > > +       if [ -n "$in_tree_defconfig" ]; then
> >> > >> > > +               sccs_defconfig=$in_tree_defconfig
> >> > >> > > +               if [ -n "$src_uri_defconfig" ]; then
> >> > >> > > +                       bbwarn "[NOTE]: defconfig was supplied
> both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> >> > >> > > +               fi
> >> > >> > > +       else
> >> > >> > > +               # if we didn't have an in-tree one, make our
> defconfig the one
> >> > >> > > +               # from the src_uri. Note: there may not have
> been one from the
> >> > >> > > +               # src_uri, so this can be an empty variable.
> >> > >> > > +               sccs_defconfig=$src_uri_defconfig
> >> > >> > >         fi
> >> > >> > > -       sccs="$sccs $sccs_from_src_uri"
> >> > >> > > +       sccs="$sccs_from_src_uri"
> >> > >> > >
> >> > >> > >         # check for feature directories/repos/branches that
> were part of the
> >> > >> > >         # SRC_URI. If they were supplied, we convert them into
> include directives
> >> > >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
> >> > >> > >         # expand kernel features into their full path
> equivalents
> >> > >> > >         bsp_definition=$(spp ${includes} --find
> -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
> >> > >> > >         if [ -z "$bsp_definition" ]; then
> >> > >> > > -               echo "$sccs" | grep -q defconfig
> >> > >> > > -               if [ $? -ne 0 ]; then
> >> > >> > > +               if [ -z "$sccs_defconfig" ]; then
> >> > >> > >                         bbfatal_log "Could not locate BSP
> definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was
> provided"
> >> > >> > >                 fi
> >> > >> > > -
> >> > >> > > +       else
> >> > >> > >                 # if the bsp definition has "define
> KMETA_EXTERNAL_BSP t",
> >> > >> > >                 # then we need to set a flag that will
> instruct the next
> >> > >> > >                 # steps to use the BSP as both configuration
> and patches.
> >> > >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
> >> > >> > >         elements="`echo -n ${bsp_definition} ${sccs}
> ${patches} ${KERNEL_FEATURES}`"
> >> > >> > >         if [ -n "${elements}" ]; then
> >> > >> > >                 echo "${bsp_definition}" >
> ${S}/${meta_dir}/bsp_definition
> >> > >> > > -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> >> > >> > > +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} $sccs_defconfig $bsp_definition $sccs $patches
> ${KERNEL_FEATURES}
> >> > >> > >                 if [ $? -ne 0 ]; then
> >> > >> > >                         bbfatal_log "Could not generate
> configuration queue for ${KMACHINE}."
> >> > >> > >                 fi
> >> > >> > > --
> >> > >> > > 2.17.1
> >> > >> > >
> >> > >> > >
> >> > >> >
> >> > >> >
> >> > >> >
> >> > >> > --
> >> > >> > - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> >> > >> > thee at its end
> >> > >> > - "Use the force Harry" - Gandalf, Star Trek II
> >> > >> 
> >> >
> >> >
> >> >
> >> > --
> >> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> > thee at its end
> >> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000e2e58705ab1bf8b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Bruce,</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, 23 Jul 2020 at 13:27, Bruce Ash=
field &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin &lt;<a href=3D"mailto:ryan.h=
arkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; Hi Bruce, Steve,<br>
&gt;<br>
&gt; Thanks for your replies and the help.<br>
&gt;<br>
&gt; On Thu, 23 Jul 2020 at 04:33, Steve Sakoman &lt;<a href=3D"mailto:ste=
ve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield &lt;<a href=3D"mai=
lto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin &lt;<a href=3D"m=
ailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&=
gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Just an FYI, but when this was submitted, my imx7s-warp=
 builds began to fail when building linux-fslc from meta-freescale / meta-f=
reescale-3rdparty.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I&#39;m not sure why yet, I&#39;ve only discovered the =
problem, but I thought I&#39;d report it in case anyone else sees the probl=
em.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Someone already sent a dunfell backport request for a follow=
 up patch to this.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It went to the poky list, but I just replied to it and copie=
d oe-core.<br>
&gt;&gt;<br>
&gt;&gt; Both patches are already in dunfell!<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?h=3Ddunfell&amp;id=3D7ecc81baeacaa1149a4947791200e8819c3df677" rel=3D"nore=
ferrer" target=3D"_blank">https://git.openembedded.org/openembedded-core/co=
mmit/?h=3Ddunfell&amp;id=3D7ecc81baeacaa1149a4947791200e8819c3df677</a><br>
&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?h=3Ddunfell&amp;id=3D11089e06bfb3d0defb52825ffba978d085385569" rel=3D"nore=
ferrer" target=3D"_blank">https://git.openembedded.org/openembedded-core/co=
mmit/?h=3Ddunfell&amp;id=3D11089e06bfb3d0defb52825ffba978d085385569</a><br>
&gt;<br>
&gt;<br>
&gt; Yes, they are present. I guess I should have checked the error messag=
es more closely during git bisect rather than stopping as soon as the build=
 failed.<br>
&gt;<br>
&gt; After Bruce&#39;s 7ecc81baea patch, I see this error:<br>
&gt;<br>
&gt; ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_metadata:=
 Could not locate BSP definition for imx7s-warp/standard and no defconfig w=
as provided<br>
&gt;<br>
&gt; Then, after 11089e06bf, I see the error I originally posted from my C=
I job, but reproduced here from a local build:<br>
&gt;<br>
&gt; ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme:=
 Execution of &#39;/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/wo=
rk/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-=
r0/temp/run.do_kernel_configme.31899&#39; failed with exit code 1:<br>
&gt; WARNING: exit code 1 from a shell command.<br>
&gt;<br>
&gt; ERROR: Logfile of failure stored in: /data/warp7/workspace-dunfell/bu=
ild-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.4=
6+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing python function extend_recipe_sysroot<br>
&gt; | NOTE: Direct dependencies are [&#39;/data/warp7/workspace-dunfell/b=
uild-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc=
/gcc-cross_arm-9.2.bb:do_populate_sysroot&#39;, &#39;virtual:native:/data/w=
arp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/r=
ecipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot&#39;, &#39;/data/warp7/=
workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipe=
s-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot&#39;, &#39;v=
irtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/ope=
nembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysro=
ot&#39;, &#39;/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/ope=
nembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate=
_sysroot&#39;, &#39;/data/warp7/workspace-dunfell/build-rpb/conf/../../laye=
rs/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.b=
b:do_populate_sysroot&#39;, &#39;virtual:native:/data/warp7/workspace-dunfe=
ll/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/patc=
h/patch_2.7.6.bb:do_populate_sysroot&#39;]<br>
&gt; | NOTE: Installed into sysroot: []<br>
&gt; | NOTE: Skipping as already exists in sysroot: [&#39;gcc-cross-arm&#3=
9;, &#39;bc-native&#39;, &#39;binutils-cross-arm&#39;, &#39;bison-native&#3=
9;, &#39;quilt-native&#39;, &#39;kern-tools-native&#39;, &#39;patch-native&=
#39;, &#39;readline-native&#39;, &#39;flex-native&#39;, &#39;automake-nativ=
e&#39;, &#39;texinfo-dummy-native&#39;, &#39;autoconf-native&#39;, &#39;lib=
tool-native&#39;, &#39;gnu-config-native&#39;, &#39;xz-native&#39;, &#39;ge=
ttext-minimal-native&#39;, &#39;libmpc-native&#39;, &#39;gmp-native&#39;, &=
#39;zlib-native&#39;, &#39;mpfr-native&#39;, &#39;linux-libc-headers&#39;, =
&#39;attr-native&#39;, &#39;ncurses-native&#39;, &#39;m4-native&#39;, &#39;=
pkgconfig-native&#39;]<br>
&gt; | DEBUG: Python function extend_recipe_sysroot finished<br>
&gt; | DEBUG: Executing shell function do_kernel_configme<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; | ERROR: Execution of &#39;/data/warp7/workspace-dunfell/build-rpb/tm=
p-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOI=
NC+38d6c3525e-r0/temp/run.do_kernel_configme.31899&#39; failed with exit co=
de 1:<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;<br>
&gt; I haven&#39;t yet looked at what these patches do, but I&#39;m expect=
ing there&#39;s something to update in the linux-fslc recipe, unless there&=
#39;s another issue in the defconfig patches.<br>
&gt;<br>
<br>
We&#39;ve had multiple reports that with those patches the linux-fslc<br>
recipe is building. So something else may be going on in your setup.<br></=
blockquote><div><br></div><div>That&#39;s reassuring.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If you have a set of layers and build steps, can you send them to me ?<br>
I can spin up a local build and see if I get the same behaviour.<br></bloc=
kquote><div><br></div><div>Thanks for the offer. I&#39;m based on Linaro&#3=
9;s &quot;OE-RPB&quot; setup.<br></div><div><br></div><div>My own layer is =
quite simple:</div><div><a href=3D"https://git.linaro.org/people/ryan.harki=
n/meta-warp7.git/log/?h=3Ddunfell">https://git.linaro.org/people/ryan.harki=
n/meta-warp7.git/log/?h=3Ddunfell</a><br></div><div><br></div><div>I mostly=
 provide a new image definition and a simple u-boot patch to change the con=
sole UART for our CI system. I don&#39;t have a kernel recipe overlaying li=
nux-fslc.</div><div><br></div><div> My basic steps to clone and build are:<=
/div><div>--------------------------<br></div><div>mkdir /data/warp7/worksp=
ace-dunfell</div><div>cd /data/warp7/workspace-dunfell<br>repo init -u \</d=
iv><div>	<a href=3D"https://git.linaro.org/people/ryan.harkin/oe-rpb-manife=
st.git">https://git.linaro.org/people/ryan.harkin/oe-rpb-manifest.git</a> \=
<br>	-b dunfell<br>repo sync<br><br># link in shared downloads and sstate-c=
ache<br>ln -s /linaro/oe-rpb/downloads . &amp;&amp; ln -s /linaro/oe-rpb/ss=
tate-cache .<br><br>export MACHINE=3Dimx7s-warp ; export DISTRO=3Drpb ; . s=
etup-environment <br>bitbake warp7-console-image<br>-----------------------=
---<br></div><div><br></div><div>Right now, I&#39;ve pinned oo-core to my l=
ast known working build from before your recent defconfig patch, so you&#39=
;ll want to go into layer/openembedded-core and checkout the latest commits=
.</div><div><br></div><div>For reference, my pinned commit:</div><div>cabaf=
5654d =C2=A02020-07-06 =C2=A0iso-codes: switch upstream branch master -&gt;=
 main =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Hongxu Jia]<b=
r></div><div><br></div><div>Local testing tells me that the repo works fine=
 for me all the way up to just before your commit, at this point:</div><div=
>2399fdf98a =C2=A02020-07-03 =C2=A0classes/archive: do_configure should not=
 depend on do_ar_p.. =C2=A0 =C2=A0[Joshua Watt]=C2=A0<br></div><div><br></d=
iv><div>I&#39;m building on an=C2=A0Ubuntu 18.04 host locally.</div><div><b=
r></div><div>Regards,</div><div>Ryan.</div><div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt; Regards,<br>
&gt; Ryan.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Steve<br>
&gt;&gt;<br>
&gt;&gt; &gt; &gt; Here&#39;s a link to my failing build for reference:<br=
>
&gt;&gt; &gt; &gt; <a href=3D"https://ci.linaro.org/job/warp7-openembedded=
-dunfell/67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/c=
onsoleText" rel=3D"noreferrer" target=3D"_blank">https://ci.linaro.org/job/=
warp7-openembedded-dunfell/67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddoc=
ker-buster-amd64/consoleText</a><br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; And a snippet from the failure:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_ke=
rnel_configme: Execution of &#39;/srv/oe/build/tmp-rpb-glibc/work/imx7s_war=
p-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.=
do_kernel_configme.7123&#39; failed with exit code 1:<br>
&gt;&gt; &gt; &gt; WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; ERROR: Logfile of failure stored in: /srv/oe/build/tmp-=
rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC=
+38d6c3525e-r0/temp/log.do_kernel_configme.7123<br>
&gt;&gt; &gt; &gt; Log data follows:<br>
&gt;&gt; &gt; &gt; | DEBUG: Executing python function extend_recipe_sysroo=
t<br>
&gt;&gt; &gt; &gt; | NOTE: Direct dependencies are [&#39;virtual:native:/s=
rv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/bison=
/bison_3.5.3.bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../lay=
ers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.=
bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/openembed=
ded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_=
sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/openembedded-core/meta/r=
ecipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot&#39;, &#39;v=
irtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipe=
s-devtools/patch/patch_2.7.6.bb:do_populate_sysroot&#39;, &#39;virtual:nati=
ve:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-extended/=
bc/bc_1.07.1.bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../lay=
ers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:d=
o_populate_sysroot&#39;]<br>
&gt;&gt; &gt; &gt; | NOTE: Installed into sysroot: []<br>
&gt;&gt; &gt; &gt; | NOTE: Skipping as already exists in sysroot: [&#39;bi=
son-native&#39;, &#39;kern-tools-native&#39;, &#39;binutils-cross-arm&#39;,=
 &#39;quilt-native&#39;, &#39;patch-native&#39;, &#39;bc-native&#39;, &#39;=
gcc-cross-arm&#39;, &#39;flex-native&#39;, &#39;texinfo-dummy-native&#39;, =
&#39;gnu-config-native&#39;, &#39;readline-native&#39;, &#39;libtool-native=
&#39;, &#39;automake-native&#39;, &#39;autoconf-native&#39;, &#39;xz-native=
&#39;, &#39;linux-libc-headers&#39;, &#39;gmp-native&#39;, &#39;libmpc-nati=
ve&#39;, &#39;mpfr-native&#39;, &#39;zlib-native&#39;, &#39;gettext-minimal=
-native&#39;, &#39;attr-native&#39;, &#39;m4-native&#39;, &#39;ncurses-nati=
ve&#39;, &#39;pkgconfig-native&#39;]<br>
&gt;&gt; &gt; &gt; | DEBUG: Python function extend_recipe_sysroot finished=
<br>
&gt;&gt; &gt; &gt; | DEBUG: Executing shell function do_kernel_configme<br=
>
&gt;&gt; &gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt; &gt; | ERROR: Execution of &#39;/srv/oe/build/tmp-rpb-glibc/=
work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525=
e-r0/temp/run.do_kernel_configme.7123&#39; failed with exit code 1:<br>
&gt;&gt; &gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt; &gt; |<br>
&gt;&gt; &gt; &gt; NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0=
: task do_kernel_configme: Failed<br>
&gt;&gt; &gt; &gt; ERROR: Task (/srv/oe/build/conf/../../layers/meta-frees=
cale/recipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with=
 exit code &#39;1&#39;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Mon, 6 Jul 2020 at 17:38, Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; =
wrote:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield &lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; We have a fixup patch for this one in test rig=
ht now, so we don&#39;t want<br>
&gt;&gt; &gt; &gt;&gt; &gt; this patch, without the follow up.<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; But this is useful for dunfell, since it was a=
n unexpected behaviour<br>
&gt;&gt; &gt; &gt;&gt; &gt; that needed to be fixed.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Thanks, I&#39;ll drop this patch from the pull requ=
est and include it<br>
&gt;&gt; &gt; &gt;&gt; along with the fixup patch in next week&#39;s patch=
 set.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Steve<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman =
&lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.co=
m</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&=
gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; It is uncommon that a BSP definition and =
a defconfig are used in<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; a single configuration. That being said, =
it is a valid way to<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; organize kernel configuration meta data.<=
br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; When a defconfig is used, either on the s=
rc_uri or from in<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; the kernel tree, it is normally expected =
that it is the baseline,<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; with all options applied on top of it.<br=
>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; With this commit, we detect either type o=
f defconfig and ensure<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; that it is used first, followed by the fr=
agments in their<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; previous order. This allows existing conf=
iguration stacks to<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; remain the same, while ensuring that a de=
fconfig combined stack<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; works as expected.<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=
=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=
=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; (cherry picked from commit e6845327b69396=
d843a2f3c4c3ac9400ae9caedf)<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; Signed-off-by: Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt;<=
br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 meta/classes/kernel-yocto.bbclass |=
 33 ++++++++++++++++++++-----------<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 1 file changed, 21 insertions(+), 1=
2 deletions(-)<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; diff --git a/meta/classes/kernel-yocto.bb=
class b/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; index 5bc627066e..41d8620e67 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; --- a/meta/classes/kernel-yocto.bbclass<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +++ b/meta/classes/kernel-yocto.bbclass<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -131,7 +131,7 @@ do_kernel_metadata() =
{<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfi=
g<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;${WORKDIR}/defco=
nfig&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in_tree_defconfig=3D&quot;${W=
ORKDIR}/defconfig&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;A KBUILD_DEF=
CONFIG &#39;${KBUILD_DEFCONFIG}&#39; was specified, but not present in the =
source tree&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -153,14 +153,24 @@ do_kernel_metadata(=
) {<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patches=
=3D&quot;${@&quot; &quot;.join(find_patches(d,&#39;&#39;))}&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feat_dir=
s=3D&quot;${@&quot; &quot;.join(find_kernel_feature_dirs(d))}&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# a quick che=
ck to make sure we don&#39;t have duplicate defconfigs<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# If there&#3=
9;s a defconfig in the SRC_URI, did we also have one from<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# the KBUILD_=
DEFCONFIG processing above ?<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot=
;$sccs&quot; ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# we did have a defconfig from above. remove any that might be in the s=
rc_uri<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk &#39;{ if ($0!=3D&q=
uot;defconfig&quot;) { print $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# a quick che=
ck to make sure we don&#39;t have duplicate defconfigs If<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# there&#39;s=
 a defconfig in the SRC_URI, did we also have one from the<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# KBUILD_DEFC=
ONFIG processing above ?<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri_defco=
nfig=3D$(echo $sccs_from_src_uri | awk &#39;{ if ($0=3D=3D&quot;defconfig&q=
uot;) { print $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# drop and de=
fconfig&#39;s from the src_uri variable, we captured it just above here if =
it existed<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs_from_src=
_uri=3D$(echo $sccs_from_src_uri | awk &#39;{ if ($0!=3D&quot;defconfig&quo=
t;) { print $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot=
;$in_tree_defconfig&quot; ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sccs_defconfig=3D$in_tree_defconfig<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if [ -n &quot;$src_uri_defconfig&quot; ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;[NOTE]: defconfi=
g was supplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defc=
onfig&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# if we didn&#39;t have an in-tree one, make our defconfi=
g the one<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# from the src_uri. Note: there may not have been one fro=
m the<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# src_uri, so this can be an empty variable.<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sccs_defconfig=3D$src_uri_defconfig<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;=
$sccs $sccs_from_src_uri&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;=
$sccs_from_src_uri&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check =
for feature directories/repos/branches that were part of the<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# SRC_UR=
I. If they were supplied, we convert them into include directives<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -187,11 +197,10 @@ do_kernel_metadata(=
) {<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# expand=
 kernel features into their full path equivalents<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bsp_defi=
nition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE} -DKTYPE=3D${LINU=
X_KERNEL_TYPE})<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z =
&quot;$bsp_definition&quot; ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0echo &quot;$sccs&quot; | grep -q defconfig<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if [ -z &quot;$sccs_defconfig&quot; ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Could no=
t locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconf=
ig was provided&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0# if the bsp definition has &quot;define KMETA_EXTERNA=
L_BSP t&quot;,<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0# then we need to set a flag that will instruct the ne=
xt<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0# steps to use the BSP as both configuration and patch=
es.<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -206,7 +215,7 @@ do_kernel_metadata() =
{<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elements=
=
=3D&quot;`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`=
&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n =
&quot;${elements}&quot; ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0echo &quot;${bsp_definition}&quot; &gt; ${S}/${meta_di=
r}/bsp_definition<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes=
} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes=
} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Could no=
t generate configuration queue for ${KMACHINE}.&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; --<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt; 2.17.1<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt; &gt;&gt; &gt; - Thou shalt not follow the NULL pointer, for =
chaos and madness await<br>
&gt;&gt; &gt; &gt;&gt; &gt; thee at its end<br>
&gt;&gt; &gt; &gt;&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br>
&gt;&gt; &gt; &gt;&gt; <br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madn=
ess await<br>
&gt;&gt; &gt; thee at its end<br>
&gt;&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000e2e58705ab1bf8b9--
