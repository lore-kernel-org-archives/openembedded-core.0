Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58253.1795453413485796387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 09:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oj8yA0g5;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso33570445e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795453412; x=1796058212; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfX/JJ8BRptBC5WyqRyObd1ts22nAcHEi6urkkOEjwU=;
        b=oj8yA0g5cUHh5oRV/pfEaQykzaBg8pMZtcPhS35zKjTJRGUs1QWS8bEjWNMsGb2ciL
         BFVjFfo+JLItSAB97E+tO6RqCX6RVPNdyIqe3SbjZoxNStRT4FGO88i7Bya0hlZC+maQ
         mPMuJwrguX56DWCt2QnzF5a3COY3xLVPGWp7z809y2ibblaYlxfWUTkGHY99U8pv8qi4
         ig7mBWzf4RK5v5Uu/xPpkls4jI3cWxmv2ASsGfjEqXe+Md8D5SxEgGf3HUwXNTQq3cux
         0nuV4DCAhnOF0WeXTbtKwg6o9PR1xQ/nlF/swdOu+VJi96OQxLDbHzlGkcquU5ORVoca
         96mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453412; x=1796058212;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfX/JJ8BRptBC5WyqRyObd1ts22nAcHEi6urkkOEjwU=;
        b=wAnPgwUIdQGZIp7I7zvvBFqCFwNLjDeUyGdl4bG6thOilY3HnMTQUnigOU1/poVoMK
         wYIUH3Qbpy79/E3+d0YrQkNS2FSg6EeaJZm2Wj2UC/Ech6dD2diWlDvZGbDjas1GYaA1
         4A32cDMcTDIP+bIO3Yiqmb5ucyVSpZtyMNx6N28QzTSiZrOd7TK4zJfVU2NBaeToZDYP
         j3VHUHrEMr63bTEbXb6vWg3DBpvZzcznjScuU5iDMu2j9dXYjN8TQy+XZShiize/uEg7
         VJ6mIIXS9cNXJ7VDfjBAMPwX0E7fRDb6Q6G9J2Cf+28l+/f8aNLMUrMcoK9IwQ9JCAR3
         5+ZA==
X-Forwarded-Encrypted: i=1; AL+hErFC14/vM2KNGpEVoUUAcM9g2whYhhdXpEOJw3V3R+g3KwIg+/YKCsdAoLk2ZG5eQ66SEo/qamXhe+7sqheL4kePZg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+6ZMzVbcnWr4AbrTTKG2o38fhlPyxbc9didNfCLHxiUmP1DcpV
	fqoH0iiQz16HGWW6LsNSaydsW3QBoBAXrMXDJvShCKPyGgzz+bAb7jQ8vX7fHPvgyzI=
X-Gm-Gg: AZFdTZfu6Zli48Aa3vPDMDjYf4dvMvXYuzjZB0XvAOvzGBsYF9l2TCJIha4chCjxGY2
	D0+rh0fVhwA7G4Oh74qPvkEILWY9BVxA9/4KvMLpxDmXrzUTitL/O3pbAtCuOONaeSEl/X5TS7l
	rXJ19EPZ8VKJIgH+15kEIWTBE6iZTQC8tkTwJJ/LCk2i/nPvvSbIFoYxsOMq9lvwpPXh/9RQ4TX
	p8EPfPG7LUAcjl5RvDCloDIDRuH0OoAeFDuKOAn1Wage2Vw5XDnP7gHDHm0Nduk3YGLwAkFuyyx
	z6fMGOzZ6FmK3ukIiioPJMjteWh1Ecvw0w1G8Y3MZ1vMx5AxeYEp+XxGJ2lAYRZ/aZvjESGbQF6
	8Zaf2EkEpFdXNtopxAsNkJsjKMXaid6JN9YEJS0IC5KIJYi7EYQURSNJmUP29B7xDwv27zjQmtb
	v0icPmpaXmlOQM3+DmaR2qbMFxylFLTFePZNOOu8DfZO4lNXB2cMt2teaDO0LjQuLhtoQYfp8/U
	VTAgVB4JAO8W1+0yAJysNeBIZYeWPvDC56U03sY9YY/4Z2WKKvRpoHYLB25Sc5YA8lvnoyE9Gre
	IQjnxbqRwj7h26MaaZPPKkEchvqFGUkTCpcF6YneVjZzHuHJhNMFbYkbhEz59MyU9OOYZpdeYfU
	bLA6ilAWXbigWiI2uGUy1bRXcrnwMt6ADGHc=
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr255078365e9.34.1795453411652;
        Mon, 23 Nov 2026 09:03:31 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm538883455e9.13.2026.11.23.09.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:03:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 18:03:30 +0100
Message-Id: <DN2R468NTAL9.2NXZ7MZO87AV3@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 06/12] curl: fix CVE-2026-92386
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261104073627.302002-1-dkelaiya@cisco.com>
 <20261104073627.302002-7-dkelaiya@cisco.com>
In-Reply-To: <20261104073627.302002-7-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 17:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250927

On Wed Nov 4, 2026 at 8:36 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> Include the upstream correction [3] to accept every cookie-jar record
> that curl can serialize. The original MAX_COOKIE_LINE + 48 allowance
> is too small for long paths and domains. Keep both commits in separate
> patches and include the test1902/lib1902.c regression coverage.
>
> [1] https://github.com/curl/curl/commit/445aa87e13f91c94bc742f54343a2eac9=
24e1765
> [2] https://curl.se/docs/CVE-2026-92386.html
> [3] https://github.com/curl/curl/commit/7d64440abba37e3d8039fe663d3edc84f=
582ce92
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../curl/curl/CVE-2026-92386_p1.patch         |  33 ++++
>  .../curl/curl/CVE-2026-92386_p2.patch         | 146 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
>  3 files changed, 181 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p2.patc=
h
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch b/met=
a/recipes-support/curl/curl/CVE-2026-92386_p2.patch
> new file mode 100644
> index 00000000000..4228387ae63
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-92386_p2.patch
> @@ -0,0 +1,146 @@
> +From 7d64440abba37e3d8039fe663d3edc84f582ce92 Mon Sep 17 00:00:00 2001
> +From: Zheng Yu <dataisland@outlook.com>
> +Date: Wed, 14 Oct 2026 18:13:59 -0700
> +Subject: [PATCH] cookie: reload complete self-generated cookie jar rows
> +
> +Closes #23407
> +
> +CVE: CVE-2026-92386
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/7d64440ab=
ba37e3d8039fe663d3edc84f582ce92]
> +
> +Backport Changes:
> +- Match the two spaces before URL in the deleted CURLOPT_COOKIEJAR
> +  line in lib1902.c; upstream's deleted line uses one space.
> +
> +(cherry picked from commit 7d64440abba37e3d8039fe663d3edc84f582ce92)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/cookie.c            |  9 ++++++---
> + tests/data/test1902     |  5 ++++-
> + tests/libtest/lib1902.c | 39 ++++++++++++++++++++++++++++++++++-----
> + 3 files changed, 44 insertions(+), 9 deletions(-)

Hello,

That _p2 looks indeed like a regression fix, it needs to be submitted to
blacksail.

Regards,
--=20
Yoann Congal
Smile ECS

