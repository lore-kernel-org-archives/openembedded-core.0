Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4485.1792492345995322513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 03:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QGoL8CjT;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2534968f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792492344; x=1793097144; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLK0nUSjoonzBVxBYjgWZG8LkU/eM6RH+cXuF/5ptew=;
        b=QGoL8CjTHBmfEvVRG2YXuSI7sDrN2xLLMSexAd9kLHTOaSEZIZ2yBWaXps2nQlKDjr
         r71T8zY3tBcJdJGqEc+ifoz5aIYLeXfYp/XWJOusbAwr48MLzpYptwbgqKcwRMa6QUqn
         uJlfIv6xZJpt+GBUEp53R6Sxc9YrBu4p4A7qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492344; x=1793097144;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLK0nUSjoonzBVxBYjgWZG8LkU/eM6RH+cXuF/5ptew=;
        b=1777iwK+CYhq/KVy8Q8cTJTy9ZUOclvnnMGWTVi8v/xzAWUuKF+FQBIivo1ZnXD3HO
         xpyo4awOfvzZc7kP0mGOUxyEybcX//wIEE9BabvMvJ5g6SVxTCG+Znnz8kMP/1ev2oy/
         RdwBXiR6gqClqL+XEOSRVoiO49ax6mdQi6Eeo7ylmFkMtq1ihqjN6xfhUZeogOqJICFN
         LN8tQojJtoMUmHkkPJATk1Ye9+DWXdyJhv8RQbxbfmxVS3Nz5OT14t+Kv3X5M1810X4U
         ZDFW2Rpf/6P16ODymCSTVgizlh410tkQRVKjsvQP049Dt0kpqIUN/W2Nkldfk9COBQ84
         IBxA==
X-Forwarded-Encrypted: i=1; AKwUvBxphWyFgKovPd2zAuUkM29r2IYzzLlSa2ZCs0HrdA/L71R3l0yCM7nYAn5nkYxcc/+TJ47c0kNHLUcrn33wfuE87w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIFK197WYLStabeHsjZ1Gf4pUxRhHZYzLFviG/Mdi74q+QHPH5y
	yJc9C2kazcUjOlOKsNc4YX6Nq2Uq5RIz3U3V2fBIr4fsKZCPAt9it4/MwII50cfLzsU=
X-Gm-Gg: AYBFou1YcCFuNZUS9PbFWlGWgenvIUv9OcGhp1JHJay8/5mEr7MfrAsHpb5GAAlAB8W
	tVFN+gT1wj4LhK41riQRyBH1f0SClIkn5dTZrGVte+wVlx2h7Qs7HJUtLwGCafeu/P8XAAqakEn
	oSCokudyFbSc4vhRmolM+7G/4Ggx/z7xX/82U48pd2OrqUIu1ERsTEkUdqojeor+/bn/G+IFmU8
	7oM+LmmLcsOAdJ5lPa4KhSwTxQ/K+KgF9ICaBwnG9ncRUSP4DZyXbiILNaMzgnqMCT2iKAbYR8M
	e14ryW8O/kc8QpSL+O+Col5qVtDnpDjAtNRpeUFCV2mbLQ08tpUFASCc+kbptlrrmdaJ+mSvf/Z
	nTtpebKXVHIdNS3ln9dLATaOg8CmAH248IuQhONCh12+ZOP00AaqVJQpIqTA5b1kGFeZJeWW1t4
	fzz2RFHBl+nej3xVJONhzRX3FnHmcZL/XMlp+JOlHdTJin++0ehW8CH6qqUqzT9YVmDf9CFFAmd
	tNLY1jCfVFxJlCjTEBPlpIKsgNEkHdzp9PxS5hI+IVqMjaKAGItG8eoDD6DoVh1kj11Wg==
X-Received: by 2002:a05:600c:c16f:b0:4a1:d828:cb2d with SMTP id 5b1f17b1804b1-4a1d828cc78mr202192845e9.8.1792492343852;
        Tue, 20 Oct 2026 03:32:23 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm66480055e9.13.2026.10.20.03.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:32:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:32:23 +0200
Message-Id: <DM9LI6HT90N6.GDRPKQK30J7I@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 06/27] python3-git: fix CVE-2026-69097
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016054106.210444-1-yurade@cisco.com>
 <20261016054106.210444-7-yurade@cisco.com>
In-Reply-To: <20261016054106.210444-7-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 10:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248270

On Fri Oct 16, 2026 at 7:40 AM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/gitpython-developers/GitPython/commit/1ed1b924f4e2=
d2ee7bab296df77b978af21853f
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-69097
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>
> ---
>  .../python/python3-git/CVE-2026-69097.patch   | 48 +++++++++++++++++++
>  .../python/python3-git_3.1.43.bb              |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-690=
97.patch
>
> diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patc=
h b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
> new file mode 100644
> index 0000000000..fc22c65818
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
> @@ -0,0 +1,48 @@
> +From 00034e1e5eb542542158461c3c542d3bfd3a49f0 Mon Sep 17 00:00:00 2001
> +From: Yogita Urade <yurade@cisco.com>
> +Date: Fri, 25 Sep 2026 03:55:16 -0700
> +Subject: [PATCH] Validate config section delimiters
> +
> +Reject unsafe unquoted closing brackets and malformed quoted subsections=
.
> +
> +CVE: CVE-2026-69097
> +Upstream-Status: Backport [https://github.com/gitpython-developers/GitPy=
thon/commit/1ed1b924f4e2d2ee7bab296df77b978af21853f]
> +
> +Backport Changes:
> +- Omitted test/test_config.py because the current PyPI=20
> +  source archive does not include the test suite and=20
> +  the python3-git recipe does not run it.
> +
> +(cherry picked from commit 1ed1b924f4e2d2ee7bab296df77b978af21853f)
> +Signed-off-by: Yogita Urade <yurade@cisco.com>

Hello,

Please keep the upstream patch metadata (authorship, commit message,
...)
This might be a corner case where the upstream author is
"GPT 5.6" <codex@openai.com>, but still...

Regards,
--=20
Yoann Congal
Smile ECS

