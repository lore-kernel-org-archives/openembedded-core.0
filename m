Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8912.1793358087577988970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZO+lT0bc;
 spf=pass (domain: smile.fr, ip: 209.85.208.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so527735a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793358086; x=1793962886; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TmDpfPPgWsk8U9Kyot4vUQgV+bfjQBWF+CZVPiuOSM=;
        b=ZO+lT0bcXzKuCT9ZglgfGDJRGUszUlbcXl1+1GdCTobFJxw5HZDu+SNxFNtQ8g0EfD
         TM6oe8GjxsG7/LbaZ10ute3C9Iz4HBFp0ne20bUqkkievs1X2QLdSPPsbjvsTb8W9N3i
         EmeyxqS67SrZ+hUPQ+YKOgvnIiMaa+1slbbVokzLUEMo6BsIrnZP70uCmuiiEokRXN/i
         GOR4j4HVSBkJnHidhALZSbk5y6V6UWG7UT9A0U3u8PoesUBxJCv/9n8qtO6QpN2FxS2N
         vNdhDkJjf2dsOYiQfRxQjTtIv0ZyjZlV51JMepsPJ9Ad3xvyEjFZiX4Bvh2OP4vpfojN
         gKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358086; x=1793962886;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TmDpfPPgWsk8U9Kyot4vUQgV+bfjQBWF+CZVPiuOSM=;
        b=GIWhqoGnNmQsI66oCkG7qH2Q6Qo6FnBxYo3HqyWLFXKYX4zdF8amAkwSJV0UHLDYwN
         BPfr025313ouj6ZTsRVhZOPCvYulAXpv3TnBrGwC8C7HAUubD0NuBnkeZmXD9sqPI3wZ
         yndfnWrCoCRjLxpD9+pj2ZXV9KxGLlIxKCYxa3ZnEYzdcdnnCj8y5NXEss/KcIew5cBi
         Bi4u3If8GsQVOnC6c8FbZdXyfvPtibUDhxSGG9b07SWocfOXWNL7jaAQyzExASVTPPA9
         X+llVo+RAJ3FxQ0Fd42vvolHRBI/D1EHO8NqJytAURsApUGvKDIKZad67ID4AZbqrSI2
         y89Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaG5h7H6vDvDajVBotAEYXXY5L/LdT2vMqZimuPruTeihbUy5WTm9Im6WKZEw89pEVMNp9ohPyf0cMC6kRZ/sNgg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKdY3fmOYdTsvcZ9sttYo4AQdeKcZ3Z77J4riNy8RFYF0j+Rxh8
	nxjX2oyO0g7F+bbvzjI5aQkigtcZ0H174bs6WyEspTLf6dpzEjkdQC6IiqimyLOjwug=
X-Gm-Gg: AYBFou2m2/xqvZW4cRRZwvNxh5r/p0XFcdLwagldtrrjJuvGPBdrr9yeaVDBGWZeERn
	CpRzGn0psy/luiMTqyTqkTM9ubPxH6NWJnUnikppQM8XJr2M9oEIW22Yf53xMVeI+Glgiyy289x
	t9YQJxT4omP34knkBcr54vpQO5/TebOvG7cEWh2F5CUItGEQBf260uosU3i+fSg7vnHriEP+J9g
	ez+AeqfhRU7fjr8NFOrJ6FkHpmgliO2tt93zKDAGqgyOUIU/R9hHxiOcq9QjqAqKl19kmm4euRm
	r0i5GNTWE9ly5nIzPLX/IKwcM/D6DlRz81vONTptpCgW63sxZAN8p+3SaljEUevOjKBljd2uJvq
	NnPrjQQYiFTt0Hx5UvqYV5fliU0B6O4Jy9p0Pxbpw5Xod4hRwIQ6u7vmBMInoV6kjFj0nK1/1PV
	vx1Hu/QKsdkS6CnIZdCru5W2LkwL8YKHeiTtmqHspcX6d/I0zXMTn5DodNRaGgoThpCPXp3LRJu
	pBsn2hG1djb3ThZko5q3etKfPf7bQleCCJKdpp+7z51YcHpP5sEg7Ix1gJO4Dq5xQH4sTZLck6r
	qmu/2SAUCBxECv54YuwHu5NOleDOuyN6cw7HQvpL8NaVShftNUl7w58SAQWhyNs1GFxMbnjZE/D
	qQQpqLxzyPxPv+rMm
X-Received: by 2002:a05:6402:7ca:b0:6b1:df89:7e11 with SMTP id 4fb4d7f45d1cf-6b4d4f7367emr1035100a12.36.1793358083975;
        Fri, 30 Oct 2026 04:01:23 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm2570094f8f.51.2026.10.30.04.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 04:01:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 12:01:23 +0100
Message-Id: <DMI4DTXTVWDM.1ZLOT94319M1J@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 6/8] curl: fix CVE-2026-8932
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016130439.603118-1-devanshp@cisco.com>
 <20261016130439.603118-2-devanshp@cisco.com>
In-Reply-To: <20261016130439.603118-2-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249028

Hello,

On Fri Oct 16, 2026 at 3:04 PM CEST, Devansh Patel -X (devanshp - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using the
> commit shown in [1].
>
> [1] https://github.com/curl/curl/commit/7541ae569d82fb308a5e2d94916027da4=
fa3ba3e
> [2] https://curl.se/docs/CVE-2026-8932.html
>
> Validation: unit3303 passes in a native debug build with OpenSSL.
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>
> Changes in v2:
> - Rebase onto stable/scarthgap-review.
> - Record native unit3303 validation.
>
>  .../curl/curl/CVE-2026-8932.patch             | 423 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 424 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch

This is not an easy patch to review. I need you to make it easier by
reformating it:

>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8932.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8932.patch
> new file mode 100644
> index 0000000..432d5e5
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8932.patch
> @@ -0,0 +1,423 @@
> +From c25faf128bba57a64da636f126773b858b35bc27 Mon Sep 17 00:00:00 2001
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
> +- Add the missing credential fields to ssl_primary_config for
> +  connection and session matching. Keep the backend fields as aliases
> +  instead of changing accesses throughout the TLS backends.
> +- Keep the session cache in vtls.c; curl 8.7.1 has no vtls_scache
> +  files or peer key API.
> +- Use the older unit test harness and allocator (memdebug.h last).
> +  Combine unit3304's case-insensitive type checks into unit3303,
> +  with key_blob deep copy and connection/session matching checks.
> +- Use a writable hostname array for the older char * hostname field.
> +
> +(cherry picked from commit 7541ae569d82fb308a5e2d94916027da4fa3ba3e)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + lib/urldata.h           |   5 +
> + lib/vtls/vtls.c         |  25 +++++
> + tests/data/Makefile.inc |   3 +-
> + tests/data/test3303     |  23 +++++
> + tests/unit/Makefile.inc |   4 +-
> + tests/unit/unit3303.c   | 211 ++++++++++++++++++++++++++++++++++++++++
> + 6 files changed, 269 insertions(+), 2 deletions(-)
> + create mode 100644 tests/data/test3303
> + create mode 100644 tests/unit/unit3303.c
> +
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index d2d9424197..9015515e17 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -286,6 +286,11 @@ struct ssl_primary_config {
> +   char *CAfile;          /* certificate to verify peer against */
> +   char *issuercert;      /* optional issuer certificate filename */
> +   char *clientcert;
> ++  char *cert_type;       /* format for certificate (default: PEM) */
> ++  char *key;             /* private key file name */
                                                ^ upstream patch has no
space here. Please reduce this kind of noise to the minimum.

> ++  struct curl_blob *key_blob;

Please try to keep upstream ordering (key_blob goes at the end of the
change in upstream patch).

Also, in many place of the patch, these elements are inserted in
existing code. Can you try to find the spot in the existing code were
diff is minimal? Here, neither the context above nor below match the
upstream patch.

> ++  char *key_type;        /* format for private key (default: PEM) */
> ++  char *key_passwd;      /* plain text private key password */
> +   char *cipher_list;     /* list of ciphers to use */
> +   char *cipher_list13;   /* list of TLS 1.3 cipher suites to use */
> +   char *pinned_key;
> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
> +index d13a3cb1b7..c89e8abcc6 100644
> +--- a/lib/vtls/vtls.c
> ++++ b/lib/vtls/vtls.c
> +@@ -187,10 +187,15 @@ match_ssl_primary_config(struct Curl_easy *data,
> +      blobcmp(c1->cert_blob, c2->cert_blob) &&
> +      blobcmp(c1->ca_info_blob, c2->ca_info_blob) &&
> +      blobcmp(c1->issuercert_blob, c2->issuercert_blob) &&
> ++     blobcmp(c1->key_blob, c2->key_blob) &&
> +      Curl_safecmp(c1->CApath, c2->CApath) &&
> +      Curl_safecmp(c1->CAfile, c2->CAfile) &&
> +      Curl_safecmp(c1->issuercert, c2->issuercert) &&
> +      Curl_safecmp(c1->clientcert, c2->clientcert) &&
> ++     curl_strequal(c1->cert_type, c2->cert_type) &&
> ++     Curl_safecmp(c1->key, c2->key) &&
> ++     curl_strequal(c1->key_type, c2->key_type) &&
> ++     !Curl_timestrcmp(c1->key_passwd, c2->key_passwd) &&

Same remark about ordering and context, it continues to apply below.

> + #ifdef USE_TLS_SRP
> +      !Curl_timestrcmp(c1->username, c2->username) &&
> +      !Curl_timestrcmp(c1->password, c2->password) &&
> +@@ -234,10 +239,15 @@ static bool clone_ssl_primary_config(struct ssl_pr=
imary_config *source,
> +   CLONE_BLOB(cert_blob);
> +   CLONE_BLOB(ca_info_blob);
> +   CLONE_BLOB(issuercert_blob);
> ++  CLONE_BLOB(key_blob);
> +   CLONE_STRING(CApath);
> +   CLONE_STRING(CAfile);
> +   CLONE_STRING(issuercert);
> +   CLONE_STRING(clientcert);
> ++  CLONE_STRING(cert_type);
> ++  CLONE_STRING(key);
> ++  CLONE_STRING(key_type);
> ++  CLONE_STRING(key_passwd);
> +   CLONE_STRING(cipher_list);
> +   CLONE_STRING(cipher_list13);
> +   CLONE_STRING(pinned_key);
> +@@ -257,12 +267,17 @@ static void Curl_free_primary_ssl_config(struct ss=
l_primary_config *sslc)
> +   Curl_safefree(sslc->CAfile);
> +   Curl_safefree(sslc->issuercert);
> +   Curl_safefree(sslc->clientcert);
> ++  Curl_safefree(sslc->cert_type);
> ++  Curl_safefree(sslc->key);
> ++  Curl_safefree(sslc->key_type);
> ++  Curl_safefree(sslc->key_passwd);
> +   Curl_safefree(sslc->cipher_list);
> +   Curl_safefree(sslc->cipher_list13);
> +   Curl_safefree(sslc->pinned_key);
> +   Curl_safefree(sslc->cert_blob);
> +   Curl_safefree(sslc->ca_info_blob);
> +   Curl_safefree(sslc->issuercert_blob);
> ++  Curl_safefree(sslc->key_blob);
> +   Curl_safefree(sslc->curves);
> +   Curl_safefree(sslc->CRLfile);
> + #ifdef USE_TLS_SRP
> +@@ -297,6 +312,11 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_=
easy *data)
> +   data->set.ssl.key_passwd =3D data->set.str[STRING_KEY_PASSWD];
> +   data->set.ssl.primary.clientcert =3D data->set.str[STRING_CERT];
> +   data->set.ssl.key_blob =3D data->set.blobs[BLOB_KEY];
> ++  data->set.ssl.primary.cert_type =3D data->set.ssl.cert_type;
> ++  data->set.ssl.primary.key =3D data->set.ssl.key;
> ++  data->set.ssl.primary.key_type =3D data->set.ssl.key_type;
> ++  data->set.ssl.primary.key_passwd =3D data->set.ssl.key_passwd;
> ++  data->set.ssl.primary.key_blob =3D data->set.ssl.key_blob;
> +=20
> + #ifndef CURL_DISABLE_PROXY
> +   data->set.proxy_ssl.primary.CApath =3D data->set.str[STRING_SSL_CAPAT=
H_PROXY];
> +@@ -322,6 +342,11 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_=
easy *data)
> +   data->set.proxy_ssl.key_passwd =3D data->set.str[STRING_KEY_PASSWD_PR=
OXY];
> +   data->set.proxy_ssl.primary.clientcert =3D data->set.str[STRING_CERT_=
PROXY];
> +   data->set.proxy_ssl.key_blob =3D data->set.blobs[BLOB_KEY_PROXY];
> ++  data->set.proxy_ssl.primary.cert_type =3D data->set.proxy_ssl.cert_ty=
pe;
> ++  data->set.proxy_ssl.primary.key =3D data->set.proxy_ssl.key;
> ++  data->set.proxy_ssl.primary.key_type =3D data->set.proxy_ssl.key_type=
;
> ++  data->set.proxy_ssl.primary.key_passwd =3D data->set.proxy_ssl.key_pa=
sswd;
> ++  data->set.proxy_ssl.primary.key_blob =3D data->set.proxy_ssl.key_blob=
;
> + #ifdef USE_TLS_SRP
> +   data->set.proxy_ssl.primary.username =3D
> +     data->set.str[STRING_TLSAUTH_USERNAME_PROXY];
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index f420a8a4f5..27b1b52a10 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -264,4 +264,5 @@ test3024 test3025 test3026 test3027 test3028 test302=
9 test3030 \
> + \
> + test3100 test3101 test3102 test3103 \
> + test3200 \
> +-test3201 test3202
> ++test3201 test3202 \
> ++test3303
> +diff --git a/tests/data/test3303 b/tests/data/test3303
> +new file mode 100644
> +index 0000000000..9b52bcb817
> +--- /dev/null
> ++++ b/tests/data/test3303
> +@@ -0,0 +1,23 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++unittest
> ++TLS
> ++mTLS
> ++</keywords>
> ++</info>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++none
> ++</server>
> ++<features>
> ++unittest
> ++</features>
> ++<name>
> ++conn-reuse match distinguishes mTLS key, cert_type, key_type and key_pa=
sswd fields
> ++</name>
> ++</client>
> ++</testcase>
> +diff --git a/tests/unit/Makefile.inc b/tests/unit/Makefile.inc
> +index 1926b49b3a..afbe29d2b7 100644
> +--- a/tests/unit/Makefile.inc
> ++++ b/tests/unit/Makefile.inc
> +@@ -39,7 +39,7 @@ UNITPROGS =3D unit1300          unit1302 unit1303 unit=
1304 unit1305 unit1307 \
> +  unit1650 unit1651 unit1652 unit1653 unit1654 unit1655 unit1656 \
> +  unit1660 unit1661 \
> +  unit2600 unit2601 unit2602 unit2603 \
> +- unit3200
> ++ unit3200 unit3303
> +=20
> + unit1300_SOURCES =3D unit1300.c $(UNITFILES)
> +=20
> +@@ -134,3 +134,5 @@ unit2602_SOURCES =3D unit2602.c $(UNITFILES)
> + unit2603_SOURCES =3D unit2603.c $(UNITFILES)
> +=20
> + unit3200_SOURCES =3D unit3200.c $(UNITFILES)
> ++
> ++unit3303_SOURCES =3D unit3303.c $(UNITFILES)
> +diff --git a/tests/unit/unit3303.c b/tests/unit/unit3303.c
> +new file mode 100644
> +index 0000000000..d0a59877d6
> +--- /dev/null
> ++++ b/tests/unit/unit3303.c
> +@@ -0,0 +1,211 @@
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ **********************************************************************=
*****/
> ++#include "curlcheck.h"
> ++#include "cfilters.h"
> ++#include "http.h"
> ++#include "urldata.h"
> ++
> ++#ifdef USE_SSL
> ++#include "vtls/vtls.h"
> ++#include "vtls/vtls_int.h"
> ++#endif
> ++#include "memdebug.h" /* LAST include file */
> ++
> ++static CURLcode unit_setup(void)
> ++{
> ++  return curl_global_init(CURL_GLOBAL_ALL);
> ++}
> ++
> ++static void unit_stop(void)
> ++{
> ++  curl_global_cleanup();
> ++}
> ++
> ++UNITTEST_START
> ++#ifdef USE_SSL
> ++{
> ++  CURL *curl;
    ^ indent changed from upstream patch. Which make it needlessly
harder to review.

Indentation diff aside, I also noticed a lot of changes from upstream
test code. At some point, if the upstream test can't apply to the
backported sources, I have to ask if it's worth it? I'd rather have no
test instead of an entirely new test that upstream never reviewed.


Can you send a v3 series with those changes?
Please renumber the patches 1-4/4 (many tools don't like partial series
like these)
Also, look at 7-8/8 and apply the same idea of diff minimisation from
upstream (if applicable)

Thanks!
--=20
Yoann Congal
Smile ECS

