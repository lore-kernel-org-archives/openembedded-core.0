Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669E3C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 20:43:34 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.1629.1637181813142676627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 12:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cy+Xglwh;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id bu18so14800217lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 12:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rn5pGw4jhSBl++ga/KUpNx3t3JgQs3VrjQ0cfmFdiC8=;
        b=cy+XglwhkzAOtUujSbkSwvF+abTP+msduOKc0UONpTtDunTz2dEDYSfJ31FgFMk1+c
         dYrtOrj1fHxaSwyckQW+j1kX7o6NNCr5MTjiHFd193fuIzOFIt9L3zIz9FsO3u7labH4
         kPYs33+szEDwY8Kb/KHXdt7gLgx3vtevPPHl75KpQXNmk8yTVRQWdTZ9bp7cOVKEYBDo
         Xt4rwxoJJNrR2SeozSF3m8Lw4mkTImh96FiboPq+55uSMV6Fwe00hPz8LnhMcaKRjNuF
         VyIhiSaPs51u5FzWMzaWsav6vTH4YWDiRwObDFrkDGH4QehBH2DSw8dwVlpuOdHmzkWC
         qTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rn5pGw4jhSBl++ga/KUpNx3t3JgQs3VrjQ0cfmFdiC8=;
        b=kqmmgcrlP8hyNH0Htp5+One6078Co/Gn6AzC/u/H/GwNwcdAtfT87NVkHr55VZRvm4
         7pIkBzxpVfbFxJLJ3vn04bW7ixsfmcN6a4sCKRT6IMobs2mwl5naGSveHpXzktXIrwFT
         J+CfQhZcPSOA6QysgCh/lZPuMLG7TZLLzuJPVsOESQcGsSiiCfzEmob4kfL8KdHz5k1u
         3NlgTuSWpn1L4qvbdlGw585eM0XAsew/VhmW2p+YT/yIHBX21x9zK63601YhjqbYUaXN
         RrSopv6FnLlUDyShCV4KwyySehG30453yjOhDt5nJdWsUmnqHjfsIJmjtAfDYwAc2i/z
         vOFQ==
X-Gm-Message-State: AOAM5337pq0+KisfGKnifPi734jHx6cPhpnBXegmEiSpWQfqbNu+HQjb
	GGkKgbzVdpxiQ9MoDhhFH9soVLaOZpuQ9Zka6cI=
X-Google-Smtp-Source: 
 ABdhPJzTobXgZhm6ZSrmI5oGLmjiPDYJFgzeBHtSsvOp5h0oLjOPj9kd/Sx0xzucADfRQ7ssu95F8lGbL/VSUbtQjVo=
X-Received: by 2002:a05:651c:1698:: with SMTP id
 bd24mr11105583ljb.97.1637181810573;
 Wed, 17 Nov 2021 12:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-34-alex@linutronix.de>
In-Reply-To: <20211117153525.257146-34-alex@linutronix.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 17 Nov 2021 12:43:14 -0800
Message-ID: 
 <CAJ86T=X-uLwWJTf86dJueyeZBdcxhvVWvQbrj+06mrRz6dL-4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/36] busybox: drop
 0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 20:43:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158459

On Wed, Nov 17, 2021 at 7:36 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This was added 10 years ago, is almost certainly non-upstreamable
> and it isn't clear what the issues it aims to fix are:
> the AB revealed no problems when the patch is removed.

The comment in the patch was: This fixes the issue where LDFLAGS
escaped with -Wl are ignored during compilation. Seems fairly clear!

Checking that the AB run didn't fail is probably not enough to justify
removing this patch. You should also confirm that LDFLAGS escaped with
-Wl (e.g. -Wl,-z,relro,-z,now when security flags are enabled, etc)
are still passed to the linker.

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ing-instead-of-LD-and-use-CFLAGS-and.patch | 114 ------------------
>  meta/recipes-core/busybox/busybox_1.34.1.bb   |   1 -
>  2 files changed, 115 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
> deleted file mode 100644
> index 2bf2b91c7e..0000000000
> --- a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 2001
> -From: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
> -Date: Thu, 10 Mar 2011 00:27:08 -0500
> -Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use $(CFLAGS)
> - and $(EXTRA_CFLAGS) when linking.
> -
> -This fixes the issue where LDFLAGS escaped with -Wl are ignored during
> -compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such as
> --m32 on x86_64 or -flto) which apply to both compilation and linking
> -situations.
> -
> -Signed-off-by: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
> ----
> -Upstream-Status: Pending
> -
> - Makefile               |  7 ++++---
> - scripts/Makefile.build |  8 ++++----
> - scripts/Makefile.lib   | 13 +++----------
> - 3 files changed, 11 insertions(+), 17 deletions(-)
> -
> -Index: busybox-1.23.2/Makefile
> -===================================================================
> ---- busybox-1.23.2.orig/Makefile
> -+++ busybox-1.23.2/Makefile
> -@@ -309,7 +309,8 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D
> - MODFLAGS      = -DMODULE
> - CFLAGS_MODULE   = $(MODFLAGS)
> - AFLAGS_MODULE   = $(MODFLAGS)
> --LDFLAGS_MODULE  = -r
> -+LDFLAGS_RELOCATABLE = -r -nostdlib
> -+LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
> - CFLAGS_KERNEL =
> - AFLAGS_KERNEL =
> -
> -@@ -331,7 +332,7 @@ KERNELVERSION = $(VERSION).$(PATCHLEVEL)
> - export        VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION \
> -       ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC \
> -       CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL UTS_MACHINE \
> --      HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> -+      HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAGS_MODULE CHECK CHECKFLAGS
> -
> - export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
> - export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> -@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?= LINK    $@
> -       cmd_busybox__ ?= $(srctree)/scripts/trylink \
> -       "$@" \
> -       "$(CC)" \
> --      "$(CFLAGS) $(CFLAGS_busybox)" \
> -+      "$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAGS)" \
> -       "$(LDFLAGS) $(EXTRA_LDFLAGS)" \
> -       "$(core-y)" \
> -       "$(libs-y)" \
> -Index: busybox-1.23.2/scripts/Makefile.build
> -===================================================================
> ---- busybox-1.23.2.orig/scripts/Makefile.build
> -+++ busybox-1.23.2/scripts/Makefile.build
> -@@ -174,7 +174,7 @@ cmd_modversions =                                                  \
> -               | $(GENKSYMS) -a $(ARCH)                                \
> -               > $(@D)/.tmp_$(@F:.o=.ver);                             \
> -                                                                       \
> --              $(LD) $(LDFLAGS) -r -o $@ $(@D)/.tmp_$(@F)              \
> -+               $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(@D)/.tmp_$(@F)        \
> -                       -T $(@D)/.tmp_$(@F:.o=.ver);                    \
> -               rm -f $(@D)/.tmp_$(@F) $(@D)/.tmp_$(@F:.o=.ver);        \
> -       else                                                            \
> -@@ -257,7 +257,7 @@ quiet_cmd_link_o_target = LD      $@
> - # If the list of objects to link is empty, just create an empty built-in.o
> - # -nostdlib is added to make "make LD=gcc ..." work (some people use that)
> - cmd_link_o_target = $(if $(strip $(obj-y)),\
> --              $(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
> -+              $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(filter $(obj-y), $^),\
> -               rm -f $@; $(AR) rcs $@)
> -
> - $(builtin-target): $(obj-y) FORCE
> -@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
> - $($(subst $(obj)/,,$(@:.o=-y)))), $^)
> -
> - quiet_cmd_link_multi-y = LD      $@
> --cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
> -+cmd_link_multi-y = $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(link_multi_deps)
> -
> - quiet_cmd_link_multi-m = LD [M]  $@
> --cmd_link_multi-m = $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(link_multi_deps)
> -+cmd_link_multi-m = $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(link_multi_deps)
> -
> - # We would rather have a list of rules like
> - #     foo.o: $(foo-objs)
> -Index: busybox-1.23.2/scripts/Makefile.lib
> -===================================================================
> ---- busybox-1.23.2.orig/scripts/Makefile.lib
> -+++ busybox-1.23.2/scripts/Makefile.lib
> -@@ -121,7 +121,8 @@ cpp_flags      = -Wp,-MD,$(depfile) $(NO
> - # yet ld_flags is fed to ld.
> - #ld_flags       = $(LDFLAGS) $(EXTRA_LDFLAGS)
> - # Remove the -Wl, prefix from linker options normally passed through gcc
> --ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS))
> -+ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS) $(CFLAGS) $(EXTRA_CFLAGS))
> -+ld_flags_partial = $($(filter-out -shared%, $(filter-out -pie%,$(ld_flags))))
> -
> -
> - # Finds the multi-part object the current object will be linked into
> -@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped
> - # Linking
> - # ---------------------------------------------------------------------------
> -
> --# TODO: LDFLAGS usually is supposed to contain gcc's flags, not ld's.
> --# but here we feed them to ld!
> --quiet_cmd_ld = LD      $@
> --cmd_ld = $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \
> -+quiet_cmd_ld = CC    $@
> -+cmd_ld = $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \
> -              $(filter-out FORCE,$^) -o $@
> -
> - # Objcopy
> diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recipes-core/busybox/busybox_1.34.1.bb
> index 6aed0f0476..3651c06126 100644
> --- a/meta/recipes-core/busybox/busybox_1.34.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
> @@ -26,7 +26,6 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://login-utilities.cfg \
>             file://recognize_connmand.patch \
>             file://busybox-cross-menuconfig.patch \
> -           file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
>             file://mount-via-label.cfg \
>             file://sha1sum.cfg \
>             file://sha256sum.cfg \
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158429): https://lists.openembedded.org/g/openembedded-core/message/158429
> Mute This Topic: https://lists.openembedded.org/mt/87122011/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

