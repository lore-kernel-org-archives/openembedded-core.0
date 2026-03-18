Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9893C103E164
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 11:07:54 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11590.1773832067920667440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 04:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Twbffmgi;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so6608822f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773832066; x=1774436866; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRoLePQ9KrGst6D87DlAXMcokWhvz+VmNmBmiSEHU5E=;
        b=TwbffmgivO4DWkFTknWnaX3/56Hy5Z3jOU9MGbTKK+sx3a79U5X3pLGr/5OV+rI7aD
         D7dqQTCG5p8b0ZtXzOp3883aINIVdMejbssfmAgPQLzSb1oiPbujXy9ov0eGfG14HMc4
         J9psJOJilDd2PmB0oNKUbLfafvf52ksLF8vEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832066; x=1774436866;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRoLePQ9KrGst6D87DlAXMcokWhvz+VmNmBmiSEHU5E=;
        b=q1SYBzOiEnxNIsSsmjddw60N74HhaF7BUYl6Rf/QNNvVnoqpEXyZCNHeVdFsiIojq+
         hf0aZxKGIo/jVwQtAIvH4lxb58c/O0ySG5LqVS2v4Gr7PkgfgoqDmgi/hpZkmEj/hg0q
         j/bpzQR3kC3EwQYM2sP9zpxELlk9gGSSZredfU6qSaa4B03FSHuXRslKRAZ7S82cLnit
         ltWs3xdDrZg1Q4JsjIBpiHQIFrEzWYNfBsJoaMxT+8nvYgrj4mAKqcnVBBzoIgJkhrZ+
         R7jtCCxOmhMoqatU0s8QHW+llfOQWZCVBt0/+DLPcCKkQw+zA4wIMrijwpxuuS2Bg443
         mIPg==
X-Forwarded-Encrypted: i=1; AJvYcCVvCso0Z0WMVVvWItOBnEYTuqeHLcRyUHe07qSSywgPd2k9KJMVRbKKDCOBAc7SHfV3CZiofqhLXsJwcOVz5KgY1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4KOi74+cZUQT8Zu9wr73IMjsegbtOYzOtHgCe2WmKosG0akoj
	lnSFbo8NOiBgQ5zHKYnMrP0ul3c0VtD//MZzR4RAfMrMv1fm2Mwyf6m8grFfaOgljIo=
X-Gm-Gg: ATEYQzyqPzFBbAeSRsmU3glP4mw0RiIXofMg5Dc4bPIZlcxIzqBtTe67+fQ7UGaujB6
	3+PMhU+LeA2bNkvBwiK9qCUkpcPFHWuW5EG2j3cDmBxXyKefGWDcnSHxsRz7AB8ALPyqjWgapkm
	brrzfst7Ojrl4vbWFsgsGTdovHe5suMYnItqPe+mjwTerFdlbQfe2G+OTklcjNc1LnfAh0bKA1f
	LKIk6SjHXpSydUKVpzTfyrB06xCFJXokM8TM537UsbjarwgV+2pwtr0yAUwV+I95de6nIzaWskV
	gqUsUNBFfKqbEM45xzAiC/akIl2oi8xNZhR/1B6bAHhYZGLElvLGUhaUklQBbfv6PHJqMjwtV5S
	SIiW70z56jLEEi/F9tvRIQG01dkUYO4NfQRn2sYaW7vrCd9Cg+rWy/ajnRBsWfCVwOyiMFtCcsk
	HEBlaQ7hu/fgGlLGHio8aDI0a2Q2tzLPNSdYdORpaIqiyRyx/FBH+sMOc92oOvdrwE9bqLlTfY9
	FMxiJCbZNg=
X-Received: by 2002:a05:6000:2884:b0:43b:45da:f296 with SMTP id ffacd0b85a97d-43b527a0953mr4683133f8f.11.1773832066223;
        Wed, 18 Mar 2026 04:07:46 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm7508309f8f.5.2026.03.18.04.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:07:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 12:07:45 +0100
Message-Id: <DH5UZL3U1MAB.1SVC41PGSAO8X@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <vchavda@cisco.com>
To: <hetpat@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrect
 CVE assessments and runtime warnings - cover letter
X-Mailer: aerc 0.20.0
References: <20260318053906.26606-1-hetpat@cisco.com>
In-Reply-To: <20260318053906.26606-1-hetpat@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 11:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233379

Hello,

On Wed Mar 18, 2026 at 6:39 AM CET, Het Patel via lists.openembedded.org wr=
ote:
> From: Het Patel <hetpat@cisco.com>
>
> The patches address the following bugs:
>
> 1. Incomplete CVE Assessment Details: Currently, the `detail` field is mi=
ssing for approximately 81% of entries, rendering reports unreliable for au=
diting. These changes ensure that the rationale for a "Patched" or "Unpatch=
ed" assessment is properly recorded, allowing for a clear distinction betwe=
en version-based assessments and missing data.
>
> 2. Runtime Warnings: Corrects four instances where debug calls were missi=
ng the required log level parameter. This change eliminates the runtime war=
nings that currently trigger during every CVE scan.

I appreciate that you trimed down your previous try to cleanup CVE
checking code[0]. But I still feel like it is too intrusive for stable
inclusion.

Can you please provide examples of some CVEs having "Incomplete CVE
Assessment Details:" so I can understand the problem?

> Testing:
> - Applied cleanly to the current `scarthgap` HEAD.
> - Verified via a full CVE scan.
> - Confirmed that all existing CVE statuses are preserved with no regressi=
ons observed.

Can you provide output (log+json) both before/after to verify this
claim?

Thanks!

[0]: https://lore.kernel.org/openembedded-core/20260220053443.3006180-1-het=
pat@cisco.com/#r

> Het Patel (4):
>   cve-check: encode affected product/vendor in CVE_STATUS
>   cve-check: annotate CVEs during analysis
>   cve-check-map: add new statuses
>   cve-check: fix debug message
>
>  meta/classes/cve-check.bbclass | 246 +++++++++++++++++++++--------------=
------
>  meta/conf/cve-check-map.conf   |   9 +
>  meta/lib/oe/cve_check.py       |  74 +++++++++---
>  3 files changed, 197 insertions(+), 132 deletions(-)


--=20
Yoann Congal
Smile ECS


