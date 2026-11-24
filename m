Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25129.1795543428783336259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RnlEN5Ex;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so47981785e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795543427; x=1796148227; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yQaiXx785qXwvunu3qfO4eDpG1vNA6epd1HT9bVzw0=;
        b=RnlEN5ExjSQKMy1Jxitl20Fyi7/LTZtqkBhwTAZja4jm4vr3NujAaYfoHFGaBkg8Kg
         pF0R/cg8aGDrxedtT+xQbwErlRmA5spi8cTpQmA3a81qAOGkvDVKYD80wsl82+9u+HHu
         f4kXVjrFbMkB6lIVo/gniFED50IITtZ4VlyAY0V0AKP9oBuXdo6Vrjh6YSTFHlRX8K79
         8ha/tNgvPx1Lw2SrJLY0O25Q1xTvQFj6+JDY188+a+mkvxzLtPlu4taGneNfElg/+03r
         WEkFQI4wE9BQxoqS4b+rlfy9YlDKhn9uikLvuD+pKd77VMWWpM1zqQaDo2Tlz7+jC9Na
         8NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543427; x=1796148227;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yQaiXx785qXwvunu3qfO4eDpG1vNA6epd1HT9bVzw0=;
        b=sJ7gnitOSiXUsQwDmssfwclQ4la22PYlmOBmZ+JLpJxczDvop0L+GVZbvhbI95BO4g
         eL9DQBUEzocr0tOTTFqriGkwTl4W2R6JUW/tGmhrMk8JVLKsUCwYqhIFIUkhV8/Cu5ll
         iE6s8LhZEWXPp6ErYL6znyFW4aysR5a4O6eoZUVwD1SbBLoJasXcQbHAnzOPqRPVe/s0
         ItV8aTF+HcZ8jr0GIpit5hGIbqeK89KSH2ekaUsSHTiSgM3x0ybf8p9W2Eb0jsm01CCz
         oaxntwPgXgPkCoiHHcgvldH7le3Ol3EHUzvaoZo8v4fBF8GzlQqn/8OUQqYGyOpIPVZg
         wXwA==
X-Forwarded-Encrypted: i=1; AL+hErFLJzinN70Ol34FfjPSD45zXpX+jLmnffwIm2xRio+sKYm4oQxODWzfPuBMZdUdfNufczUjxOGFEw/lC1FKLxfbRQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z91nM3ktG0MZy/fb37+7PmuNHKZjnxhLFbwvUuNVUxpGFfUKC/p
	VJrTGFViGjQmK3v3lY++MzSCOUPXtCbo4XGtES5R04iEWskMZ8dTndNCNykCOFuOeF8=
X-Gm-Gg: AZFdTZdWvWF6pvUpB6Mp6UA2npaLXBXX9/8NqYWjA2W80q4OKmkXmXsvbOopEElIXM0
	q++AvVAmXAeYEqcptr1557CNwOykZFCk18+bn/3M47jL5gT4dpYsFiml0tuUVPsYp28FVBRqhIV
	TNWoU7NoRnComVgJ76uAYo0BJNRdPbQUKeVNFU8Zi+6or/nKWH+lZjX8rYPsqbX9WI6uYpTVGT3
	+grnrCe6WrmLpzebty64qxXSpYlja5eY85PQQKGUrlNVtRh+KhLUduC41/LPv9apEXAlNImd2DS
	6XAcAoZTJ5yCz7f4FL0wftevUaAlXlxM9Er1JuqzofkKUjuZGOApwxuTsCTiSeuxxFhGvI3VcKh
	PX51uNBwogLPjaqNs21thEluUkYa3EGelExHIqSdfT9Tre+40QvfOjr2XcB5imEeAuR8ZM0lSpy
	JPbTNuLfGAP6rreThepddJ6avIPqtYx0klnMMlEUDW+X9SH3lIevEr4xNBMTIUtcdl0qAN+iH5c
	ZH3GdjbE6ihq93mkHUi4zxsH/Dwf8xVEO9C0MCNBX33LhkxubX7u/QeJQLEZYyr00V1CIbIUkz7
	kiFM9z2w54XDu7eZRqMC28WhMLC5YImL2JkLuUOt4MFGeacXeSLXhyCZ09DNgC25tFtUj5DWlSQ
	OmZoX5AjC5mD46WHXnHA7e2adX5z+usinl8qRPw==
X-Received: by 2002:a05:600c:3e0e:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb88929c63mr288703415e9.18.1795543426810;
        Tue, 24 Nov 2026 10:03:46 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm268265785e9.1.2026.11.24.10.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:03:46 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 19:03:45 +0100
Message-Id: <DN3N0UGY7DKD.2117G4UWLX8NV@smile.fr>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][scarthgap][PATCH 2/4] curl: Fix CVE-2026-8932
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261120130414.822854-1-devanshp@cisco.com>
 <20261120130414.822854-3-devanshp@cisco.com>
In-Reply-To: <20261120130414.822854-3-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 18:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251069

On Fri Nov 20, 2026 at 2:04 PM CET, Devansh Patel via openembedded-core wro=
te:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix commit as referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4=
fa3ba3e
> [2] https://curl.se/docs/CVE-2026-8932.html
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-8932
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8932.patch             | 170 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 171 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8932.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8932.patch
> new file mode 100644
> index 0000000..c7a6c4f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
> @@ -0,0 +1,170 @@
> +From 8b62ee5391b03f780223bfc0780c9e14f01d34f2 Mon Sep 17 00:00:00 2001
> +From: Joshua Rogers <MegaManSec@users.noreply.github.com>
> +Date: Tue, 19 May 2026 11:47:50 +0200
> +Subject: [PATCH] tls: fix incomplete mTLS config in conn reuse and sessi=
on
> + cache
> +
> +cert_type, key, key_type, key_passwd and key_blob lived in
> +ssl_config_data but not in ssl_primary_config, so they were invisible to
> +match_ssl_primary_config() and to the TLS session cache peer key.
> +
> +Two easy handles sharing a connection pool could reuse each other's
> +authenticated connections when they differed only on SSLKEY, SSLKEYTYPE,
> +KEYPASSWD, SSLCERTTYPE or SSLKEYBLOB. The second handle would silently
> +inherit the first handle's authenticated identity.
> +
> +Promote all five fields into ssl_primary_config so the conn-reuse
> +predicate and session cache key cover the complete client credential
> +set. Also replace the fixed ":CCERT" session cache marker with the
> +actual clientcert path so sessions are not shared across different
> +client certificates.
> +
> +Verified by test 3303 and 3304
> +
> +Reported-By: Joshua Rogers (AISLE Research)
> +Closes #21667
> +
> +CVE: CVE-2026-8932
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/7541ae569=
d82fb308a5e2d94916027da4fa3ba3e]
> +
> +Backport Changes:
> +- Add the credential fields in upstream order and initialize primary
> +  directly. Retain the old ssl_config_data fields as backend aliases.
> +  The omitted lib/ldap.c, lib/vssh/{libssh,libssh2}.c and lib/vtls/
> +  {gtls,mbedtls,openssl,rustls,schannel,wolfssl}.c hunks only relocate
> +  equivalent credential reads. Use the old Curl_safefree name.
> +- Apply session isolation through the existing vtls.c primary-config
> +  clone/match paths. 8.7.1 lacks lib/vtls/vtls_scache.{c,h}; its cache
> +  already compares the actual clientcert path, without a peer-key API.
> +- Omit tests/data/{Makefile.am,test3303,test3304} and
> +  tests/unit/{Makefile.inc,unit3303.c,unit3304.c}.
> +
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + lib/urldata.h   |  5 +++++
> + lib/vtls/vtls.c | 47 ++++++++++++++++++++++++++++++++++++-----------
> + 2 files changed, 41 insertions(+), 11 deletions(-)
> +
> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> +index d13a3cb..969a8a2 100644
> +--- a/lib/vtls/vtls.c
> ++++ b/lib/vtls/vtls.c
> +@@ -291,12 +306,17 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl=
_easy *data)
> +   data->set.ssl.primary.username =3D data->set.str[STRING_TLSAUTH_USERN=
AME];
> +   data->set.ssl.primary.password =3D data->set.str[STRING_TLSAUTH_PASSW=
ORD];
> + #endif
> +-  data->set.ssl.cert_type =3D data->set.str[STRING_CERT_TYPE];
> +-  data->set.ssl.key =3D data->set.str[STRING_KEY];
> +-  data->set.ssl.key_type =3D data->set.str[STRING_KEY_TYPE];
> +-  data->set.ssl.key_passwd =3D data->set.str[STRING_KEY_PASSWD];
> ++  data->set.ssl.primary.cert_type =3D data->set.str[STRING_CERT_TYPE];
> ++  data->set.ssl.primary.key =3D data->set.str[STRING_KEY];
> ++  data->set.ssl.primary.key_type =3D data->set.str[STRING_KEY_TYPE];
> ++  data->set.ssl.primary.key_passwd =3D data->set.str[STRING_KEY_PASSWD]=
;
> +   data->set.ssl.primary.clientcert =3D data->set.str[STRING_CERT];
> +-  data->set.ssl.key_blob =3D data->set.blobs[BLOB_KEY];
> ++  data->set.ssl.primary.key_blob =3D data->set.blobs[BLOB_KEY];

This block:
> ++  data->set.ssl.cert_type =3D data->set.ssl.primary.cert_type;
> ++  data->set.ssl.key =3D data->set.ssl.primary.key;
> ++  data->set.ssl.key_type =3D data->set.ssl.primary.key_type;
> ++  data->set.ssl.key_passwd =3D data->set.ssl.primary.key_passwd;
> ++  data->set.ssl.key_blob =3D data->set.ssl.primary.key_blob;

> +=20
> + #ifndef CURL_DISABLE_PROXY
> +   data->set.proxy_ssl.primary.CApath =3D data->set.str[STRING_SSL_CAPAT=
H_PROXY];
> +@@ -316,12 +336,17 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl=
_easy *data)
> +     data->set.blobs[BLOB_SSL_ISSUERCERT_PROXY];
> +   data->set.proxy_ssl.primary.CRLfile =3D
> +     data->set.str[STRING_SSL_CRLFILE_PROXY];
> +-  data->set.proxy_ssl.cert_type =3D data->set.str[STRING_CERT_TYPE_PROX=
Y];
> +-  data->set.proxy_ssl.key =3D data->set.str[STRING_KEY_PROXY];
> +-  data->set.proxy_ssl.key_type =3D data->set.str[STRING_KEY_TYPE_PROXY]=
;
> +-  data->set.proxy_ssl.key_passwd =3D data->set.str[STRING_KEY_PASSWD_PR=
OXY];
> ++  data->set.proxy_ssl.primary.cert_type =3D data->set.str[STRING_CERT_T=
YPE_PROXY];
> ++  data->set.proxy_ssl.primary.key =3D data->set.str[STRING_KEY_PROXY];
> ++  data->set.proxy_ssl.primary.key_type =3D data->set.str[STRING_KEY_TYP=
E_PROXY];
> ++  data->set.proxy_ssl.primary.key_passwd =3D data->set.str[STRING_KEY_P=
ASSWD_PROXY];
> +   data->set.proxy_ssl.primary.clientcert =3D data->set.str[STRING_CERT_=
PROXY];
> +-  data->set.proxy_ssl.key_blob =3D data->set.blobs[BLOB_KEY_PROXY];
> ++  data->set.proxy_ssl.primary.key_blob =3D data->set.blobs[BLOB_KEY_PRO=
XY];

... and this block:
> ++  data->set.proxy_ssl.cert_type =3D data->set.proxy_ssl.primary.cert_ty=
pe;
> ++  data->set.proxy_ssl.key =3D data->set.proxy_ssl.primary.key;
> ++  data->set.proxy_ssl.key_type =3D data->set.proxy_ssl.primary.key_type=
;
> ++  data->set.proxy_ssl.key_passwd =3D data->set.proxy_ssl.primary.key_pa=
sswd;
> ++  data->set.proxy_ssl.key_blob =3D data->set.proxy_ssl.primary.key_blob=
;

Both are new code. I guess this is what allows to not patch every
callsite to add the .primary indirection.=20

But, I think it needs more explanation:
* A comment in the added code explaining why this is here.
* This creates alias pointers to some data. Did you ensure that this
  does not create use-after-free or double-free situations?

Regards,
--=20
Yoann Congal
Smile ECS

