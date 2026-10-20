Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8924.1792506518452497559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 07:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qfOCALgI;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df54150dfso2548607f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792506516; x=1793111316; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k41+wIxKsAmlw4mUxM/+cUcj8upO42lPVKsYRg1NfBA=;
        b=qfOCALgI0hGIfEqQmCZ/RytBRwm0WPiE+lqAP59XXlj45TjMl4N4vaf/cp3wvASGug
         sAnDYhoVF3kwTeDTfNQnVvuYRDqak6k2QUPIaK6gxdE0A7BSAvBilbcWzocYqtAskdzh
         NdDQcx0rUBlyPNhdGVJOT5L1yY6TEhkhXcrW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506516; x=1793111316;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k41+wIxKsAmlw4mUxM/+cUcj8upO42lPVKsYRg1NfBA=;
        b=Hfz8/YO/qcIpR20E54owCzHpVyPJsd2lHVTPyfs1sUnVM/OuIi0794of2NeGkWTUfI
         l/zT70c74C2phfOV2cPeL7SSMgpHa8vOzEfmWZpkRYbEnBl2iugzH4/sNNcCiKdjnLKk
         1/MvexJOSyQKU1T2hIb3ty9far9b/OFvrtwU9lc93FPGCfHZQSdZD2QR9iFXAJPBhl25
         UfkguKZnufARtoMCjwXGcQriHIiNLUuOzTbNtRaqrTCQsqxJA2mHI81zSq8eD38MR8Hi
         G7I1CbrBlpdfEyJpSEg42Bp/T6qp7E7v+a40RemTf95h8P+XukeUv6lqKpT4JZmjiDiL
         P7JA==
X-Forwarded-Encrypted: i=1; AKwUvByCB4cW2bJnTO3C3TRLCZ2joKGS/p4mvOiKhK4ljYPS2A85cUBxxdHN1FM58FL0TmMqM7XpBjHSopTWAjE60hPYNA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYK6Q+c5G+ZtwNKvCAvL+lo3uqjv3qWxc7kYq765Dskry3AA5Lz5
	1aI1KjEeyTtVdQJKxl8kPiCLjqsfFA5dfCUbL5ULWsD4hARdYb2RDNElxjOueHAp0jk=
X-Gm-Gg: AYBFou1m9/gZyuT32Zr6K2XheRLh7suyl2BZELJvAsiFQyaoHx1PEJzLpGNjibzVbPz
	9yBLvx3Xx7riMun4Bn1nov51wYBWRD+BfJOwLYoof4Tzn9mof7fOWcXeyljLsdMzGXaUtVs75DX
	foXuxEWWdREdNnMH42EC1JN98tRwXSSC1VcDwLRPPjindJ7Q5sSv9/BqjdBcdc+oOY1H98I3OIp
	MpRlwx481qQdLxJe9XLSa59no/d4GH5undY3Fgzw66oABa+Z+bzbB1ByCdOLYIkUW9FImypiFyM
	+ZdseZwlxB1vdsW92yuOY4cdtiCAPSjOMm+7NHeQVNeW/fXHrA2HJVeMqeQn9ditQ4AW7i4BSDb
	ZYO6M3iQGab9L5zgwWeyFGPXC81K5yXxyImChanORnoHELgJvVvoBg7ivXJ2o0PENDF/ny0pUtS
	tGvci1ua5j+1fWnvB+dYaFmeG2llGkeUdPRNMpwoS1HpoOexV8wQ+o5p+Pd4loUvkyuQAr/lp+L
	htXnyEO83K6l/KHuC/a6Z8YPLhqIV/bsaWrqm5tQ7rCWrfb2spoJ1tfIIo=
X-Received: by 2002:a05:600c:19d2:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4a1d76262e1mr231443905e9.31.1792506516216;
        Tue, 20 Oct 2026 07:28:36 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d57ef7sm93421395e9.11.2026.10.20.07.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:28:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:28:35 +0200
Message-Id: <DM9QJ145I5YK.336GF2F2ZKSIL@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 5/5] curl: fix CVE-2026-80231
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
 <20261019064320.3978613-6-dkelaiya@cisco.com>
In-Reply-To: <20261019064320.3978613-6-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 14:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248297

On Mon Oct 19, 2026 at 8:43 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Apply the native CA connection-reuse fix [1] after CVE-2026-11564.
> Store the effective native CA setting in the primary SSL configuration
> and include it in connection matching and cloning. Update each affected
> TLS backend to read the connection setting using the curl 8.19.0 layout.
> The upstream advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7d=
cdeff42
> [2] https://curl.se/docs/CVE-2026-80231.html
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../curl/curl/CVE-2026-80231.patch            | 212 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 213 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80231.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80231.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-80231.patch
> new file mode 100644
> index 0000000000..dd58c6c544
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-80231.patch
> @@ -0,0 +1,212 @@
> +From 7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 25 Aug 2026 13:47:11 +0200
> +Subject: [PATCH] vtls: move 'native_ca_store' ssl_config_data =3D>
> + ssl_primary_config
> +
> +And include it as key for connection reuse matching.
> +
> +Reported-by: Stanislav Fort
> +
> +Closes #22668
> +
> +CVE: CVE-2026-80231
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/7be1e70cb=
6bcd83e130ecfe8cb91b6a7dcdeff42]
> +
> +Backport Changes:
> +- Moved the SSL config structures to lib/urldata.h and matching,
> +  cloning and option completion to lib/vtls/vtls.c. Curl 8.19.0
> +  does not provide lib/vtls/vtls_config.[ch].
> +- Omitted the ossl_apply_session() hunk because curl 8.19.0 has no
> +  corresponding session-verification path.
Can you provide a proof for this? Same as a previous patch in the
series: I need to be convinced we are not introducing a vulnerability by
omitting part of the upstream fix.

> +- Retained the older GnuTLS verification layout and helper names.
> +
> +(cherry picked from commit 7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/urldata.h      | 2 +-
> + lib/vtls/gtls.c    | 6 +++---
> + lib/vtls/openssl.c | 7 +++----
> + lib/vtls/rustls.c  | 2 +-
> + lib/vtls/vtls.c    | 8 +++++---
> + lib/vtls/wolfssl.c | 5 ++---
> + 6 files changed, 15 insertions(+), 15 deletions(-)

Regards,
--=20
Yoann Congal
Smile ECS

