Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.1291.1595520398776488218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uHZ9SLTz;
 spf=pass (domain: linaro.org, ip: 209.85.219.49, mailfrom: ryan.harkin@linaro.org)
Received: by mail-qv1-f49.google.com with SMTP id el4so2776156qvb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7fzHbnNfKjAijnn1dNZ8lfVrzE1pinbHj0H2kMsT/M=;
        b=uHZ9SLTzoWOsPyknfN4D+tp7RJnOduK7tnz57nDTENGJWtEflPOQ9GnVXrb+A6uGf1
         liRDroqqo062BDmvUMzIv0VSYxyyLrTUabRcHhE8A43Zj3Zw0H5Ehp3FVm3WmV6banQe
         CMx9eFE1Wmfo3i3UM/EiQcHIKPCzzilYNrPxhGCSvjgU+KIBnCRK4xf1eESGY0qyHhiI
         ZsIGV9qacUH7NRcqpQJss1x6Kpwp7FOHTlEsx+H6DsI5PFSFY6DHOTHv6mhJXw7pEVL+
         kwKFquZMr2W0m5yS+/w6xkjhuKXbFpJQfHymwOrMJsQ1vgjj+6j1924cem42eoX6df31
         a2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7fzHbnNfKjAijnn1dNZ8lfVrzE1pinbHj0H2kMsT/M=;
        b=pvn4a4jejQJf2xaQvfO8Fe20ESHYyr60xr+L5OWdBJM5ykAYHQ1OQQyiFjuFHRPGnQ
         /6VlnUqefb8SHUrRjYar4fhktbs+oWGk3yy7+EDm1UV84pjuYoa5fCDIi/qaspm1NTnY
         c+Y2mSokHOF6vEtGpIT2/LSlI3hWEgHNK+Z70PDUWgLHU70keexAdeuCblotQ6jBsS53
         1fVkWokkPEsyIaTZfYKfX1C1dxqm0+6FsUpuFaK/pQJohi8pZ8x3S5kmZSAQpQI0uaVv
         PUGeHsr5u6MApUIpPEIyO4sW4yugcr5n1PVahp8sBReb0gQ2IUGFhIY+qfeIan5oalfu
         6slw==
X-Gm-Message-State: AOAM530CzC493U5hXBgHeDcYPpFg08ZXU0oFpAgHqRGVMEyFsYhn4Oqe
	7c2PFWOPj+6w44ehLnd74KujwWYU1+BIUqNWSBT9Kg==
X-Google-Smtp-Source: ABdhPJxxTrFHob3Doyy1xfq/RYOKQt/f9lGaLtcW4OVmPa22XfyX0o1600ZdclYHKTNz6fLEJg+vj+mGeqmbuk7+H6g=
X-Received: by 2002:ad4:4732:: with SMTP id l18mr5320788qvz.208.1595520397630;
 Thu, 23 Jul 2020 09:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
 <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
 <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
 <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com>
 <CAD0U-hK0upC8OpXCU_FsHt_46gmcfMKO32Y2zjVKf-d27dviFw@mail.gmail.com>
 <CADkTA4M895FfQer_n4-5TF5ycq9g5nsmaHWqzCHiBCQwd4oR2w@mail.gmail.com>
 <CAD0U-h+Cc94LdVMGpGR8Cn0hBcr0YQSefv=+7XhgXXym6TAufg@mail.gmail.com> <CADkTA4Ord_XFE3nTFCOTp=hzRQWbUtyJbZEA9G4BWnZG7G2+Tg@mail.gmail.com>
In-Reply-To: <CADkTA4Ord_XFE3nTFCOTp=hzRQWbUtyJbZEA9G4BWnZG7G2+Tg@mail.gmail.com>
From: "Ryan Harkin" <ryan.harkin@linaro.org>
Date: Thu, 23 Jul 2020 17:06:24 +0100
Message-ID: <CAD0U-hLJpDSDC_9YyYziwWTPw_Dt=GHBdCLYiEXdRs-+pJyjwQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008873db05ab1e0a7d"

--0000000000008873db05ab1e0a7d
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jul 2020 at 16:05, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Thu, Jul 23, 2020 at 9:38 AM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >
> > Hi Bruce,
> >
> > On Thu, 23 Jul 2020 at 13:27, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >>
> >> On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >> >
> >> > Hi Bruce, Steve,
> >> >
> >> > Thanks for your replies and the help.
> >> >
> >> > On Thu, 23 Jul 2020 at 04:33, Steve Sakoman <steve@sakoman.com>
> wrote:
> >> >>
> >> >> On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >> >> >
> >> >> > On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <
> ryan.harkin@linaro.org> wrote:
> >> >> > >
> >> >> > > Just an FYI, but when this was submitted, my imx7s-warp builds
> began to fail when building linux-fslc from meta-freescale /
> meta-freescale-3rdparty.
> >> >> > >
> >> >> > > I'm not sure why yet, I've only discovered the problem, but I
> thought I'd report it in case anyone else sees the problem.
> >> >> > >
> >> >> >
> >> >> > Someone already sent a dunfell backport request for a follow up
> patch to this.
> >> >> >
> >> >> > It went to the poky list, but I just replied to it and copied
> oe-core.
> >> >>
> >> >> Both patches are already in dunfell!
> >> >>
> >> >>
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=7ecc81baeacaa1149a4947791200e8819c3df677
> >> >>
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=11089e06bfb3d0defb52825ffba978d085385569
> >> >
> >> >
> >> > Yes, they are present. I guess I should have checked the error
> messages more closely during git bisect rather than stopping as soon as the
> build failed.
> >> >
> >> > After Bruce's 7ecc81baea patch, I see this error:
> >> >
> >> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_metadata:
> Could not locate BSP definition for imx7s-warp/standard and no defconfig
> was provided
> >> >
> >> > Then, after 11089e06bf, I see the error I originally posted from my
> CI job, but reproduced here from a local build:
> >> >
> >> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme:
> Execution of
> '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.31899'
> failed with exit code 1:
> >> > WARNING: exit code 1 from a shell command.
> >> >
> >> > ERROR: Logfile of failure stored in:
> /data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899
> >> > Log data follows:
> >> > | DEBUG: Executing python function extend_recipe_sysroot
> >> > | NOTE: Direct dependencies are
> ['/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:do_populate_sysroot',
> 'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot',
> '/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot',
> 'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot',
> '/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
> '/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
> 'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:
> do_populate_sysroot']
> >> > | NOTE: Installed into sysroot: []
> >> > | NOTE: Skipping as already exists in sysroot: ['gcc-cross-arm',
> 'bc-native', 'binutils-cross-arm', 'bison-native', 'quilt-native',
> 'kern-tools-native', 'patch-native', 'readline-native', 'flex-native',
> 'automake-native', 'texinfo-dummy-native', 'autoconf-native',
> 'libtool-native', 'gnu-config-native', 'xz-native',
> 'gettext-minimal-native', 'libmpc-native', 'gmp-native', 'zlib-native',
> 'mpfr-native', 'linux-libc-headers', 'attr-native', 'ncurses-native',
> 'm4-native', 'pkgconfig-native']
> >> > | DEBUG: Python function extend_recipe_sysroot finished
> >> > | DEBUG: Executing shell function do_kernel_configme
> >> > | WARNING: exit code 1 from a shell command.
> >> > | ERROR: Execution of
> '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.31899'
> failed with exit code 1:
> >> > | WARNING: exit code 1 from a shell command.
> >> >
> >> > I haven't yet looked at what these patches do, but I'm expecting
> there's something to update in the linux-fslc recipe, unless there's
> another issue in the defconfig patches.
> >> >
> >>
> >> We've had multiple reports that with those patches the linux-fslc
> >> recipe is building. So something else may be going on in your setup.
> >
> >
> > That's reassuring.
> >
> >>
> >> If you have a set of layers and build steps, can you send them to me ?
> >> I can spin up a local build and see if I get the same behaviour.
> >
> >
> > Thanks for the offer. I'm based on Linaro's "OE-RPB" setup.
> >
> > My own layer is quite simple:
> > https://git.linaro.org/people/ryan.harkin/meta-warp7.git/log/?h=dunfell
> >
> > I mostly provide a new image definition and a simple u-boot patch to
> change the console UART for our CI system. I don't have a kernel recipe
> overlaying linux-fslc.
> >
> > My basic steps to clone and build are:
> > --------------------------
> > mkdir /data/warp7/workspace-dunfell
> > cd /data/warp7/workspace-dunfell
> > repo init -u \
> > https://git.linaro.org/people/ryan.harkin/oe-rpb-manifest.git \
> > -b dunfell
> > repo sync
> >
> > # link in shared downloads and sstate-cache
> > ln -s /linaro/oe-rpb/downloads . && ln -s /linaro/oe-rpb/sstate-cache .
> >
> > export MACHINE=imx7s-warp ; export DISTRO=rpb ; . setup-environment
> > bitbake warp7-console-image
> > --------------------------
> >
>
> I'm spinning up a build now (but as usual, I'm fighting some
> infrastructure issues and can't get repo to install).
>

It looks like you can stand down on this...


>
> Steve mentioned two patches ... but can you also confirm that:
> [kernel-yocto: account for extracted defconfig in elements check] is
> in the branch you are building ?
>

That patch wasn't in my dunfell branch, so I cherry-picked it from master
locally and now the build is working again.
Meanwhile, doing a "git remote update" and I see the patch is now on top of
the dunfell branch as of today, and my build is working again.

Great, thanks for your help folks.

Regards,
Ryan.




>
> Bruce
>
>
> > Right now, I've pinned oo-core to my last known working build from
> before your recent defconfig patch, so you'll want to go into
> layer/openembedded-core and checkout the latest commits.
> >
> > For reference, my pinned commit:
> > cabaf5654d  2020-07-06  iso-codes: switch upstream branch master ->
> main                [Hongxu Jia]
> >
> > Local testing tells me that the repo works fine for me all the way up to
> just before your commit, at this point:
> > 2399fdf98a  2020-07-03  classes/archive: do_configure should not depend
> on do_ar_p..    [Joshua Watt]
> >
> > I'm building on an Ubuntu 18.04 host locally.
> >
> > Regards,
> > Ryan.
> >
> >
> >>
> >>
> >> Bruce
> >>
> >> > Regards,
> >> > Ryan.
> >> >
> >> >
> >> >
> >> >
> >> >
> >> >
> >> >>
> >> >>
> >> >>
> >> >> Steve
> >> >>
> >> >> > > Here's a link to my failing build for reference:
> >> >> > >
> https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=rpb,MACHINE=imx7s-warp,label=docker-buster-amd64/consoleText
> >> >> > >
> >> >> > > And a snippet from the failure:
> >> >> > >
> >> >> > > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0
> do_kernel_configme: Execution of
> '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
> failed with exit code 1:
> >> >> > > WARNING: exit code 1 from a shell command.
> >> >> > >
> >> >> > > ERROR: Logfile of failure stored in:
> /srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.7123
> >> >> > > Log data follows:
> >> >> > > | DEBUG: Executing python function extend_recipe_sysroot
> >> >> > > | NOTE: Direct dependencies are
> ['virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
> 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:
> do_populate_sysroot']
> >> >> > > | NOTE: Installed into sysroot: []
> >> >> > > | NOTE: Skipping as already exists in sysroot: ['bison-native',
> 'kern-tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-native',
> 'bc-native', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native',
> 'gnu-config-native', 'readline-native', 'libtool-native',
> 'automake-native', 'autoconf-native', 'xz-native', 'linux-libc-headers',
> 'gmp-native', 'libmpc-native', 'mpfr-native', 'zlib-native',
> 'gettext-minimal-native', 'attr-native', 'm4-native', 'ncurses-native',
> 'pkgconfig-native']
> >> >> > > | DEBUG: Python function extend_recipe_sysroot finished
> >> >> > > | DEBUG: Executing shell function do_kernel_configme
> >> >> > > | WARNING: exit code 1 from a shell command.
> >> >> > > | ERROR: Execution of
> '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
> failed with exit code 1:
> >> >> > > | WARNING: exit code 1 from a shell command.
> >> >> > > |
> >> >> > > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task
> do_kernel_configme: Failed
> >> >> > > ERROR: Task
> (/srv/oe/build/conf/../../layers/meta-freescale/recipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme)
> failed with exit code '1'
> >> >> > >
> >> >> > >
> >> >> > >
> >> >> > > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com>
> wrote:
> >> >> > >>
> >> >> > >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >> >> > >> >
> >> >> > >> > We have a fixup patch for this one in test right now, so we
> don't want
> >> >> > >> > this patch, without the follow up.
> >> >> > >> >
> >> >> > >> > But this is useful for dunfell, since it was an unexpected
> behaviour
> >> >> > >> > that needed to be fixed.
> >> >> > >>
> >> >> > >> Thanks, I'll drop this patch from the pull request and include
> it
> >> >> > >> along with the fixup patch in next week's patch set.
> >> >> > >>
> >> >> > >> Steve
> >> >> > >>
> >> >> > >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <
> steve@sakoman.com> wrote:
> >> >> > >> > >
> >> >> > >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> >> > >> > >
> >> >> > >> > > It is uncommon that a BSP definition and a defconfig are
> used in
> >> >> > >> > > a single configuration. That being said, it is a valid way
> to
> >> >> > >> > > organize kernel configuration meta data.
> >> >> > >> > >
> >> >> > >> > > When a defconfig is used, either on the src_uri or from in
> >> >> > >> > > the kernel tree, it is normally expected that it is the
> baseline,
> >> >> > >> > > with all options applied on top of it.
> >> >> > >> > >
> >> >> > >> > > With this commit, we detect either type of defconfig and
> ensure
> >> >> > >> > > that it is used first, followed by the fragments in their
> >> >> > >> > > previous order. This allows existing configuration stacks to
> >> >> > >> > > remain the same, while ensuring that a defconfig combined
> stack
> >> >> > >> > > works as expected.
> >> >> > >> > >
> >> >> > >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> >> > >> > > Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org>
> >> >> > >> > > (cherry picked from commit
> e6845327b69396d843a2f3c4c3ac9400ae9caedf)
> >> >> > >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> >> > >> > > ---
> >> >> > >> > >  meta/classes/kernel-yocto.bbclass | 33
> ++++++++++++++++++++-----------
> >> >> > >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
> >> >> > >> > >
> >> >> > >> > > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> >> >> > >> > > index 5bc627066e..41d8620e67 100644
> >> >> > >> > > --- a/meta/classes/kernel-yocto.bbclass
> >> >> > >> > > +++ b/meta/classes/kernel-yocto.bbclass
> >> >> > >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
> >> >> > >> > >                         else
> >> >> > >> > >                                 cp -f
> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> >> >> > >> > >                         fi
> >> >> > >> > > -                       sccs="${WORKDIR}/defconfig"
> >> >> > >> > > +
>  in_tree_defconfig="${WORKDIR}/defconfig"
> >> >> > >> > >                 else
> >> >> > >> > >                         bbfatal "A KBUILD_DEFCONFIG
> '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
> >> >> > >> > >                 fi
> >> >> > >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
> >> >> > >> > >         patches="${@" ".join(find_patches(d,''))}"
> >> >> > >> > >         feat_dirs="${@"
> ".join(find_kernel_feature_dirs(d))}"
> >> >> > >> > >
> >> >> > >> > > -       # a quick check to make sure we don't have
> duplicate defconfigs
> >> >> > >> > > -       # If there's a defconfig in the SRC_URI, did we
> also have one from
> >> >> > >> > > -       # the KBUILD_DEFCONFIG processing above ?
> >> >> > >> > > -       if [ -n "$sccs" ]; then
> >> >> > >> > > -           # we did have a defconfig from above. remove
> any that might be in the src_uri
> >> >> > >> > > -           sccs_from_src_uri=$(echo $sccs_from_src_uri |
> awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> >> >> > >> > > +       # a quick check to make sure we don't have
> duplicate defconfigs If
> >> >> > >> > > +       # there's a defconfig in the SRC_URI, did we also
> have one from the
> >> >> > >> > > +       # KBUILD_DEFCONFIG processing above ?
> >> >> > >> > > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk
> '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> >> >> > >> > > +       # drop and defconfig's from the src_uri variable,
> we captured it just above here if it existed
> >> >> > >> > > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk
> '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> >> >> > >> > > +       if [ -n "$in_tree_defconfig" ]; then
> >> >> > >> > > +               sccs_defconfig=$in_tree_defconfig
> >> >> > >> > > +               if [ -n "$src_uri_defconfig" ]; then
> >> >> > >> > > +                       bbwarn "[NOTE]: defconfig was
> supplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> >> >> > >> > > +               fi
> >> >> > >> > > +       else
> >> >> > >> > > +               # if we didn't have an in-tree one, make
> our defconfig the one
> >> >> > >> > > +               # from the src_uri. Note: there may not
> have been one from the
> >> >> > >> > > +               # src_uri, so this can be an empty variable.
> >> >> > >> > > +               sccs_defconfig=$src_uri_defconfig
> >> >> > >> > >         fi
> >> >> > >> > > -       sccs="$sccs $sccs_from_src_uri"
> >> >> > >> > > +       sccs="$sccs_from_src_uri"
> >> >> > >> > >
> >> >> > >> > >         # check for feature directories/repos/branches that
> were part of the
> >> >> > >> > >         # SRC_URI. If they were supplied, we convert them
> into include directives
> >> >> > >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
> >> >> > >> > >         # expand kernel features into their full path
> equivalents
> >> >> > >> > >         bsp_definition=$(spp ${includes} --find
> -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
> >> >> > >> > >         if [ -z "$bsp_definition" ]; then
> >> >> > >> > > -               echo "$sccs" | grep -q defconfig
> >> >> > >> > > -               if [ $? -ne 0 ]; then
> >> >> > >> > > +               if [ -z "$sccs_defconfig" ]; then
> >> >> > >> > >                         bbfatal_log "Could not locate BSP
> definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was
> provided"
> >> >> > >> > >                 fi
> >> >> > >> > > -
> >> >> > >> > > +       else
> >> >> > >> > >                 # if the bsp definition has "define
> KMETA_EXTERNAL_BSP t",
> >> >> > >> > >                 # then we need to set a flag that will
> instruct the next
> >> >> > >> > >                 # steps to use the BSP as both
> configuration and patches.
> >> >> > >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
> >> >> > >> > >         elements="`echo -n ${bsp_definition} ${sccs}
> ${patches} ${KERNEL_FEATURES}`"
> >> >> > >> > >         if [ -n "${elements}" ]; then
> >> >> > >> > >                 echo "${bsp_definition}" >
> ${S}/${meta_dir}/bsp_definition
> >> >> > >> > > -               scc --force -o
> ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs}
> ${patches} ${KERNEL_FEATURES}
> >> >> > >> > > +               scc --force -o
> ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition
> $sccs $patches ${KERNEL_FEATURES}
> >> >> > >> > >                 if [ $? -ne 0 ]; then
> >> >> > >> > >                         bbfatal_log "Could not generate
> configuration queue for ${KMACHINE}."
> >> >> > >> > >                 fi
> >> >> > >> > > --
> >> >> > >> > > 2.17.1
> >> >> > >> > >
> >> >> > >> > >
> >> >> > >> >
> >> >> > >> >
> >> >> > >> >
> >> >> > >> > --
> >> >> > >> > - Thou shalt not follow the NULL pointer, for chaos and
> madness await
> >> >> > >> > thee at its end
> >> >> > >> > - "Use the force Harry" - Gandalf, Star Trek II
> >> >> > >> 
> >> >> >
> >> >> >
> >> >> >
> >> >> > --
> >> >> > - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> >> >> > thee at its end
> >> >> > - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--0000000000008873db05ab1e0a7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 23 Jul 2020 at 16:05, Bruce A=
shfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, Jul 23, 2020 at 9:38 AM Ryan Harkin &lt;<a href=3D"mailto:ryan=
.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; On Thu, 23 Jul 2020 at 13:27, Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin &lt;<a href=3D"mailto=
:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; w=
rote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Bruce, Steve,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks for your replies and the help.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, 23 Jul 2020 at 04:33, Steve Sakoman &lt;<a href=3D"m=
ailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:=
<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield &lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin &lt;<a =
href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro=
.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Just an FYI, but when this was submitted, my i=
mx7s-warp builds began to fail when building linux-fslc from meta-freescale=
 / meta-freescale-3rdparty.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; I&#39;m not sure why yet, I&#39;ve only discov=
ered the problem, but I thought I&#39;d report it in case anyone else sees =
the problem.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Someone already sent a dunfell backport request for=
 a follow up patch to this.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; It went to the poky list, but I just replied to it =
and copied oe-core.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Both patches are already in dunfell!<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-cor=
e/commit/?h=3Ddunfell&amp;id=3D7ecc81baeacaa1149a4947791200e8819c3df677" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core/commit/?h=3Ddunfell&amp;id=3D7ecc81baeacaa1149a4947791200e8819c3df67=
7</a><br>
&gt;&gt; &gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-cor=
e/commit/?h=3Ddunfell&amp;id=3D11089e06bfb3d0defb52825ffba978d085385569" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core/commit/?h=3Ddunfell&amp;id=3D11089e06bfb3d0defb52825ffba978d08538556=
9</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Yes, they are present. I guess I should have checked the err=
or messages more closely during git bisect rather than stopping as soon as =
the build failed.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; After Bruce&#39;s 7ecc81baea patch, I see this error:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_=
metadata: Could not locate BSP definition for imx7s-warp/standard and no de=
fconfig was provided<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Then, after 11089e06bf, I see the error I originally posted =
from my CI job, but reproduced here from a local build:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_=
configme: Execution of &#39;/data/warp7/workspace-dunfell/build-rpb/tmp-rpb=
-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38=
d6c3525e-r0/temp/run.do_kernel_configme.31899&#39; failed with exit code 1:=
<br>
&gt;&gt; &gt; WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: Logfile of failure stored in: /data/warp7/workspace-d=
unfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-f=
slc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899<br>
&gt;&gt; &gt; Log data follows:<br>
&gt;&gt; &gt; | DEBUG: Executing python function extend_recipe_sysroot<br>
&gt;&gt; &gt; | NOTE: Direct dependencies are [&#39;/data/warp7/workspace-=
dunfell/build-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-cross_arm-9.2.bb:do_populate_sysroot&#39;, &#39;virtual:nativ=
e:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-co=
re/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot&#39;, &#39;/da=
ta/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/me=
ta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot&#39=
;, &#39;virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../l=
ayers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_popul=
ate_sysroot&#39;, &#39;/data/warp7/workspace-dunfell/build-rpb/conf/../../l=
ayers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do=
_populate_sysroot&#39;, &#39;/data/warp7/workspace-dunfell/build-rpb/conf/.=
./../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-nat=
ive_git.bb:do_populate_sysroot&#39;, &#39;virtual:native:/data/warp7/worksp=
ace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devt=
ools/patch/patch_2.7.6.bb:do_populate_sysroot&#39;]<br>
&gt;&gt; &gt; | NOTE: Installed into sysroot: []<br>
&gt;&gt; &gt; | NOTE: Skipping as already exists in sysroot: [&#39;gcc-cro=
ss-arm&#39;, &#39;bc-native&#39;, &#39;binutils-cross-arm&#39;, &#39;bison-=
native&#39;, &#39;quilt-native&#39;, &#39;kern-tools-native&#39;, &#39;patc=
h-native&#39;, &#39;readline-native&#39;, &#39;flex-native&#39;, &#39;autom=
ake-native&#39;, &#39;texinfo-dummy-native&#39;, &#39;autoconf-native&#39;,=
 &#39;libtool-native&#39;, &#39;gnu-config-native&#39;, &#39;xz-native&#39;=
, &#39;gettext-minimal-native&#39;, &#39;libmpc-native&#39;, &#39;gmp-nativ=
e&#39;, &#39;zlib-native&#39;, &#39;mpfr-native&#39;, &#39;linux-libc-heade=
rs&#39;, &#39;attr-native&#39;, &#39;ncurses-native&#39;, &#39;m4-native&#3=
9;, &#39;pkgconfig-native&#39;]<br>
&gt;&gt; &gt; | DEBUG: Python function extend_recipe_sysroot finished<br>
&gt;&gt; &gt; | DEBUG: Executing shell function do_kernel_configme<br>
&gt;&gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt; | ERROR: Execution of &#39;/data/warp7/workspace-dunfell/bui=
ld-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46=
+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.31899&#39; failed wit=
h exit code 1:<br>
&gt;&gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I haven&#39;t yet looked at what these patches do, but I&#39=
;m expecting there&#39;s something to update in the linux-fslc recipe, unle=
ss there&#39;s another issue in the defconfig patches.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; We&#39;ve had multiple reports that with those patches the linux-=
fslc<br>
&gt;&gt; recipe is building. So something else may be going on in your set=
up.<br>
&gt;<br>
&gt;<br>
&gt; That&#39;s reassuring.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; If you have a set of layers and build steps, can you send them to=
 me ?<br>
&gt;&gt; I can spin up a local build and see if I get the same behaviour.<=
br>
&gt;<br>
&gt;<br>
&gt; Thanks for the offer. I&#39;m based on Linaro&#39;s &quot;OE-RPB&quot=
; setup.<br>
&gt;<br>
&gt; My own layer is quite simple:<br>
&gt; <a href=3D"https://git.linaro.org/people/ryan.harkin/meta-warp7.git/l=
og/?h=3Ddunfell" rel=3D"noreferrer" target=3D"_blank">https://git.linaro.or=
g/people/ryan.harkin/meta-warp7.git/log/?h=3Ddunfell</a><br>
&gt;<br>
&gt; I mostly provide a new image definition and a simple u-boot patch to =
change the console UART for our CI system. I don&#39;t have a kernel recipe=
 overlaying linux-fslc.<br>
&gt;<br>
&gt; My basic steps to clone and build are:<br>
&gt; --------------------------<br>
&gt; mkdir /data/warp7/workspace-dunfell<br>
&gt; cd /data/warp7/workspace-dunfell<br>
&gt; repo init -u \<br>
&gt; <a href=3D"https://git.linaro.org/people/ryan.harkin/oe-rpb-manifest.=
git" rel=3D"noreferrer" target=3D"_blank">https://git.linaro.org/people/rya=
n.harkin/oe-rpb-manifest.git</a> \<br>
&gt; -b dunfell<br>
&gt; repo sync<br>
&gt;<br>
&gt; # link in shared downloads and sstate-cache<br>
&gt; ln -s /linaro/oe-rpb/downloads . &amp;&amp; ln -s /linaro/oe-rpb/ssta=
te-cache .<br>
&gt;<br>
&gt; export MACHINE=3Dimx7s-warp ; export DISTRO=3Drpb ; . setup-environme=
nt<br>
&gt; bitbake warp7-console-image<br>
&gt; --------------------------<br>
&gt;<br>
<br>
I&#39;m spinning up a build now (but as usual, I&#39;m fighting some<br>
infrastructure issues and can&#39;t get repo to install).<br></blockquote>=
<div><br></div><div>It looks like you can stand down on this...</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Steve mentioned two patches ... but can you also confirm that:<br>
[kernel-yocto: account for extracted defconfig in elements check] is<br>
in the branch you are building ?<br></blockquote><div><br></div><div>That =
patch wasn&#39;t in my dunfell branch, so I cherry-picked it from master lo=
cally and now the build is working again.</div><div>Meanwhile, doing a=C2=
=A0&quot;git remote update&quot; and I see the patch is now on top of the =
dunfell branch as of today, and my build is working again.</div><div><br></=
div><div>Great, thanks for your help folks.</div><div><br></div><div>Regard=
s,</div><div>Ryan.</div><div><br></div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
<br>
&gt; Right now, I&#39;ve pinned oo-core to my last known working build fro=
m before your recent defconfig patch, so you&#39;ll want to go into layer/o=
penembedded-core and checkout the latest commits.<br>
&gt;<br>
&gt; For reference, my pinned commit:<br>
&gt; cabaf5654d=C2=A0 2020-07-06=C2=A0 iso-codes: switch upstream branch m=
aster -&gt; main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Ho=
ngxu Jia]<br>
&gt;<br>
&gt; Local testing tells me that the repo works fine for me all the way up=
 to just before your commit, at this point:<br>
&gt; 2399fdf98a=C2=A0 2020-07-03=C2=A0 classes/archive: do_configure shoul=
d not depend on do_ar_p..=C2=A0 =C2=A0 [Joshua Watt]<br>
&gt;<br>
&gt; I&#39;m building on an Ubuntu 18.04 host locally.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Ryan.<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Ryan.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Steve<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Here&#39;s a link to my failing build for refe=
rence:<br>
&gt;&gt; &gt;&gt; &gt; &gt; <a href=3D"https://ci.linaro.org/job/warp7-ope=
nembedded-dunfell/67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buste=
r-amd64/consoleText" rel=3D"noreferrer" target=3D"_blank">https://ci.linaro=
.org/job/warp7-openembedded-dunfell/67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,la=
bel=3Ddocker-buster-amd64/consoleText</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; And a snippet from the failure:<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e=
-r0 do_kernel_configme: Execution of &#39;/srv/oe/build/tmp-rpb-glibc/work/=
imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/=
temp/run.do_kernel_configme.7123&#39; failed with exit code 1:<br>
&gt;&gt; &gt;&gt; &gt; &gt; WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; ERROR: Logfile of failure stored in: /srv/oe/b=
uild/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+g=
itAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.7123<br>
&gt;&gt; &gt;&gt; &gt; &gt; Log data follows:<br>
&gt;&gt; &gt;&gt; &gt; &gt; | DEBUG: Executing python function extend_reci=
pe_sysroot<br>
&gt;&gt; &gt;&gt; &gt; &gt; | NOTE: Direct dependencies are [&#39;virtual:=
native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devto=
ols/bison/bison_3.5.3.bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/=
../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-na=
tive_git.bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/=
openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_=
populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/openembedded-co=
re/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot&#39=
;, &#39;virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/me=
ta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot&#39;, &#39;vir=
tual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-=
extended/bc/bc_1.07.1.bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/=
../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm=
-9.2.bb:do_populate_sysroot&#39;]<br>
&gt;&gt; &gt;&gt; &gt; &gt; | NOTE: Installed into sysroot: []<br>
&gt;&gt; &gt;&gt; &gt; &gt; | NOTE: Skipping as already exists in sysroot:=
 [&#39;bison-native&#39;, &#39;kern-tools-native&#39;, &#39;binutils-cross-=
arm&#39;, &#39;quilt-native&#39;, &#39;patch-native&#39;, &#39;bc-native&#3=
9;, &#39;gcc-cross-arm&#39;, &#39;flex-native&#39;, &#39;texinfo-dummy-nati=
ve&#39;, &#39;gnu-config-native&#39;, &#39;readline-native&#39;, &#39;libto=
ol-native&#39;, &#39;automake-native&#39;, &#39;autoconf-native&#39;, &#39;=
xz-native&#39;, &#39;linux-libc-headers&#39;, &#39;gmp-native&#39;, &#39;li=
bmpc-native&#39;, &#39;mpfr-native&#39;, &#39;zlib-native&#39;, &#39;gettex=
t-minimal-native&#39;, &#39;attr-native&#39;, &#39;m4-native&#39;, &#39;ncu=
rses-native&#39;, &#39;pkgconfig-native&#39;]<br>
&gt;&gt; &gt;&gt; &gt; &gt; | DEBUG: Python function extend_recipe_sysroot=
 finished<br>
&gt;&gt; &gt;&gt; &gt; &gt; | DEBUG: Executing shell function do_kernel_co=
nfigme<br>
&gt;&gt; &gt;&gt; &gt; &gt; | WARNING: exit code 1 from a shell command.<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt; | ERROR: Execution of &#39;/srv/oe/build/tmp-r=
pb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+=
38d6c3525e-r0/temp/run.do_kernel_configme.7123&#39; failed with exit code 1=
:<br>
&gt;&gt; &gt;&gt; &gt; &gt; | WARNING: exit code 1 from a shell command.<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt; |<br>
&gt;&gt; &gt;&gt; &gt; &gt; NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6=
c3525e-r0: task do_kernel_configme: Failed<br>
&gt;&gt; &gt;&gt; &gt; &gt; ERROR: Task (/srv/oe/build/conf/../../layers/m=
eta-freescale/recipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme) fa=
iled with exit code &#39;1&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; On Mon, 6 Jul 2020 at 17:38, Steve Sakoman &lt=
;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce=
.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; We have a fixup patch for this one in=
 test right now, so we don&#39;t want<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; this patch, without the follow up.<br=
>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; But this is useful for dunfell, since=
 it was an unexpected behaviour<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; that needed to be fixed.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; Thanks, I&#39;ll drop this patch from the =
pull request and include it<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; along with the fixup patch in next week&#3=
9;s patch set.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; Steve<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; On Mon, Jul 6, 2020 at 12:11 PM Steve=
 Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@s=
akoman.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=
=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; It is uncommon that a BSP defini=
tion and a defconfig are used in<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; a single configuration. That bei=
ng said, it is a valid way to<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; organize kernel configuration me=
ta data.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; When a defconfig is used, either=
 on the src_uri or from in<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; the kernel tree, it is normally =
expected that it is the baseline,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; with all options applied on top =
of it.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; With this commit, we detect eith=
er type of defconfig and ensure<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; that it is used first, followed =
by the fragments in their<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; previous order. This allows exis=
ting configuration stacks to<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; remain the same, while ensuring =
that a defconfig combined stack<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; works as expected.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; Signed-off-by: Bruce Ashfield &l=
t;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfi=
eld@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; Signed-off-by: Richard Purdie &l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; (cherry picked from commit e6845=
327b69396d843a2f3c4c3ac9400ae9caedf)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; Signed-off-by: Steve Sakoman &lt=
;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</=
a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 meta/classes/kernel-yocto.=
bbclass | 33 ++++++++++++++++++++-----------<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 1 file changed, 21 inserti=
ons(+), 12 deletions(-)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; diff --git a/meta/classes/kernel=
-yocto.bbclass b/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; index 5bc627066e..41d8620e67 100=
644<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; --- a/meta/classes/kernel-yocto.=
bbclass<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +++ b/meta/classes/kernel-yocto.=
bbclass<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -131,7 +131,7 @@ do_kernel_me=
tadata() {<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR=
}/defconfig<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;${WORKDIR=
}/defconfig&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in_tree_defconfig=3D&q=
uot;${WORKDIR}/defconfig&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;A=
 KBUILD_DEFCONFIG &#39;${KBUILD_DEFCONFIG}&#39; was specified, but not pres=
ent in the source tree&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -153,14 +153,24 @@ do_kernel_=
metadata() {<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0patches=3D&quot;${@&quot; &quot;.join(find_patches(d,&#39;&#39;))}&quot=
;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0feat_dirs=3D&quot;${@&quot; &quot;.join(find_kernel_feature_dirs(d))}&q=
uot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# a =
quick check to make sure we don&#39;t have duplicate defconfigs<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# If=
 there&#39;s a defconfig in the SRC_URI, did we also have one from<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# th=
e KBUILD_DEFCONFIG processing above ?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [=
 -n &quot;$sccs&quot; ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0# we did have a defconfig from above. remove any that might be i=
n the src_uri<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk &#39;{ if ($=
0!=3D&quot;defconfig&quot;) { print $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# a =
quick check to make sure we don&#39;t have duplicate defconfigs If<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# th=
ere&#39;s a defconfig in the SRC_URI, did we also have one from the<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# KB=
UILD_DEFCONFIG processing above ?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0src_=
uri_defconfig=3D$(echo $sccs_from_src_uri | awk &#39;{ if ($0=3D=3D&quot;de=
fconfig&quot;) { print $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# dr=
op and defconfig&#39;s from the src_uri variable, we captured it just above=
 here if it existed<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=
_from_src_uri=3D$(echo $sccs_from_src_uri | awk &#39;{ if ($0!=3D&quot;defc=
onfig&quot;) { print $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [=
 -n &quot;$in_tree_defconfig&quot; ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0sccs_defconfig=3D$in_tree_defconfig<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$src_uri_defconfig&quot; ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;[NOTE]: d=
efconfig was supplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_U=
RI defconfig&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0# if we didn&#39;t have an in-tree one, make our d=
efconfig the one<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0# from the src_uri. Note: there may not have been =
one from the<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0# src_uri, so this can be an empty variable.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0sccs_defconfig=3D$src_uri_defconfig<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fi<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=
=
=3D&quot;$sccs $sccs_from_src_uri&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=
=
=3D&quot;$sccs_from_src_uri&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# check for feature directories/repos/branches that were part of the<br=
>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# SRC_URI. If they were supplied, we convert them into include directiv=
es<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -187,11 +197,10 @@ do_kernel_=
metadata() {<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# expand kernel features into their full path equivalents<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE} -DKT=
YPE=3D${LINUX_KERNEL_TYPE})<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if [ -z &quot;$bsp_definition&quot; ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$sccs&quot; | grep -q defconfig<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$sccs_defconfig&quot; ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &qu=
ot;Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and=
 no defconfig was provided&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# if the bsp definition has &quot;define KM=
ETA_EXTERNAL_BSP t&quot;,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# then we need to set a flag that will inst=
ruct the next<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# steps to use the BSP as both configuratio=
n and patches.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; @@ -206,7 +215,7 @@ do_kernel_me=
tadata() {<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0elements=3D&quot;`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL=
_FEATURES}`&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if [ -n &quot;${elements}&quot; ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${bsp_definition}&quot; &gt; ${S=
}/${meta_dir}/bsp_definition<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${i=
ncludes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${i=
ncludes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}<=
br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &qu=
ot;Could not generate configuration queue for ${KMACHINE}.&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; 2.17.1<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; - Thou shalt not follow the NULL poin=
ter, for chaos and madness await<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; thee at its end<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; - &quot;Use the force Harry&quot; - G=
andalf, Star Trek II<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; <br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos=
 and madness await<br>
&gt;&gt; &gt;&gt; &gt; thee at its end<br>
&gt;&gt; &gt;&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--0000000000008873db05ab1e0a7d--
