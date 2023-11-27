Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF84BC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:42:40 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.104582.1701114159916494529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 11:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0Bv++q8;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b5714439b3so2218595b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 11:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701114159; x=1701718959; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O22OOFXm7ld5usj+J6l/CnJ3hhA1TsgzhSUuDcyFBYI=;
        b=Z0Bv++q87iEdTnP2w+O2VI5ihkq7+bUDPpmGEXczmZxJBtMarWzhFaDjQYO6vpGzAZ
         6oMAKggwFj2DDSUKONLEFRUF0NzkJKbq8ofasRUf/9YeNdTMTZIYkSP9v4TLTNsKXQP9
         StBdI+kZNPhwjOKHsJ0RQ9krZ61k5hKEah3hulfdpf7q9oPJbNgGP4lk7+UjCweUwots
         m6tGbK2BmdvXZs26EM0DSKQK3upNhUPcf+4EZKfES2ie6MFL9B8tAJYH0Uhr6vctqsCS
         /zvPKUrmxIwU1rCrSwdkFnUGclaXxfherRKOIsxIS941gjENvwQBZaYspz+5Y8Ob0JtF
         Wijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114159; x=1701718959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O22OOFXm7ld5usj+J6l/CnJ3hhA1TsgzhSUuDcyFBYI=;
        b=aGAXTw/Q9GYCUe3v/0qyj8TF3zD8XruEZIKWSv/ODRz8gB9shU8ARdx8HJQWZSdmGg
         sfoVqXCQFUE3DglFjsoIJsdj9Y6+LMhx2P49CjGAlH2TLWlegdzKuPgLev3cX8xzHakn
         LaL5ngT7nXb4PhmwftDBhVoS/RoiKaVwZIschNb9AAtzD6MmF5SioxwMlVaf6GSWf2nZ
         oR+ctFG+IcIjh/LFYlHMdXpf2NMOyBL1pypaD6PKrgd6LLqE99H6B1BFuj87Yiz50tAp
         FEqTcSz5j4dkJV/bIkjsjU3cMlnecmVzRyXno3SVEFoOEmtmmo/tvRFm1yXZV8NyP912
         nu5w==
X-Gm-Message-State: AOJu0YxlV8tYvU0F88/LCG9tDT5tNRSo9rLGUuegXhYFlwuHYz3TT8Vm
	MIzWMJBwcUd6djzMqUZ3CLESTIAwnjUP3FrBu4o=
X-Google-Smtp-Source: AGHT+IFK3a1w32JnuODAnPbpdjkiyXmo/cEAWbLxqzC4h9b334nbXVC34TqwSsG5L8KGMreso2H3zD6/g+ECT3MOxhQ=
X-Received: by 2002:a05:6359:2eaa:b0:16b:fb5a:20bb with SMTP id
 rp42-20020a0563592eaa00b0016bfb5a20bbmr6092153rwb.29.1701114158947; Mon, 27
 Nov 2023 11:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20231127193708.427995-1-peter.marko@siemens.com>
In-Reply-To: <20231127193708.427995-1-peter.marko@siemens.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 27 Nov 2023 19:42:28 +0000
Message-ID: <CANPvuRn0h9nyj7DxQT=i-xgepLHm03aYh0TO1VVsKen0rz=ZnA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] cve-update-nvd2-native: remove unused
 variable CVE_DB_UPDATE_RETRIES
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002aa06e060b2781f6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 19:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191320

--0000000000002aa06e060b2781f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Marko via lists.openembedded.org <peter.marko=3D
siemens.com@lists.openembedded.org> escreveu no dia segunda, 27/11/2023
=C3=A0(s) 19:38:

> From: Peter Marko <peter.marko@siemens.com>
>
> This variable is not referenced in oe-core anymore.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 67d76f75dd..64a96a46f0 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -26,9 +26,6 @@ NVDCVE_API_KEY ?=3D ""
>  # Use a negative value to skip the update
>  CVE_DB_UPDATE_INTERVAL ?=3D "86400"
>
> -# Timeout for blocking socket operations, such as the connection attempt=
.
> -CVE_SOCKET_TIMEOUT ?=3D "60"
>

The commit says CVE_DB_UPDATE_RETRIES

Jose


> -
>  CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
>
>  CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191318):
> https://lists.openembedded.org/g/openembedded-core/message/191318
> Mute This Topic: https://lists.openembedded.org/mt/102836497/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002aa06e060b2781f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Peter Marko via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=
=3D"mailto:siemens.com@lists.openembedded.org">siemens.com@lists.openembedd=
ed.org</a>&gt; escreveu no dia segunda, 27/11/2023 =C3=A0(s) 19:38:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<=
a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@sie=
mens.com</a>&gt;<br>
<br>
This variable is not referenced in oe-core anymore.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> | 3 ---<b=
r>
=C2=A01 file changed, 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> b/=
meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
index 67d76f75dd..64a96a46f0 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -26,9 +26,6 @@ NVDCVE_API_KEY ?=3D &quot;&quot;<br>
=C2=A0# Use a negative value to skip the update<br>
=C2=A0CVE_DB_UPDATE_INTERVAL ?=3D &quot;86400&quot;<br>
<br>
-# Timeout for blocking socket operations, such as the connection attempt.<=
br>
-CVE_SOCKET_TIMEOUT ?=3D &quot;60&quot;<br></blockquote><div><br>The commit=
 says=C2=A0CVE_DB_UPDATE_RETRIES<br><br>Jose<br>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
-<br>
=C2=A0CVE_DB_TEMP_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db&quot=
;<br>
<br>
=C2=A0CVE_CHECK_DB_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/nvdcve_2.db&quot;<br=
>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191318): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/191318" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/191318</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102836497/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102836497/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000002aa06e060b2781f6--

