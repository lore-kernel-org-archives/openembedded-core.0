Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2299DCFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 06:01:06 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10144.1763964060364283995
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 22:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JpOsrTTL;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-640e065991dso3375931d50.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 22:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763964059; x=1764568859; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf63PAyL1G7vry0VniKn96u349rYdcqE7m53mgf6G8w=;
        b=JpOsrTTLxXPFSYQ4QiHMHLPPc9eHlBlR57z8leW9lqIirucQ7ntmiBY1Rtuft4jQSd
         ndtS5oGSQ4oJMnBGQ8Wi59k6CPqLwHY5UQnOdmRxZQsQFroyhoJIgSW56EUSM3VqG7Py
         Qrl2fxBvHW+berZPYEZ/Tk7pt7xYjqxv39ChEJo5QOeYyXcou1k1lCtYMl2EuyDjQp8G
         SuSXKqrL8o7fDF2opmRPKbHADsEq6URgmnsL4GMKAC54SHMEPdbLh0RNhZyd/3YozIq4
         i3Jg68E8JBlkWqwY84yfSKhGtIk+vYLy4be3gdW4ZOzi/dUwKWEhhodhc8af4vJpOctG
         F4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763964059; x=1764568859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf63PAyL1G7vry0VniKn96u349rYdcqE7m53mgf6G8w=;
        b=DeXnWdAkyAc85Tbvq0rpEbbZVC+UDQxpYhGt7pfayb+MoMAg+fZjfmREAFtsy8dpXy
         sScTw/rXZbazNrHDrXf/bKuN9vjowPn9cEpPlPpAKRMM/QObSMnVUZLN5pl29qDxiHNM
         lABjTXZHd6vLFNwkHRgv5KZFxw69vRRdOGTNxZIcLwE2oYhaVaOe8xQ2Y0s2vtAWOqSg
         asH5FBtE/VndbteuJqYM4YV/KIXO9eG7dKesturQIx4pGZFujYhm1+uASmN6E1FoTLDf
         NnDVB4woXzSl05+DZc+JolFrj1btJP0yvTbb2WrQDBoa6jMtIUvNKpZEyC9B7EjbTQ5+
         cMEA==
X-Gm-Message-State: AOJu0YyvFb1rB28GVv8PFQ1tNN+RhCUIx4xsfaOU8hfTCDQYy65UKGDP
	sW10I88Ghdm3vKAYpKZOs9BHgkO3Oh3f9USNvnvWCYsHS8W0ZbLWtN5z1PYmjVOZC1jJG/s+Cw5
	zOfKhjLdRKfKyu5a4V1+hw6n+kZsoxGtI+2+B
X-Gm-Gg: ASbGncs2irhSMELAUUNJjIDyqLKkK6ktcY+EfKhIgxmowI9ElsV/9FNlJ1OANm0pESw
	n7OLXgcFNw1a7MEIvpAxQeTCcaY4zRbX9f/EbNudBy9yNWH/u4ymjjxlfrEkpF35hAq6xOQ+FUa
	eamzWColjb2rLmIaHWtuzuiDCpjRtuZT6ughhOlRCN2r8qwlaNy3QhOAzUx5LywByOXYxy9ERN3
	bNUoaARnltLIUDsA8awH+r17VGmOiKZQtUSJvoZ1a3TxfuGb63fb0WPOdWekSfYExUV3b6kTdbt
	IOBDoP847C+tfn7t8iBcNtd/yGWUBsuc1diX3LyuS9APgZi1TliZuwTH3ogvF47TSQbULPY2QqD
	4ldrYT0opX1S6sNKEzak13zWP3cw=
X-Google-Smtp-Source: AGHT+IHgaGoDxuu7J7CXoMf0ALDwSbWWzPO7tt5FonYRJ887P6m7XimOMSdpud0IucoJFoVDko1b5Cy4wnSuLHqgTkE=
X-Received: by 2002:a53:accc:0:10b0:640:d038:faf9 with SMTP id
 956f58d0204a3-64302a4857dmr6436937d50.25.1763964059456; Sun, 23 Nov 2025
 22:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20251124055533.857103-1-Moritz.Haase@bmw.de>
In-Reply-To: <20251124055533.857103-1-Moritz.Haase@bmw.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Nov 2025 22:00:33 -0800
X-Gm-Features: AWmQ_bl8kZqdgEPijIH6OX_U80UWRogowT1qGcG7ccvRKGcnoRz2Px9tvtqNYCo
Message-ID: <CAMKF1spga_gW1G7i1W_oT9fpFtRhL7=XnWZzrufALQ9LwTVCDA@mail.gmail.com>
Subject: Re: [PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected
To: Moritz Haase <Moritz.Haase@bmw.de>
Cc: openembedded-core@lists.openembedded.org, changqing.li@windriver.com
Content-Type: multipart/alternative; boundary="0000000000002918f8064450e3a6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 06:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226735

--0000000000002918f8064450e3a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 9:55=E2=80=AFPM Moritz Haase <Moritz.Haase@bmw.de> =
wrote:

> Due to what looks like a copy'n'paste mistake, the environment setup scri=
pt
> might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
> untouched. Fix that.
>
> CC: changqing.li@windriver.com
> CC: raj.khem@gmail.com
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
>  meta/recipes-support/curl/curl/environment.d-curl.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh
> b/meta/recipes-support/curl/curl/environment.d-curl.sh
> index 581108ef35..b948db2cf6 100644
> --- a/meta/recipes-support/curl/curl/environment.d-curl.sh
> +++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
> @@ -1,6 +1,6 @@
>  # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected
> host cert, then cert in buildtools
> -# CAFILE/CAPATH is auto-deteced when source buildtools
> -if [ -z "${CURL_CA_PATH:-}" ]; then
> +# CAFILE/CAPATH is auto-detected when source buildtools
> +if [ -z "${CURL_CA_BUNDLE:-}" ]; then
>

Looks good.


>         if [ -n "${CAFILE:-}" ];then
>                 export CURL_CA_BUNDLE=3D"$CAFILE"
>         elif [ -e
> "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
>

--0000000000002918f8064450e3a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, No=
v 23, 2025 at 9:55=E2=80=AFPM Moritz Haase &lt;<a href=3D"mailto:Moritz.Haa=
se@bmw.de" target=3D"_blank">Moritz.Haase@bmw.de</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Due to what looks like a co=
py&#39;n&#39;paste mistake, the environment setup script<br>
might override &#39;CURL_CA_BUNDLE&#39; from the host env instead of leavin=
g it<br>
untouched. Fix that.<br>
<br>
CC: <a href=3D"mailto:changqing.li@windriver.com" target=3D"_blank">changqi=
ng.li@windriver.com</a><br>
CC: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a><br>
Signed-off-by: Moritz Haase &lt;<a href=3D"mailto:Moritz.Haase@bmw.de" targ=
et=3D"_blank">Moritz.Haase@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.s=
h" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a> | 4 ++--<=
br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/curl/curl/<a href=3D"http://environment.d=
-curl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a> b/=
meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.sh" rel=
=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a><br>
index 581108ef35..b948db2cf6 100644<br>
--- a/meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.s=
h" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a><br>
+++ b/meta/recipes-support/curl/curl/<a href=3D"http://environment.d-curl.s=
h" rel=3D"noreferrer" target=3D"_blank">environment.d-curl.sh</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0# Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detec=
ted host cert, then cert in buildtools<br>
-# CAFILE/CAPATH is auto-deteced when source buildtools<br>
-if [ -z &quot;${CURL_CA_PATH:-}&quot; ]; then<br>
+# CAFILE/CAPATH is auto-detected when source buildtools<br>
+if [ -z &quot;${CURL_CA_BUNDLE:-}&quot; ]; then<br></blockquote><div><br><=
/div><div>Looks good.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${CAFILE:-}&quot; ];then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CURL_CA_BUND=
LE=3D&quot;$CAFILE&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -e &quot;${OECORE_NATIVE_SYSROOT}/etc/ss=
l/certs/ca-certificates.crt&quot; ];then<br>
</blockquote></div>
</div>

--0000000000002918f8064450e3a6--

