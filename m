Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2163C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 11:36:18 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web10.19956.1742988973233260827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 04:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QroanB/Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5240764f7c1so2631251e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742988972; x=1743593772; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lX5I9NP3E8gf5/teSPWEPo8VqDoo64uQVLaYSU5/JRA=;
        b=QroanB/Y5ZTvAd9IMYJq7bFYmMEWA45PwWc1WErdlwfYgLjGDEEw2Ksie6Tdh+f9IT
         nHEjG4y+Z6qtGksLEz1klSFcO5NFm4iH1hFZWPrAoe34ZSQfPXyCV97wX7F7j7CcFruN
         9Xeufv0KsWiijmktvuQn/GM6Zsg8lP7rhgKOBfgk6yuJ9X9962bAuvnGj/MER7Rv7GEH
         XG46yJkOJuP9SPcss0datSEIKgjDAKjB94vGfS5UEQKX9FgUK9YLamMf6qon9CIogjwV
         MPqRxGc5dKbxxYQ/50CS3xN8k/ZTDktUBdd+zI0Txx4x1AMYzrFuxWPjkcoBH3dxAcG9
         Esnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742988972; x=1743593772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lX5I9NP3E8gf5/teSPWEPo8VqDoo64uQVLaYSU5/JRA=;
        b=Ohx2r6R9xZl8+TznRnCAKwp65tkb+4FUHp+XvslVhf0tut2mKkOtbcWYqGQa5pofz6
         1wbk0P7kp3ioNKenDnl6vODQu+phvXGJxHPV9VyUyyW01oqpk5kEjW5aFJf+AUnnlK6v
         +YJbcMEXlYqOD0eSsuynPwZdBeoG3AQkMdr3tVAX4DQLhWZ5RzKKlEGo4tH/oAYlP6bc
         tUcXeSMkWL3OieQ5a4DD9OvyT1TKP4HQ6w0I1ep84OztqW1KWPrNzChx2MGniuhpSngS
         dlI34NQ05+LfDtcYJdRFr8jDqZY2c5R7y0P0MlJ+tuDxmaYehRRv+p/Rjh6m/ktPe/4L
         T0xg==
X-Forwarded-Encrypted: i=1; AJvYcCUbPYoiS9oN+looUoO/pfwtWHEO4agF+yhE4mVsc1kwOMauAJ1uWOm/n++Lrgu4TE/M0s0gKdHxX7U861dDlE+beQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx32CGgfmjDqafeeYk3u6RRD6vSBx6kxMtH+iuCuP42qMmvaEPG
	m6p4ucKXAaSafPm+YCVtE3fvBVQ48esEzYFiO+jazCrA30LMaAtwycaiv8U/rg247SJmT7MmpQ5
	2jmUZN+o5R+xWE+b1KXh9lpy5xW8=
X-Gm-Gg: ASbGncsHAvmHVxk1yaFfAqwf4uxbUimQ8v03ALL2jz0ASrLoNSu7w+ba0WFRPqPrh6f
	11NqPcrvkJ+GJGt7CIlooGrNFOBGsELYT6laQGK5zBEWL99GFubo+ZL/JjYhvpFPVRocYse02Sv
	WXfCwrHzyiJ8BHR3zrZYYx9cPY8eQ=
X-Google-Smtp-Source: AGHT+IHq5Xy5JV8K9W2HgxtAH0kpsBDWDFZT5BLwiT6403IDRzcsC0cv1I0X7c5eFFEyl/Z5q2rBER0plEpZVuYlr34=
X-Received: by 2002:a05:6122:6083:b0:518:791a:3462 with SMTP id
 71dfb90a1353d-525a852a429mr14840953e0c.9.1742988971796; Wed, 26 Mar 2025
 04:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250326063647.1941-1-leimaohui@fujitsu.com> <20250326063647.1941-6-leimaohui@fujitsu.com>
In-Reply-To: <20250326063647.1941-6-leimaohui@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Mar 2025 11:36:01 +0000
X-Gm-Features: AQ5f1Jr6i7nhAU7WezPd8TrzLi0F1J0-yhuNdhYndAJPd1TnNeC9UqhXSVtF9oY
Message-ID: <CANPvuRmESxURWti-HzcQAUpJYSOxm-2bBXzrFgoFOeF438mVrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/7] gstreamer1.0-plugins-{ugly,base,good}:
 upgrade 1.24.12 -> 1.26.0
To: leimaohui@fujitsu.com
Cc: Anuj Mittal <anuj.mittal@intel.com>, openembedded-core@lists.openembedded.org, 
	Lei Maohui <leihaohui@fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000082efd006313d3e3b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 11:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213645

--00000000000082efd006313d3e3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lei,

This is a major bump and is a bit strange that there are no new
packageconfig knobs and also some other deprecation.
Have you checked the meson opinions changes?

Jose

leimaohui via lists.openembedded.org <leimaohui=3D
fujitsu.com@lists.openembedded.org> escreveu (quarta, 26/03/2025 =C3=A0(s)
06:37):

> From: Lei Maohui <leihaohui@fujitsu.com>
>
> Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
> ---
>  ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++--
>  .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 2 +-
>  .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 2 +-
>  ...ns-base_1.24.12.bb =3D> gstreamer1.0-plugins-base_1.26.0.bb} | 2 +-
>  ...ns-good_1.24.12.bb =3D> gstreamer1.0-plugins-good_1.26.0.bb} | 2 +-
>  ...ns-ugly_1.24.12.bb =3D> gstreamer1.0-plugins-ugly_1.26.0.bb} | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.24.12.bb =3D>
> gstreamer1.0-plugins-base_1.26.0.bb} (98%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-good_1.24.12.bb =3D>
> gstreamer1.0-plugins-good_1.26.0.bb} (97%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.24.12.bb =3D>
> gstreamer1.0-plugins-ugly_1.26.0.bb} (94%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> index e35ec026e4..7373bd3e26 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> @@ -1,4 +1,4 @@
> -From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001
> +From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
>  From: zhouming <b42586@freescale.com>
>  Date: Wed, 14 May 2014 10:16:20 +0800
>  Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
> @@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
>  diff --git a/gst-libs/gst/tag/gsttagdemux.c
> b/gst-libs/gst/tag/gsttagdemux.c
>  old mode 100644
>  new mode 100755
> -index ef0ff90..53f05c8
> +index 975fe83..df82840
>  --- a/gst-libs/gst/tag/gsttagdemux.c
>  +++ b/gst-libs/gst/tag/gsttagdemux.c
>  @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject =
*
> parent, GstQuery * query)
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> index 810a4ba676..fc9ad474d9 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> @@ -1,4 +1,4 @@
> -From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001
> +From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
>  From: Mingke Wang <mingke.wang@freescale.com>
>  Date: Thu, 19 Mar 2015 14:17:10 +0800
>  Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> index 8fa46d809a..06b5bc41ed 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> @@ -1,4 +1,4 @@
> -From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001
> +From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
>  From: Carlos Rafael Giani <crg7475@mailbox.org>
>  Date: Tue, 21 May 2019 14:01:11 +0200
>  Subject: [PATCH] viv-fb: Make sure config.h is included
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> similarity index 98%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> index f4505d831e..bd0131c647 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
>             file://0003-viv-fb-Make-sure-config.h-is-included.patch \
>             file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
> +SRC_URI[sha256sum] =3D
> "e23189fbed2ec486690382d1055c19eeaf5aae3e95e2576fc4c884d96a90e69e"
>
>  S =3D "${WORKDIR}/gst-plugins-base-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> index 9cc2d462f6..a2c6426c34 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> @@ -6,7 +6,7 @@ BUGTRACKER =3D "
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
>
>  SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-$=
{PV}.tar.xz
> "
>
> -SRC_URI[sha256sum] =3D
> "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
> +SRC_URI[sha256sum] =3D
> "9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83f60e8d3adb1e2eaf03b"
>
>  S =3D "${WORKDIR}/gst-plugins-good-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> similarity index 94%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> index 75f528216f..f0e42ad8fb 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D " \
>
> https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$=
{PV}.tar.xz
> \
>              "
>
> -SRC_URI[sha256sum] =3D
> "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
> +SRC_URI[sha256sum] =3D
> "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
>
>  S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213636):
> https://lists.openembedded.org/g/openembedded-core/message/213636
> Mute This Topic: https://lists.openembedded.org/mt/111912609/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000082efd006313d3e3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Lei,<br><br>This is a major bump and is a bit stra=
nge=C2=A0that there are no new packageconfig knobs and also some other depr=
ecation.</div><div>Have you checked=C2=A0the meson opinions changes?</div><=
div><br></div>Jose<br><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">leimaohui via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;leimaohui=3D<a href=3D"ma=
ilto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org=
</a>&gt; escreveu (quarta, 26/03/2025 =C3=A0(s) 06:37):<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">From: Lei Maohui &lt;<a href=3D"mai=
lto:leihaohui@fujitsu.com" target=3D"_blank">leihaohui@fujitsu.com</a>&gt;<=
br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leihaohui@fujitsu.com" targ=
et=3D"_blank">leihaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++-=
-<br>
=C2=A0.../0002-ssaparse-enhance-SSA-text-lines-parsing.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../0003-viv-fb-Make-sure-config.h-is-included.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0...<a href=3D"http://ns-base_1.24.12.bb" rel=3D"noreferrer" target=3D=
"_blank">ns-base_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plug=
ins-base_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-base_1.26.0.bb</a>} | 2 +-<br>
=C2=A0...<a href=3D"http://ns-good_1.24.12.bb" rel=3D"noreferrer" target=3D=
"_blank">ns-good_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plug=
ins-good_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-good_1.26.0.bb</a>} | 2 +-<br>
=C2=A0...<a href=3D"http://ns-ugly_1.24.12.bb" rel=3D"noreferrer" target=3D=
"_blank">ns-ugly_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-ugly_1.26.0.bb</a>} | 2 +-<br>
=C2=A06 files changed, 7 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-base_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer=
1.0-plugins-base_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plug=
ins-base_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-base_1.26.0.bb</a>} (98%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-good_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer=
1.0-plugins-good_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plug=
ins-good_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-good_1.26.0.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer=
1.0-plugins-ugly_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-ugly_1.26.0.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
01-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-=
multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-f=
rom-src-pad-when-query-caps.patch<br>
index e35ec026e4..7373bd3e26 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch<br>
@@ -1,4 +1,4 @@<br>
-From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001<br>
+From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: zhouming &lt;<a href=3D"mailto:b42586@freescale.com" target=3D"=
_blank">b42586@freescale.com</a>&gt;<br>
=C2=A0Date: Wed, 14 May 2014 10:16:20 +0800<br>
=C2=A0Subject: [PATCH] ENGR00312515: get caps from src pad when query caps<=
br>
@@ -16,7 +16,7 @@ Signed-off-by: zhouming &lt;<a href=3D"mailto:b42586@free=
scale.com" target=3D"_blank">b42586@freescale.com</a>&gt;<br>
=C2=A0diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttag=
demux.c<br>
=C2=A0old mode 100644<br>
=C2=A0new mode 100755<br>
-index ef0ff90..53f05c8<br>
+index 975fe83..df82840<br>
=C2=A0--- a/gst-libs/gst/tag/gsttagdemux.c<br>
=C2=A0+++ b/gst-libs/gst/tag/gsttagdemux.c<br>
=C2=A0@@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObje=
ct * parent, GstQuery * query)<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
02-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-pa=
rsing.patch<br>
index 810a4ba676..fc9ad474d9 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001<br>
+From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mingke Wang &lt;<a href=3D"mailto:mingke.wang@freescale.com" ta=
rget=3D"_blank">mingke.wang@freescale.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Mar 2015 14:17:10 +0800<br>
=C2=A0Subject: [PATCH] ssaparse: enhance SSA text lines parsing.<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
03-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-include=
d.patch<br>
index 8fa46d809a..06b5bc41ed 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch<br>
@@ -1,4 +1,4 @@<br>
-From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001<br>
+From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org" =
target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
=C2=A0Date: Tue, 21 May 2019 14:01:11 +0200<br>
=C2=A0Subject: [PATCH] viv-fb: Make sure config.h is included<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-base_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-base_1.24.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=
=3D"http://gstreamer1.0-plugins-base_1.26.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0-plugins-base_1.26.0.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-base_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-base_1.24.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-base_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-base_1.26.0.bb</a><br>
index f4505d831e..bd0131c647 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-base_1.24.12.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-base_1.26.0.bb</a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gst-plugins-base/gst-plugins-ba" rel=3D"noreferrer" target=3D"_bl=
ank">https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-viv-fb-Make-sure-conf=
ig.h-is-included.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ssaparse-enhance-SSA-=
text-lines-parsing.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;f6efbaa8fea8d00bc380bccca76a530527b1f083e8523=
eafb3e9b1e18bc653d3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e23189fbed2ec486690382d1055c19eeaf5aae3e95e25=
76fc4c884d96a90e69e&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-base-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-good_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-good_1.24.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=
=3D"http://gstreamer1.0-plugins-good_1.26.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0-plugins-good_1.26.0.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-good_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-good_1.24.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-good_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-good_1.26.0.bb</a><br>
index 9cc2d462f6..a2c6426c34 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-good_1.24.12.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-good_1.26.0.bb</a><br>
@@ -6,7 +6,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedesktop.=
org/gstreamer/gst-plugins-good/-/issues" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues</a><b=
r>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/gs=
t-plugins-good/gst-plugins-good-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plug=
ins-good-${PV}.tar.xz</a>&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c=
51bf0233b39e0489a64&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83=
f60e8d3adb1e2eaf03b&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-good-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-ugly_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-ugly_1.24.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=
=3D"http://gstreamer1.0-plugins-ugly_1.26.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0-plugins-ugly_1.26.0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-ugly_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-ugly_1.24.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-ugly_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-p=
lugins-ugly_1.26.0.bb</a><br>
index 75f528216f..f0e42ad8fb 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-ugly_1.24.12.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-ugly_1.26.0.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gstreame=
r.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$%7BPV%7D.tar.xz" r=
el=3D"noreferrer" target=3D"_blank">https://gstreamer.freedesktop.org/src/g=
st-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a=
9fac0b7a16543eee78b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a86b51c8454a813120848c803421f327d8c07aabcae46=
1e0597cc49398c0fcde&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-ugly-${PV}&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#213636): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/213636" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/213636</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111912609/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111912609/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000082efd006313d3e3b--

