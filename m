Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.297.1628614674144422037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 09:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i0FDm+nc;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id h10so6238989qtj.11;
        Tue, 10 Aug 2021 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7TYn5h1EUIwrsqWt/McNOAMLz+H5zIKZyBWIcIZnVMs=;
        b=i0FDm+nc8KXCH+4BJviT7kyeQcTVMl+yz4uinJO6BX0MocJwqvk1KH13/0kHTtEFZe
         TIL9MRx0hKeW4hKjQmTEloa8V6LEpj3QNWzPC3F0QHTyMLJCh6Q0Gc4WT+0U9VrsSWKT
         J8DIv4Ax46x8OeBZi1hZgpDNd/GIB5LbSQcmD0A2wdfKGGsDEpKkWIMP+rQtr6LHyU5c
         455ui4jc3e1cDkEjjr1plhyrZWNf2osryAW/ilMt4PFoR0sfDe3zmwY5CNlW6lZdgLgy
         UdTu9Tp8/U5OtEMPiCFHoeIwl1qfPNMOGEjtRGgI5wnnk9sRZDIBhQbZ2/PxQwTAYW79
         dyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7TYn5h1EUIwrsqWt/McNOAMLz+H5zIKZyBWIcIZnVMs=;
        b=AMcOc04Y8iJkTbicO6e5NB0jJXDzSu/GG07a2T0Hc6/9DMvp3ZT8kfxKkd7/qOGNiU
         40KmiZnI/GpTOz2GW2G4N2jOS3d00Ulp/vOSTBMqLGnjrcqXPRVEw1xRwg3vetjYadS6
         lEgrU9FIFggcohUkohYQxVMZtLfiaHmDmJ3EpGgIPZNq0xbe8XMlBcc7PEKGDI4r8+fL
         Qyypfksmw+94SV+hU4Cn7d699qVSBVWDMwQly39nNae555q0UId78bZCeW+pYEykrkOA
         3DGpX5w+A+q5UfyPs3eDYUZNSZRUQHfa1HF4WUFyt7xxBwPgQ6AKLyvjyMFC8hGQ1/+m
         snsA==
X-Gm-Message-State: AOAM533bHqdM533upXEFKWmNRY4rRZRmVZnkd0YKHxogy2mKfJ+nAxe7
	MvWdBGZZ+lGOIp7daQc5qs38w3MA1bMuVKY1Lik=
X-Google-Smtp-Source: ABdhPJwkvGSo8pXcBOJORllM1ZndIZkxa3BPgF2NEXo2RQJKBi2ihaIoINXCn6RUvQji7DxcOo20GlVt622IY+ZKHWs=
X-Received: by 2002:a05:622a:354:: with SMTP id r20mr25515148qtw.289.1628614673101;
 Tue, 10 Aug 2021 09:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com> <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com> <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
 <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com> <5e21ec72-667f-6e48-eefc-843312544fe4@cybernetics.com>
 <CAMKF1srcLEBkk1udvadr1xeh8qsgr-i-8+hT_ZvL-2Nak-tsjg@mail.gmail.com>
 <17ef7e32-fe38-6e02-8d65-ee1518a38e82@cybernetics.com> <ead673c1-a9dd-613e-1d7c-6fcc6cf96eca@gmail.com>
In-Reply-To: <ead673c1-a9dd-613e-1d7c-6fcc6cf96eca@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 10 Aug 2021 09:57:27 -0700
Message-ID: <CAMKF1soO1vifStLgeOH31-UnCUePNi9s_F1ifPsWJHR=qzkgxQ@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
To: Tony Battersby <tonyb@cybernetics.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <randy.macleod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

when using ubuntu 18.04 host tcsh fails now  see [1]

gcc: error: unrecognized command line option
=E2=80=98-fmacro-prefix-map=3DTOPDIR/build/tmp/work/core2-32-yoe-linux/tcsh=
/6.22.04-r0=3D/usr/src/debug/tcsh/6.22.04-r0=E2=80=99
Makefile:450: recipe for target 'gethost' failed
make: *** [gethost] Error 1

[1] https://errors.yoctoproject.org/Errors/Details/600645/

On Mon, Aug 9, 2021 at 10:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 8/9/21 7:39 AM, Tony Battersby wrote:
> > On 8/6/21 10:19 PM, Khem Raj wrote:
> >> I am seeing bunch of failures on meta-oe and meta-atmel
> >>
> >> https://errors.yoctoproject.org/Errors/Details/600064/
> >> https://errors.yoctoproject.org/Errors/Details/600065/
> >> https://errors.yoctoproject.org/Errors/Details/600071/
> >>
> >>
> > I sent patches for meta-openembedded, but I am not sure how to build
> > meta-atmel:
> >
> > bitbake libegl
> > ERROR: Layer atmel is not compatible with the core layer which only
> > supports these series: honister (layer is compatible with hardknott)
>
> you can use my branch which has fixes for override problem
>
> https://github.com/YoeDistro/meta-atmel/tree/yoe/mut
>
>
> >
> > But the fix is probably the same as the ones I sent for the other
> > packages (which I copied from
> > meta-openembedded/meta-networking/recipes-protocols/net-snmp/net-snmp_5=
.9.1.bb).
> >
> > Tony Battersby
> >
> >
> >> On Fri, Aug 6, 2021 at 2:04 PM Tony Battersby <tonyb@cybernetics.com> =
wrote:
> >>> On 8/6/21 12:44 PM, Tony Battersby wrote:
> >>>> On 8/6/21 1:33 AM, Richard Purdie wrote:
> >>>>> On Thu, 2021-08-05 at 17:54 -0400, Tony Battersby wrote:
> >>>>>> On 8/5/21 6:21 AM, Richard Purdie wrote:
> >>>>>>> On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
> >>>>>>>> On 2021-07-27 9:34 a.m., Tony Battersby wrote:
> >>>>>>>>> Currently, enabling Link Time Optimization via:
> >>>>>>>>>
> >>>>>>>>> require conf/distro/include/lto.inc
> >>>>>>>>> DISTRO_FEATURES_append =3D " lto"
> >>>>>>>>>
> >>>>>>>>> makes the build non-reproducible (as in
> >>>>>>>>> https://reproducible-builds.org/).  This patch set fixes some o=
f the
> >>>>>>>>> problems, but is not yet a complete solution.
> >>>>>>>>>
> >>>>>>>>> This patch set addresses the following bugs:
> >>>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481
> >>>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14490
> >>>>>>>>>
> >>>>>>>>> openembedded-core patches
> >>>>>>>>> 1/4: lto.inc: disable LTO for grub
> >>>>>>>>> 2/4: gcc: Backport patch to make LTO builds more reproducible
> >>>>>>>>> 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
> >>>>>>>>>
> >>>>>>>>> openembedded-devel patches
> >>>>>>>>> 4/4: net-snmp: fix QA Issue after LDFLAGS change
> >>>>>>>>>
> >>>>>>>>> Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already=
 in
> >>>>>>>>> TARGET_CFLAGS).  This could possibly be done differently, such =
as by
> >>>>>>>>> removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIO=
NS,
> >>>>>>>>> TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.  Le=
t me know
> >>>>>>>>> if there is a better/preferred way to do it.
> >>>>>>>>>
> >>>>>>>>> The TARGET_LDFLAGS change broke net-snmp from meta-networking, =
so I have
> >>>>>>>>> included a patch to fix that.  Other packages might have been b=
roken as
> >>>>>>>>> well, although I haven't found any others.
> >>>>>>>>>
> >>>>>>>>> With all these patches, there are still many shared libraries i=
n /lib
> >>>>>>>>> and /usr/lib that are still not reproducible with LTO enabled b=
ecause
> >>>>>>>>> x86_64-poky-linux-libtool filters out the -f*-prefix-map flags =
added by
> >>>>>>>>> patch 3 when linking shared libraries.  /usr/lib/libbz2.so.1.0.=
6 from
> >>>>>>>>> the libbz2 package from the bzip2 recipe is a good example.  I =
do not
> >>>>>>>>> have a patch for that problem.  I will leave that to someone el=
se.
> >>>>>>>>>
> >>>>>>>>> So this is what we need to achieve reproducible LTO builds:
> >>>>>>>>> *) This patch set
> >>>>>>>>> *) A fix for libtool
> >>>>>>>>> *) Add LTO to reproducible builds testing if appropriate (e.g.
> >>>>>>>>> meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder=
)
> >>>>>>>>> *) Fixes for individual packages, if needed
> >>>>>>>>> *) Once everything works, update the documentation again (I pre=
viously
> >>>>>>>>> requested a documentation change for this bug, which will event=
ually
> >>>>>>>>> show up at
> >>>>>>>>> http://docs.yoctoproject.org/test-manual/reproducible-builds.ht=
ml).
> >>>>>>>> This is certainly a few steps in the right direction with a good=
 outline
> >>>>>>>> of what's next.
> >>>>>>>>
> >>>>>>>> I suspect that Richard has been busy with other things like over=
rides
> >>>>>>>> and the update to glibc-2.34.
> >>>>>>>>
> >>>>>>>> Do you have any suggestions or questions about what we should do
> >>>>>>>> with this patch series Richard?
> >>>>>>> Thanks for the reminder, I've been meaning to queue/test this whi=
ch I will
> >>>>>>> do. The gcc version has been bumped but I ported the patch forwar=
d to it
> >>>>>>> and the patches are in master-next for testing. It is great to se=
e this
> >>>>>>> support moving forward.
> >>>>>>>
> >>>>>>> Much as it pains me to admit having any libtool knowledge, I may =
be able to
> >>>>>>> help with that bit. There is an untested patch below which may ad=
dress that
> >>>>>>> issue, or at least give a good hint on how to do it if it doesn't=
 work. I
> >>>>>>> don't have an environment to test easily right now.
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>>
> >>>>>>> Richard
> >>>>>> I tested your libtool patch in master-next with the bzip2 recipe. =
 It
> >>>>>> works as intended; libbz2.so.1.0.6 and all the other output files =
are
> >>>>>> now reproducible with LTO enabled.  I also verified that libtool i=
s
> >>>>>> passing the -f*-prefix-map flags to the link command in log.do_com=
pile
> >>>>>> as intended.
> >>>>>>
> >>>>>> I also verified that core-image-minimal builds successfully with t=
he
> >>>>>> libtool patch.
> >>>>> Thanks for testing that, sounds like it helps that issue. I'll queu=
e that patch.
> >>>>>
> >>>>> Unfortunately even with the ruby fix I queued, we still see reprodu=
ciblity
> >>>>> issues with the LDFLAGS change in curl-dev, gettext-ptest, ruby and=
 ruby-dbg
> >>>>> packages:
> >>>>>
> >>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/=
515/steps/12/logs/stdio
> >>>>>
> >>>>> We'll need to resolve those before I can merge the flags change.
> >>>>>
> >>>>> Diffoscope output:
> >>>>>
> >>>>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2021080=
5-8jfd55ki/packages/diff-html/
> >>>>>
> >>>>> Basically LDFLAGS get encoded into a couple of scripts and the ruby=
 binary.
> >>>>>
> >>>>> Cheers,
> >>>>>
> >>>>> Richard
> >>>>>
> >>>> It looks like the ruby problem is being caused by MJIT_DLDFLAGS in
> >>>> build/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/build/mjit_config.h=
.
> >>>> There is already a patch
> >>>> poky/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-no=
t-write-host-cross-cc-item.patch
> >>>> that removes some of these items for the sake of reproducibiltiy.  B=
ut I
> >>>> do not know ruby, so I do not know the implications of doing the sam=
e
> >>>> thing for MJIT_DLDFLAGS.
> >>>>
> >>>> Tony Battersby
> >>>>
> >>>>
> >>>>
> >>> Richard,
> >>>
> >>> I noticed that you already fixed the problems in curl and gettext in
> >>> master-next.  Here is a patch for ruby if you haven't fixed that alre=
ady.
> >>>
> >>> Tony Battersby
> >>>
> >>>  From 9cfb9777ff6ef95a27ed6a03719c807365d0f116 Mon Sep 17 00:00:00 20=
01
> >>> From: Tony Battersby <tonyb@cybernetics.com>
> >>> Date: Fri, 6 Aug 2021 16:47:14 -0400
> >>> Subject: [PATCH] ruby: Fix reproducibility issue with LDFLAGS
> >>>
> >>> If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no
> >>> longer reproducible.  Fix this.
> >>>
> >>> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> >>> ---
> >>>   ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++++++++++=
+++
> >>>   meta/recipes-devtools/ruby/ruby_3.0.2.bb      |  1 +
> >>>   2 files changed, 43 insertions(+)
> >>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Ma=
kefile.in-filter-out-f-prefix-map.patch
> >>>
> >>> diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.i=
n-filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-temp=
late-Makefile.in-filter-out-f-prefix-map.patch
> >>> new file mode 100644
> >>> index 0000000000..9387506c26
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filte=
r-out-f-prefix-map.patch
> >>> @@ -0,0 +1,42 @@
> >>> +Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
> >>> +
> >>> +If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no lo=
nger
> >>> +reproducible.  Fix this.
> >>> +
> >>> +Upstream-Status: Inapproppriate [oe-core specific]
> >>> +Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> >>> +---
> >>> +--- a/tool/mjit_archflag.sh
> >>> ++++ b/tool/mjit_archflag.sh
> >>> +@@ -7,6 +7,20 @@ quote() {
> >>> +     echo
> >>> + }
> >>> +
> >>> ++quote_filtered() {
> >>> ++    printf "#${indent}define $1"
> >>> ++    while shift && [ "$#" -gt 0 ]; do
> >>> ++      case "$1" in
> >>> ++          -ffile-prefix-map=3D*|-fdebug-prefix-map=3D*|-fmacro-pref=
ix-map=3D*)
> >>> ++              ;;
> >>> ++          *)
> >>> ++              printf ' "%s"'$sep "$1"
> >>> ++              ;;
> >>> ++      esac
> >>> ++    done
> >>> ++    echo
> >>> ++}
> >>> ++
> >>> + archs=3D""
> >>> + arch_flag=3D""
> >>> +
> >>> +--- a/template/Makefile.in
> >>> ++++ b/template/Makefile.in
> >>> +@@ -666,7 +666,7 @@ mjit_config.h:
> >>> +       quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
> >>> +       quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
> >>> +       quote "MJIT_LDSHARED   " ; \
> >>> +-      quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> >>> ++      quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLA=
GS); \
> >>> +       quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
> >>> +       quote 'PRELOADENV       "@PRELOADENV@"'; \
> >>> +       indent=3D$${archs:+'  '}; \
> >>> diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb b/meta/recipes-=
devtools/ruby/ruby_3.0.2.bb
> >>> index 0b9c342def..38e594a59e 100644
> >>> --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> >>> +++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> >>> @@ -6,6 +6,7 @@ SRC_URI +=3D " \
> >>>              file://remove_has_include_macros.patch \
> >>>              file://run-ptest \
> >>>              file://0001-template-Makefile.in-do-not-write-host-cross=
-cc-item.patch \
> >>> +           file://0002-template-Makefile.in-filter-out-f-prefix-map.=
patch \
> >>>              "
> >>>
> >>>   SRC_URI[sha256sum] =3D "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f2=
2e2d98c3f2bc3bef7e6f1"
> >>> --
> >>> 2.25.1
> >>>
> >
