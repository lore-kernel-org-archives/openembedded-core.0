Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.2379.1628302785255999121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 19:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X/QqDW9q;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id t3so10746337qkg.11;
        Fri, 06 Aug 2021 19:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XqK6fcbdEx4VI4MUY1uQeoFC9TrLfgq0yz1QL8j0HRQ=;
        b=X/QqDW9qgp52oPB/Iv2XDV6WJvHcVpMMGYW5slZQ9iF5rqIxIsrZ4+/cVYxlQwXy0+
         RL1skW10UPIHe8l1EUaDtMjUd8iUVXvbaNcH5dy3i7yCHobMSVLUmVMKTxUeGJgAdOCG
         LSAfXqiFA5lnPY52bbt8ME6QE+7EePKLpnb7abLzyEyMcfkTxcKuTAEe9G50bPqsuYHx
         OllDQyx2h0AJGaVgesPO201MyJQfiaD/w/gMgoBJ09bPXXFpzY8bNVvchGFYqFUMNOZ0
         IPg+56A94eurcQezAhd/CGzJOAdzHLsdGHaj38H0R/iX3HJZ0xVEzSwsmUoRQ5B4JUDb
         hx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqK6fcbdEx4VI4MUY1uQeoFC9TrLfgq0yz1QL8j0HRQ=;
        b=Cr7zRl/bsNnnTUK3PCMTEW9SXVEU+O7Pa5qwS44noUrX21cXIVU8kt5us38pW1zPk6
         Tq46s4oJHOjK5jonFd5hxnYOy/+gyDDpqlFNEFami9SIBkdGPV/hpetx6B6li8KcwrAk
         p6l2jEHs7nRBwl5HP5FcEIJu0Rw4LBGINKIWJB/E/9ROW1BFmOboGNofHh7ysA0F6JQJ
         pjIgctgnAEn3coi8k+Lvo1I0b4ueFGXz0quSfne5bz2qsdu0GsMm9iFd1reKWvDJ+spL
         o9imC1CsgXYweQ8p12+Ou9dkIcecxWFA6lRN7rgAtWHd7gLL+6fOvZiB1fIIzTzY9PCO
         oBVg==
X-Gm-Message-State: AOAM531yFbFV5XJ5jkYCySusMrzVFiWVOSmnQDbJ3CqpH0nyEibJZjnB
	Zb8MKo8G2WYAuiQxcz0TkkFnVFsya7gKqlWPYl0=
X-Google-Smtp-Source: ABdhPJxaGrpbWdZLp7MGiJCMIIGD/wo2unzzFABgJL/edUHo3TOBYvgVWRr58ut+jumWdQUCeou+g+8+9gZRQ9DOvV4=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr12878541qkg.381.1628302784323;
 Fri, 06 Aug 2021 19:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com> <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com> <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
 <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com> <5e21ec72-667f-6e48-eefc-843312544fe4@cybernetics.com>
In-Reply-To: <5e21ec72-667f-6e48-eefc-843312544fe4@cybernetics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 6 Aug 2021 19:19:18 -0700
Message-ID: <CAMKF1srcLEBkk1udvadr1xeh8qsgr-i-8+hT_ZvL-2Nak-tsjg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
To: Tony Battersby <tonyb@cybernetics.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <randy.macleod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing bunch of failures on meta-oe and meta-atmel

https://errors.yoctoproject.org/Errors/Details/600064/
https://errors.yoctoproject.org/Errors/Details/600065/
https://errors.yoctoproject.org/Errors/Details/600071/

On Fri, Aug 6, 2021 at 2:04 PM Tony Battersby <tonyb@cybernetics.com> wrote:
>
> On 8/6/21 12:44 PM, Tony Battersby wrote:
> > On 8/6/21 1:33 AM, Richard Purdie wrote:
> >> On Thu, 2021-08-05 at 17:54 -0400, Tony Battersby wrote:
> >>> On 8/5/21 6:21 AM, Richard Purdie wrote:
> >>>> On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
> >>>>> On 2021-07-27 9:34 a.m., Tony Battersby wrote:
> >>>>>> Currently, enabling Link Time Optimization via:
> >>>>>>
> >>>>>> require conf/distro/include/lto.inc
> >>>>>> DISTRO_FEATURES_append = " lto"
> >>>>>>
> >>>>>> makes the build non-reproducible (as in
> >>>>>> https://reproducible-builds.org/).  This patch set fixes some of the
> >>>>>> problems, but is not yet a complete solution.
> >>>>>>
> >>>>>> This patch set addresses the following bugs:
> >>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481
> >>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14490
> >>>>>>
> >>>>>> openembedded-core patches
> >>>>>> 1/4: lto.inc: disable LTO for grub
> >>>>>> 2/4: gcc: Backport patch to make LTO builds more reproducible
> >>>>>> 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
> >>>>>>
> >>>>>> openembedded-devel patches
> >>>>>> 4/4: net-snmp: fix QA Issue after LDFLAGS change
> >>>>>>
> >>>>>> Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
> >>>>>> TARGET_CFLAGS).  This could possibly be done differently, such as by
> >>>>>> removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
> >>>>>> TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.  Let me know
> >>>>>> if there is a better/preferred way to do it.
> >>>>>>
> >>>>>> The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I have
> >>>>>> included a patch to fix that.  Other packages might have been broken as
> >>>>>> well, although I haven't found any others.
> >>>>>>
> >>>>>> With all these patches, there are still many shared libraries in /lib
> >>>>>> and /usr/lib that are still not reproducible with LTO enabled because
> >>>>>> x86_64-poky-linux-libtool filters out the -f*-prefix-map flags added by
> >>>>>> patch 3 when linking shared libraries.  /usr/lib/libbz2.so.1.0.6 from
> >>>>>> the libbz2 package from the bzip2 recipe is a good example.  I do not
> >>>>>> have a patch for that problem.  I will leave that to someone else.
> >>>>>>
> >>>>>> So this is what we need to achieve reproducible LTO builds:
> >>>>>> *) This patch set
> >>>>>> *) A fix for libtool
> >>>>>> *) Add LTO to reproducible builds testing if appropriate (e.g.
> >>>>>> meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
> >>>>>> *) Fixes for individual packages, if needed
> >>>>>> *) Once everything works, update the documentation again (I previously
> >>>>>> requested a documentation change for this bug, which will eventually
> >>>>>> show up at
> >>>>>> http://docs.yoctoproject.org/test-manual/reproducible-builds.html).
> >>>>> This is certainly a few steps in the right direction with a good outline
> >>>>> of what's next.
> >>>>>
> >>>>> I suspect that Richard has been busy with other things like overrides
> >>>>> and the update to glibc-2.34.
> >>>>>
> >>>>> Do you have any suggestions or questions about what we should do
> >>>>> with this patch series Richard?
> >>>> Thanks for the reminder, I've been meaning to queue/test this which I will
> >>>> do. The gcc version has been bumped but I ported the patch forward to it
> >>>> and the patches are in master-next for testing. It is great to see this
> >>>> support moving forward.
> >>>>
> >>>> Much as it pains me to admit having any libtool knowledge, I may be able to
> >>>> help with that bit. There is an untested patch below which may address that
> >>>> issue, or at least give a good hint on how to do it if it doesn't work. I
> >>>> don't have an environment to test easily right now.
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Richard
> >>> I tested your libtool patch in master-next with the bzip2 recipe.  It
> >>> works as intended; libbz2.so.1.0.6 and all the other output files are
> >>> now reproducible with LTO enabled.  I also verified that libtool is
> >>> passing the -f*-prefix-map flags to the link command in log.do_compile
> >>> as intended.
> >>>
> >>> I also verified that core-image-minimal builds successfully with the
> >>> libtool patch.
> >> Thanks for testing that, sounds like it helps that issue. I'll queue that patch.
> >>
> >> Unfortunately even with the ruby fix I queued, we still see reproduciblity
> >> issues with the LDFLAGS change in curl-dev, gettext-ptest, ruby and ruby-dbg
> >> packages:
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/515/steps/12/logs/stdio
> >>
> >> We'll need to resolve those before I can merge the flags change.
> >>
> >> Diffoscope output:
> >>
> >> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210805-8jfd55ki/packages/diff-html/
> >>
> >> Basically LDFLAGS get encoded into a couple of scripts and the ruby binary.
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> > It looks like the ruby problem is being caused by MJIT_DLDFLAGS in
> > build/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/build/mjit_config.h.
> > There is already a patch
> > poky/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
> > that removes some of these items for the sake of reproducibiltiy.  But I
> > do not know ruby, so I do not know the implications of doing the same
> > thing for MJIT_DLDFLAGS.
> >
> > Tony Battersby
> >
> >
> >
> Richard,
>
> I noticed that you already fixed the problems in curl and gettext in
> master-next.  Here is a patch for ruby if you haven't fixed that already.
>
> Tony Battersby
>
> From 9cfb9777ff6ef95a27ed6a03719c807365d0f116 Mon Sep 17 00:00:00 2001
> From: Tony Battersby <tonyb@cybernetics.com>
> Date: Fri, 6 Aug 2021 16:47:14 -0400
> Subject: [PATCH] ruby: Fix reproducibility issue with LDFLAGS
>
> If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no
> longer reproducible.  Fix this.
>
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ---
>  ...-Makefile.in-filter-out-f-prefix-map.patch | 42 +++++++++++++++++++
>  meta/recipes-devtools/ruby/ruby_3.0.2.bb      |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
>
> diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
> new file mode 100644
> index 0000000000..9387506c26
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
> @@ -0,0 +1,42 @@
> +Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
> +
> +If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
> +reproducible.  Fix this.
> +
> +Upstream-Status: Inapproppriate [oe-core specific]
> +Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> +---
> +--- a/tool/mjit_archflag.sh
> ++++ b/tool/mjit_archflag.sh
> +@@ -7,6 +7,20 @@ quote() {
> +     echo
> + }
> +
> ++quote_filtered() {
> ++    printf "#${indent}define $1"
> ++    while shift && [ "$#" -gt 0 ]; do
> ++      case "$1" in
> ++          -ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*)
> ++              ;;
> ++          *)
> ++              printf ' "%s"'$sep "$1"
> ++              ;;
> ++      esac
> ++    done
> ++    echo
> ++}
> ++
> + archs=""
> + arch_flag=""
> +
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -666,7 +666,7 @@ mjit_config.h:
> +       quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
> +       quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
> +       quote "MJIT_LDSHARED   " ; \
> +-      quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> ++      quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> +       quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
> +       quote 'PRELOADENV       "@PRELOADENV@"'; \
> +       indent=$${archs:+'  '}; \
> diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> index 0b9c342def..38e594a59e 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> @@ -6,6 +6,7 @@ SRC_URI += " \
>             file://remove_has_include_macros.patch \
>             file://run-ptest \
>             file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
> +           file://0002-template-Makefile.in-filter-out-f-prefix-map.patch \
>             "
>
>  SRC_URI[sha256sum] = "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
> --
> 2.25.1
>
