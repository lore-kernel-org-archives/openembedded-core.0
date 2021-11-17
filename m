Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F2BC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 22:05:31 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.342.1637186730928350549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 14:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AgUiTzYI;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id r15so9261901uao.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UvzumtYc7sCQiMXsD+BqzAyg6nbTsHaOGRF4haKvYVs=;
        b=AgUiTzYIRvL41/g4kuFkTf3IR5t84RJSNxV1z+9ECgeEGRCCIWNzwe0NmJuze67Rbx
         MLjNSDpR/fLNJ+49QRC0FctSGJu0IxgTXZD7KyiE6Le3DoKCA02Mbtk1HSAYU8EItXKZ
         iaxYIKr+SCyFpiUx8RVlphsQbckgRp0TVhpeCSrchvSXZZwEtUKyUCOBQDb4UyJ5L2Hn
         RYtrgbx5GzK/Vya7XRy4ZQhG5mUdoPQEWzY8S2w3XyDqv3Z9kpRa9k/0izjN9C0t+qw2
         lUg8iwULI1NtOG8Unyvb2S7IT6ye/rf7RCjialRx24dTv+2ouW8VevQsOtQIlBKSRqFI
         ophw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UvzumtYc7sCQiMXsD+BqzAyg6nbTsHaOGRF4haKvYVs=;
        b=ssgQdrTsU6W/5IJuLz08ZuAyLjwXjo9z0zwavD3I6o4zyLxZ3dHkL5mNcl7vMW2c3v
         KXY09w6Lyu4j2McyJfY3W8XaQErxzua6RJfCpP+Tdpbl/MOLuz9aR//M4D2XQDrxNQmX
         eaodxIVNSqYBMWzRgJVlRmVmA/Ictvvhj/xDOXo6OncVgNqc4gKxMKFDI2tnpO6wrunB
         MBZZlhRxn25ysuXgotUlKCq5GLGwdHTEHY+MrH7ZgyAjIBFKLHI4k5za05rMzB0yqzbS
         hSU/yGIVuf0kY4KeDliXMXoJdjHsKs2hGRmMBjrARzTWn9NikhHA7lykGI80q1r9qNTq
         0u8A==
X-Gm-Message-State: AOAM533bNMgIm1v0UHrCo6RCtyP6Yf4ABEN6c60/RdW6FFX8+lEgnO3B
	iUb4dpqLYS3FYhJnekQ37xGHJYovEvlw2ErxrAM=
X-Google-Smtp-Source: 
 ABdhPJyk/Eqe/V60w+ZiCmIRi2BfDWVl4yy2z8NKlY5aDJqVxQJ19RI5JtUjiu5jW8Auqp6nS7YfaQ6RuFf+5XB74BQ=
X-Received: by 2002:a67:ca8f:: with SMTP id a15mr67645636vsl.18.1637186730039;
 Wed, 17 Nov 2021 14:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-34-alex@linutronix.de>
 <CAJ86T=X-uLwWJTf86dJueyeZBdcxhvVWvQbrj+06mrRz6dL-4A@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=X-uLwWJTf86dJueyeZBdcxhvVWvQbrj+06mrRz6dL-4A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 23:05:18 +0100
Message-ID: 
 <CANNYZj8YExaoyAEiEskOq6MWjF-v_neEVtPofs2V0xXzQbFPNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/36] busybox: drop
 0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
Content-Type: multipart/alternative; boundary="000000000000799dc705d1033d11"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 22:05:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158461

--000000000000799dc705d1033d11
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Nov 2021 at 21:43, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Nov 17, 2021 at 7:36 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This was added 10 years ago, is almost certainly non-upstreamable
> > and it isn't clear what the issues it aims to fix are:
> > the AB revealed no problems when the patch is removed.
>
> The comment in the patch was: This fixes the issue where LDFLAGS
> escaped with -Wl are ignored during compilation. Seems fairly clear!
>
> Checking that the AB run didn't fail is probably not enough to justify
> removing this patch. You should also confirm that LDFLAGS escaped with
> -Wl (e.g. -Wl,-z,relro,-z,now when security flags are enabled, etc)
> are still passed to the linker.
>

Thanks, I will double check.

Alex


>
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...ing-instead-of-LD-and-use-CFLAGS-and.patch | 114 ------------------
> >  meta/recipes-core/busybox/busybox_1.34.1.bb   |   1 -
> >  2 files changed, 115 deletions(-)
> >  delete mode 100644
> meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
> >
> > diff --git
> a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
> b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
> > deleted file mode 100644
> > index 2bf2b91c7e..0000000000
> > ---
> a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
> > +++ /dev/null
> > @@ -1,114 +0,0 @@
> > -From a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 2001
> > -From: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
> > -Date: Thu, 10 Mar 2011 00:27:08 -0500
> > -Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use
> $(CFLAGS)
> > - and $(EXTRA_CFLAGS) when linking.
> > -
> > -This fixes the issue where LDFLAGS escaped with -Wl are ignored during
> > -compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such as
> > --m32 on x86_64 or -flto) which apply to both compilation and linking
> > -situations.
> > -
> > -Signed-off-by: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
> > ----
> > -Upstream-Status: Pending
> > -
> > - Makefile               |  7 ++++---
> > - scripts/Makefile.build |  8 ++++----
> > - scripts/Makefile.lib   | 13 +++----------
> > - 3 files changed, 11 insertions(+), 17 deletions(-)
> > -
> > -Index: busybox-1.23.2/Makefile
> > -===================================================================
> > ---- busybox-1.23.2.orig/Makefile
> > -+++ busybox-1.23.2/Makefile
> > -@@ -309,7 +309,8 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D
> > - MODFLAGS      = -DMODULE
> > - CFLAGS_MODULE   = $(MODFLAGS)
> > - AFLAGS_MODULE   = $(MODFLAGS)
> > --LDFLAGS_MODULE  = -r
> > -+LDFLAGS_RELOCATABLE = -r -nostdlib
> > -+LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
> > - CFLAGS_KERNEL =
> > - AFLAGS_KERNEL =
> > -
> > -@@ -331,7 +332,7 @@ KERNELVERSION = $(VERSION).$(PATCHLEVEL)
> > - export        VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION \
> > -       ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC \
> > -       CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL
> UTS_MACHINE \
> > --      HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> > -+      HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAGS_MODULE CHECK
> CHECKFLAGS
> > -
> > - export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
> > - export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> > -@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?= LINK    $@
> > -       cmd_busybox__ ?= $(srctree)/scripts/trylink \
> > -       "$@" \
> > -       "$(CC)" \
> > --      "$(CFLAGS) $(CFLAGS_busybox)" \
> > -+      "$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAGS)" \
> > -       "$(LDFLAGS) $(EXTRA_LDFLAGS)" \
> > -       "$(core-y)" \
> > -       "$(libs-y)" \
> > -Index: busybox-1.23.2/scripts/Makefile.build
> > -===================================================================
> > ---- busybox-1.23.2.orig/scripts/Makefile.build
> > -+++ busybox-1.23.2/scripts/Makefile.build
> > -@@ -174,7 +174,7 @@ cmd_modversions =
>                 \
> > -               | $(GENKSYMS) -a $(ARCH)                                \
> > -               > $(@D)/.tmp_$(@F:.o=.ver);                             \
> > -                                                                       \
> > --              $(LD) $(LDFLAGS) -r -o $@ $(@D)/.tmp_$(@F)              \
> > -+               $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@
> $(@D)/.tmp_$(@F)        \
> > -                       -T $(@D)/.tmp_$(@F:.o=.ver);                    \
> > -               rm -f $(@D)/.tmp_$(@F) $(@D)/.tmp_$(@F:.o=.ver);        \
> > -       else                                                            \
> > -@@ -257,7 +257,7 @@ quiet_cmd_link_o_target = LD      $@
> > - # If the list of objects to link is empty, just create an empty
> built-in.o
> > - # -nostdlib is added to make "make LD=gcc ..." work (some people use
> that)
> > - cmd_link_o_target = $(if $(strip $(obj-y)),\
> > --              $(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y),
> $^),\
> > -+              $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@
> $(filter $(obj-y), $^),\
> > -               rm -f $@; $(AR) rcs $@)
> > -
> > - $(builtin-target): $(obj-y) FORCE
> > -@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
> > - $($(subst $(obj)/,,$(@:.o=-y)))), $^)
> > -
> > - quiet_cmd_link_multi-y = LD      $@
> > --cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
> > -+cmd_link_multi-y = $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o
> $@ $(link_multi_deps)
> > -
> > - quiet_cmd_link_multi-m = LD [M]  $@
> > --cmd_link_multi-m = $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@
> $(link_multi_deps)
> > -+cmd_link_multi-m = $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@
> $(link_multi_deps)
> > -
> > - # We would rather have a list of rules like
> > - #     foo.o: $(foo-objs)
> > -Index: busybox-1.23.2/scripts/Makefile.lib
> > -===================================================================
> > ---- busybox-1.23.2.orig/scripts/Makefile.lib
> > -+++ busybox-1.23.2/scripts/Makefile.lib
> > -@@ -121,7 +121,8 @@ cpp_flags      = -Wp,-MD,$(depfile) $(NO
> > - # yet ld_flags is fed to ld.
> > - #ld_flags       = $(LDFLAGS) $(EXTRA_LDFLAGS)
> > - # Remove the -Wl, prefix from linker options normally passed through
> gcc
> > --ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS))
> > -+ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS)
> $(CFLAGS) $(EXTRA_CFLAGS))
> > -+ld_flags_partial = $($(filter-out -shared%, $(filter-out
> -pie%,$(ld_flags))))
> > -
> > -
> > - # Finds the multi-part object the current object will be linked into
> > -@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped
> > - # Linking
> > - #
> ---------------------------------------------------------------------------
> > -
> > --# TODO: LDFLAGS usually is supposed to contain gcc's flags, not ld's.
> > --# but here we feed them to ld!
> > --quiet_cmd_ld = LD      $@
> > --cmd_ld = $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \
> > -+quiet_cmd_ld = CC    $@
> > -+cmd_ld = $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \
> > -              $(filter-out FORCE,$^) -o $@
> > -
> > - # Objcopy
> > diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb
> b/meta/recipes-core/busybox/busybox_1.34.1.bb
> > index 6aed0f0476..3651c06126 100644
> > --- a/meta/recipes-core/busybox/busybox_1.34.1.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
> > @@ -26,7 +26,6 @@ SRC_URI = "
> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> >             file://login-utilities.cfg \
> >             file://recognize_connmand.patch \
> >             file://busybox-cross-menuconfig.patch \
> > -
>  file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
> >             file://mount-via-label.cfg \
> >             file://sha1sum.cfg \
> >             file://sha256sum.cfg \
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158429):
> https://lists.openembedded.org/g/openembedded-core/message/158429
> > Mute This Topic: https://lists.openembedded.org/mt/87122011/3619030
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> armccurdy@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000799dc705d1033d11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 17 Nov 2021 at 21:43, Andre McCurdy &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, Nov 17, 2021 at 7:36 AM Alexa=
nder Kanavin<br>
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
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#158429): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/158429" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/158429</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87122011=
/3619030" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87122011/3619030</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:armccurdy@gmail.com" =
target=3D"_blank">armccurdy@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000799dc705d1033d11--

