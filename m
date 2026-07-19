Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AFCC4451B
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 21:48:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.235.1784497716753133781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 14:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iCbSLDCf;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so7307998f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 14:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784497715; x=1785102515; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=daF9ELS/Ice7Y0dWtj74VLuIdZ/MT8Ku7Z+2AwB30f0=;
        b=iCbSLDCfsd0iGpTHKLtr2I1yq1gpMVIUNpQ2dJyHCVXnMu8COQ8nSE0HALPXUPpX2c
         DESX76rrF9vr5tAsUFgxZuGnzp3ybNSfE/kMNRoOQnL+hfvkMuII0ZRisF0V+DSvRLr/
         afL8Z3oaODf6gKYWpR8dVlXQWYVn56+56KPoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497715; x=1785102515;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=daF9ELS/Ice7Y0dWtj74VLuIdZ/MT8Ku7Z+2AwB30f0=;
        b=GkWdlk3dFWMRJMtsnorNv7JOyXlhi6QitVDEUr6LdaaLPhBp4ETU+vHJ7HmoJ2290b
         jW3PspsPJyjLfJqgtvvvFA/xkZybW/z0m+xqBT/EXxzkT9uXvlqXGEee5uIx9FTQV6+Q
         hscUlf9Sfcn/55XtuKT7ZuYTLiAzr/C2WoMNmYUACmBF01xxuItB8XXhWSlk56IQfHNF
         j4HnbvQlDkXrmPRXNKx6YJ5UYvGWqDukCdFaP+YppkhriDOOJ9K7zrmact/cLG/o8s5j
         k3t7GanZrR04A28+k425vDFMebhZVQqCvziwDkjs7agrzARgN1LcZMM+kx6iIsLLF7v0
         AiEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR9uqlo7IrA/mC7Loc194atdE3ei8ocGXz2wHM5kBUPbq33WXefzR4Z5Ek776GchnlEUUJkz4YsZ9i04Ek5HlATw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYmWqGeBegENLV645Ydg2xtqM5lenQDKHJZ5SOYsp2OMamWehP
	ecOlcYlr7GP4lA14gG1HzzwzMJoMtjdlXl5PCvFCNkCiejWMpzF6pfGsOX2ZZwsOSNS/ZY98bwX
	v/ufUVpn/Ng==
X-Gm-Gg: AfdE7cn5c5AYgzgLJHdYTJ7qPULxwmFXHvnSJhr50P4lCwvtPHvLJWwtd5SsA1q7n9p
	gpc+RYj35PcXxtZRHehTLz/tPGHzf/zIaWFvDG54GsnerJVnDrTSeWWEzNmj0OBlmGlnxkOoDUR
	SljWtUZAojLkjJA3fwWKFAGUOqCtlqcc1wiLvddufohaP08BuYwyEtaF2MVtA62eGWCuVHHvj/p
	AGYPUzzaWICvB3K/pDWhjt+HxbyhBeWjL2WUbZqtSeWpFMpUaf9hXHSkMEgKmuPOzsmmZeaV6Wg
	4niq2b+kXYNbNdeVCHYibO7uWl3rNyYeINMpQJG1Y/WCsNLgyFiB8bSFFb3iQQHzldNjZdr87BW
	115chwbOYdht+3z9wWwm2d0deSm9XIQCic01c2GlUXEctnDl0tpwKGQCX9bFfNFK5+RjlUhiCLP
	KqBv7FxupxNioD/UWjnsiQXvoSjwvt3GcGqt5GmjKwiSkXx9rhg67dodfmv+zWtGUxPmQ=
X-Received: by 2002:a05:6000:4b08:b0:47f:725a:174b with SMTP id ffacd0b85a97d-47f725a1adbmr4525505f8f.27.1784497714895;
        Sun, 19 Jul 2026 14:48:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm25295417f8f.22.2026.07.19.14.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 14:48:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 23:48:34 +0200
Message-Id: <DK2VN8KB0RQM.2Q9LKRBCIRRGZ@smile.fr>
Subject: Re: [OE-core] [PATCH v3][scarthgap] python3: fix CVE-2026-7210
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706132712.51931-1-amaury.couderc@est.tech>
In-Reply-To: <20260706132712.51931-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 21:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241304

Hello,

On Mon Jul 6, 2026 at 3:26 PM CEST, Amaury Couderc via lists.openembedded.o=
rg wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
> Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
> An attacker can craft XML input that forces O(n=C2=B2) hash collisions in
> libexpat's internal name dictionary, causing excessive CPU consumption.
>
> The previous mitigation seeded libexpat's hash function with only 4
> bytes of entropy, which is insufficient against a determined attacker.
> This patch upgrades to XML_SetHashSalt16Bytes (libexpat >=3D 2.8.0),
> providing a full 16-byte secret. Older expat versions fall back
> gracefully to the legacy XML_SetHashSalt via a runtime NULL check.
>
> Backport patch to fix CVE-2026-7210.
> https://nvd.nist.gov/vuln/detail/CVE-2026-7210
>
> Upstream fix:
>   https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442f=
cd495391e4
>
> Tested with ptest:
> Before: PASSED: 40019, FAILED: 0, SKIPPED: 1882
> After: PASSED: 40020, FAILED: 0, SKIPPED: 1882
>
> CVE: CVE-2026-7210
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>
> NOTE: CVE-2026-7210 full mitigation requires the companion
>     expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)
>
> .../python/python3/CVE-2026-7210.patch        | 122 ++++++++++++++++++
>  .../python/python3_3.12.13.bb                 |   1 +
>  2 files changed, 123 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.pa=
tch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-7210.patch
> new file mode 100644
> index 0000000000..8acf174a0a
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
> @@ -0,0 +1,122 @@
> +From 2ed6138dea0bc94c726f879501e4525712e885d1 Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 10 May 2026 18:36:26 +0100
> +Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in
> + `pyexpat`/`_elementtree` when possible (#149023)
> +
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/24b8=
f12544468e4cedf5bfbe25442fcd495391e4]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/pyexpat.h                                      |  3 +++
> + Include/pyhash.h                                       |  8 +++++---
> + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst     |  3 +++
> + Modules/_elementtree.c                                 |  8 ++++++--
> + Modules/pyexpat.c                                      | 10 +++++++++-
> + 5 files changed, 26 insertions(+), 6 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-iss=
ue-149018.a9SqWb.rst

The patched files have slighty changed
Include/internal/pycore_pyhash.h -> Include/pyhash.h
This time, I could check that nothing important changed but next time
I'd like a like a little change log about what changed between upstream
and the imported patch.

> [...]
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index 79492ca5c4f..388473d3855 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1388,7 +1388,10 @@ newxmlparseobject(pyexpat_state *state, const cha=
r *encoding,
> +         Py_DECREF(self);
> +         return NULL;
> +     }
> +-#if XML_COMBINED_VERSION >=3D 20100
> ++#if XML_COMBINED_VERSION >=3D 20800
> ++    /* This feature was added upstream in libexpat 2.8.0. */
> ++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt1=
6);
> ++#elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
> +@@ -2257,6 +2260,11 @@ pyexpat_exec(PyObject *mod)
> + #else
> +     capi->SetHashSalt =3D NULL;
> + #endif
> ++#if XML_COMBINED_VERSION >=3D 20800
> ++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
> ++#else
> ++    capi->SetHashSalt16Bytes =3D NULL;
> ++#endif
> + #if XML_COMBINED_VERSION >=3D 20600
> +     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
> + #else

We did not upgrade expat but patched in the fixing API
XML_SetHashSalt16Bytes. Can you check we can activate the fixed code
path with those "#if XML_COMBINED_VERSION >=3D 20800"?

I will hold the patch in the meantime, I really want to avoid a false
negative in CVE data.

Regards,
--=20
Yoann Congal
Smile ECS


