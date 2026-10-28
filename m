Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42420.1793192642627905390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 06:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eFcMupuo;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6313635e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793192641; x=1793797441; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XCd3UivbE9UFR82J+/29W+vDIKrZ3aPTtABuAFqbppk=;
        b=eFcMupuoGeIYjgdM18HFdlWj52r46L7eQHbLq+EayQ1VvNFeu2f3ZlDnUKfu+MMmy1
         TVEb9OMV/5XvUHoJ1wjWbGpaNjW9mzIsqA2rwsCACWnrcQV4MVPsS/QEbBTOsHYAjq6S
         eJf//xp0JmEZbAhBldEZueqtp3lyjpdVgbSUXzyLGg0Nx/StVpcNZrdNJf7lKd8BGGS5
         e437peQR5xW3PuEVUokKXtJRZRtgrjOVHzFzNpRnx5JCnCHWInHpxfDJvO0ODYyfLWF0
         0/PJwpDFn7L5sQUGXQ3gFyZuEbOhBYztsCw+rXllCJt8+tA5FmSZun5ly8K7SMTY1FkE
         9CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192641; x=1793797441;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCd3UivbE9UFR82J+/29W+vDIKrZ3aPTtABuAFqbppk=;
        b=h9H58BBhcMVXINAYlWC+aFzcMRM4Ugc1dqM/gJL75emCAIlHT4g19jeARx+piEFs98
         /FW7RD6w4++UDXpinhiboNyJ+7oVBVht/td4F0m8wKYMsgC0YilldRaVR5Z4lIep2HT6
         xMmqTubNzXwouQQNP4u04jMqRhkLpC/2m6DSF8AfnXaXj/0w9TpgdkOi7rslTdxL97Ma
         /hQJamkTb1PqUOAbSgcUud1df/UjopkHqgtcxmRsaDIJlW06ioMh1wfOd5moWMPKor4X
         wEMkYysvyOIBSm+xAuf8bAHm0IzJCC5mg6iOP2EnREfSQGpVHjTIVqXP4zSvQOouT5qi
         QSjg==
X-Forwarded-Encrypted: i=1; AKwUvBz2IfddPxCsoWxzBRM+PpCkxHuCqo5O2TBZxTaLXj0z/ZzJdJ3j+UF+jLiKWKwM71d1jFVk19CX7s8jHXPxaePl6Q==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLEHLVTVJemlFR7YkVNfwn7xPsUJdtUNmOKQzWwvjiZvsMTOX7z
	/HWZuyRUaTez5tMWaaqZ3zvJmTM2a//9bj8iaVcanVCyI9Gq9MtBfoav86yafeQhSrg=
X-Gm-Gg: AYBFou3eAUEa4rVKcYgZApR437GatrduBd0RBS4J+KdN0esoP8Fu7JdG7jkRP5DPABd
	qk3TGzieZYsGPLGpCpr5ghox2w1Ars3yVpnfn5hJv7mvUrp7nDa3sAKy8XzrywSzQufgXeKHAO+
	Vdtmpe0YpMWMcXWtM8kuMG+sg8vLf0I9ZTaseKcPj7MkxcXoDO7utBhBzdxpuhVqyvn834j4Mqw
	NKJrwxN4HyOMMbOK2JTOTB4qUleffbrR01ZRXQg1kcavefRAFZT2LhXRXGsDFTeRVcPUHcNByLz
	hcgZhyUahMv7DhLSqvyhkR3fhmFfFTrCCDGWupriSbA7A83HBWkqxFOFCIretuQZY2k5anyU6BH
	gMjhrngAgh+THG/vdjg3JmuNKGY9a7G2fg5Ccb4G2uG9Hv8M/83cvp173RDJSllX1gLJ/wVU3sN
	BmNFq3NVHIPamj1hcMojVG9++b9IsOUHgDKvlmM0AttkRIPIqX2/zWAql7rjDkG6kGuWIgn/jmq
	mN0BFVmMobusxPBI4m8mwT73s1JHxV82UInhrOCE5epaKi5zR0KgS0TzUpNm2YHkmZdK6v9/a5h
	d2vhimMqY6fuIWJeJOarb8nGd5gFZqVxPlQkwsujqAjwWGMZlvsGtcWGAY68iv3uwFpZ8epQMix
	cf9lsZqa5UEMYY96wq82sNpFeDQPcbLslhRAd
X-Received: by 2002:a05:600c:3e1b:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4a9676d1a47mr50336475e9.31.1793192640637;
        Wed, 28 Oct 2026 06:04:00 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977539ef8sm46538265e9.0.2026.10.28.06.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:03:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Oct 2026 14:03:58 +0100
Message-Id: <DMGHQLTOWJ0S.784QETD8PGOO@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v3 1/5] apr-util: Fix CVE-2025-49506
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261015122721.2278428-1-hthakar@cisco.com>
In-Reply-To: <20261015122721.2278428-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 13:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248813

On Thu Oct 15, 2026 at 2:27 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Backport the upstream timing-safe comparison fix [1].
> APR-util 1.6.4 identifies this issue as fixed [2].
>
> [1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5ea=
fc534ae24b19e
>
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-49506
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
> Changes in v3:
> - Drop the XLC-specific compatibility follow-up patch,
>   as it is not required by OE-Core's GCC/Clang toolchains.
> ---
>  .../apr/apr-util/CVE-2025-49506.patch         | 310 ++++++++++++++++++
>  meta/recipes-support/apr/apr-util_1.6.3.bb    |   6 +
>  2 files changed, 316 insertions(+)
>  create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506.patc=
h
>
> diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch b/met=
a/recipes-support/apr/apr-util/CVE-2025-49506.patch
> new file mode 100644
> index 0000000000..0ab5cf0648
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch
> @@ -0,0 +1,310 @@
> +From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 2001
> +From: Eric Covener <covener@apache.org>
> +Date: Mon, 3 Aug 2026 12:10:13 +0000
> +Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:
> +
> +use timing safe comparison
> +
> +Submitted By: ylavic
> +Reviewed By: ylavic, rpluem, covener
> +
> +
> +
> +
> +git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x=
@1936805 13f79535-47bb-0310-9956-ffa450edef68
> +
> +CVE: CVE-2025-49506
> +Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f77=
a20761cb15686f8d4de5b5eafc534ae24b19e]
> +
> +(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> +---
> + crypto/apr_crypto.c |  60 +++++++++++++++++---
> + crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++----
> + 2 files changed, 176 insertions(+), 19 deletions(-)
> +
> [...]
> diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-su=
pport/apr/apr-util_1.6.3.bb
> index 3a5f52d250..19f8e59ca5 100644
> --- a/meta/recipes-support/apr/apr-util_1.6.3.bb
> +++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
> @@ -13,6 +13,12 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz =
\
>             file://configfix.patch \
>             file://configure_fixes.patch \
>  	   file://0001-test_transformation-Check-if-transform-is-supported-.pat=
ch \
> +           file://CVE-2025-49506.patch \
> +           file://CVE-2026-32327-dependent.patch \
> +           file://CVE-2026-32327.patch \
> +           file://CVE-2026-34501.patch \
> +           file://CVE-2026-34502_p1.patch \
> +           file://CVE-2026-34502_p2.patch \

This patch adds all the patches files of the series to SRC_URI in 1/5.
Please add each patch to SRC_URI in each commit.

Thanks!
--=20
Yoann Congal
Smile ECS

