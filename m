Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE572C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:37:16 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.18801.1691678230734270145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nIDAJkOK;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-56cc3453e31so809003eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691678230; x=1692283030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JhI0Q1pVzM0VN+i5yK6slgDGFdnDTAtYlQGvPXZdvO8=;
        b=nIDAJkOKis7n/uRcYs322+GJrKlMa/u/zsweZL9XqewKmhi8kJKSUqE2CoWmJ6HB25
         /S+yGYWXhRPkoDZ36oTsDZOaxF5muqqDNTp9Do4UL374oVeImjxBX5SD0yGMMqZMudhb
         rKGLxQjiguXSk93vW+RgQ8PWY+5B2MdD7dX7ErSWLWW1ompcjEST8y5J/lVRzhJGbEI1
         jPmpTAUJSKodcJ+ZXiTbixeTWXlvzcVpec9cV8befgAQDzoLaMaYd4DQ0D8G446udLgC
         0sSDtK/GVM1syLqkZpy4B3+ehRiutCNrvmBccVOWR7GO1gJo68nwPXa8O4Km4hvSZXTF
         8eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691678230; x=1692283030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhI0Q1pVzM0VN+i5yK6slgDGFdnDTAtYlQGvPXZdvO8=;
        b=gmFcuzU+5MOOYWqT2fQk43KyCWIdLifJLv1oKXF9sGrzzsdQa4gygQBkQ8TUkJoB3k
         6Euac32hO+GOoZ45vpOm12chCzwLOOJTVNngwPoiorjokbOUR9vkdgWRt2Wy9pJlH6jY
         ULzYgACuIMG7WAPdYF4GSSaKvk3aFDpZwPTdpCT2DszOi8qCd7b+4SlSOwZhJSNRa6Sz
         IODww2fMAZS95PNg/GvUC6UaADqwEYuFhgYsE/3AnR4LiZtpTY8d4VptBgv0rrNC7lwl
         d46ygudbYXR/UkS+5kjP6B7QpwQEOUrytbaHs01ouBzWoXBe1Snb3SxAjkhwddMtE+fp
         zwJw==
X-Gm-Message-State: AOJu0YxcslPH2iwXp7dj5mmdxVNTdawxrAUkL5Mf6ku/DP/z8fAgkAEN
	10QNeN298yn4cXVLgMF0GIsJUNJWxvNWpdsf5GTbFXLpMns=
X-Google-Smtp-Source: AGHT+IEzYXmnKZy0zHeLmbuyvTW7cQio4DiYUkLvXr+0dxJS27Czl3xjaY15Y7fic2XFYG/30PJFVOf5xJBvNOSFpnc=
X-Received: by 2002:a05:6820:48:b0:56c:6c34:3e46 with SMTP id
 v8-20020a056820004800b0056c6c343e46mr2011580oob.2.1691678229809; Thu, 10 Aug
 2023 07:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230809210227.2723296-1-raj.khem@gmail.com> <202308101305271063afd1@mail.local>
In-Reply-To: <202308101305271063afd1@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Aug 2023 07:36:58 -0700
Message-ID: <CAMKF1spTEw_xWVHwjbxV+fHTeqz-nvJjGYQU6Jn239ft3Aky0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: Fix build on musl
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f64e6506029287a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185755

--000000000000f64e6506029287a2
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 10, 2023 at 6:05 AM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> I tested this with the meson/systemd series from Ross and it actually
> breaks the build:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7581/steps/12/logs/stdio


Patch applies only to musl builds did you test a musl + systemd

>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7581/steps/12/logs/stdio>
>
> On 09/08/2023 14:02:27-0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../0001-efi-Use-char16_t-on-musl.patch       | 79 +++++++++++++++++++
> >  meta/recipes-core/systemd/systemd-boot_254.bb |  2 +
> >  2 files changed, 81 insertions(+)
> >  create mode 100644
> meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
> >
> > diff --git
> a/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
> b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
> > new file mode 100644
> > index 00000000000..1988d50ac90
> > --- /dev/null
> > +++
> b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
> > @@ -0,0 +1,79 @@
> > +From efe1720de61534c814580fec61fe0025308482b2 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 8 Aug 2023 00:57:12 -0700
> > +Subject: [PATCH] efi: Use char16_t on musl
> > +
> > +musl does not support configurations with under-sized definitions of
> > +types like 16-bit wchar_t or 32-bit off_t. Only the sizes that can
> > +represent the full range of values are supported. musl does however
> > +have the C11 uchar.h functions which can operate on char16_t, so you
> > +could use char16_t and the corresponding c16 conversion functions
> > +instead of the wc versions
> > +
> > +Upstream-Status: Inappropriate [Musl specific]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/boot/efi/efi-string.c                 | 2 +-
> > + src/boot/efi/efi.h                        | 2 ++
> > + src/boot/efi/meson.build                  | 1 -
> > + src/fundamental/string-util-fundamental.h | 4 ++++
> > + 4 files changed, 7 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
> > +index 4400591255..421b2c262d 100644
> > +--- a/src/boot/efi/efi-string.c
> > ++++ b/src/boot/efi/efi-string.c
> > +@@ -735,7 +735,7 @@ static bool handle_format_specifier(FormatContext
> *ctx, SpecifierContext *sp) {
> > +         case 's':
> > +                 if (sp->long_arg) {
> > +                         sp->wstr = va_arg(ctx->ap, const wchar_t *) ?:
> L"(null)";
> > +-                        sp->len = wcsnlen(sp->wstr, sp->len);
> > ++                        sp->len = wcsnlen((char16_t*)sp->wstr,
> sp->len);
> > +                 } else {
> > +                         sp->str = va_arg(ctx->ap, const char *) ?:
> "(null)";
> > +                         sp->len = strnlen8(sp->str, sp->len);
> > +diff --git a/src/boot/efi/efi.h b/src/boot/efi/efi.h
> > +index 5c34668383..459f675ea5 100644
> > +--- a/src/boot/efi/efi.h
> > ++++ b/src/boot/efi/efi.h
> > +@@ -21,7 +21,9 @@ assert_cc(sizeof(uint8_t) == 1);
> > + assert_cc(sizeof(uint16_t) == 2);
> > + assert_cc(sizeof(uint32_t) == 4);
> > + assert_cc(sizeof(uint64_t) == 8);
> > ++#if defined(__linux__) && defined(__GLIBC__)
> > + assert_cc(sizeof(wchar_t) == 2);
> > ++#endif
> > + assert_cc(sizeof(char16_t) == 2);
> > + assert_cc(sizeof(char32_t) == 4);
> > + assert_cc(sizeof(size_t) == sizeof(void *));
> > +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> > +index 1c52629651..4a64838295 100644
> > +--- a/src/boot/efi/meson.build
> > ++++ b/src/boot/efi/meson.build
> > +@@ -132,7 +132,6 @@ efi_c_args = [
> > +         '-DSD_BOOT=1',
> > +         '-ffreestanding',
> > +         '-fno-strict-aliasing',
> > +-        '-fshort-wchar',
> > +         '-include', 'efi_config.h',
> > + ]
> > +
> > +diff --git a/src/fundamental/string-util-fundamental.h
> b/src/fundamental/string-util-fundamental.h
> > +index 9019542b16..1b46f42995 100644
> > +--- a/src/fundamental/string-util-fundamental.h
> > ++++ b/src/fundamental/string-util-fundamental.h
> > +@@ -16,7 +16,11 @@
> > + #  define strncmp strncmp16
> > + #  define strcasecmp strcasecmp16
> > + #  define strncasecmp strncasecmp16
> > ++#if defined (__linux__) && !defined(__GLIBC__)
> > ++#  define STR_C(str)       (u ## str)
> > ++#else
> > + #  define STR_C(str)       (L ## str)
> > ++#endif
> > + typedef char16_t sd_char;
> > + #else
> > + #  define STR_C(str)       (str)
> > +--
> > +2.41.0
> > +
> > diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb
> b/meta/recipes-core/systemd/systemd-boot_254.bb
> > index 5d69cf83abc..ae86450d2a6 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_254.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
> > @@ -1,6 +1,8 @@
> >  require systemd.inc
> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
> >
> > +SRC_URI:append:libc-musl = " file://0001-efi-Use-char16_t-on-musl.patch
> "
> > +
> >  require conf/image-uefi.conf
> >
> >  DEPENDS = "intltool-native libcap util-linux gperf-native
> python3-jinja2-native python3-pyelftools-native"
> > --
> > 2.41.0
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185718):
> https://lists.openembedded.org/g/openembedded-core/message/185718
> > Mute This Topic: https://lists.openembedded.org/mt/100652047/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000f64e6506029287a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 10, 2023 at 6:05 AM Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I tested this with the meson/systemd series from Ross and it actually<br>
breaks the build:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/7581/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7581/steps/12/logs/=
stdio</a></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Patch a=
pplies only to musl builds did you test a musl + systemd=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex" dir=3D"auto"><a href=3D"https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/64/builds/7581/steps/12/logs/stdio" rel=3D"nor=
eferrer" target=3D"_blank"></a><br>
<br>
On 09/08/2023 14:02:27-0700, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-efi-Use-char16_t-on-musl.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 79 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a> |=C2=A0 2 +<b=
r>
&gt;=C2=A0 2 files changed, 81 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/systemd/systemd-boot/0001-e=
fi-Use-char16_t-on-musl.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char1=
6_t-on-musl.patch b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-cha=
r16_t-on-musl.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..1988d50ac90<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-=
musl.patch<br>
&gt; @@ -0,0 +1,79 @@<br>
&gt; +From efe1720de61534c814580fec61fe0025308482b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 8 Aug 2023 00:57:12 -0700<br>
&gt; +Subject: [PATCH] efi: Use char16_t on musl<br>
&gt; +<br>
&gt; +musl does not support configurations with under-sized definitions of<=
br>
&gt; +types like 16-bit wchar_t or 32-bit off_t. Only the sizes that can<br=
>
&gt; +represent the full range of values are supported. musl does however<b=
r>
&gt; +have the C11 uchar.h functions which can operate on char16_t, so you<=
br>
&gt; +could use char16_t and the corresponding c16 conversion functions<br>
&gt; +instead of the wc versions<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [Musl specific]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/boot/efi/efi-string.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; + src/boot/efi/efi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; + src/boot/efi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt; + src/fundamental/string-util-fundamental.h | 4 ++++<br>
&gt; + 4 files changed, 7 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c<br=
>
&gt; +index 4400591255..421b2c262d 100644<br>
&gt; +--- a/src/boot/efi/efi-string.c<br>
&gt; ++++ b/src/boot/efi/efi-string.c<br>
&gt; +@@ -735,7 +735,7 @@ static bool handle_format_specifier(FormatContext=
 *ctx, SpecifierContext *sp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;s&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sp-=
&gt;long_arg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0sp-&gt;wstr =3D va_arg(ctx-&gt;ap, const wchar_t *) ?:=
 L&quot;(null)&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sp-&gt;len =3D wcsnlen(sp-&gt;wstr, sp-&gt;len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sp-&gt;len =3D wcsnlen((char16_t*)sp-&gt;wstr, sp-&gt;len=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0sp-&gt;str =3D va_arg(ctx-&gt;ap, const char *) ?: &qu=
ot;(null)&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0sp-&gt;len =3D strnlen8(sp-&gt;str, sp-&gt;len);<br>
&gt; +diff --git a/src/boot/efi/efi.h b/src/boot/efi/efi.h<br>
&gt; +index 5c34668383..459f675ea5 100644<br>
&gt; +--- a/src/boot/efi/efi.h<br>
&gt; ++++ b/src/boot/efi/efi.h<br>
&gt; +@@ -21,7 +21,9 @@ assert_cc(sizeof(uint8_t) =3D=3D 1);<br>
&gt; + assert_cc(sizeof(uint16_t) =3D=3D 2);<br>
&gt; + assert_cc(sizeof(uint32_t) =3D=3D 4);<br>
&gt; + assert_cc(sizeof(uint64_t) =3D=3D 8);<br>
&gt; ++#if defined(__linux__) &amp;&amp; defined(__GLIBC__)<br>
&gt; + assert_cc(sizeof(wchar_t) =3D=3D 2);<br>
&gt; ++#endif<br>
&gt; + assert_cc(sizeof(char16_t) =3D=3D 2);<br>
&gt; + assert_cc(sizeof(char32_t) =3D=3D 4);<br>
&gt; + assert_cc(sizeof(size_t) =3D=3D sizeof(void *));<br>
&gt; +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build<br>
&gt; +index 1c52629651..4a64838295 100644<br>
&gt; +--- a/src/boot/efi/meson.build<br>
&gt; ++++ b/src/boot/efi/meson.build<br>
&gt; +@@ -132,7 +132,6 @@ efi_c_args =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-DSD_BOOT=3D1&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-ffreestanding&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-fno-strict-aliasing&#39;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-fshort-wchar&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-include&#39;, &#39;efi_config=
.h&#39;,<br>
&gt; + ]<br>
&gt; + <br>
&gt; +diff --git a/src/fundamental/string-util-fundamental.h b/src/fundamen=
tal/string-util-fundamental.h<br>
&gt; +index 9019542b16..1b46f42995 100644<br>
&gt; +--- a/src/fundamental/string-util-fundamental.h<br>
&gt; ++++ b/src/fundamental/string-util-fundamental.h<br>
&gt; +@@ -16,7 +16,11 @@<br>
&gt; + #=C2=A0 define strncmp strncmp16<br>
&gt; + #=C2=A0 define strcasecmp strcasecmp16<br>
&gt; + #=C2=A0 define strncasecmp strncasecmp16<br>
&gt; ++#if defined (__linux__) &amp;&amp; !defined(__GLIBC__)<br>
&gt; ++#=C2=A0 define STR_C(str)=C2=A0 =C2=A0 =C2=A0 =C2=A0(u ## str)<br>
&gt; ++#else<br>
&gt; + #=C2=A0 define STR_C(str)=C2=A0 =C2=A0 =C2=A0 =C2=A0(L ## str)<br>
&gt; ++#endif<br>
&gt; + typedef char16_t sd_char;<br>
&gt; + #else<br>
&gt; + #=C2=A0 define STR_C(str)=C2=A0 =C2=A0 =C2=A0 =C2=A0(str)<br>
&gt; +-- <br>
&gt; +2.41.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_=
254.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb" rel=3D"norefer=
rer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; index 5d69cf83abc..ae86450d2a6 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; @@ -1,6 +1,8 @@<br>
&gt;=C2=A0 require systemd.inc<br>
&gt;=C2=A0 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/systemd:&quot;<br>
&gt;=C2=A0 <br>
&gt; +SRC_URI:append:libc-musl =3D &quot; file://0001-efi-Use-char16_t-on-m=
usl.patch &quot;<br>
&gt; +<br>
&gt;=C2=A0 require conf/image-uefi.conf<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS =3D &quot;intltool-native libcap util-linux gperf-native=
 python3-jinja2-native python3-pyelftools-native&quot;<br>
&gt; -- <br>
&gt; 2.41.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#185718): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/185718" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/185718</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10065204=
7/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100652047/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000f64e6506029287a2--

