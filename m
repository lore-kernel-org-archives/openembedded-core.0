Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15981.1795519650000016075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 03:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=KpwUfZav;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so44591945e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795519648; x=1796124448; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WxTm5lT0jh6mn9DalbsbMWBl15oIqCc0wkUqbU/AY8g=;
        b=KpwUfZavwReXr4FbxS/y2UKeJc1J/aiQIP2QKEXpN4buElk8xrO5e+l2fql7bFusvH
         1ByDrvWm7L06Pe3f2X3V9kufOR7JOVUn9bPaRT4VFU/D8PMOFpvcFULrIRLWeyRe5moY
         X4dVn8/Np8KT+R92qeyEorEcHyl2YrUNUqt0r68n0n5vMvD8BmvlDa7Q+oq+V9WkajX+
         q8OKtgdeyfcYjgFJk4KVHWzHhbOPHuuk4kg6lBFNGg828J6Kq+FE8JhinJd2zUYRTPwa
         0aFnsMDyWt62X+SJMPxskz6Uf2wOsLUULBoLx8IxwovTWxG5ZryX9UNalU59Svsqm+i0
         GKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519648; x=1796124448;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxTm5lT0jh6mn9DalbsbMWBl15oIqCc0wkUqbU/AY8g=;
        b=y/k+zo7mP6SePDo++FSYPQfejMYAIcP+9q8veCLAg30XrF+B27rB6W1rCvzsvkw3d9
         nIlSSyrh9Gh/G3HuIVaoHxv9EVZ45nnh7Ong1vqk88ZHvEmL8kmCGTJJtzp5fvWAoaL2
         A60FzMRzxwA9FyHSaJG5DP0dxvFSnfPEk34uTmkoIpsyQQszwtbIdIlVTD+D9WJqJmlq
         MacwCPEZrsUkF/zJ1EWzu1gqk7sIIIy+2QCWFpwS22C36MiNynw+NzO0sPZ11C2t5pV4
         2GMd613xvWQBnUP2PTPw9lPSdOplRmEYy4vDOi+oWUu5XrihWxMJN2CMPIpU3VnFXqyr
         Vmjg==
X-Forwarded-Encrypted: i=1; AL+hErEuUpNeESRyFjAm4Bl/ZW9zLP5PekOkjeMR/AUzKaiqCsr8ebTYjGonb2zehAxRsYs7/4usMH9ggQvDyk0MB78IiA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9GeZg2TgeqAe2SxqZRha5m4RyCCZh4v2T2s+yVQ5RqDErj4+H0
	gPFQBReRmE7vJ3F4OEOXlI0VaB0eGYyQMPh/tD0NNsDz1QF+7uEjFZWkWJcVv2ocoiI=
X-Gm-Gg: AZFdTZfwdRodhn6u0w4GA9Zs+yV4A4CB3g53wKzyVKJPprbLnI7++ZfBpaprwuqQ7/1
	Nss695Gh1wmVzVEBNxdc71XZwhcfO/KZW7BCi24poEU8cWqZK0zqgDf+u4spT685eNOfrAqawXU
	UqlcFW07sIkzMqsy2E7i1jAY4hFLUP+ec27CjkfvXOLvT1ESDyHyUTVnmVX9HR0x/QMmivAjrMX
	iyIAhzAQNgf/Pr09nmoG/5HbXZBZGXx13akIlK1SsZ+yoSaXh/5W82h8PbeUfRrpHFEEBfAlJHf
	q/KhdoWWhB0Er8zTkF1EviOQm40gf+dKyKDWyogzlGKAThXXYWwmamLMCpvyzRe8MpcClH32JZb
	5eazYBJ2RXyuPh+aO1bngZMdWjad2QpLPx1xh0eq05WKiz9jVJ26gdU+IcT852MmfQlFKGC5oCC
	zkskQ539k3xVkVvwwzqDg+eblxA7dlRJlRZ95P3YAOneCcIgZKEDAPQZqPyBDBjeCAiXpHyG9Aw
	yQijAE9JTb8PQ5Bl20KS83LO5AUpsS3rX1KkkbdPzkE1MulJVx90Qytb+bdNt6bRf/j/w58lX3Q
	l8EA2023yG+A7JakzfRSPLbrvF9Ui4uN6fRpvZAMqWXOUmDRUbrkLQHUkqX6G2i8xjddw8ouMIU
	6YlSvIny3kFse9zAJ
X-Received: by 2002:a05:600c:3113:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb88816a53mr309554845e9.21.1795519647914;
        Tue, 24 Nov 2026 03:27:27 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm387381115e9.8.2026.11.24.03.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:27:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 12:27:27 +0100
Message-Id: <DN3ELESNX6PF.3L73PUZP0X5PE@smile.fr>
Subject: Re: [OE-Core][scarthgap][PATCH 1/4] curl: Fix CVE-2026-8927
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261120130414.822854-1-devanshp@cisco.com>
 <20261120130414.822854-2-devanshp@cisco.com>
In-Reply-To: <20261120130414.822854-2-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 11:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251024

On Fri Nov 20, 2026 at 2:04 PM CET, Devansh Patel via openembedded-core wro=
te:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix commit as referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57=
aacb567
> [2] https://curl.se/docs/CVE-2026-8927.html
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-8927
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8927.patch             | 87 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8927.patch
> new file mode 100644
> index 0000000..a8b07a5
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
> @@ -0,0 +1,87 @@
> +From d4e71ad3aed07542606d9c4afdf6884eccdb3a26 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 18 May 2026 23:47:11 +0200
> +Subject: [PATCH] url: detect proxy changes read from environment
> +
> +When a proxy is set from an environment variable, detect if that proxy
> +is not the same as previously and flush state.
> +
> +Verified by test1647: verify changing proxy with env variables and make
> +sure Digest state is flushed in the second use
> +
> +Closes #21666
> +
> +CVE: CVE-2026-8927
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5c225384b=
8d52c67ce8259c6e4203bc57aacb567]
> +
> +Backport Changes:
> +- Use the 8.7.1 free()/strdup() names and include vauth/vauth.h.
> +  Keep the parsed proxy string until the existing out cleanup so the
> +  upstream Digest-state comparison can still read it.
> +- Omit tests/data/Makefile.am, tests/data/test1647,
> +  tests/libtest/Makefile.inc and tests/libtest/lib1647.c.
> +  The test-only feature-detection dependency is therefore unnecessary.
> +
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + lib/url.c     | 13 ++++++++++++-
> + lib/urldata.h |  1 +
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index 9e1ca03..fe76397 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -79,6 +79,7 @@
> + #include "share.h"
> + #include "content_encoding.h"
> + #include "http_digest.h"
> ++#include "vauth/vauth.h"
> + #include "http_negotiate.h"
> + #include "select.h"
> + #include "multiif.h"
> +@@ -331,6 +332,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
> +   Curl_wildcard_dtor(&data->wildcard);
> +   Curl_freeset(data);
> +   Curl_headers_cleanup(data);
> ++#ifndef CURL_DISABLE_DIGEST_AUTH
> ++  free(data->state.envproxy);
> ++#endif
> +   free(data);
> +   return CURLE_OK;
> + }
> +@@ -2535,7 +2539,6 @@ static CURLcode create_conn_helper_init_proxy(stru=
ct Curl_easy *data,
> +     curl_proxytype ptype =3D (curl_proxytype)conn->http_proxy.proxytype=
;
> +     if(proxy) {
> +       result =3D parse_proxy(data, conn, proxy, ptype);
> +-      Curl_safefree(proxy); /* parse_proxy copies the proxy string */

This removed line is not in upstream patch. Are you sure you don't want
to move it instead? Removing a free() sounds like a memory leak...

> +       if(result)
> +         goto out;
> +     }
> +@@ -2554,6 +2557,14 @@ static CURLcode create_conn_helper_init_proxy(str=
uct Curl_easy *data,
> +       result =3D CURLE_UNSUPPORTED_PROTOCOL;
> +       goto out;
> + #else
> ++#ifndef CURL_DISABLE_DIGEST_AUTH
> ++      if(!Curl_safecmp(data->state.envproxy, proxy)) {
> ++        /* proxy changed */
> ++        Curl_auth_digest_cleanup(&data->state.proxydigest);
> ++        free(data->state.envproxy);
> ++        data->state.envproxy =3D strdup(proxy);

Have you checked that proxy can't be NULL here (on curl 8.7.1)?

My review LLM wrote that it could and that sounds plausible to me:
| Warning: The guard is different. 8.7.1 tests
| `conn->http_proxy.host.rawalloc` where upstream tests
| `conn->http_proxy.peer`.
|=20
| Upstream always parses the pre-proxy into socks_proxy, so `proxy` is
| never NULL at that point.
|=20
| In 8.7.1, parse_proxy() puts a schemeless CURLOPT_PRE_PROXY
| ("host:1080", scheme guessed as http, default PROXYTYPE) into http_proxy
| and leaves `proxy` NULL. If the same handle used an HTTP proxy earlier,
| Curl_safecmp(envproxy, NULL) returns false, the code calls strdup(NULL)
| and segfaults.

Can you check please?

Regards,
--=20
Yoann Congal
Smile ECS

