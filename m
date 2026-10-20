Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8542.1792505718531373770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 07:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Aa/Fng37;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so40779485e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792505716; x=1793110516; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfOB61XmT0LCPVFuqOgEKiQ7rkNmGvXPBXL4CejFtp8=;
        b=Aa/Fng37Lqe30T810mU031EmUO6dQQJ8A+m/BlF1a7Eoa00ptqc2M2lVUVidBY1q9y
         PLjUVVAgtVcrA2NlYST9oV4B3nkxJHvirdIq/fZSXM6pJyurQ/tAYcCHQQwCVaa/Atd8
         xLOL+umqF7iBD8m8enKXTukR7wQTTp+sSV1qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505716; x=1793110516;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XfOB61XmT0LCPVFuqOgEKiQ7rkNmGvXPBXL4CejFtp8=;
        b=G5YpqCd8MNCCJRrWh/BUXMtnd11gRdvlUbURUTDkRlciTmwu4kyGRLx3ym1D3vPkA1
         2mDTk7emA5S4a1dQM2QDfuO2c24n/BsanUXzzMBF4GyOM4OWnjDmEhD6sgoc1dJW7v7Q
         qjN3GgKTAauIU0KPRecl0s7fHTWfU9f63nKnP4AQRv0vsq8Ye4gKDC4vl2HOkgPtqop9
         mBog/TvgEHWzCNC9Y+n0NE4nijV7/KTBePWH/wx8yZxtf8acKKVj4WqHls7aPC5rejVp
         6YtnlnhjPVD45jhUWsi+fJojPkkyk8+95doubCSh9wJhvsC5Upbrrnmb4k4QalKqMgPP
         5dqw==
X-Forwarded-Encrypted: i=1; AKwUvBw55RiSwQeqlpM9VXUsp2QomzmPgqL5DKtn/cxAAVlojsmLqAPwNykSLMnnNcJelnY3RwdYtQm7UraG1dce9g8qmw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYK00F9nlofHZA3XmHESfzVeznoDXxMxhMgna5prf6b7N0DqUzT9
	9KB0IHjUYOTpuZ1Kwhaz/dMpyZqtR3ypLZu37772o4XnjbybXxvw0zTzazR/gzUhSLg1sDEiyrJ
	ml24ZuyA=
X-Gm-Gg: AYBFou18kJ+/s6WxdutmWIZj5vo6AWnwcg2IXgE4qFH+zeeAUU2ODoIpF8m1NmuP4EG
	QcBdE/ME+1K67qt5jI0Y24qiPRLHGERewmwS61ZRc0FhbVhtYMwUeDrDut6fNtFO1xmmYavoCJc
	J2+UkTnbVI8D9a67ldSF8LrBs9909XslwDHsBrSyZFZyum09qMSFn/jKeE/1Rz9x6UqX5dE4E+y
	sBjFcH1KjhOis9i4X4NXLIH7XuGygqOvxH51t16F3zhp3BBjzEoViBNwVR3PCkq/ywN8pMg8E32
	qLxEH7kUiCueMC9701w+6ztPcohDTkMFojzj/3TACtFSkmYfiwPN1rsZ3TDhy/RPHcJvhrmiD26
	VVwdXQpLsqmvfaMfgPNMn8GiWKNGIk0AaXfaXcqHwNyt0QpY0k7Tq6eay8eibs4KHp0mRKY8LXx
	xaxaosy5q0mnG6eY0HO4axXwSqrLp+lILq4YITk7tBHaCWdXR/LIBMQUH22kXPdEL0RxGsrpI9S
	wjLenaaHJ+getZWVUIFuFuiYTgFED+bH5HxDDd8QkD5fpIQkXE9PJD6pJg=
X-Received: by 2002:a05:600c:4f41:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a1e0d52a92mr208433975e9.21.1792505716508;
        Tue, 20 Oct 2026 07:15:16 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33155fsm255860565e9.4.2026.10.20.07.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:15:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:15:15 +0200
Message-Id: <DM9Q8TS5ICO7.1APSVWR4YLU7R@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 4/5] curl: fix CVE-2026-82208
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
 <20261019064320.3978613-5-dkelaiya@cisco.com>
In-Reply-To: <20261019064320.3978613-5-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 14:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248296

On Mon Oct 19, 2026 at 8:43 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90013a096=
dedd07a
> [2] https://curl.se/docs/CVE-2026-82208.html
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../curl/curl/CVE-2026-82208.patch            | 52 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-82208.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-82208.patch
> new file mode 100644
> index 0000000000..2c733de210
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-82208.patch
> @@ -0,0 +1,52 @@
> +From ed0338befd1d865a8ea1fbaa90013a096dedd07a Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Wed, 26 Aug 2026 13:46:13 +0200
> +Subject: [PATCH] wolfssl: do not run Curl_wssl_setup_x509_store() twice
> +
> +The flag preventing a rerun was not set when a cached_store
> +was used.
> +
> +CURL_UNCONST an ech string for my old wolfssl version
> +
> +Closes #22689
> +
> +CVE: CVE-2026-82208
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/ed0338bef=
d1d865a8ea1fbaa90013a096dedd07a]
> +
> +Backport Changes:
> +- Omitted the unrelated CURL_UNCONST ECH compatibility change because
> +  curl 8.19.0 uses a mutable ECH configuration string and a different
> +  code path.

Can you justify this? How can I know that difference from upstream just
broke ECH or introduced a vulnerability?

Regards,
--=20
Yoann Congal
Smile ECS

