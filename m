Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web12.334.1595529252823970650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 11:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k6PC3LLu;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: andrey.z@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id q85so1627345vke.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nciYGaSLuEXUM494BqUn2asK7H+Dlb3uarO3DJWhmMg=;
        b=k6PC3LLuE8Fc1/gK4oDoVUUVoe91AGLxIyYn2J41nv+yAimRHRivsXpuVoZrQmZTxy
         e2iXDHHyp7WJ3atu+c8rbAx22LJ0g1ftptlWLbSzUXPGKqlZwN/ZGdcMapUo1gTHpQLW
         k+lFyqOIbyRCIarVQobnS4yi/Iw+QjVS/OaW6lHb1y+2cVI38yhsJBmCO3bxfyk3D3YY
         3QoQZ5pPJgTg9q2/IJxWaUxT0OTa1OYuwYGvw5lVSwao8MotGlie2AsokcH0Th1uqdFe
         EgVnnH2MiF4VONmgMYkLRW26LPDAmCegCwPMSkLIvxy4NFe9hfGZoy2gEVItfM/o5qUC
         /Tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nciYGaSLuEXUM494BqUn2asK7H+Dlb3uarO3DJWhmMg=;
        b=ipeIt9IKJGnGnmYuiBUxuGMlUO+X7T4MI1f2JC74NY76aa6Z86dEfW4SLEY7sSQHjP
         lWLr4icylmxJojbEcdOV3mOiCptyzGL56JUDi0D5+J2wXH4zW33lXC39ihm24N6UoY94
         KohfyphZeIJGXAjCfTuRc8/ExSx1DO/yTIBp4uUKrA/GjbyVCqgmrv/I8hCNMhieSF9e
         nWHh+MahuTi+lxw8KSL9B3XkmnrLCF3LJtfK/lFP2IX0h2zNvAX1CSYMGXVeU/Ra0Wp8
         aTfnDAOqSDsfMYg4pD15+zmI9xN0drOdlFzhS/wq+cWvquqq1HljnJ0cOpxzDJNerys+
         cMqQ==
X-Gm-Message-State: AOAM531hf+vcCrUxtbYp6fXUTAZsg1qOz/WYoCeROnCe11kQmEbH8ps9
	r0+d9KYZgGut1HuQEGsGvA/1ZWatYZPvvOne4sY=
X-Google-Smtp-Source: ABdhPJwDj9uzB78pj1q8bRpezlQMWhT2wP2r9aRKAEKKYZrqKCF2Kfr+NACB+Je5byxuCiZIT76wVrcE2XLJkwqC5rM=
X-Received: by 2002:a1f:1185:: with SMTP id 127mr5072290vkr.23.1595529251611;
 Thu, 23 Jul 2020 11:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
 <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
 <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
 <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com>
 <CAD0U-hK0upC8OpXCU_FsHt_46gmcfMKO32Y2zjVKf-d27dviFw@mail.gmail.com>
 <CADkTA4M895FfQer_n4-5TF5ycq9g5nsmaHWqzCHiBCQwd4oR2w@mail.gmail.com>
 <CAD0U-h+Cc94LdVMGpGR8Cn0hBcr0YQSefv=+7XhgXXym6TAufg@mail.gmail.com>
 <CADkTA4Ord_XFE3nTFCOTp=hzRQWbUtyJbZEA9G4BWnZG7G2+Tg@mail.gmail.com> <CAD0U-hLJpDSDC_9YyYziwWTPw_Dt=GHBdCLYiEXdRs-+pJyjwQ@mail.gmail.com>
In-Reply-To: <CAD0U-hLJpDSDC_9YyYziwWTPw_Dt=GHBdCLYiEXdRs-+pJyjwQ@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 23 Jul 2020 20:33:59 +0200
Message-ID: <CAHtQpK4iLSNVhsz6BAfBff+ki+nPmJqZZ9oM0uO9+mwN0p3Sqw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey guys,

Sorry for jumping into this thread a bit later - I saw that it has
been sorted out already.

On Thu, Jul 23, 2020 at 6:06 PM Ryan Harkin <ryan.harkin@linaro.org> wrote=
:
>
>
>
> On Thu, 23 Jul 2020 at 16:05, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>>
>> On Thu, Jul 23, 2020 at 9:38 AM Ryan Harkin <ryan.harkin@linaro.org> wr=
ote:
>> >
>> > Hi Bruce,
>> >
>> > On Thu, 23 Jul 2020 at 13:27, Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
>> >>
>> >> On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin <ryan.harkin@linaro.org>=
 wrote:
>> >> >
>> >> > Hi Bruce, Steve,
>> >> >
>> >> > Thanks for your replies and the help.
>> >> >
>> >> > On Thu, 23 Jul 2020 at 04:33, Steve Sakoman <steve@sakoman.com> wr=
ote:
>> >> >>
>> >> >> On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>> >> >> >
>> >> >> > On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@linaro=
.org> wrote:
>> >> >> > >
>> >> >> > > Just an FYI, but when this was submitted, my imx7s-warp build=
s began to fail when building linux-fslc from meta-freescale / meta-freesca=
le-3rdparty.
>> >> >> > >
>> >> >> > > I'm not sure why yet, I've only discovered the problem, but I=
 thought I'd report it in case anyone else sees the problem.
>> >> >> > >
>> >> >> >
>> >> >> > Someone already sent a dunfell backport request for a follow up=
 patch to this.
>> >> >> >
>> >> >> > It went to the poky list, but I just replied to it and copied o=
e-core.
>> >> >>
>> >> >> Both patches are already in dunfell!
>> >> >>
>> >> >> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfel=
l&id=3D7ecc81baeacaa1149a4947791200e8819c3df677
>> >> >> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfel=
l&id=3D11089e06bfb3d0defb52825ffba978d085385569
>> >> >
>> >> >
>> >> > Yes, they are present. I guess I should have checked the error mes=
sages more closely during git bisect rather than stopping as soon as the bu=
ild failed.
>> >> >
>> >> > After Bruce's 7ecc81baea patch, I see this error:
>> >> >
>> >> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_metada=
ta: Could not locate BSP definition for imx7s-warp/standard and no defconfi=
g was provided
>> >> >
>> >> > Then, after 11089e06bf, I see the error I originally posted from m=
y CI job, but reproduced here from a local build:

This was the patch I've introduced and seeing those errors were quite
a surprise to me. I have also an internal CI that builds
meta-freescale off the dunfell branch - and I never had any issues
with it.

>> >> >
>> >> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_config=
me: Execution of '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/wor=
k/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r=
0/temp/run.do_kernel_configme.31899' failed with exit code 1:
>> >> > WARNING: exit code 1 from a shell command.
>> >> >
>> >> > ERROR: Logfile of failure stored in: /data/warp7/workspace-dunfell=
/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.=
4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899
>> >> > Log data follows:
>> >> > | DEBUG: Executing python function extend_recipe_sysroot
>> >> > | NOTE: Direct dependencies are ['/data/warp7/workspace-dunfell/bu=
ild-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/=
gcc-cross_arm-9.2.bb:do_populate_sysroot', 'virtual:native:/data/warp7/work=
space-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-ex=
tended/bc/bc_1.07.1.bb:do_populate_sysroot', '/data/warp7/workspace-dunfell=
/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/binuti=
ls/binutils-cross_2.34.bb:do_populate_sysroot', 'virtual:native:/data/warp7=
/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recip=
es-devtools/bison/bison_3.5.3.bb:do_populate_sysroot', '/data/warp7/workspa=
ce-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devto=
ols/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/data/warp7/workspace=
-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kernel/=
kern-tools/kern-tools-native_git.bb:do_populate_sysroot', 'virtual:native:/=
data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/=
meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
>> >> > | NOTE: Installed into sysroot: []
>> >> > | NOTE: Skipping as already exists in sysroot: ['gcc-cross-arm', '=
bc-native', 'binutils-cross-arm', 'bison-native', 'quilt-native', 'kern-too=
ls-native', 'patch-native', 'readline-native', 'flex-native', 'automake-nat=
ive', 'texinfo-dummy-native', 'autoconf-native', 'libtool-native', 'gnu-con=
fig-native', 'xz-native', 'gettext-minimal-native', 'libmpc-native', 'gmp-n=
ative', 'zlib-native', 'mpfr-native', 'linux-libc-headers', 'attr-native', =
'ncurses-native', 'm4-native', 'pkgconfig-native']
>> >> > | DEBUG: Python function extend_recipe_sysroot finished
>> >> > | DEBUG: Executing shell function do_kernel_configme
>> >> > | WARNING: exit code 1 from a shell command.
>> >> > | ERROR: Execution of '/data/warp7/workspace-dunfell/build-rpb/tmp=
-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOIN=
C+38d6c3525e-r0/temp/run.do_kernel_configme.31899' failed with exit code 1:
>> >> > | WARNING: exit code 1 from a shell command.
>> >> >
>> >> > I haven't yet looked at what these patches do, but I'm expecting t=
here's something to update in the linux-fslc recipe, unless there's another=
 issue in the defconfig patches.
>> >> >
>> >>
>> >> We've had multiple reports that with those patches the linux-fslc
>> >> recipe is building. So something else may be going on in your setup.

If there were some reports - I haven't seen them...

Bruce, do you happen to have any reference to them? I'm trying to
merge and maintain linux-fslc[-imx] kernels, and so far I've never
seen any failures. Or maybe they were reported on some mailing lists
I'm not in.

>> >
>> >
>> > That's reassuring.
>> >
>> >>
>> >> If you have a set of layers and build steps, can you send them to me=
 ?
>> >> I can spin up a local build and see if I get the same behaviour.
>> >
>> >
>> > Thanks for the offer. I'm based on Linaro's "OE-RPB" setup.
>> >
>> > My own layer is quite simple:
>> > https://git.linaro.org/people/ryan.harkin/meta-warp7.git/log/?h=3Ddun=
fell
>> >
>> > I mostly provide a new image definition and a simple u-boot patch to =
change the console UART for our CI system. I don't have a kernel recipe ove=
rlaying linux-fslc.
>> >
>> > My basic steps to clone and build are:
>> > --------------------------
>> > mkdir /data/warp7/workspace-dunfell
>> > cd /data/warp7/workspace-dunfell
>> > repo init -u \
>> > https://git.linaro.org/people/ryan.harkin/oe-rpb-manifest.git \
>> > -b dunfell
>> > repo sync
>> >
>> > # link in shared downloads and sstate-cache
>> > ln -s /linaro/oe-rpb/downloads . && ln -s /linaro/oe-rpb/sstate-cache=
 .
>> >
>> > export MACHINE=3Dimx7s-warp ; export DISTRO=3Drpb ; . setup-environme=
nt
>> > bitbake warp7-console-image
>> > --------------------------
>> >
>>
>> I'm spinning up a build now (but as usual, I'm fighting some
>> infrastructure issues and can't get repo to install).
>
>
> It looks like you can stand down on this...
>
>>
>>
>> Steve mentioned two patches ... but can you also confirm that:
>> [kernel-yocto: account for extracted defconfig in elements check] is
>> in the branch you are building ?
>
>
> That patch wasn't in my dunfell branch, so I cherry-picked it from maste=
r locally and now the build is working again.
> Meanwhile, doing a "git remote update" and I see the patch is now on top=
 of the dunfell branch as of today, and my build is working again.

Glad to see that it is solved for you! I've run the build for
meta-freescale linux-fslc yesterday - it went through like a breeze...
I don't think there was a significant update on dunfell, but I can
start the build now anyway...

>
> Great, thanks for your help folks.
>
> Regards,
> Ryan.
>
>
>
>>
>>
>> Bruce
>>
>>
>> > Right now, I've pinned oo-core to my last known working build from be=
fore your recent defconfig patch, so you'll want to go into layer/openembed=
ded-core and checkout the latest commits.
>> >
>> > For reference, my pinned commit:
>> > cabaf5654d  2020-07-06  iso-codes: switch upstream branch master -> m=
ain                [Hongxu Jia]
>> >
>> > Local testing tells me that the repo works fine for me all the way up=
 to just before your commit, at this point:
>> > 2399fdf98a  2020-07-03  classes/archive: do_configure should not depe=
nd on do_ar_p..    [Joshua Watt]
>> >
>> > I'm building on an Ubuntu 18.04 host locally.
>> >
>> > Regards,
>> > Ryan.
>> >
>> >
>> >>
>> >>
>> >> Bruce
>> >>
>> >> > Regards,
>> >> > Ryan.
>> >> >
>> >> >
>> >> >
>> >> >
>> >> >
>> >> >
>> >> >>
>> >> >>
>> >> >>
>> >> >> Steve
>> >> >>
>> >> >> > > Here's a link to my failing build for reference:
>> >> >> > > https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTR=
O=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/consoleText
>> >> >> > >
>> >> >> > > And a snippet from the failure:
>> >> >> > >
>> >> >> > > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_c=
onfigme: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-l=
inux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_=
configme.7123' failed with exit code 1:

Oh, this is actually a good reminder: I have to bump up the kernel
version! It's been merged into the linux-fslc repo, but I didn't
update recipes so far... Vacation time... :) Latest update would
include v5.4.51 tag.

>> >> >> > > WARNING: exit code 1 from a shell command.
>> >> >> > >
>> >> >> > > ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-gl=
ibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c=
3525e-r0/temp/log.do_kernel_configme.7123
>> >> >> > > Log data follows:
>> >> >> > > | DEBUG: Executing python function extend_recipe_sysroot
>> >> >> > > | NOTE: Direct dependencies are ['virtual:native:/srv/oe/buil=
d/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5=
.3.bb:do_populate_sysroot', '/srv/oe/build/conf/../../layers/openembedded-c=
ore/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sys=
root', '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devt=
ools/binutils/binutils-cross_2.34.bb:do_populate_sysroot', '/srv/oe/build/c=
onf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native=
_0.66.bb:do_populate_sysroot', 'virtual:native:/srv/oe/build/conf/../../lay=
ers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populat=
e_sysroot', 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-co=
re/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', '/srv/oe/bui=
ld/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-c=
ross_arm-9.2.bb:do_populate_sysroot']
>> >> >> > > | NOTE: Installed into sysroot: []
>> >> >> > > | NOTE: Skipping as already exists in sysroot: ['bison-native=
', 'kern-tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-native=
', 'bc-native', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native', 'gn=
u-config-native', 'readline-native', 'libtool-native', 'automake-native', '=
autoconf-native', 'xz-native', 'linux-libc-headers', 'gmp-native', 'libmpc-=
native', 'mpfr-native', 'zlib-native', 'gettext-minimal-native', 'attr-nati=
ve', 'm4-native', 'ncurses-native', 'pkgconfig-native']
>> >> >> > > | DEBUG: Python function extend_recipe_sysroot finished
>> >> >> > > | DEBUG: Executing shell function do_kernel_configme
>> >> >> > > | WARNING: exit code 1 from a shell command.
>> >> >> > > | ERROR: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s=
_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/=
run.do_kernel_configme.7123' failed with exit code 1:
>> >> >> > > | WARNING: exit code 1 from a shell command.
>> >> >> > > |
>> >> >> > > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task=
 do_kernel_configme: Failed
>> >> >> > > ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/r=
ecipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exit =
code '1'
>> >> >> > >
>> >> >> > >
>> >> >> > >
>> >> >> > > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com=
> wrote:
>> >> >> > >>
>> >> >> > >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfiel=
d@gmail.com> wrote:
>> >> >> > >> >
>> >> >> > >> > We have a fixup patch for this one in test right now, so w=
e don't want
>> >> >> > >> > this patch, without the follow up.
>> >> >> > >> >
>> >> >> > >> > But this is useful for dunfell, since it was an unexpected=
 behaviour
>> >> >> > >> > that needed to be fixed.
>> >> >> > >>
>> >> >> > >> Thanks, I'll drop this patch from the pull request and inclu=
de it
>> >> >> > >> along with the fixup patch in next week's patch set.
>> >> >> > >>
>> >> >> > >> Steve
>> >> >> > >>
>> >> >> > >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakom=
an.com> wrote:
>> >> >> > >> > >
>> >> >> > >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >> >> > >> > >
>> >> >> > >> > > It is uncommon that a BSP definition and a defconfig are=
 used in
>> >> >> > >> > > a single configuration. That being said, it is a valid w=
ay to
>> >> >> > >> > > organize kernel configuration meta data.
>> >> >> > >> > >
>> >> >> > >> > > When a defconfig is used, either on the src_uri or from =
in
>> >> >> > >> > > the kernel tree, it is normally expected that it is the =
baseline,
>> >> >> > >> > > with all options applied on top of it.
>> >> >> > >> > >
>> >> >> > >> > > With this commit, we detect either type of defconfig and=
 ensure
>> >> >> > >> > > that it is used first, followed by the fragments in thei=
r
>> >> >> > >> > > previous order. This allows existing configuration stack=
s to
>> >> >> > >> > > remain the same, while ensuring that a defconfig combine=
d stack
>> >> >> > >> > > works as expected.
>> >> >> > >> > >
>> >> >> > >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >> >> > >> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfound=
ation.org>
>> >> >> > >> > > (cherry picked from commit e6845327b69396d843a2f3c4c3ac9=
400ae9caedf)
>> >> >> > >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> >> >> > >> > > ---
>> >> >> > >> > >  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++=
++++-----------
>> >> >> > >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
>> >> >> > >> > >
>> >> >> > >> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/cl=
asses/kernel-yocto.bbclass
>> >> >> > >> > > index 5bc627066e..41d8620e67 100644
>> >> >> > >> > > --- a/meta/classes/kernel-yocto.bbclass
>> >> >> > >> > > +++ b/meta/classes/kernel-yocto.bbclass
>> >> >> > >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
>> >> >> > >> > >                         else
>> >> >> > >> > >                                 cp -f ${S}/arch/${ARCH}/=
configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
>> >> >> > >> > >                         fi
>> >> >> > >> > > -                       sccs=3D"${WORKDIR}/defconfig"
>> >> >> > >> > > +                       in_tree_defconfig=3D"${WORKDIR}/=
defconfig"
>> >> >> > >> > >                 else
>> >> >> > >> > >                         bbfatal "A KBUILD_DEFCONFIG '${K=
BUILD_DEFCONFIG}' was specified, but not present in the source tree"
>> >> >> > >> > >                 fi
>> >> >> > >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
>> >> >> > >> > >         patches=3D"${@" ".join(find_patches(d,''))}"
>> >> >> > >> > >         feat_dirs=3D"${@" ".join(find_kernel_feature_dir=
s(d))}"
>> >> >> > >> > >
>> >> >> > >> > > -       # a quick check to make sure we don't have dupli=
cate defconfigs
>> >> >> > >> > > -       # If there's a defconfig in the SRC_URI, did we =
also have one from
>> >> >> > >> > > -       # the KBUILD_DEFCONFIG processing above ?
>> >> >> > >> > > -       if [ -n "$sccs" ]; then
>> >> >> > >> > > -           # we did have a defconfig from above. remove=
 any that might be in the src_uri
>> >> >> > >> > > -           sccs_from_src_uri=3D$(echo $sccs_from_src_ur=
i | awk '{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> >> >> > >> > > +       # a quick check to make sure we don't have dupli=
cate defconfigs If
>> >> >> > >> > > +       # there's a defconfig in the SRC_URI, did we als=
o have one from the
>> >> >> > >> > > +       # KBUILD_DEFCONFIG processing above ?
>> >> >> > >> > > +       src_uri_defconfig=3D$(echo $sccs_from_src_uri | =
awk '{ if ($0=3D=3D"defconfig") { print $0 } }' RS=3D' ')
>> >> >> > >> > > +       # drop and defconfig's from the src_uri variable=
, we captured it just above here if it existed
>> >> >> > >> > > +       sccs_from_src_uri=3D$(echo $sccs_from_src_uri | =
awk '{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
>> >> >> > >> > > +       if [ -n "$in_tree_defconfig" ]; then
>> >> >> > >> > > +               sccs_defconfig=3D$in_tree_defconfig
>> >> >> > >> > > +               if [ -n "$src_uri_defconfig" ]; then
>> >> >> > >> > > +                       bbwarn "[NOTE]: defconfig was su=
pplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
>> >> >> > >> > > +               fi
>> >> >> > >> > > +       else
>> >> >> > >> > > +               # if we didn't have an in-tree one, make=
 our defconfig the one
>> >> >> > >> > > +               # from the src_uri. Note: there may not =
have been one from the
>> >> >> > >> > > +               # src_uri, so this can be an empty varia=
ble.
>> >> >> > >> > > +               sccs_defconfig=3D$src_uri_defconfig
>> >> >> > >> > >         fi
>> >> >> > >> > > -       sccs=3D"$sccs $sccs_from_src_uri"
>> >> >> > >> > > +       sccs=3D"$sccs_from_src_uri"
>> >> >> > >> > >
>> >> >> > >> > >         # check for feature directories/repos/branches t=
hat were part of the
>> >> >> > >> > >         # SRC_URI. If they were supplied, we convert the=
m into include directives
>> >> >> > >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
>> >> >> > >> > >         # expand kernel features into their full path eq=
uivalents
>> >> >> > >> > >         bsp_definition=3D$(spp ${includes} --find -DKMAC=
HINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})
>> >> >> > >> > >         if [ -z "$bsp_definition" ]; then
>> >> >> > >> > > -               echo "$sccs" | grep -q defconfig
>> >> >> > >> > > -               if [ $? -ne 0 ]; then
>> >> >> > >> > > +               if [ -z "$sccs_defconfig" ]; then
>> >> >> > >> > >                         bbfatal_log "Could not locate BS=
P definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was prov=
ided"
>> >> >> > >> > >                 fi
>> >> >> > >> > > -
>> >> >> > >> > > +       else
>> >> >> > >> > >                 # if the bsp definition has "define KMET=
A_EXTERNAL_BSP t",
>> >> >> > >> > >                 # then we need to set a flag that will i=
nstruct the next
>> >> >> > >> > >                 # steps to use the BSP as both configura=
tion and patches.
>> >> >> > >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
>> >> >> > >> > >         elements=3D"`echo -n ${bsp_definition} ${sccs} $=
{patches} ${KERNEL_FEATURES}`"
>> >> >> > >> > >         if [ -n "${elements}" ]; then
>> >> >> > >> > >                 echo "${bsp_definition}" > ${S}/${meta_d=
ir}/bsp_definition
>> >> >> > >> > > -               scc --force -o ${S}/${meta_dir}:cfg,merg=
e,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>> >> >> > >> > > +               scc --force -o ${S}/${meta_dir}:cfg,merg=
e,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_=
FEATURES}
>> >> >> > >> > >                 if [ $? -ne 0 ]; then
>> >> >> > >> > >                         bbfatal_log "Could not generate =
configuration queue for ${KMACHINE}."
>> >> >> > >> > >                 fi
>> >> >> > >> > > --
>> >> >> > >> > > 2.17.1
>> >> >> > >> > >
>> >> >> > >> > >
>> >> >> > >> >
>> >> >> > >> >
>> >> >> > >> >
>> >> >> > >> > --
>> >> >> > >> > - Thou shalt not follow the NULL pointer, for chaos and ma=
dness await
>> >> >> > >> > thee at its end
>> >> >> > >> > - "Use the force Harry" - Gandalf, Star Trek II
>> >> >> > >>
>> >> >> >
>> >> >> >
>> >> >> >
>> >> >> > --
>> >> >> > - Thou shalt not follow the NULL pointer, for chaos and madness=
 await
>> >> >> > thee at its end
>> >> >> > - "Use the force Harry" - Gandalf, Star Trek II
>> >>
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20



--=20
Regards,
Andrey.
