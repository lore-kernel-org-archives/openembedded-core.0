Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D82C5AD49
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 02:38:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.50274.1749436698077014835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 19:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Oza8OV/A;
 spf=pass (domain: mvista.com, ip: 209.85.208.53, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso6371168a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 19:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749436696; x=1750041496; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRkAi5Ovun7jQyliWMuQLxM9tbdFohpOW5DCsN5Qc4g=;
        b=Oza8OV/ArlKgAI++srmnCiqO8wGmkXeXvG/rSZdZA9hm0bAGwVOzdoabwMvadHGk/Z
         V1UfKCTvD9eJrOAQvu+Y7PaE5aa8gVziwEzgJMoBQHLLALXZOjaBtsmCZ/VtuXO9fVi7
         dAeZO0+1oumc+13NjnwWFzZ1+7EgghwXPhBQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749436696; x=1750041496;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRkAi5Ovun7jQyliWMuQLxM9tbdFohpOW5DCsN5Qc4g=;
        b=DChRvCAqh6WriNAuu65yO24aqeCmBp3xnu+A/gAfMAg8GfNVjf9+nmqLEw5G38Fu4A
         a9h1oip2qYHI1ZpKD1wbs4ufVrTSQCHYo0pn0NDMvUxkQB3PRQwl4SdEAvO9416v7uKj
         Nuw1VEQ04KCPyJGiNP91NYITJIQ9q+UdIqG+FnQZj2GSmWyBL74RWsj1HcD0NYtnV0ix
         qS9fSJ3X6jBoUP9dzurOLEbRa5gXCP3a29ZBNLro41LttA3alYP/pmcN8hI5JUhQLCiT
         MQT0zvus29CLnNCO/oBhZHyCJ5UAn6PGSwwEjo6XmAEj9KhfPLwWJSICsQ1Pp1OBs7bs
         fBcg==
X-Gm-Message-State: AOJu0YwWPxBhCPLbG07Acw1td7ieRS4NbCqhkXQ2NyY6lV8lgMVRVx5M
	vNaw7/1EirXvRiYkRDCROYEI0Zwy5nffJXH3B3UC+Ap3zf9znSgzsRdd3M8bf0gI1DejgQmcDqq
	zfMoFqu/bLtEM551di7VMoHoAVSAbx67e3hp45RfEA9BZKrlEMswp
X-Gm-Gg: ASbGnctBSvjv3PPMNC4rxsZfEIQvVmSdYQZJ0l9OLhTzptEdFhs0/4/xkXhLxWboYPQ
	6XOjech/sZZgdDjF09UBacbcJab7si+T3dgmgCaHMDglV+LNJjdfWBCLtzQ/9jmBFVdcUXDojss
	mbbGkShAKcELpLEmAMeH2mCbo+3uQ3xLc2EA==
X-Google-Smtp-Source: AGHT+IGokrCCXchb42V2YHCPfUVQWHNnh5iu7Foivb4+oYXhK26cceVUQSNoYb7aIB74hfv5dNu5nnCi/SWlBSjgJ2o=
X-Received: by 2002:a17:907:2d92:b0:ad8:9ff4:c047 with SMTP id
 a640c23a62f3a-ade1a922afbmr1012416466b.35.1749436696041; Sun, 08 Jun 2025
 19:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250604053655.96207-1-vanusuri@mvista.com>
In-Reply-To: <20250604053655.96207-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 9 Jun 2025 08:08:03 +0530
X-Gm-Features: AX0GCFumTbuU0bKMMTSmTJjDdxk97wxCCtWJSTQlDkFrNKPs_BidZwry7e7FFAY
Message-ID: <CANQUz18y87HfvcgbAUFb6nRkhP_gxrhAEd9BdMAcFT3qUxde6Q@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] kea: upgrade 2.4.1 -> 2.4.2
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000d3295306371a7836"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218239

--000000000000d3295306371a7836
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Any update on this ?

Thanks & Regards,
Vijay

On Wed, Jun 4, 2025 at 11:07=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Changelog
> https://downloads.isc.org/isc/kea/2.4.2/Kea-2.4.2-ReleaseNotes.txt
>
> License-Update: Update copyright year
>
> Includes security fixes for CVE-2025-32801, CVE-2025-32802 and
> CVE-2025-32803
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-connectivity/kea/{kea_2.4.1.bb =3D> kea_2.4.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/kea/{kea_2.4.1.bb =3D> kea_2.4.2.bb} (9=
4%)
>
> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> b/meta/recipes-connectivity/kea/kea_2.4.2.bb
> similarity index 94%
> rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
> rename to meta/recipes-connectivity/kea/kea_2.4.2.bb
> index fcdb4889d9..6bb7cb9164 100644
> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.4.2.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Kea is the next generation of DHCP softw=
are
> developed by ISC. It
>  HOMEPAGE =3D "http://kea.isc.org"
>  SECTION =3D "connectivity"
>  LICENSE =3D "MPL-2.0"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea061fa0188838072c4248c1318ec=
131"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dee16e7280a6cf2a1487717faf3319=
0dc"
>
>  DEPENDS =3D "boost log4cplus openssl"
>
> @@ -18,7 +18,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar=
.gz
> \
>             file://fix_pid_keactrl.patch \
>
> file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
> +SRC_URI[sha256sum] =3D
> "6e82fb319d3b871c0d39bbd504f2cda0c66fa1262865872985fb4fb91b4eaafc"
>
>  inherit autotools systemd update-rc.d upstream-version-is-even
>
> --
> 2.25.1
>
>

--000000000000d3295306371a7836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Steve,<br><br></div>Any update on this ?=
<br><br></div>Thanks &amp; Regards,<br></div>Vijay</div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Jun 4, 2025 at 11:07=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvista.=
com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Changelog<br>
<a href=3D"https://downloads.isc.org/isc/kea/2.4.2/Kea-2.4.2-ReleaseNotes.t=
xt" rel=3D"noreferrer" target=3D"_blank">https://downloads.isc.org/isc/kea/=
2.4.2/Kea-2.4.2-ReleaseNotes.txt</a><br>
<br>
License-Update: Update copyright year<br>
<br>
Includes security fixes for CVE-2025-32801, CVE-2025-32802 and CVE-2025-328=
03<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/kea/{<a href=3D"http://kea_2.4.1.bb" rel=3D=
"noreferrer" target=3D"_blank">kea_2.4.1.bb</a> =3D&gt; <a href=3D"http://k=
ea_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.2.bb</a>} | 4 ++-=
-<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/kea/{<a href=3D"http://kea_2.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a> =3D&gt; <a href=3D"h=
ttp://kea_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.4.2.bb</a>} =
(94%)<br>
<br>
diff --git a/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a> b/meta/recipes-connec=
tivity/kea/<a href=3D"http://kea_2.4.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">kea_2.4.2.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">kea_2.4.1.bb</a><br>
rename to meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.2.bb" rel=
=3D"noreferrer" target=3D"_blank">kea_2.4.2.bb</a><br>
index fcdb4889d9..6bb7cb9164 100644<br>
--- a/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">kea_2.4.1.bb</a><br>
+++ b/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.4.2.bb" rel=3D"=
noreferrer" target=3D"_blank">kea_2.4.2.bb</a><br>
@@ -3,7 +3,7 @@ DESCRIPTION =3D &quot;Kea is the next generation of DHCP so=
ftware developed by ISC. It<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://kea.isc.org" rel=3D"noreferrer" =
target=3D"_blank">http://kea.isc.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;connectivity&quot;<br>
=C2=A0LICENSE =3D &quot;MPL-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dea061fa0188838072c4248c131=
8ec131&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dee16e7280a6cf2a1487717faf3=
3190dc&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;boost log4cplus openssl&quot;<br>
<br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.isc.org/isc/kea/$=
%7BPV%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.=
isc.org/isc/kea/${PV}/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_pid_keactrl.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-lib-log-logger_un=
ittest_support.cc-do-not-write-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;815c61f5c271caa4a1db31dd656eb50a7f6ea973da369=
0f7c8581408e180131a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6e82fb319d3b871c0d39bbd504f2cda0c66fa12628658=
72985fb4fb91b4eaafc&quot;<br>
<br>
=C2=A0inherit autotools systemd update-rc.d upstream-version-is-even<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000d3295306371a7836--

