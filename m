Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3DBC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 23:15:02 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.978.1637277301025421647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 15:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A7VvjeDm;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id f18so34050045lfv.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 15:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aJQQfLN8u2Q4yNLSWr0hgTusaNVOX4zzhYcD/IjhtBU=;
        b=A7VvjeDmrfgKn8+z2BCA1Y0SVyY/mRtujtFqTuT69Pl3yoWkKB8jmZEuJitC+pM4TU
         udANzJGz8mzBSlSPae+bjo5Ff8F+7VsVeNju4qqG1HpJBJ1h205vN+tCSVIvvYogwnNp
         Tglt5v4kIlWqTJ/qroMMiyFfUKyWHMRv5dliILT6ke6bpM5o9fog2a/g9pBJfikozoxO
         QVUWUEgP4Gm9s3WZy4UzbG3UvXH5cfHYA7A+CZr4qVQMWPqJlpgsTzwYX5ShaJ0yLjmk
         aVSYrMwMCKQeJ9NWMS5ttO3ckQfYE9C3wbPKL4s9Lybo0LE8vZFJL6qkCwgMG0Lo3aX0
         kl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aJQQfLN8u2Q4yNLSWr0hgTusaNVOX4zzhYcD/IjhtBU=;
        b=0n9JOr4GlXV1/mBnXkVK/5xnTosWMRdbC89NaM5FTCfc+dTKGj4MelX3Joim2HNc/i
         wOdXgsmZlR562VzSmwgR8UyXavVqyCgqvqWmpSIiOniWBej1jY1qWWMFWiY9YuQkuYW2
         vH69y8wr/gD6SgC34pm37ivYH2Uw9CDyf53K49F87afaOmHphEDkVb/ARFMbkQJ9+bWz
         FW8qd4pbpMqVYqjMJP8jcqfpgYxk/O9O3oErMHfwEnjNqkLRUPiQKSF+hpFafYa20sHZ
         vHOaa5X1/xDs5SwQ3WSYDYTttkQV71RinYMw0fqN8NDNRq+tsrW9JXIALVLhg/3CLGcV
         07KA==
X-Gm-Message-State: AOAM532IDPsWm3qajP32SbTrffJtlZa6wPGf6NS+EBJmZhrFNfHBSmO3
	NhGeq27rOPzJTheYb3dZ0AXxDFsO/kaluZfuF3M=
X-Google-Smtp-Source: 
 ABdhPJydnKVAt+cc8bPiWtr4K59dJpItlefCmkQqflgbjqslf9XL8qRw28qoKZkOgJrdnXL+pQnJq22tUAagwIhylxQ=
X-Received: by 2002:a05:651c:98c:: with SMTP id
 b12mr21422054ljq.481.1637277298717;
 Thu, 18 Nov 2021 15:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-34-alex@linutronix.de>
 <CAJ86T=X-uLwWJTf86dJueyeZBdcxhvVWvQbrj+06mrRz6dL-4A@mail.gmail.com>
 <16B874A872BAAE14.8846@lists.openembedded.org>
 <CANNYZj9g5RRyQbU6+=gNZQ0OXbgC2OVtWYtnNbW_bAvRDT4_eg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9g5RRyQbU6+=gNZQ0OXbgC2OVtWYtnNbW_bAvRDT4_eg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 18 Nov 2021 15:14:42 -0800
Message-ID: 
 <CAJ86T=XEZ4jqyujLiUoqtw0wODUtxUVvVLCzQ3jDVihwF67nCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/36] busybox: drop
 0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 23:15:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158485

On Thu, Nov 18, 2021 at 2:32 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I double checked, with strace (can't trust the logs as they don't show th=
e actual linker invocation :)
>
> execve("/home/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-l=
inux/busybox/1.34.1-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_=
64-poky-linux-gcc", ["x86_64-poky-linux-gcc", "-m64", "-march=3Dcore2", "-m=
tune=3Dcore2", "-msse3", "-mfpmath=3Dsse", "-fstack-protector-strong", "-O2=
", "-D_FORTIFY_SOURCE=3D2", "--sysroot=3D/home/alex/development/poky/build-=
64-alt/tmp/work/core2-64-poky-linux/busybox/1.34.1-r0/recipe-sysroot", "-ma=
lign-data=3Dabi", "-Wall", "-Wshadow", "-Wwrite-strings", "-Wundef", "-Wstr=
ict-prototypes", "-Wunused", "-Wunused-parameter", "-Wunused-function", "-W=
unused-value", "-Wmissing-prototypes", "-Wmissing-declarations", "-Wno-form=
at-security", "-Wdeclaration-after-statement", "-Wold-style-definition", "-=
finline-limit=3D0", "-fno-builtin-strlen", "-fomit-frame-pointer", "-ffunct=
ion-sections", "-fdata-sections", "-fno-guess-branch-probability", "-funsig=
ned-char", "-static-libgcc", "-falign-functions=3D1", "-falign-jumps=3D1", =
"-falign-labels=3D1", "-falign-loops=3D1", "-fno-unwind-tables", "-fno-asyn=
chronous-unwind-tables", "-fno-builtin-printf", "-Os", "-O2", "-pipe", "-g"=
, "-feliminate-unused-debug-types", "-m64", "-march=3Dcore2", "-mtune=3Dcor=
e2", "-msse3", "-mfpmath=3Dsse", "-fstack-protector-strong", "-O2", "-D_FOR=
TIFY_SOURCE=3D2", "-Wl,-O1", "-Wl,--hash-style=3Dgnu", "-Wl,--as-needed", "=
-fmacro-prefix-map=3D/home/alex/development/poky/build-64-alt/tmp/work/core=
2-64-poky-linux/busybox/1.34.1-r0=3D/usr/src/debug/busybox/1.34.1-r0", "-fd=
ebug-prefix-map=3D/home/alex/development/poky/build-64-alt/tmp/work/core2-6=
4-poky-linux/busybox/1.34.1-r0=3D/usr/src/debug/busybox/1.34.1-r0", "-fdebu=
g-prefix-map=3D/home/alex/development/poky/build-64-alt/tmp/work/core2-64-p=
oky-linux/busybox/1.34.1-r0/recipe-sysroot=3D", "-fdebug-prefix-map=3D/home=
/alex/development/poky/build-64-alt/tmp/work/core2-64-poky-linux/busybox/1.=
34.1-r0/recipe-sysroot-native=3D", "-Wl,-z,relro,-z,now", "-o", "busybox_un=
stripped", "-Wl,--sort-common", "-Wl,--sort-section,alignment", "-Wl,--gc-s=
ections", "-Wl,--start-group", "applets/built-in.o", "archival/lib.a", "arc=
hival/libarchive/lib.a", "console-tools/lib.a", "coreutils/lib.a", "coreuti=
ls/libcoreutils/lib.a", "debianutils/lib.a", "klibc-utils/lib.a", "e2fsprog=
s/lib.a", "editors/lib.a", "findutils/lib.a", "init/lib.a", "libbb/lib.a", =
"libpwdgrp/lib.a", "loginutils/lib.a", "mailutils/lib.a", "miscutils/lib.a"=
, "modutils/lib.a", "networking/lib.a", "networking/libiproute/lib.a", "net=
working/udhcp/lib.a", "printutils/lib.a", "procps/lib.a", "runit/lib.a", "s=
elinux/lib.a", "shell/lib.a", "sysklogd/lib.a", "util-linux/lib.a", "util-l=
inux/volume_id/lib.a", "archival/built-in.o", "archival/libarchive/built-in=
.o", "console-tools/built-in.o", "coreutils/built-in.o", "coreutils/libcore=
utils/built-in.o", "debianutils/built-in.o", "klibc-utils/built-in.o", "e2f=
sprogs/built-in.o", "editors/built-in.o", "findutils/built-in.o", "init/bui=
lt-in.o", "libbb/built-in.o", "libpwdgrp/built-in.o", "loginutils/built-in.=
o", "mailutils/built-in.o", "miscutils/built-in.o", "modutils/built-in.o", =
"networking/built-in.o", "networking/libiproute/built-in.o", "networking/ud=
hcp/built-in.o", "printutils/built-in.o", "procps/built-in.o", "runit/built=
-in.o", "selinux/built-in.o", "shell/built-in.o", "sysklogd/built-in.o", "u=
til-linux/built-in.o", "util-linux/volume_id/built-in.o", "-Wl,--end-group"=
, "-Wl,--start-group", "-lcrypt", "-lm", "-lrt", "-Wl,--end-group"], 0x5654=
941e7a98 /* 138 vars */) =3D 0
>
> So everything that is supposed to be there is actually present, and the p=
atch is indeed unneeded.

Looks good. If you have the full strace logs for both cases then it
might still be useful to check which (if any) command lines are
changed by removing the patch, but if not then removing the whole
patch does seem OK.

> Alex
>
> On Wed, 17 Nov 2021 at 23:05, Alexander Kanavin via lists.openembedded.or=
g <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Wed, 17 Nov 2021 at 21:43, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> On Wed, Nov 17, 2021 at 7:36 AM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>> >
>>> > This was added 10 years ago, is almost certainly non-upstreamable
>>> > and it isn't clear what the issues it aims to fix are:
>>> > the AB revealed no problems when the patch is removed.
>>>
>>> The comment in the patch was: This fixes the issue where LDFLAGS
>>> escaped with -Wl are ignored during compilation. Seems fairly clear!
>>>
>>> Checking that the AB run didn't fail is probably not enough to justify
>>> removing this patch. You should also confirm that LDFLAGS escaped with
>>> -Wl (e.g. -Wl,-z,relro,-z,now when security flags are enabled, etc)
>>> are still passed to the linker.
>>
>>
>> Thanks, I will double check.
>>
>> Alex
>>
>>>
>>>
>>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>> > ---
>>> >  ...ing-instead-of-LD-and-use-CFLAGS-and.patch | 114 ----------------=
--
>>> >  meta/recipes-core/busybox/busybox_1.34.1.bb   |   1 -
>>> >  2 files changed, 115 deletions(-)
>>> >  delete mode 100644 meta/recipes-core/busybox/busybox/0001-Use-CC-whe=
n-linking-instead-of-LD-and-use-CFLAGS-and.patch
>>> >
>>> > diff --git a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linki=
ng-instead-of-LD-and-use-CFLAGS-and.patch b/meta/recipes-core/busybox/busyb=
ox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
>>> > deleted file mode 100644
>>> > index 2bf2b91c7e..0000000000
>>> > --- a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-inst=
ead-of-LD-and-use-CFLAGS-and.patch
>>> > +++ /dev/null
>>> > @@ -1,114 +0,0 @@
>>> > -From a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 20=
01
>>> > -From: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
>>> > -Date: Thu, 10 Mar 2011 00:27:08 -0500
>>> > -Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use=
 $(CFLAGS)
>>> > - and $(EXTRA_CFLAGS) when linking.
>>> > -
>>> > -This fixes the issue where LDFLAGS escaped with -Wl are ignored duri=
ng
>>> > -compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such a=
s
>>> > --m32 on x86_64 or -flto) which apply to both compilation and linking
>>> > -situations.
>>> > -
>>> > -Signed-off-by: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
>>> > ----
>>> > -Upstream-Status: Pending
>>> > -
>>> > - Makefile               |  7 ++++---
>>> > - scripts/Makefile.build |  8 ++++----
>>> > - scripts/Makefile.lib   | 13 +++----------
>>> > - 3 files changed, 11 insertions(+), 17 deletions(-)
>>> > -
>>> > -Index: busybox-1.23.2/Makefile
>>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> > ---- busybox-1.23.2.orig/Makefile
>>> > -+++ busybox-1.23.2/Makefile
>>> > -@@ -309,7 +309,8 @@ CHECKFLAGS     :=3D -D__linux__ -Dlinux -D
>>> > - MODFLAGS      =3D -DMODULE
>>> > - CFLAGS_MODULE   =3D $(MODFLAGS)
>>> > - AFLAGS_MODULE   =3D $(MODFLAGS)
>>> > --LDFLAGS_MODULE  =3D -r
>>> > -+LDFLAGS_RELOCATABLE =3D -r -nostdlib
>>> > -+LDFLAGS_MODULE  =3D $(LDFLAGS_RELOCATABLE)
>>> > - CFLAGS_KERNEL =3D
>>> > - AFLAGS_KERNEL =3D
>>> > -
>>> > -@@ -331,7 +332,7 @@ KERNELVERSION =3D $(VERSION).$(PATCHLEVEL)
>>> > - export        VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSI=
ON \
>>> > -       ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC \
>>> > -       CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL UTS_MA=
CHINE \
>>> > --      HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
>>> > -+      HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAGS_MODULE CHECK=
 CHECKFLAGS
>>> > -
>>> > - export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
>>> > - export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
>>> > -@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?=3D LINK    $@
>>> > -       cmd_busybox__ ?=3D $(srctree)/scripts/trylink \
>>> > -       "$@" \
>>> > -       "$(CC)" \
>>> > --      "$(CFLAGS) $(CFLAGS_busybox)" \
>>> > -+      "$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAGS)" \
>>> > -       "$(LDFLAGS) $(EXTRA_LDFLAGS)" \
>>> > -       "$(core-y)" \
>>> > -       "$(libs-y)" \
>>> > -Index: busybox-1.23.2/scripts/Makefile.build
>>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> > ---- busybox-1.23.2.orig/scripts/Makefile.build
>>> > -+++ busybox-1.23.2/scripts/Makefile.build
>>> > -@@ -174,7 +174,7 @@ cmd_modversions =3D                             =
                     \
>>> > -               | $(GENKSYMS) -a $(ARCH)                             =
   \
>>> > -               > $(@D)/.tmp_$(@F:.o=3D.ver);                        =
     \
>>> > -                                                                    =
   \
>>> > --              $(LD) $(LDFLAGS) -r -o $@ $(@D)/.tmp_$(@F)           =
   \
>>> > -+               $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o =
$@ $(@D)/.tmp_$(@F)        \
>>> > -                       -T $(@D)/.tmp_$(@F:.o=3D.ver);               =
     \
>>> > -               rm -f $(@D)/.tmp_$(@F) $(@D)/.tmp_$(@F:.o=3D.ver);   =
     \
>>> > -       else                                                         =
   \
>>> > -@@ -257,7 +257,7 @@ quiet_cmd_link_o_target =3D LD      $@
>>> > - # If the list of objects to link is empty, just create an empty bui=
lt-in.o
>>> > - # -nostdlib is added to make "make LD=3Dgcc ..." work (some people =
use that)
>>> > - cmd_link_o_target =3D $(if $(strip $(obj-y)),\
>>> > --              $(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y=
), $^),\
>>> > -+              $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $=
@ $(filter $(obj-y), $^),\
>>> > -               rm -f $@; $(AR) rcs $@)
>>> > -
>>> > - $(builtin-target): $(obj-y) FORCE
>>> > -@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=3D-objs)))    \
>>> > - $($(subst $(obj)/,,$(@:.o=3D-y)))), $^)
>>> > -
>>> > - quiet_cmd_link_multi-y =3D LD      $@
>>> > --cmd_link_multi-y =3D $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
>>> > -+cmd_link_multi-y =3D $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABL=
E) -o $@ $(link_multi_deps)
>>> > -
>>> > - quiet_cmd_link_multi-m =3D LD [M]  $@
>>> > --cmd_link_multi-m =3D $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(li=
nk_multi_deps)
>>> > -+cmd_link_multi-m =3D $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@ $(li=
nk_multi_deps)
>>> > -
>>> > - # We would rather have a list of rules like
>>> > - #     foo.o: $(foo-objs)
>>> > -Index: busybox-1.23.2/scripts/Makefile.lib
>>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> > ---- busybox-1.23.2.orig/scripts/Makefile.lib
>>> > -+++ busybox-1.23.2/scripts/Makefile.lib
>>> > -@@ -121,7 +121,8 @@ cpp_flags      =3D -Wp,-MD,$(depfile) $(NO
>>> > - # yet ld_flags is fed to ld.
>>> > - #ld_flags       =3D $(LDFLAGS) $(EXTRA_LDFLAGS)
>>> > - # Remove the -Wl, prefix from linker options normally passed throug=
h gcc
>>> > --ld_flags       =3D $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDF=
LAGS))
>>> > -+ld_flags       =3D $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDF=
LAGS) $(CFLAGS) $(EXTRA_CFLAGS))
>>> > -+ld_flags_partial =3D $($(filter-out -shared%, $(filter-out -pie%,$(=
ld_flags))))
>>> > -
>>> > -
>>> > - # Finds the multi-part object the current object will be linked int=
o
>>> > -@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped
>>> > - # Linking
>>> > - # -----------------------------------------------------------------=
----------
>>> > -
>>> > --# TODO: LDFLAGS usually is supposed to contain gcc's flags, not ld'=
s.
>>> > --# but here we feed them to ld!
>>> > --quiet_cmd_ld =3D LD      $@
>>> > --cmd_ld =3D $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \
>>> > -+quiet_cmd_ld =3D CC    $@
>>> > -+cmd_ld =3D $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \
>>> > -              $(filter-out FORCE,$^) -o $@
>>> > -
>>> > - # Objcopy
>>> > diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recip=
es-core/busybox/busybox_1.34.1.bb
>>> > index 6aed0f0476..3651c06126 100644
>>> > --- a/meta/recipes-core/busybox/busybox_1.34.1.bb
>>> > +++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
>>> > @@ -26,7 +26,6 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-=
${PV}.tar.bz2;name=3Dtarball \
>>> >             file://login-utilities.cfg \
>>> >             file://recognize_connmand.patch \
>>> >             file://busybox-cross-menuconfig.patch \
>>> > -           file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFL=
AGS-and.patch \
>>> >             file://mount-via-label.cfg \
>>> >             file://sha1sum.cfg \
>>> >             file://sha256sum.cfg \
>>> > --
>>> > 2.20.1
>>> >
>>> >
>>> >
>>> >
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#158461): https://lists.openembedded.org/g/openembedd=
ed-core/message/158461
>> Mute This Topic: https://lists.openembedded.org/mt/87122011/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

