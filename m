Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52189.1795433633497880045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=h+/dmVR8;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1695251f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795433632; x=1796038432; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UFy1gt1F2/n/5lFLVg9BFB7Voj0eXamdj5+Yp67XJy8=;
        b=h+/dmVR8VZ+Ys58lCzrLUrlolfMZRt+ipVU2GlyhAexStiS7WWuNsovaPfTQ8R+k8R
         WxDPC/rjlv6phr5DswsxMj9j0KdnaH6u1JClOum9HCzK2Zu9nPbbYzGoW+h7LrrBYK0w
         NlIeJFRv1QQpqUUi1EU2UhN59l/Hu2zJY/XhdYUKxqe8fR90C4lQpXvggDWmR5z5F4Yx
         tO6weDKQ2ykqztkFUGBT2umWiijLBRSRLC82mjkjsPAk55azSQz43Bi6wwrr0Sn9tPYA
         rS841KvlfxalQObgOlx3wvu39LJ/N5T/ow1eK+yGq1fwjD/+l/8M5raauBKkSkv7twgd
         tzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433632; x=1796038432;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFy1gt1F2/n/5lFLVg9BFB7Voj0eXamdj5+Yp67XJy8=;
        b=lkNJBER4Xg6z/h7plcHST6Fob4zSUCLpkK3KWwV/YKkBz0Wyui0+TCDSNNa8XTW58B
         7KkAX2vhgkkSLXFsUN1b1nOZoBz9MttKv3tIvEdXM9HlfOz5WZMCyyOdjkjDrf29iQDw
         dR4Rk9MQvgDXLncP5H2QfBwd31BLDuf03t2MasxegEq+ksKnpLFmvAp2tynmw1k11jTC
         kq5MLxf/t5KdloL29PMGF2myxGqHB0wArMwOvJ4x2dIeXXzV1Urxl2S/cPyUG52xqrdc
         7sPWIYNRUYxJAGYmRDiLL//E5O7h4DX6hxgIJTNrsoNP710inUWR3aWfFAm4WLwLmNMo
         Zf/Q==
X-Forwarded-Encrypted: i=1; AL+hErHQZ8laOJbFS93+JCoiOrcQt/tpnOCkIqLhiaoPGRuPp6eD1SXr7l51bGTvudnbKnBK8ldAfAJLzpOyrCeb3bv/8w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+S20tJW2ZstQkOMS/t3cwBkfr0FjZLjiLcvxFPz5qaXjXOQslr
	IuDJjPYNtI10QtgmNJRSA2RYxFjY5eVGc2xuyBNtwYyqqY/Cl1NCZbSH8EGPPxmfQMS2rGkHsyU
	HetBEKoU=
X-Gm-Gg: AZFdTZcgB5whSWECmv8MS39FQ+OQ3d/hz+pQUz82hC/Cy0NG0NN6jCNfzrOjiKEWB8F
	qNowgf1iFj/HFYbNtFQm9t5nVQdEcv0w2fww8iSo+51RX0zgGO6m9P5ZpQV7yKG2m7Uj6tFbgKD
	95oNnfjbu2uHGiTOAFhQQi22uEQpUGSwhnnUr7LGHtV+YRA3ds3YXg13moBToKoHWPH8BO8rIzL
	9l8wjXRDJPEZAKHlEihQ9/Fb19eh6TYWjIqVNxjRMict+17g65FSqCoafswUB2F+Q3maXcLzupJ
	/rKMiGl1qCeE4amnMysxO2lD4hLnz70WVpyZyjIVC5jyb6ihfU+3w7K47yziqQmMFC17JUJKLZ7
	zfNq+wvHhkyQFCRAcMNmOwfXKXAKxBQlOHSDHaT2S5iCtH8fxZIKUKlkKexggDbC0FFIo1BUq96
	NtPfglKFMXVbFneXJ7c9OtbNQ8IiAgHEDJC8WMHc1/Jk/OnBEMbzcxhvc9UK3Gzp1BN0jt5ePcL
	XJTu6ewPQ0PEH2ian7Wp7Z00HWFIkw0LPNSHi0uImjMlakuWtubQYHFpVszX+6YEE+4hCIHqRfV
	qOeju0kZQbuM9DtSuXHRT+Naw2dIkSLU0qGgY69MRPeSv7uN/HOwddb3qSdFTEoKr8B/t7TkWIv
	qiPzXqAumxNPoKJrwQIUemodxr4gIMKs2Dc8=
X-Received: by 2002:a05:6000:2997:10b0:48e:7508:bc12 with SMTP id ffacd0b85a97d-4abb0f3c457mr16688181f8f.10.1795433631622;
        Mon, 23 Nov 2026 03:33:51 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm17721104f8f.35.2026.11.23.03.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:33:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 12:33:50 +0100
Message-Id: <DN2K3RFII8U3.WN02UT4CKQVP@smile.fr>
Subject: Re: [blacksail][PATCH 1/2] expat: fix CVE-2026-118370
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>, <bastien.jauny@smile.fr>
To: =?utf-8?b?Sm/Do28gTWFyY29zIENvc3RhIChTY2huZWlkZXIgRWxlY3RyaWMp?=
 <joaomarcos.costa@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261118103042.1825679-1-joaomarcos.costa@bootlin.com>
 <20261118103042.1825679-2-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261118103042.1825679-2-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250902

On Wed Nov 18, 2026 at 11:30 AM CET, Jo=C3=A3o Marcos Costa (Schneider Elec=
tric) wrote:
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
>  meta/recipes-core/expat/expat_2.8.5.bb        |  2 +
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

Hello,

I'll take this patch for now but, please, in the future:
Either import the whole pull request as one patch or reference the
commits in Upstream-Status: Backport.

For example, this one is https://github.com/libexpat/libexpat/commit/1bac53=
c4fc460a03cd9860f39501c7979f6750ae.

Thanks!

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
> diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/e=
xpat/expat_2.8.5.bb
> index 125d0e1f82..cca713d95f 100644
> --- a/meta/recipes-core/expat/expat_2.8.5.bb
> +++ b/meta/recipes-core/expat/expat_2.8.5.bb
> @@ -12,6 +12,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
>             file://run-ptest \
>             file://CVE-2026-102633.patch \
>             file://CVE-2026-77214.patch \
> +           file://CVE-2026-118370-01.patch \
> +           file://CVE-2026-118370-02.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"


--=20
Yoann Congal
Smile ECS

