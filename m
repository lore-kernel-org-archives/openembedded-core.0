Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C27C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:20:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19063.1784899241425980726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 06:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tj9/cAT1;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f6de72faso3944875e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784899240; x=1785504040; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jjH+bFAP1AiXnfVz8pEDdYCRmVbhN2zKIkDWps0wVbQ=;
        b=tj9/cAT1fnPFK43I1nlW5nJ+F90cZn/kzYyofGl4wlyrzx3aiwfsRgUHaXeq+4sGQO
         yanjzpPPNGK7WlgYfLrxs1P7UMF9LKPztiV6v90B/tO1ZSLJV+H7H7maH514+QmvGRFL
         3xgENWb585jtAzQzg8pwEJnt6ZKgEUyjZCPsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784899240; x=1785504040;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjH+bFAP1AiXnfVz8pEDdYCRmVbhN2zKIkDWps0wVbQ=;
        b=kVbqlmRu+epETofKWRO9yVopVPRoKKD71UwZSrVnRkwX0hQTBiJUiIV14Wah410iGq
         mCcSO9vcrI+jCVaIA37HUXbgtULRTt00c+yCtLH7IdMi+ZCNrqvXrhL9r0277ZCeSd9v
         gwduUnz7LTyw+aPamJ4Rcv7W9FD85nlXHJDgGz2pFlUT8PB1Cyuhnt7yCo+upSz3v0FC
         /SE1ihheuw3sodVa7RwcAzLo8lgLlg+ZQgdFSR8koXir9jX+wQzz98duK+Ln7WIC7F0M
         ojhiJY2dyYtEW1fq+ESR5fpRHnYLB00bZizMRgZbjrcBQQvgAdSpNL9So4LBIlHqDMfB
         nNvg==
X-Forwarded-Encrypted: i=1; AHgh+RqgUTYtpEHvSSSgNpHLh2+TNTuCTYTgAp8PJOypyPkk8URbRaOaksrv34qUSxVO1y28gRIHoz2r54JrDbtiAffnQg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyw+v4BOXm8hfMFnJsWMnyT82QgV6c5luQ6xNfMxM51SQDlVRHO
	qU2YoGoz2WWizzP4ArncLpnsav8WRxrxtZC9ei8Uc/KpT2KRiwm+C+NhA2vxgZbziNs=
X-Gm-Gg: AR+sD12xwuCBqKMfdENRXWHYpUXsNeFf1pwDxQD8izOWTQVvtNiml/NwIK54M8t8azg
	a4Fag4Iyb61269oL4Rl9ve+YnUGaQ0HrJJs6l0V7FY7rmoX+t/QxhReI1VxZZgaz9Wu+32f8ALM
	etbkEpfNVG5YaNvPici7RvS6iX1brKNm2Ok+MBGCqVgKXAL9GUzKOf07XiwYwjj4XtL/LSPVn79
	yZ2SF8lFM7IN4gckuNwXteyZ2n01D0cJJPPhzcoB8nUaQBlF9aFd0udCRU4+KKwp+e1wG7xTcZ3
	yyS6xbozch/oGGoIjINR87iDl/Qn3s1ORXabC/NkrsU0TI37PviVwQsidpjJ8PqKL7rXSte70ht
	GZiYbCR8ytwIBgh8atbDmKTLGLzTjNKi+XVVO/MjBwhjpuLlc3Mt01DGlaLuKlEwoziXJGiM5vG
	PMn2qyqPm+yS+9Y+NNVh2kDk08ZV+ZHIy9uRFnyF4X9R+n4lpoZjtrp/KIJ2xbG8nBkQ==
X-Received: by 2002:a05:600c:1987:b0:493:b240:6a8b with SMTP id 5b1f17b1804b1-49690d6f406mr6387805e9.14.1784899239638;
        Fri, 24 Jul 2026 06:20:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm24851318f8f.3.2026.07.24.06.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:20:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 15:20:38 +0200
Message-Id: <DK6TZ2E526VO.1HT6D097DHK61@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 3/8] openssh: Fix CVE-2026-59998
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720185749.4098075-1-devanshp@cisco.com>
 <20260720185749.4098075-4-devanshp@cisco.com>
In-Reply-To: <20260720185749.4098075-4-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241933

On Mon Jul 20, 2026 at 8:57 PM CEST, Devansh Patel via lists.openembedded.o=
rg wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream OpenSSH 10.4 backport for
> CVE-2026-59998. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79=
ec926221fbe6fcc296d432
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-59998
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../openssh/openssh/CVE-2026-59998.patch      | 34 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59=
998.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
> new file mode 100644
> index 0000000000..a9a13aa70e
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
> @@ -0,0 +1,34 @@
> +From f1fd8585548735bcba25faa13073aafb5f8686ca Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Wed, 24 Jun 2026 06:55:12 +0000
> +Subject: [PATCH] upstream: mention a caveat regarding
> + GSSAPIStrictAcceptorCheck in
> +
> +some environments
> +
> +CVE: CVE-2026-59998
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/8058c5bdb507591b79ec926221fbe6fcc296d432]
> +
> +Backport Changes:
> +- Retained the Scarthgap sshd_config.5 OpenBSD revision identifier and
> +  Mdocdate because the 10.4 values do not describe the older manual page=
.
> +
> +OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2
> +(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + sshd_config.5 | 1 +
> + 1 file changed, 1 insertion(+)

Same as: https://patchwork.yoctoproject.org/project/oe-core/patch/202607201=
75518.3546447-3-devanshp@cisco.com/#40497
--=20
Yoann Congal
Smile ECS


