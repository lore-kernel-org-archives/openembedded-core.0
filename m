Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17893.1794922080860131831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 05:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Z9XDZEiK;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: bastien.jauny@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so21301945e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 05:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794922079; x=1795526879; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VGRuSGnVEHEzVwaINtkZ/2/bNVV6zeGSkAdEXuD0Nn8=;
        b=Z9XDZEiKCz3w+uMakhA885nML3L222WwqQy5a1RotooSpnYtIUKxw1qHEJ649B+br1
         tZCV6TI2gxaMKIAX6aP6zRVB9ySMMgCYe+tN/iVxwT1BC3f+J3GMbWXA0be9bh6NGley
         gQaHDDKJjTvGiy3ebdhuHm4+vpjVwj36HvB9nhwqHmlHPErPlkvSuilODokfjUKXOAPm
         tCdeGLHNPLKQBlp0rCDEksYnXnWNJF/WeDtnmEfD1RthoBsMFSw50VxjXEb8k3xss83m
         t61CQkzKrnn9SBAGhjSec1vgZreyl1cVLy85Tkdlg9nntPcVByFcFJ1j28adEJRNi0y9
         eE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922079; x=1795526879;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGRuSGnVEHEzVwaINtkZ/2/bNVV6zeGSkAdEXuD0Nn8=;
        b=2IwVzity98g1hf3nHY1CCEw9sockEyclvUrLuhmvogmBIIxivKER95LkblLuSveO21
         pZsgPQhj/CX3AOKrPdoOqHwPOPxR6OJL9Qv0ffnlsnqleWhOrXLN2ek4dBNPyGm0LVb2
         oOVdFwY++4rsmbBIp7F8jVSIl60m+z1UitlXJ4s3ggzl7IlpCdQRUHwsehiAP6ZCVZCX
         KJos7EeL6LR3vPrrr+RA9/s0RPNTiLE9t/wbVA4HIgXotVBvDQ2SmzpQT2HAT9oRoiDh
         OGrdhqnvIzFjrnb9OqjY/6xVFnsnssLEcZu6YHhFM9XoIkKq3UnqZwhi7ZdtovRmckI5
         N56g==
X-Forwarded-Encrypted: i=1; AL+hErF5Ex7qBJRMwk1APmC2aRDuERLh8tLXhVgCgqIjWoafK1eP2oC6sa1+UZJlosEcOAzdKRB8uGRNMx1ZCCQMErwouw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8mF2PH1ISqmTpzuOaDN5j1mkcV5c2xgGwwHZ8cpftj6cBuCWmn
	1o1PyYzCFOQB3LMv3hzDU1M7PbZ878r5Z/57JCNdjD4N0TQm5LUblGwW1KoG7iDPCyk=
X-Gm-Gg: AYBFou3vpJUNu1T0H0aFe6W0LuJW9xNwjdQq/ennIacUVey4zQ+omIpi9QVpkcRWJo6
	H6+jvIJ2sGA9NAyD5WDTWBKY3iie6wd8IYa0+szQpQ1Cx/qdFjBSwAhkPRzoVnVGgpcst2W1AHP
	8KYutp/VNe6fvjxaiP/0UKgTO5rhszA4nO3TjFnYQod9A1zlXfqq3fWTpx1JWEj/IAsbjh6Bps3
	7vloWeUlNbPikf3Xuq+VF/OwFjLKBvaWdHzDzeYEZ/jEt0BMX9juryXra/0tBlrcBd5HNay93B0
	GAyd6wrhT4+fYDUmOw3U2KTZXn8NpivvmK4HuaSgEqAuoIKY7Ttc1F4OiQEyiyXnEWA7pQfawCc
	dCpk39JgAC3uuvrRQgyJm3eBFu8VGmM4iL+ZRJzzro42dfr0XC5m8ZIWIWdJH/VmZw+mkvI7ZKN
	dNr9SEHNXeJTq+nasCjsHEPHqJThwp0D9XsYlzbjjPyhOU8SlQrrO2/uhT1isVNav/imIDAvEzS
	V/kjGq8QJlBjRA3oVhfdA7dtdnROFLaAMBv8leMDgFomJlIlkIAIiUuqVDAearbU0wbgENkeG4c
	EQMfQGih/fRvCdDUTWyoPZRZZ8BTwWWDurltVb1NRwT+iL6561B6iU+xCVoWk4cHMI+fHqBOQWL
	yI2dCo1pAcv8W9A==
X-Received: by 2002:a05:600c:1daa:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb55a481ccmr282058175e9.14.1794922078924;
        Tue, 17 Nov 2026 05:27:58 -0800 (PST)
Return-Path: <bastien.jauny@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm68359455e9.7.2026.11.17.05.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:27:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:27:57 +0100
Message-Id: <DMXIRUZU28LY.2A6PPP8QQM7GF@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [scarthgap][PATCH] expat: fix CVE-2026-118370
From: "Bastien Jauny" <bastien.jauny@smile.fr>
To: <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0-38-g09b49b623995
References: <20261104135656.1546935-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261104135656.1546935-1-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250451

On Wed Nov 4, 2026 at 2:56 PM CET, Joao Marcos Costa via openembedded-core =
wrote:
> From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>
>
> This vulnerability, marked as High [1], was fixed upstream [2] since
> 2.10.0.
>
> Backport the fix to expat v2.8.3.
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-118370
> [2] https://github.com/libexpat/libexpat/pull/1450
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
> ---
>  .../expat/expat/CVE-2026-118370-01.patch      | 58 +++++++++++++++++++
>  .../expat/expat/CVE-2026-118370-02.patch      | 29 ++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |  2 +
>  3 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-01.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-02.patc=
h
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370-01.patch b/met=
a/recipes-core/expat/expat/CVE-2026-118370-01.patch
> new file mode 100644
> index 0000000000..aa4fe2df28
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-118370-01.patch
> @@ -0,0 +1,58 @@
> +From a135244f77776c56d825cd81efd8f98abe014841 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 27 Oct 2026 15:20:33 +0100
> +Subject: [PATCH] lib: Protect `attIndex` in `storeAtts` from signed inte=
ger
> + overflow
> +
> +.. by migrating to `size_t`
> +
> +CVE: CVE-2026-118370
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/145=
0]
> +
> +Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> +---
> + lib/xmlparse.c | 15 ++++++++++-----
> + 1 file changed, 10 insertions(+), 5 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index cb8839be..dadf647a 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3858,7 +3858,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, =
const char *attStr,
> +           TAG_NAME *tagNamePtr, BINDING **bindingsPtr,
> +           enum XML_Account account) {
> +   DTD *const dtd =3D parser->m_dtd; /* save one level of indirection */
> +-  int attIndex =3D 0;
> ++  size_t attIndex =3D 0;
> +   XML_Char *uri;
> +   int nPrefixes =3D 0;
> +   BINDING *binding;
> +@@ -4037,11 +4037,16 @@ storeAtts(XML_Parser parser, const ENCODING *enc=
, const char *attStr,
> +   }
> +=20
> +   /* set-up for XML_GetSpecifiedAttributeCount and XML_GetIdAttributeIn=
dex */
> +-  parser->m_nSpecifiedAtts =3D attIndex;
> ++  // Detect and reject integer overflow
> ++  if (attIndex > INT_MAX)
> ++    return XML_ERROR_NO_MEMORY;
> ++  parser->m_nSpecifiedAtts =3D (int)attIndex;
> +   if (elementType->idAtt && (elementType->idAtt->name)[-1]) {
> +-    for (int i =3D 0; i < attIndex; i +=3D 2)
> ++    for (size_t i =3D 0; i < attIndex; i +=3D 2)
> +       if (appAtts[i] =3D=3D elementType->idAtt->name) {
> +-        parser->m_idAttIndex =3D i;
> ++        if (i > INT_MAX)
> ++          return XML_ERROR_NO_MEMORY;
> ++        parser->m_idAttIndex =3D (int)i;
> +         break;
> +       }
> +   } else
> +@@ -4074,7 +4079,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, =
const char *attStr,
> +=20
> +   /* expand prefixed attribute names, check for duplicates,
> +      and clear flags that say whether attributes were specified */
> +-  int i =3D 0;
> ++  size_t i =3D 0;
> +   if (nPrefixes) {
> +     unsigned int j; /* hash table index */
> +     unsigned long version =3D parser->m_nsAttsVersion;
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370-02.patch b/met=
a/recipes-core/expat/expat/CVE-2026-118370-02.patch
> new file mode 100644
> index 0000000000..1d8d1d4907
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-118370-02.patch
> @@ -0,0 +1,29 @@
> +From d39404514bc51901b1e673b88bf5ec5bc6bf657a Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 27 Oct 2026 17:57:19 +0100
> +Subject: [PATCH] lib: Protect `nPrefixes` in `storeAtts` from signed int=
eger
> + overflow
> +
> +.. by migrating to `size_t`
> +
> +CVE: CVE-2026-118370
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/145=
0]
> +
> +Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> +---
> + lib/xmlparse.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index dadf647a..e248043e 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3860,7 +3860,7 @@ storeAtts(XML_Parser parser, const ENCODING *enc, =
const char *attStr,
> +   DTD *const dtd =3D parser->m_dtd; /* save one level of indirection */
> +   size_t attIndex =3D 0;
> +   XML_Char *uri;
> +-  int nPrefixes =3D 0;
> ++  size_t nPrefixes =3D 0;
> +   BINDING *binding;
> +   const XML_Char *localPart;
> +=20
> diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/e=
xpat/expat_2.8.3.bb
> index 6d08a3fd94..ff46beae8c 100644
> --- a/meta/recipes-core/expat/expat_2.8.3.bb
> +++ b/meta/recipes-core/expat/expat_2.8.3.bb
> @@ -18,6 +18,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
>             file://CVE-2026-76957-02.patch \
>             file://CVE-2026-93990-01.patch \
>             file://CVE-2026-93990-02.patch \
> +           file://CVE-2026-118370-01.patch \
> +           file://CVE-2026-118370-02.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"

Hi, I'm helping Yoann with the scarthgap reviews.

This commit has been submitted for wrynose but is still missing for
blacksail, so we can't integrate it right now.

Could you submit it to blacksail?

Thanks,
--=20
Bastien Jauny
Smile

