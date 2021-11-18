Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7BBC433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 10:32:14 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web12.4002.1637231533509618324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PVJwxKq6;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id o1so12568248uap.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npxYGm9yoE+XkVFVH4ucyBciqrxJrvZkpfk37tYVgDQ=;
        b=PVJwxKq6R7rxRBtm8020RGz8fWRnwIlEoHKR8zhXxZgwb//c4tO63hvcCUynz+8zdX
         I0CbPRYZIFr9K2Ycn5pRcRUq2tatDz+/Lj/zsDCl5G4IRd+JXqBWylLLwYKfE+xfV1oF
         XxditeGfAYnNNEtqAFwrsQGNTIr9CZsCi0Gc5+G5VPpPWBEsKmCTQQfPbeGU/l+Dy0fN
         5EwaUqClfmZv/jhzzdXPJrwVA5NixS0MU+hz7ofAEj2MoH4Yd0mkZWEnEotAu6O/GzUX
         IilrX0kwFLQTgpBskZyfi2vUcr3Uo6TCAD6Nx3sNrkt3TtuL52NOdbS7bVaK4W0//aD3
         3HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npxYGm9yoE+XkVFVH4ucyBciqrxJrvZkpfk37tYVgDQ=;
        b=OqrablgrxA+0obJRGoWZM5lhaDxv08IMY9nLTiOKSQTnv6sBejBw8664VewcbdiVFt
         KH/2pdjQBHUbhzA8Z0GeDMDMJe5/vRUl38xHQkhs6NISJgBC7mUzFZKT/Tjtlj/kQoVn
         vgUAVYs+nHo39xMNI/B7WzmbjBu7ruwOB9Hgek85W98BEZxNpjbqIrE5SAR/Av/A1TrC
         aPDHrBOKjj/sBpGZxR2UbNyZud1nSoxIj73SVR5UZSMH3UGD5nZZt7oEVRoRlsZWbXFT
         INRgQ42luDKSJFxg37bADjyrZuCrTUNY1E/4jcCx+B2gCOHVno6o+id0c6CYr0FhaZIl
         paXw==
X-Gm-Message-State: AOAM533E+tU/7SKA8bSgFilOZ+xnChN348orbJqXcoFbg3ThTKKNQ+UQ
	a8Ip9waOek5g7s947143APIkVze4AnflYm+RvYURK+nrj0o=
X-Google-Smtp-Source: 
 ABdhPJxY8/5NTwJcRo8G+EaO+hbUQ1XzzkeSw3tN1RrKsjhG/SPtEp7Ul2nFMZiqal9JAQy40sUpfjf4sQRrXQECHrc=
X-Received: by 2002:ab0:484:: with SMTP id 4mr33885545uaw.71.1637231531047;
 Thu, 18 Nov 2021 02:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-34-alex@linutronix.de>
 <CAJ86T=X-uLwWJTf86dJueyeZBdcxhvVWvQbrj+06mrRz6dL-4A@mail.gmail.com>
 <16B874A872BAAE14.8846@lists.openembedded.org>
In-Reply-To: <16B874A872BAAE14.8846@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Nov 2021 11:32:00 +0100
Message-ID: 
 <CANNYZj9g5RRyQbU6+=gNZQ0OXbgC2OVtWYtnNbW_bAvRDT4_eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/36] busybox: drop
 0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
Content-Type: multipart/alternative; boundary="000000000000d2c02305d10dabba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 10:32:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158467

--000000000000d2c02305d10dabba
Content-Type: text/plain; charset="UTF-8"

I double checked, with strace (can't trust the logs as they don't show the
actual linker invocation :)

execve("/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/busybox/1.34.1-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc",
["x86_64-poky-linux-gcc", "-m64", "-march=core2", "-mtune=core2", "-msse3",
"-mfpmath=sse", "-fstack-protector-strong", "-O2", "-D_FORTIFY_SOURCE=2",
"--sysroot=/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/busybox/1.34.1-r0/recipe-sysroot",
"-malign-data=abi", "-Wall", "-Wshadow", "-Wwrite-strings", "-Wundef",
"-Wstrict-prototypes", "-Wunused", "-Wunused-parameter",
"-Wunused-function", "-Wunused-value", "-Wmissing-prototypes",
"-Wmissing-declarations", "-Wno-format-security",
"-Wdeclaration-after-statement", "-Wold-style-definition",
"-finline-limit=0", "-fno-builtin-strlen", "-fomit-frame-pointer",
"-ffunction-sections", "-fdata-sections", "-fno-guess-branch-probability",
"-funsigned-char", "-static-libgcc", "-falign-functions=1",
"-falign-jumps=1", "-falign-labels=1", "-falign-loops=1",
"-fno-unwind-tables", "-fno-asynchronous-unwind-tables",
"-fno-builtin-printf", "-Os", "-O2", "-pipe", "-g",
"-feliminate-unused-debug-types", "-m64", "-march=core2", "-mtune=core2",
"-msse3", "-mfpmath=sse", "-fstack-protector-strong", "-O2",
"-D_FORTIFY_SOURCE=2", "-Wl,-O1", "-Wl,--hash-style=gnu",
"-Wl,--as-needed",
"-fmacro-prefix-map=/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/busybox/1.34.1-r0=/usr/src/debug/busybox/1.34.1-r0",
"-fdebug-prefix-map=/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/busybox/1.34.1-r0=/usr/src/debug/busybox/1.34.1-r0",
"-fdebug-prefix-map=/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/busybox/1.34.1-r0/recipe-sysroot=",
"-fdebug-prefix-map=/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/busybox/1.34.1-r0/recipe-sysroot-native=",
"-Wl,-z,relro,-z,now", "-o", "busybox_unstripped", "-Wl,--sort-common",
"-Wl,--sort-section,alignment", "-Wl,--gc-sections", "-Wl,--start-group",
"applets/built-in.o", "archival/lib.a", "archival/libarchive/lib.a",
"console-tools/lib.a", "coreutils/lib.a", "coreutils/libcoreutils/lib.a",
"debianutils/lib.a", "klibc-utils/lib.a", "e2fsprogs/lib.a",
"editors/lib.a", "findutils/lib.a", "init/lib.a", "libbb/lib.a",
"libpwdgrp/lib.a", "loginutils/lib.a", "mailutils/lib.a",
"miscutils/lib.a", "modutils/lib.a", "networking/lib.a",
"networking/libiproute/lib.a", "networking/udhcp/lib.a",
"printutils/lib.a", "procps/lib.a", "runit/lib.a", "selinux/lib.a",
"shell/lib.a", "sysklogd/lib.a", "util-linux/lib.a",
"util-linux/volume_id/lib.a", "archival/built-in.o",
"archival/libarchive/built-in.o", "console-tools/built-in.o",
"coreutils/built-in.o", "coreutils/libcoreutils/built-in.o",
"debianutils/built-in.o", "klibc-utils/built-in.o", "e2fsprogs/built-in.o",
"editors/built-in.o", "findutils/built-in.o", "init/built-in.o",
"libbb/built-in.o", "libpwdgrp/built-in.o", "loginutils/built-in.o",
"mailutils/built-in.o", "miscutils/built-in.o", "modutils/built-in.o",
"networking/built-in.o", "networking/libiproute/built-in.o",
"networking/udhcp/built-in.o", "printutils/built-in.o",
"procps/built-in.o", "runit/built-in.o", "selinux/built-in.o",
"shell/built-in.o", "sysklogd/built-in.o", "util-linux/built-in.o",
"util-linux/volume_id/built-in.o", "-Wl,--end-group", "-Wl,--start-group",
"-lcrypt", "-lm", "-lrt", "-Wl,--end-group"], 0x5654941e7a98 /* 138 vars
*/) = 0

So everything that is supposed to be there is actually present, and the
patch is indeed unneeded.

Alex

On Wed, 17 Nov 2021 at 23:05, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Wed, 17 Nov 2021 at 21:43, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> On Wed, Nov 17, 2021 at 7:36 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > This was added 10 years ago, is almost certainly non-upstreamable
>> > and it isn't clear what the issues it aims to fix are:
>> > the AB revealed no problems when the patch is removed.
>>
>> The comment in the patch was: This fixes the issue where LDFLAGS
>> escaped with -Wl are ignored during compilation. Seems fairly clear!
>>
>> Checking that the AB run didn't fail is probably not enough to justify
>> removing this patch. You should also confirm that LDFLAGS escaped with
>> -Wl (e.g. -Wl,-z,relro,-z,now when security flags are enabled, etc)
>> are still passed to the linker.
>>
>
> Thanks, I will double check.
>
> Alex
>
>
>>
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  ...ing-instead-of-LD-and-use-CFLAGS-and.patch | 114 ------------------
>> >  meta/recipes-core/busybox/busybox_1.34.1.bb   |   1 -
>> >  2 files changed, 115 deletions(-)
>> >  delete mode 100644
>> meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
>> >
>> > diff --git
>> a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
>> b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
>> > deleted file mode 100644
>> > index 2bf2b91c7e..0000000000
>> > ---
>> a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
>> > +++ /dev/null
>> > @@ -1,114 +0,0 @@
>> > -From a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 2001
>> > -From: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
>> > -Date: Thu, 10 Mar 2011 00:27:08 -0500
>> > -Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use
>> $(CFLAGS)
>> > - and $(EXTRA_CFLAGS) when linking.
>> > -
>> > -This fixes the issue where LDFLAGS escaped with -Wl are ignored during
>> > -compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such as
>> > --m32 on x86_64 or -flto) which apply to both compilation and linking
>> > -situations.
>> > -
>> > -Signed-off-by: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
>> > ----
>> > -Upstream-Status: Pending
>> > -
>> > - Makefile               |  7 ++++---
>> > - scripts/Makefile.build |  8 ++++----
>> > - scripts/Makefile.lib   | 13 +++----------
>> > - 3 files changed, 11 insertions(+), 17 deletions(-)
>> > -
>> > -Index: busybox-1.23.2/Makefile
>> > -===================================================================
>> > ---- busybox-1.23.2.orig/Makefile
>> > -+++ busybox-1.23.2/Makefile
>> > -@@ -309,7 +309,8 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D
>> > - MODFLAGS      = -DMODULE
>> > - CFLAGS_MODULE   = $(MODFLAGS)
>> > - AFLAGS_MODULE   = $(MODFLAGS)
>> > --LDFLAGS_MODULE  = -r
>> > -+LDFLAGS_RELOCATABLE = -r -nostdlib
>> > -+LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
>> > - CFLAGS_KERNEL =
>> > - AFLAGS_KERNEL =
>> > -
>> > -@@ -331,7 +332,7 @@ KERNELVERSION = $(VERSION).$(PATCHLEVEL)
>> > - export        VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
>> \
>> > -       ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC \
>> > -       CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL
>> UTS_MACHINE \
>> > --      HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
>> > -+      HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAGS_MODULE CHECK
>> CHECKFLAGS
>> > -
>> > - export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
>> > - export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
>> > -@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?= LINK    $@
>> > -       cmd_busybox__ ?= $(srctree)/scripts/trylink \
>> > -       "$@" \
>> > -       "$(CC)" \
>> > --      "$(CFLAGS) $(CFLAGS_busybox)" \
>> > -+      "$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAGS)" \
>> > -       "$(LDFLAGS) $(EXTRA_LDFLAGS)" \
>> > -       "$(core-y)" \
>> > -       "$(libs-y)" \
>> > -Index: busybox-1.23.2/scripts/Makefile.build
>> > -===================================================================
>> > ---- busybox-1.23.2.orig/scripts/Makefile.build
>> > -+++ busybox-1.23.2/scripts/Makefile.build
>> > -@@ -174,7 +174,7 @@ cmd_modversions =
>>                 \
>> > -               | $(GENKSYMS) -a $(ARCH)
>> \
>> > -               > $(@D)/.tmp_$(@F:.o=.ver);
>>  \
>> > -
>>  \
>> > --              $(LD) $(LDFLAGS) -r -o $@ $(@D)/.tmp_$(@F)
>> \
>> > -+               $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@
>> $(@D)/.tmp_$(@F)        \
>> > -                       -T $(@D)/.tmp_$(@F:.o=.ver);
>> \
>> > -               rm -f $(@D)/.tmp_$(@F) $(@D)/.tmp_$(@F:.o=.ver);
>> \
>> > -       else
>> \
>> > -@@ -257,7 +257,7 @@ quiet_cmd_link_o_target = LD      $@
>> > - # If the list of objects to link is empty, just create an empty
>> built-in.o
>> > - # -nostdlib is added to make "make LD=gcc ..." work (some people use
>> that)
>> > - cmd_link_o_target = $(if $(strip $(obj-y)),\
>> > --              $(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y),
>> $^),\
>> > -+              $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@
>> $(filter $(obj-y), $^),\
>> > -               rm -f $@; $(AR) rcs $@)
>> > -
>> > - $(builtin-target): $(obj-y) FORCE
>> > -@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
>> > - $($(subst $(obj)/,,$(@:.o=-y)))), $^)
>> > -
>> > - quiet_cmd_link_multi-y = LD      $@
>> > --cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
>> > -+cmd_link_multi-y = $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE)
>> -o $@ $(link_multi_deps)
>> > -
>> > - quiet_cmd_link_multi-m = LD [M]  $@
>> > --cmd_link_multi-m = $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@
>> $(link_multi_deps)
>> > -+cmd_link_multi-m = $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@
>> $(link_multi_deps)
>> > -
>> > - # We would rather have a list of rules like
>> > - #     foo.o: $(foo-objs)
>> > -Index: busybox-1.23.2/scripts/Makefile.lib
>> > -===================================================================
>> > ---- busybox-1.23.2.orig/scripts/Makefile.lib
>> > -+++ busybox-1.23.2/scripts/Makefile.lib
>> > -@@ -121,7 +121,8 @@ cpp_flags      = -Wp,-MD,$(depfile) $(NO
>> > - # yet ld_flags is fed to ld.
>> > - #ld_flags       = $(LDFLAGS) $(EXTRA_LDFLAGS)
>> > - # Remove the -Wl, prefix from linker options normally passed through
>> gcc
>> > --ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS)
>> $(EXTRA_LDFLAGS))
>> > -+ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS)
>> $(EXTRA_LDFLAGS) $(CFLAGS) $(EXTRA_CFLAGS))
>> > -+ld_flags_partial = $($(filter-out -shared%, $(filter-out
>> -pie%,$(ld_flags))))
>> > -
>> > -
>> > - # Finds the multi-part object the current object will be linked into
>> > -@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped
>> > - # Linking
>> > - #
>> ---------------------------------------------------------------------------
>> > -
>> > --# TODO: LDFLAGS usually is supposed to contain gcc's flags, not ld's.
>> > --# but here we feed them to ld!
>> > --quiet_cmd_ld = LD      $@
>> > --cmd_ld = $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \
>> > -+quiet_cmd_ld = CC    $@
>> > -+cmd_ld = $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \
>> > -              $(filter-out FORCE,$^) -o $@
>> > -
>> > - # Objcopy
>> > diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb
>> b/meta/recipes-core/busybox/busybox_1.34.1.bb
>> > index 6aed0f0476..3651c06126 100644
>> > --- a/meta/recipes-core/busybox/busybox_1.34.1.bb
>> > +++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
>> > @@ -26,7 +26,6 @@ SRC_URI = "
>> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>> >             file://login-utilities.cfg \
>> >             file://recognize_connmand.patch \
>> >             file://busybox-cross-menuconfig.patch \
>> > -
>>  file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
>> >             file://mount-via-label.cfg \
>> >             file://sha1sum.cfg \
>> >             file://sha256sum.cfg \
>> > --
>> > 2.20.1
>> >
>> >
>> >
>> >
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158461):
> https://lists.openembedded.org/g/openembedded-core/message/158461
> Mute This Topic: https://lists.openembedded.org/mt/87122011/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d2c02305d10dabba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I double checked, with strace (can&#39;t trust the lo=
gs as they don&#39;t show the actual linker invocation :)</div><div><br></d=
iv><div>execve(&quot;/home/alex/development/poky/build-64-alt/tmp/work/core=
2-64-poky-linux/busybox/1.34.1-r0/recipe-sysroot-native/usr/bin/x86_64-poky=
-linux/x86_64-poky-linux-gcc&quot;, [&quot;x86_64-poky-linux-gcc&quot;, &qu=
ot;-m64&quot;, &quot;-march=3Dcore2&quot;, &quot;-mtune=3Dcore2&quot;, &quo=
t;-msse3&quot;, &quot;-mfpmath=3Dsse&quot;, &quot;-fstack-protector-strong&=
quot;, &quot;-O2&quot;, &quot;-D_FORTIFY_SOURCE=3D2&quot;, &quot;--sysroot=
=3D/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/bu=
sybox/1.34.1-r0/recipe-sysroot&quot;, &quot;-malign-data=3Dabi&quot;, &quot=
;-Wall&quot;, &quot;-Wshadow&quot;, &quot;-Wwrite-strings&quot;, &quot;-Wun=
def&quot;, &quot;-Wstrict-prototypes&quot;, &quot;-Wunused&quot;, &quot;-Wu=
nused-parameter&quot;, &quot;-Wunused-function&quot;, &quot;-Wunused-value&=
quot;, &quot;-Wmissing-prototypes&quot;, &quot;-Wmissing-declarations&quot;=
, &quot;-Wno-format-security&quot;, &quot;-Wdeclaration-after-statement&quo=
t;, &quot;-Wold-style-definition&quot;, &quot;-finline-limit=3D0&quot;, &qu=
ot;-fno-builtin-strlen&quot;, &quot;-fomit-frame-pointer&quot;, &quot;-ffun=
ction-sections&quot;, &quot;-fdata-sections&quot;, &quot;-fno-guess-branch-=
probability&quot;, &quot;-funsigned-char&quot;, &quot;-static-libgcc&quot;,=
 &quot;-falign-functions=3D1&quot;, &quot;-falign-jumps=3D1&quot;, &quot;-f=
align-labels=3D1&quot;, &quot;-falign-loops=3D1&quot;, &quot;-fno-unwind-ta=
bles&quot;, &quot;-fno-asynchronous-unwind-tables&quot;, &quot;-fno-builtin=
-printf&quot;, &quot;-Os&quot;, &quot;-O2&quot;, &quot;-pipe&quot;, &quot;-=
g&quot;, &quot;-feliminate-unused-debug-types&quot;, &quot;-m64&quot;, &quo=
t;-march=3Dcore2&quot;, &quot;-mtune=3Dcore2&quot;, &quot;-msse3&quot;, &qu=
ot;-mfpmath=3Dsse&quot;, &quot;-fstack-protector-strong&quot;, &quot;-O2&qu=
ot;, &quot;-D_FORTIFY_SOURCE=3D2&quot;, &quot;-Wl,-O1&quot;, &quot;-Wl,--ha=
sh-style=3Dgnu&quot;, &quot;-Wl,--as-needed&quot;, &quot;-fmacro-prefix-map=
=3D/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/bu=
sybox/1.34.1-r0=3D/usr/src/debug/busybox/1.34.1-r0&quot;, &quot;-fdebug-pre=
fix-map=3D/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-l=
inux/busybox/1.34.1-r0=3D/usr/src/debug/busybox/1.34.1-r0&quot;, &quot;-fde=
bug-prefix-map=3D/home/alex/development/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/busybox/1.34.1-r0/recipe-sysroot=3D&quot;, &quot;-fdebug-prefix=
-map=3D/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linu=
x/busybox/1.34.1-r0/recipe-sysroot-native=3D&quot;, &quot;-Wl,-z,relro,-z,n=
ow&quot;, &quot;-o&quot;, &quot;busybox_unstripped&quot;, &quot;-Wl,--sort-=
common&quot;, &quot;-Wl,--sort-section,alignment&quot;, &quot;-Wl,--gc-sect=
ions&quot;, &quot;-Wl,--start-group&quot;, &quot;applets/built-in.o&quot;, =
&quot;archival/lib.a&quot;, &quot;archival/libarchive/lib.a&quot;, &quot;co=
nsole-tools/lib.a&quot;, &quot;coreutils/lib.a&quot;, &quot;coreutils/libco=
reutils/lib.a&quot;, &quot;debianutils/lib.a&quot;, &quot;klibc-utils/lib.a=
&quot;, &quot;e2fsprogs/lib.a&quot;, &quot;editors/lib.a&quot;, &quot;findu=
tils/lib.a&quot;, &quot;init/lib.a&quot;, &quot;libbb/lib.a&quot;, &quot;li=
bpwdgrp/lib.a&quot;, &quot;loginutils/lib.a&quot;, &quot;mailutils/lib.a&qu=
ot;, &quot;miscutils/lib.a&quot;, &quot;modutils/lib.a&quot;, &quot;network=
ing/lib.a&quot;, &quot;networking/libiproute/lib.a&quot;, &quot;networking/=
udhcp/lib.a&quot;, &quot;printutils/lib.a&quot;, &quot;procps/lib.a&quot;, =
&quot;runit/lib.a&quot;, &quot;selinux/lib.a&quot;, &quot;shell/lib.a&quot;=
, &quot;sysklogd/lib.a&quot;, &quot;util-linux/lib.a&quot;, &quot;util-linu=
x/volume_id/lib.a&quot;, &quot;archival/built-in.o&quot;, &quot;archival/li=
barchive/built-in.o&quot;, &quot;console-tools/built-in.o&quot;, &quot;core=
utils/built-in.o&quot;, &quot;coreutils/libcoreutils/built-in.o&quot;, &quo=
t;debianutils/built-in.o&quot;, &quot;klibc-utils/built-in.o&quot;, &quot;e=
2fsprogs/built-in.o&quot;, &quot;editors/built-in.o&quot;, &quot;findutils/=
built-in.o&quot;, &quot;init/built-in.o&quot;, &quot;libbb/built-in.o&quot;=
, &quot;libpwdgrp/built-in.o&quot;, &quot;loginutils/built-in.o&quot;, &quo=
t;mailutils/built-in.o&quot;, &quot;miscutils/built-in.o&quot;, &quot;modut=
ils/built-in.o&quot;, &quot;networking/built-in.o&quot;, &quot;networking/l=
ibiproute/built-in.o&quot;, &quot;networking/udhcp/built-in.o&quot;, &quot;=
printutils/built-in.o&quot;, &quot;procps/built-in.o&quot;, &quot;runit/bui=
lt-in.o&quot;, &quot;selinux/built-in.o&quot;, &quot;shell/built-in.o&quot;=
, &quot;sysklogd/built-in.o&quot;, &quot;util-linux/built-in.o&quot;, &quot=
;util-linux/volume_id/built-in.o&quot;, &quot;-Wl,--end-group&quot;, &quot;=
-Wl,--start-group&quot;, &quot;-lcrypt&quot;, &quot;-lm&quot;, &quot;-lrt&q=
uot;, &quot;-Wl,--end-group&quot;], 0x5654941e7a98 /* 138 vars */) =3D 0</d=
iv><div><br></div><div>So everything that is supposed to be there is actual=
ly present, and the patch is indeed unneeded.</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, 17 Nov 2021 at 23:05, Alexander Kanavin via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D=
<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, 17 Nov 2021 at 21:43, Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
, Nov 17, 2021 at 7:36 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This was added 10 years ago, is almost certainly non-upstreamable<br>
&gt; and it isn&#39;t clear what the issues it aims to fix are:<br>
&gt; the AB revealed no problems when the patch is removed.<br>
<br>
The comment in the patch was: This fixes the issue where LDFLAGS<br>
escaped with -Wl are ignored during compilation. Seems fairly clear!<br>
<br>
Checking that the AB run didn&#39;t fail is probably not enough to justify<=
br>
removing this patch. You should also confirm that LDFLAGS escaped with<br>
-Wl (e.g. -Wl,-z,relro,-z,now when security flags are enabled, etc)<br>
are still passed to the linker.<br></blockquote><div><br></div><div>Thanks,=
 I will double check.</div><div><br></div><div>Alex<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ing-instead-of-LD-and-use-CFLAGS-and.patch | 114 ------------=
------<br>
&gt;=C2=A0 meta/recipes-core/busybox/<a href=3D"http://busybox_1.34.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.34.1.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A01 -<br>
&gt;=C2=A0 2 files changed, 115 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Use-CC=
-when-linking-instead-of-LD-and-use-CFLAGS-and.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linkin=
g-instead-of-LD-and-use-CFLAGS-and.patch b/meta/recipes-core/busybox/busybo=
x/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 2bf2b91c7e..0000000000<br>
&gt; --- a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-inste=
ad-of-LD-and-use-CFLAGS-and.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,114 +0,0 @@<br>
&gt; -From a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Nathan Phillip Brink &lt;<a href=3D"mailto:ohnobinki@ohnopublis=
hing.net" target=3D"_blank">ohnobinki@ohnopublishing.net</a>&gt;<br>
&gt; -Date: Thu, 10 Mar 2011 00:27:08 -0500<br>
&gt; -Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use =
$(CFLAGS)<br>
&gt; - and $(EXTRA_CFLAGS) when linking.<br>
&gt; -<br>
&gt; -This fixes the issue where LDFLAGS escaped with -Wl are ignored durin=
g<br>
&gt; -compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such as=
<br>
&gt; --m32 on x86_64 or -flto) which apply to both compilation and linking<=
br>
&gt; -situations.<br>
&gt; -<br>
&gt; -Signed-off-by: Nathan Phillip Brink &lt;<a href=3D"mailto:ohnobinki@o=
hnopublishing.net" target=3D"_blank">ohnobinki@ohnopublishing.net</a>&gt;<b=
r>
&gt; ----<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; - Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 7 ++++---<br>
&gt; - scripts/Makefile.build |=C2=A0 8 ++++----<br>
&gt; - scripts/Makefile.lib=C2=A0 =C2=A0| 13 +++----------<br>
&gt; - 3 files changed, 11 insertions(+), 17 deletions(-)<br>
&gt; -<br>
&gt; -Index: busybox-1.23.2/Makefile<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- busybox-1.23.2.orig/Makefile<br>
&gt; -+++ busybox-1.23.2/Makefile<br>
&gt; -@@ -309,7 +309,8 @@ CHECKFLAGS=C2=A0 =C2=A0 =C2=A0:=3D -D__linux__ -D=
linux -D<br>
&gt; - MODFLAGS=C2=A0 =C2=A0 =C2=A0 =3D -DMODULE<br>
&gt; - CFLAGS_MODULE=C2=A0 =C2=A0=3D $(MODFLAGS)<br>
&gt; - AFLAGS_MODULE=C2=A0 =C2=A0=3D $(MODFLAGS)<br>
&gt; --LDFLAGS_MODULE=C2=A0 =3D -r<br>
&gt; -+LDFLAGS_RELOCATABLE =3D -r -nostdlib<br>
&gt; -+LDFLAGS_MODULE=C2=A0 =3D $(LDFLAGS_RELOCATABLE)<br>
&gt; - CFLAGS_KERNEL =3D<br>
&gt; - AFLAGS_KERNEL =3D<br>
&gt; -<br>
&gt; -@@ -331,7 +332,7 @@ KERNELVERSION =3D $(VERSION).$(PATCHLEVEL)<br>
&gt; - export=C2=A0 =C2=A0 =C2=A0 =C2=A0 VERSION PATCHLEVEL SUBLEVEL KERNEL=
RELEASE KERNELVERSION \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_=
COMPILE AS LD CC \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK G=
ENKSYMS PERL UTS_MACHINE \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECK=
FLAGS<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAG=
S_MODULE CHECK CHECKFLAGS<br>
&gt; -<br>
&gt; - export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS<br>
&gt; - export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE<br>
&gt; -@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?=3D LINK=C2=A0 =C2=A0 $@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_busybox__ ?=3D $(srctree)/scripts/tryl=
ink \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$@&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$(CC)&quot; \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &quot;$(CFLAGS) $(CFLAGS_busybox)&quot; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &quot;$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAG=
S)&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$(LDFLAGS) $(EXTRA_LDFLAGS)&quot; \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$(core-y)&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$(libs-y)&quot; \<br>
&gt; -Index: busybox-1.23.2/scripts/Makefile.build<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- busybox-1.23.2.orig/scripts/Makefile.build<br>
&gt; -+++ busybox-1.23.2/scripts/Makefile.build<br>
&gt; -@@ -174,7 +174,7 @@ cmd_modversions =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| $(GENKSYMS) =
-a $(ARCH)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; $(@D)/.tm=
p_$(@F:.o=3D.ver);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LD) $(LDFLAGS) -r=
 -o $@ $(@D)/.tmp_$(@F)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(ld_fl=
ags_partial) $(LDFLAGS_RELOCATABLE) -o $@ $(@D)/.tmp_$(@F)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-T $(@D)/.tmp_$(@F:.o=3D.ver);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $(@D)/.t=
mp_$(@F) $(@D)/.tmp_$(@F:.o=3D.ver);=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -@@ -257,7 +257,7 @@ quiet_cmd_link_o_target =3D LD=C2=A0 =C2=A0 =C2=
=A0 $@<br>
&gt; - # If the list of objects to link is empty, just create an empty buil=
t-in.o<br>
&gt; - # -nostdlib is added to make &quot;make LD=3Dgcc ...&quot; work (som=
e people use that)<br>
&gt; - cmd_link_o_target =3D $(if $(strip $(obj-y)),\<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LD) -nostdlib $(l=
d_flags) -r -o $@ $(filter $(obj-y), $^),\<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(ld_flags_pa=
rtial) $(LDFLAGS_RELOCATABLE) -o $@ $(filter $(obj-y), $^),\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $@; $(AR=
) rcs $@)<br>
&gt; -<br>
&gt; - $(builtin-target): $(obj-y) FORCE<br>
&gt; -@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=3D-objs)))=C2=A0 =C2=
=A0 \<br>
&gt; - $($(subst $(obj)/,,$(@:.o=3D-y)))), $^)<br>
&gt; -<br>
&gt; - quiet_cmd_link_multi-y =3D LD=C2=A0 =C2=A0 =C2=A0 $@<br>
&gt; --cmd_link_multi-y =3D $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)<b=
r>
&gt; -+cmd_link_multi-y =3D $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE=
) -o $@ $(link_multi_deps)<br>
&gt; -<br>
&gt; - quiet_cmd_link_multi-m =3D LD [M]=C2=A0 $@<br>
&gt; --cmd_link_multi-m =3D $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(lin=
k_multi_deps)<br>
&gt; -+cmd_link_multi-m =3D $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(lin=
k_multi_deps)<br>
&gt; -<br>
&gt; - # We would rather have a list of rules like<br>
&gt; - #=C2=A0 =C2=A0 =C2=A0foo.o: $(foo-objs)<br>
&gt; -Index: busybox-1.23.2/scripts/Makefile.lib<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- busybox-1.23.2.orig/scripts/Makefile.lib<br>
&gt; -+++ busybox-1.23.2/scripts/Makefile.lib<br>
&gt; -@@ -121,7 +121,8 @@ cpp_flags=C2=A0 =C2=A0 =C2=A0 =3D -Wp,-MD,$(depfi=
le) $(NO<br>
&gt; - # yet ld_flags is fed to ld.<br>
&gt; - #ld_flags=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(LDFLAGS) $(EXTRA_LDFLAGS)<=
br>
&gt; - # Remove the -Wl, prefix from linker options normally passed through=
 gcc<br>
&gt; --ld_flags=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(filter-out -Wl$(comma)%,$(L=
DFLAGS) $(EXTRA_LDFLAGS))<br>
&gt; -+ld_flags=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(filter-out -Wl$(comma)%,$(L=
DFLAGS) $(EXTRA_LDFLAGS) $(CFLAGS) $(EXTRA_CFLAGS))<br>
&gt; -+ld_flags_partial =3D $($(filter-out -shared%, $(filter-out -pie%,$(l=
d_flags))))<br>
&gt; -<br>
&gt; -<br>
&gt; - # Finds the multi-part object the current object will be linked into=
<br>
&gt; -@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped<br>
&gt; - # Linking<br>
&gt; - # ------------------------------------------------------------------=
---------<br>
&gt; -<br>
&gt; --# TODO: LDFLAGS usually is supposed to contain gcc&#39;s flags, not =
ld&#39;s.<br>
&gt; --# but here we feed them to ld!<br>
&gt; --quiet_cmd_ld =3D LD=C2=A0 =C2=A0 =C2=A0 $@<br>
&gt; --cmd_ld =3D $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \<br>
&gt; -+quiet_cmd_ld =3D CC=C2=A0 =C2=A0 $@<br>
&gt; -+cmd_ld =3D $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(filter-out FORCE,$=
^) -o $@<br>
&gt; -<br>
&gt; - # Objcopy<br>
&gt; diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.34.=
1.bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.34.1.bb</a> b/meta/rec=
ipes-core/busybox/<a href=3D"http://busybox_1.34.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">busybox_1.34.1.bb</a><br>
&gt; index 6aed0f0476..3651c06126 100644<br>
&gt; --- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.34.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.34.1.bb</a><br>
&gt; +++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.34.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.34.1.bb</a><br>
&gt; @@ -26,7 +26,6 @@ SRC_URI =3D &quot;<a href=3D"https://busybox.net/dow=
nloads/busybox-$%7BPV%7D.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=
=3D"_blank">https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarb=
all</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://login-utilities.=
cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://recognize_connma=
nd.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-cross-me=
nuconfig.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-CC-when-link=
ing-instead-of-LD-and-use-CFLAGS-and.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mount-via-label.=
cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sha1sum.cfg \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sha256sum.cfg \<=
br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158461): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158461" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158461</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87122011/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87122011/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d2c02305d10dabba--

