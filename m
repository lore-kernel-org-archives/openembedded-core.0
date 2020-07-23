Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.3227.1595537222508403508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 13:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A0vSE9tW;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a1so7772975ejg.12
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N3xkzMjTVVBgo+z86MhnLUFWHn93aDBkDG1KeAL3JHw=;
        b=A0vSE9tWgD7nswpqb513FF8t5dKJERLKVBhd4nFQuY/lDnzn5HWYCqXdjGfpb3Dwp4
         CvtT0yvmE+/bbsnMa/RIHVVLvknCBXRKM5XqJVqXcjUxFHXC+0Jn7mzAS6gQ/bLO1tU/
         SocFkVmbiKd4ioFTZ0+2cgjAKTLxsz2sfb7acUyxkbHhw/Rs9AF6bq5Szd0bPFStYGa4
         sX75jHab/2L05KQJkKAwhAM+KrBxqSz47mb4Ier7gVdkfX60xK51nmny8fnBI8qtn1yY
         XZxYGpaLBv2+zajja9OuM5QO179SX6IiNrlUX/UKzMov01R+XeGwR9A1JK0CJHx301Kl
         ucSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N3xkzMjTVVBgo+z86MhnLUFWHn93aDBkDG1KeAL3JHw=;
        b=JgmI0AQ7L20rXzQhWvJUNKTPg06L16tik/WV4dO3IYi+QzPiwkQUQ8IOIvCxe2ed49
         /bvMrn+LCFBOl4Z5TB6KMFu6CJpeTxcN3mVDP0FCM1g8W19ncxDJCNnwpKhs1FnYnegf
         x9JElJmuWh7Gtq/879wr6ZLbBz0T0ACxbVvF0gNSubDKDLSwB6QKjP/mCU2E3BZhRq/L
         3vx7tbadAPfvhRbl0emfNOZtaXdX/njbsIYaMaX1B0pemCHWVl0eQ3Gk5SsLX6JAj/Ms
         Ty6Z7i5Ax6SQki8gd7JtKJeJ4QfX6agmgjyejdXeySXVCyP1GhhCd6hIulfH1nqf7k4Y
         Yb1g==
X-Gm-Message-State: AOAM531qrVL107a/CD5FabHh840vBSAdPVPia8vuFKAHD3wdYD1llJWg
	UT6wyik5H7WNlqBcbHGh9yHFAPtbUOP5lEwsXmM=
X-Google-Smtp-Source: ABdhPJz9x5pYk47gB+eaVzjU/4h8StMZRfxvQSrRHEM1FulmOzwyDcgkK1P1gt6OJFjeAOpABDN9d9UXZtUk2uIfZJ8=
X-Received: by 2002:a17:906:8542:: with SMTP id h2mr6062484ejy.517.1595537220589;
 Thu, 23 Jul 2020 13:47:00 -0700 (PDT)
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
 <CADkTA4Ord_XFE3nTFCOTp=hzRQWbUtyJbZEA9G4BWnZG7G2+Tg@mail.gmail.com>
 <CAD0U-hLJpDSDC_9YyYziwWTPw_Dt=GHBdCLYiEXdRs-+pJyjwQ@mail.gmail.com> <CAHtQpK4iLSNVhsz6BAfBff+ki+nPmJqZZ9oM0uO9+mwN0p3Sqw@mail.gmail.com>
In-Reply-To: <CAHtQpK4iLSNVhsz6BAfBff+ki+nPmJqZZ9oM0uO9+mwN0p3Sqw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 23 Jul 2020 16:46:49 -0400
Message-ID: <CADkTA4NzmHRLQ=gH0pcFK6yHyBz6Fp_XMSuahzAKH-b_eikwYg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Ryan Harkin <ryan.harkin@linaro.org>, Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 2:34 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote=
:
>
> Hey guys,
>
> Sorry for jumping into this thread a bit later - I saw that it has
> been sorted out already.
>
> On Thu, Jul 23, 2020 at 6:06 PM Ryan Harkin <ryan.harkin@linaro.org> wro=
te:
> >
> >
> >
> > On Thu, 23 Jul 2020 at 16:05, Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
> >>
> >> On Thu, Jul 23, 2020 at 9:38 AM Ryan Harkin <ryan.harkin@linaro.org> =
wrote:
> >> >
> >> > Hi Bruce,
> >> >
> >> > On Thu, 23 Jul 2020 at 13:27, Bruce Ashfield <bruce.ashfield@gmail.=
com> wrote:
> >> >>
> >> >> On Thu, Jul 23, 2020 at 5:34 AM Ryan Harkin <ryan.harkin@linaro.or=
g> wrote:
> >> >> >
> >> >> > Hi Bruce, Steve,
> >> >> >
> >> >> > Thanks for your replies and the help.
> >> >> >
> >> >> > On Thu, 23 Jul 2020 at 04:33, Steve Sakoman <steve@sakoman.com> =
wrote:
> >> >> >>
> >> >> >> On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <bruce.ashfield@=
gmail.com> wrote:
> >> >> >> >
> >> >> >> > On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@lina=
ro.org> wrote:
> >> >> >> > >
> >> >> >> > > Just an FYI, but when this was submitted, my imx7s-warp bui=
lds began to fail when building linux-fslc from meta-freescale / meta-frees=
cale-3rdparty.
> >> >> >> > >
> >> >> >> > > I'm not sure why yet, I've only discovered the problem, but=
 I thought I'd report it in case anyone else sees the problem.
> >> >> >> > >
> >> >> >> >
> >> >> >> > Someone already sent a dunfell backport request for a follow =
up patch to this.
> >> >> >> >
> >> >> >> > It went to the poky list, but I just replied to it and copied=
 oe-core.
> >> >> >>
> >> >> >> Both patches are already in dunfell!
> >> >> >>
> >> >> >> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunf=
ell&id=3D7ecc81baeacaa1149a4947791200e8819c3df677
> >> >> >> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunf=
ell&id=3D11089e06bfb3d0defb52825ffba978d085385569
> >> >> >
> >> >> >
> >> >> > Yes, they are present. I guess I should have checked the error m=
essages more closely during git bisect rather than stopping as soon as the =
build failed.
> >> >> >
> >> >> > After Bruce's 7ecc81baea patch, I see this error:
> >> >> >
> >> >> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_meta=
data: Could not locate BSP definition for imx7s-warp/standard and no defcon=
fig was provided
> >> >> >
> >> >> > Then, after 11089e06bf, I see the error I originally posted from=
 my CI job, but reproduced here from a local build:
>
> This was the patch I've introduced and seeing those errors were quite
> a surprise to me. I have also an internal CI that builds
> meta-freescale off the dunfell branch - and I never had any issues
> with it.
>
> >> >> >
> >> >> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_conf=
igme: Execution of '/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/w=
ork/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e=
-r0/temp/run.do_kernel_configme.31899' failed with exit code 1:
> >> >> > WARNING: exit code 1 from a shell command.
> >> >> >
> >> >> > ERROR: Logfile of failure stored in: /data/warp7/workspace-dunfe=
ll/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/=
5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899
> >> >> > Log data follows:
> >> >> > | DEBUG: Executing python function extend_recipe_sysroot
> >> >> > | NOTE: Direct dependencies are ['/data/warp7/workspace-dunfell/=
build-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gc=
c/gcc-cross_arm-9.2.bb:do_populate_sysroot', 'virtual:native:/data/warp7/wo=
rkspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-=
extended/bc/bc_1.07.1.bb:do_populate_sysroot', '/data/warp7/workspace-dunfe=
ll/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/binu=
tils/binutils-cross_2.34.bb:do_populate_sysroot', 'virtual:native:/data/war=
p7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/rec=
ipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot', '/data/warp7/works=
pace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-dev=
tools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/data/warp7/workspa=
ce-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kerne=
l/kern-tools/kern-tools-native_git.bb:do_populate_sysroot', 'virtual:native=
:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-cor=
e/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
> >> >> > | NOTE: Installed into sysroot: []
> >> >> > | NOTE: Skipping as already exists in sysroot: ['gcc-cross-arm',=
 'bc-native', 'binutils-cross-arm', 'bison-native', 'quilt-native', 'kern-t=
ools-native', 'patch-native', 'readline-native', 'flex-native', 'automake-n=
ative', 'texinfo-dummy-native', 'autoconf-native', 'libtool-native', 'gnu-c=
onfig-native', 'xz-native', 'gettext-minimal-native', 'libmpc-native', 'gmp=
-native', 'zlib-native', 'mpfr-native', 'linux-libc-headers', 'attr-native'=
, 'ncurses-native', 'm4-native', 'pkgconfig-native']
> >> >> > | DEBUG: Python function extend_recipe_sysroot finished
> >> >> > | DEBUG: Executing shell function do_kernel_configme
> >> >> > | WARNING: exit code 1 from a shell command.
> >> >> > | ERROR: Execution of '/data/warp7/workspace-dunfell/build-rpb/t=
mp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTO=
INC+38d6c3525e-r0/temp/run.do_kernel_configme.31899' failed with exit code =
1:
> >> >> > | WARNING: exit code 1 from a shell command.
> >> >> >
> >> >> > I haven't yet looked at what these patches do, but I'm expecting=
 there's something to update in the linux-fslc recipe, unless there's anoth=
er issue in the defconfig patches.
> >> >> >
> >> >>
> >> >> We've had multiple reports that with those patches the linux-fslc
> >> >> recipe is building. So something else may be going on in your setu=
p.
>
> If there were some reports - I haven't seen them...
>
> Bruce, do you happen to have any reference to them? I'm trying to
> merge and maintain linux-fslc[-imx] kernels, and so far I've never
> seen any failures. Or maybe they were reported on some mailing lists
> I'm not in.

They were deeper follow ups to some of the threads here and on
linux-yocto. Nothing too obvious.

Just in case anyone is reading this and thinking the issue was ever
with the linux-fslc* kernels .. that isn't the case. It just happened
to be the one that people were using that showed the issue introduced
by my defconfig juggling.


>
> >> >
> >> >
> >> > That's reassuring.
> >> >
> >> >>
> >> >> If you have a set of layers and build steps, can you send them to =
me ?
> >> >> I can spin up a local build and see if I get the same behaviour.
> >> >
> >> >
> >> > Thanks for the offer. I'm based on Linaro's "OE-RPB" setup.
> >> >
> >> > My own layer is quite simple:
> >> > https://git.linaro.org/people/ryan.harkin/meta-warp7.git/log/?h=3Dd=
unfell
> >> >
> >> > I mostly provide a new image definition and a simple u-boot patch t=
o change the console UART for our CI system. I don't have a kernel recipe o=
verlaying linux-fslc.
> >> >
> >> > My basic steps to clone and build are:
> >> > --------------------------
> >> > mkdir /data/warp7/workspace-dunfell
> >> > cd /data/warp7/workspace-dunfell
> >> > repo init -u \
> >> > https://git.linaro.org/people/ryan.harkin/oe-rpb-manifest.git \
> >> > -b dunfell
> >> > repo sync
> >> >
> >> > # link in shared downloads and sstate-cache
> >> > ln -s /linaro/oe-rpb/downloads . && ln -s /linaro/oe-rpb/sstate-cac=
he .
> >> >
> >> > export MACHINE=3Dimx7s-warp ; export DISTRO=3Drpb ; . setup-environ=
ment
> >> > bitbake warp7-console-image
> >> > --------------------------
> >> >
> >>
> >> I'm spinning up a build now (but as usual, I'm fighting some
> >> infrastructure issues and can't get repo to install).
> >
> >
> > It looks like you can stand down on this...
> >
> >>
> >>
> >> Steve mentioned two patches ... but can you also confirm that:
> >> [kernel-yocto: account for extracted defconfig in elements check] is
> >> in the branch you are building ?
> >
> >
> > That patch wasn't in my dunfell branch, so I cherry-picked it from mas=
ter locally and now the build is working again.
> > Meanwhile, doing a "git remote update" and I see the patch is now on t=
op of the dunfell branch as of today, and my build is working again.
>
> Glad to see that it is solved for you! I've run the build for
> meta-freescale linux-fslc yesterday - it went through like a breeze...
> I don't think there was a significant update on dunfell, but I can
> start the build now anyway...

It'll be fine once Steve does the next release. We just got unlucky
and picked up 2 of the defconfig correction patches before he bug
report came in. So everything is ok, and with the latest dunfell queue
there aren't any issues.

Bruce

>
> >
> > Great, thanks for your help folks.
> >
> > Regards,
> > Ryan.
> >
> >
> >
> >>
> >>
> >> Bruce
> >>
> >>
> >> > Right now, I've pinned oo-core to my last known working build from =
before your recent defconfig patch, so you'll want to go into layer/openemb=
edded-core and checkout the latest commits.
> >> >
> >> > For reference, my pinned commit:
> >> > cabaf5654d  2020-07-06  iso-codes: switch upstream branch master ->=
 main                [Hongxu Jia]
> >> >
> >> > Local testing tells me that the repo works fine for me all the way =
up to just before your commit, at this point:
> >> > 2399fdf98a  2020-07-03  classes/archive: do_configure should not de=
pend on do_ar_p..    [Joshua Watt]
> >> >
> >> > I'm building on an Ubuntu 18.04 host locally.
> >> >
> >> > Regards,
> >> > Ryan.
> >> >
> >> >
> >> >>
> >> >>
> >> >> Bruce
> >> >>
> >> >> > Regards,
> >> >> > Ryan.
> >> >> >
> >> >> >
> >> >> >
> >> >> >
> >> >> >
> >> >> >
> >> >> >>
> >> >> >>
> >> >> >>
> >> >> >> Steve
> >> >> >>
> >> >> >> > > Here's a link to my failing build for reference:
> >> >> >> > > https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DIS=
TRO=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/consoleText
> >> >> >> > >
> >> >> >> > > And a snippet from the failure:
> >> >> >> > >
> >> >> >> > > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel=
_configme: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro=
-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kerne=
l_configme.7123' failed with exit code 1:
>
> Oh, this is actually a good reminder: I have to bump up the kernel
> version! It's been merged into the linux-fslc repo, but I didn't
> update recipes so far... Vacation time... :) Latest update would
> include v5.4.51 tag.
>
> >> >> >> > > WARNING: exit code 1 from a shell command.
> >> >> >> > >
> >> >> >> > > ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-=
glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d=
6c3525e-r0/temp/log.do_kernel_configme.7123
> >> >> >> > > Log data follows:
> >> >> >> > > | DEBUG: Executing python function extend_recipe_sysroot
> >> >> >> > > | NOTE: Direct dependencies are ['virtual:native:/srv/oe/bu=
ild/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3=
.5.3.bb:do_populate_sysroot', '/srv/oe/build/conf/../../layers/openembedded=
-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_s=
ysroot', '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-de=
vtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot', '/srv/oe/build=
/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-nati=
ve_0.66.bb:do_populate_sysroot', 'virtual:native:/srv/oe/build/conf/../../l=
ayers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_popul=
ate_sysroot', 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-=
core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', '/srv/oe/b=
uild/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc=
-cross_arm-9.2.bb:do_populate_sysroot']
> >> >> >> > > | NOTE: Installed into sysroot: []
> >> >> >> > > | NOTE: Skipping as already exists in sysroot: ['bison-nati=
ve', 'kern-tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-nati=
ve', 'bc-native', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native', '=
gnu-config-native', 'readline-native', 'libtool-native', 'automake-native',=
 'autoconf-native', 'xz-native', 'linux-libc-headers', 'gmp-native', 'libmp=
c-native', 'mpfr-native', 'zlib-native', 'gettext-minimal-native', 'attr-na=
tive', 'm4-native', 'ncurses-native', 'pkgconfig-native']
> >> >> >> > > | DEBUG: Python function extend_recipe_sysroot finished
> >> >> >> > > | DEBUG: Executing shell function do_kernel_configme
> >> >> >> > > | WARNING: exit code 1 from a shell command.
> >> >> >> > > | ERROR: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx=
7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/tem=
p/run.do_kernel_configme.7123' failed with exit code 1:
> >> >> >> > > | WARNING: exit code 1 from a shell command.
> >> >> >> > > |
> >> >> >> > > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: ta=
sk do_kernel_configme: Failed
> >> >> >> > > ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale=
/recipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exi=
t code '1'
> >> >> >> > >
> >> >> >> > >
> >> >> >> > >
> >> >> >> > > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.c=
om> wrote:
> >> >> >> > >>
> >> >> >> > >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfi=
eld@gmail.com> wrote:
> >> >> >> > >> >
> >> >> >> > >> > We have a fixup patch for this one in test right now, so=
 we don't want
> >> >> >> > >> > this patch, without the follow up.
> >> >> >> > >> >
> >> >> >> > >> > But this is useful for dunfell, since it was an unexpect=
ed behaviour
> >> >> >> > >> > that needed to be fixed.
> >> >> >> > >>
> >> >> >> > >> Thanks, I'll drop this patch from the pull request and inc=
lude it
> >> >> >> > >> along with the fixup patch in next week's patch set.
> >> >> >> > >>
> >> >> >> > >> Steve
> >> >> >> > >>
> >> >> >> > >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sak=
oman.com> wrote:
> >> >> >> > >> > >
> >> >> >> > >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> >> >> > >> > >
> >> >> >> > >> > > It is uncommon that a BSP definition and a defconfig a=
re used in
> >> >> >> > >> > > a single configuration. That being said, it is a valid=
 way to
> >> >> >> > >> > > organize kernel configuration meta data.
> >> >> >> > >> > >
> >> >> >> > >> > > When a defconfig is used, either on the src_uri or fro=
m in
> >> >> >> > >> > > the kernel tree, it is normally expected that it is th=
e baseline,
> >> >> >> > >> > > with all options applied on top of it.
> >> >> >> > >> > >
> >> >> >> > >> > > With this commit, we detect either type of defconfig a=
nd ensure
> >> >> >> > >> > > that it is used first, followed by the fragments in th=
eir
> >> >> >> > >> > > previous order. This allows existing configuration sta=
cks to
> >> >> >> > >> > > remain the same, while ensuring that a defconfig combi=
ned stack
> >> >> >> > >> > > works as expected.
> >> >> >> > >> > >
> >> >> >> > >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.co=
m>
> >> >> >> > >> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfou=
ndation.org>
> >> >> >> > >> > > (cherry picked from commit e6845327b69396d843a2f3c4c3a=
c9400ae9caedf)
> >> >> >> > >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> >> >> > >> > > ---
> >> >> >> > >> > >  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++=
++++++-----------
> >> >> >> > >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
> >> >> >> > >> > >
> >> >> >> > >> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/=
classes/kernel-yocto.bbclass
> >> >> >> > >> > > index 5bc627066e..41d8620e67 100644
> >> >> >> > >> > > --- a/meta/classes/kernel-yocto.bbclass
> >> >> >> > >> > > +++ b/meta/classes/kernel-yocto.bbclass
> >> >> >> > >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
> >> >> >> > >> > >                         else
> >> >> >> > >> > >                                 cp -f ${S}/arch/${ARCH=
}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> >> >> >> > >> > >                         fi
> >> >> >> > >> > > -                       sccs=3D"${WORKDIR}/defconfig"
> >> >> >> > >> > > +                       in_tree_defconfig=3D"${WORKDIR=
}/defconfig"
> >> >> >> > >> > >                 else
> >> >> >> > >> > >                         bbfatal "A KBUILD_DEFCONFIG '$=
{KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
> >> >> >> > >> > >                 fi
> >> >> >> > >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
> >> >> >> > >> > >         patches=3D"${@" ".join(find_patches(d,''))}"
> >> >> >> > >> > >         feat_dirs=3D"${@" ".join(find_kernel_feature_d=
irs(d))}"
> >> >> >> > >> > >
> >> >> >> > >> > > -       # a quick check to make sure we don't have dup=
licate defconfigs
> >> >> >> > >> > > -       # If there's a defconfig in the SRC_URI, did w=
e also have one from
> >> >> >> > >> > > -       # the KBUILD_DEFCONFIG processing above ?
> >> >> >> > >> > > -       if [ -n "$sccs" ]; then
> >> >> >> > >> > > -           # we did have a defconfig from above. remo=
ve any that might be in the src_uri
> >> >> >> > >> > > -           sccs_from_src_uri=3D$(echo $sccs_from_src_=
uri | awk '{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
> >> >> >> > >> > > +       # a quick check to make sure we don't have dup=
licate defconfigs If
> >> >> >> > >> > > +       # there's a defconfig in the SRC_URI, did we a=
lso have one from the
> >> >> >> > >> > > +       # KBUILD_DEFCONFIG processing above ?
> >> >> >> > >> > > +       src_uri_defconfig=3D$(echo $sccs_from_src_uri =
| awk '{ if ($0=3D=3D"defconfig") { print $0 } }' RS=3D' ')
> >> >> >> > >> > > +       # drop and defconfig's from the src_uri variab=
le, we captured it just above here if it existed
> >> >> >> > >> > > +       sccs_from_src_uri=3D$(echo $sccs_from_src_uri =
| awk '{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
> >> >> >> > >> > > +       if [ -n "$in_tree_defconfig" ]; then
> >> >> >> > >> > > +               sccs_defconfig=3D$in_tree_defconfig
> >> >> >> > >> > > +               if [ -n "$src_uri_defconfig" ]; then
> >> >> >> > >> > > +                       bbwarn "[NOTE]: defconfig was =
supplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> >> >> >> > >> > > +               fi
> >> >> >> > >> > > +       else
> >> >> >> > >> > > +               # if we didn't have an in-tree one, ma=
ke our defconfig the one
> >> >> >> > >> > > +               # from the src_uri. Note: there may no=
t have been one from the
> >> >> >> > >> > > +               # src_uri, so this can be an empty var=
iable.
> >> >> >> > >> > > +               sccs_defconfig=3D$src_uri_defconfig
> >> >> >> > >> > >         fi
> >> >> >> > >> > > -       sccs=3D"$sccs $sccs_from_src_uri"
> >> >> >> > >> > > +       sccs=3D"$sccs_from_src_uri"
> >> >> >> > >> > >
> >> >> >> > >> > >         # check for feature directories/repos/branches=
 that were part of the
> >> >> >> > >> > >         # SRC_URI. If they were supplied, we convert t=
hem into include directives
> >> >> >> > >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
> >> >> >> > >> > >         # expand kernel features into their full path =
equivalents
> >> >> >> > >> > >         bsp_definition=3D$(spp ${includes} --find -DKM=
ACHINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})
> >> >> >> > >> > >         if [ -z "$bsp_definition" ]; then
> >> >> >> > >> > > -               echo "$sccs" | grep -q defconfig
> >> >> >> > >> > > -               if [ $? -ne 0 ]; then
> >> >> >> > >> > > +               if [ -z "$sccs_defconfig" ]; then
> >> >> >> > >> > >                         bbfatal_log "Could not locate =
BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was pr=
ovided"
> >> >> >> > >> > >                 fi
> >> >> >> > >> > > -
> >> >> >> > >> > > +       else
> >> >> >> > >> > >                 # if the bsp definition has "define KM=
ETA_EXTERNAL_BSP t",
> >> >> >> > >> > >                 # then we need to set a flag that will=
 instruct the next
> >> >> >> > >> > >                 # steps to use the BSP as both configu=
ration and patches.
> >> >> >> > >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
> >> >> >> > >> > >         elements=3D"`echo -n ${bsp_definition} ${sccs}=
 ${patches} ${KERNEL_FEATURES}`"
> >> >> >> > >> > >         if [ -n "${elements}" ]; then
> >> >> >> > >> > >                 echo "${bsp_definition}" > ${S}/${meta=
_dir}/bsp_definition
> >> >> >> > >> > > -               scc --force -o ${S}/${meta_dir}:cfg,me=
rge,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES=
}
> >> >> >> > >> > > +               scc --force -o ${S}/${meta_dir}:cfg,me=
rge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNE=
L_FEATURES}
> >> >> >> > >> > >                 if [ $? -ne 0 ]; then
> >> >> >> > >> > >                         bbfatal_log "Could not generat=
e configuration queue for ${KMACHINE}."
> >> >> >> > >> > >                 fi
> >> >> >> > >> > > --
> >> >> >> > >> > > 2.17.1
> >> >> >> > >> > >
> >> >> >> > >> > >
> >> >> >> > >> >
> >> >> >> > >> >
> >> >> >> > >> >
> >> >> >> > >> > --
> >> >> >> > >> > - Thou shalt not follow the NULL pointer, for chaos and =
madness await
> >> >> >> > >> > thee at its end
> >> >> >> > >> > - "Use the force Harry" - Gandalf, Star Trek II
> >> >> >> > >>
> >> >> >> >
> >> >> >> >
> >> >> >> >
> >> >> >> > --
> >> >> >> > - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await
> >> >> >> > thee at its end
> >> >> >> > - "Use the force Harry" - Gandalf, Star Trek II
> >> >>
> >> >>
> >> >>
> >> >> --
> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
> >> >> thee at its end
> >> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >=20
>
>
>
> --
> Regards,
> Andrey.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
