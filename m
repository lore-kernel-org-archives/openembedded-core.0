Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4606.1792492664178416099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 03:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wia0WW3b;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1711930f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 03:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792492662; x=1793097462; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYgRj9DziP7YRmsbdxrQtmBg87eGpHSqL7jb0Hrh4eM=;
        b=wia0WW3b8gcsqJ3bRoYMoDtE5QvEpMiMSNxb9FEo/mtFROHe7GsUEBuLqnE61x+PAe
         Bd3ZluLu5lnR5innwLm2FrUuBf4bNJpzhOsWccumcopMCI4xBqusZDnIKOZdivAHfSx6
         ZPdSnD07zrZOss5web3l8Kl+mOIUr9vfEbXiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492662; x=1793097462;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYgRj9DziP7YRmsbdxrQtmBg87eGpHSqL7jb0Hrh4eM=;
        b=eYtzVRMjMXtGT03H451jN+hm72phCdnki6Io6xmYKb8tOsiOPD4GuGDWvXjy+PJcFQ
         SGVxVOnKIeubP3qd7GaNS1DGe8TQZe7eKHY9JXOW2K+e3j0s5GgDcDizwccyPYz+4rbL
         5JRjPE78epBqhKmbwuVYmPLQSmGsucJqQwP33lO8hPRqqD3Um2SchMrwhfTTWS3A7OJ7
         RQQ1owXb11uCyzAQi47qz+vdZW2WUSOzVlteeVTbUA9VWxbxiwb4iFxZlh44uDkkrnkC
         JE+J9gFb3iNJ+DNUdaTbaIR3HhakSYT86F2uOXcfLSajKFfywYyiMCV0rEDhAfhTCRoq
         H2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBytbFFCLZFyULfoMX1DovaFhzqizvezbadUElFucR97ezNNDPNspB2kLe9ntLw5qDty+/O+y1zXZsIhPJVuhd7Y9w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIzdJoSk9x+ewBUywHrXpkV+E+vlvMpTm8muSUGtHTb0FfKT9jO
	XJo2bNsjvsQsrdc8o3/X+0RViDdAbmogRHufCmBAkOv37779EG5a62TxDJ2ccaKFU4Y=
X-Gm-Gg: AYBFou2OAU06ShOv+OddZ5aSg8EcYtNnidCd8g72IKkHLAs/C8t4Rm4+JAm8DhFgHhY
	qm/4bfsOKrKtLD7KE8oNZCKbws+ikAcc8QptCAph6ZNA+mWcRT1JtFjVRSXWu529CF5ZJibIUQc
	X3iVmFjQqZ9exfGg8JdofoB739e0uqrq66LEzPna29x5yhsDCmU6cVk93nTv3zkK8aRacmbuMH0
	SegfBrX6PU/jDVFhF3QlYAS3AEco5QgYYe705nuvmjyN2rTdqETff53Hz1LFG+gRSvL2DF6iKAL
	HalHaQ45CYX38iqkdljB5uIpjLsgH8pjjmUFXWloVt6ZFMqSG+Y3nXeN2bazyGIagjs1ILwxdYI
	Ecvi+lSerplC7GfXoTVphcugb1xzXl0apa4Tb/xObXSL5Wy1X7KD3GVr3HM7WvfH4Z9nf3X7tce
	0F0+l14lMx2kMfcHiGMOX4cJIPKlhqxRlAogfvi4WHk6T/1ytf5hVwh66s2/yyl6mi7LnSz95+d
	LeWZ+50KVaxcVlGXriIKKoHyYvkCZ/mijnrSyt5XWlZLBSrLWBV0K0ZpacoReprCVN/Gw==
X-Received: by 2002:a05:6000:468d:b0:48d:f39b:83de with SMTP id ffacd0b85a97d-48e07b92058mr15616989f8f.3.1792492662077;
        Tue, 20 Oct 2026 03:37:42 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214e1sm5189797f8f.37.2026.10.20.03.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:37:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:37:41 +0200
Message-Id: <DM9LM8QRRKOE.3C49LIEPEZUK1@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 0/27] python3-git: Security fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016054106.210444-1-yurade@cisco.com>
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 10:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248271

On Fri Oct 16, 2026 at 7:40 AM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Backport 27 GitPython security fixes covering 28 CVEs to the python3-git
> 3.1.43 recipe on wrynose. The series adds the fixes as patches and update=
s
> the recipe to apply them.
>
> CVE-2026-78678 and CVE-2026-78679 are addressed together. The CVE-2026-76=
222
> fix includes a regression correction and follow-up patch, and the CVE-202=
6-87819
> fix is carried in two patches. The patches retain upstream references.
>
> Yogita Urade (27):
>   python3-git: fix CVE-2026-67326
>   python3-git: fix CVE-2026-67323
>   python3-git: fix CVE-2026-67325
>   python3-git: fix CVE-2026-67324
>   python3-git: fix CVE-2026-67322
>   python3-git: fix CVE-2026-69097
>   python3-git: fix CVE-2026-73625
>   python3-git: fix CVE-2026-73623
>   python3-git: fix CVE-2026-73624
>   python3-git: fix CVE-2026-73622
>   python3-git: fix CVE-2026-73621
>   python3-git: fix CVE-2026-73620
>   python3-git: fix CVE-2026-73619
>   python3-git: fix CVE-2026-76221
>   python3-git: fix CVE-2026-76220
>   python3-git: fix CVE-2026-76219
>   python3-git: fix CVE-2026-76218
>   python3-git: fix CVE-2026-76217
>   python3-git: fix CVE-2026-76222
>   python3-git: fix CVE-2026-78678 CVE-2026-78679
>   python3-git: fix CVE-2026-78677
>   python3-git: fix CVE-2026-78676
>   python3-git: fix CVE-2026-78675
>   python3-git: fix CVE-2026-87817
>   python3-git: fix CVE-2026-87818
>   python3-git: Fix CVE-2026-87819
>   python3-git: fix CVE-2026-100689
>
>  .../python/python3-git/CVE-2026-100689.patch       |  90 +++++
>  .../python/python3-git/CVE-2026-67322.patch        | 167 +++++++++
>  .../python/python3-git/CVE-2026-67323.patch        | 356 +++++++++++++++=
++++
>  .../python/python3-git/CVE-2026-67324.patch        | 101 ++++++
>  .../python/python3-git/CVE-2026-67325_p1.patch     |  49 +++
>  .../python/python3-git/CVE-2026-67325_p2.patch     |  50 +++
>  .../python/python3-git/CVE-2026-67326.patch        | 108 ++++++
>  .../python/python3-git/CVE-2026-69097.patch        |  48 +++
>  .../python/python3-git/CVE-2026-73619.patch        |  58 +++
>  .../python/python3-git/CVE-2026-73620.patch        | 130 +++++++
>  .../python/python3-git/CVE-2026-73621.patch        |  72 ++++
>  .../python/python3-git/CVE-2026-73622.patch        |  60 ++++
>  .../python/python3-git/CVE-2026-73623.patch        |  53 +++
>  .../python/python3-git/CVE-2026-73624.patch        | 139 ++++++++
>  .../python/python3-git/CVE-2026-73625.patch        |  59 +++
>  .../python/python3-git/CVE-2026-76217.patch        | 179 ++++++++++
>  .../python/python3-git/CVE-2026-76218.patch        |  94 +++++
>  .../python/python3-git/CVE-2026-76219.patch        | 155 ++++++++
>  .../python/python3-git/CVE-2026-76220.patch        |  67 ++++
>  .../python/python3-git/CVE-2026-76221.patch        |  44 +++
>  .../python3-git/CVE-2026-76222-regression.patch    |  39 ++
>  .../python/python3-git/CVE-2026-76222_p1.patch     | 120 +++++++
>  .../python/python3-git/CVE-2026-76222_p2.patch     |  47 +++
>  .../python/python3-git/CVE-2026-78675.patch        |  47 +++
>  .../python/python3-git/CVE-2026-78676.patch        |  54 +++
>  .../python/python3-git/CVE-2026-78677.patch        |  86 +++++
>  .../CVE-2026-78678_CVE-2026-78679.patch            | 181 ++++++++++
>  .../python/python3-git/CVE-2026-87817.patch        | 394 +++++++++++++++=
++++++
>  .../python/python3-git/CVE-2026-87818.patch        |  55 +++
>  .../python/python3-git/CVE-2026-87819_p1.patch     |  77 ++++
>  .../python/python3-git/CVE-2026-87819_p2.patch     | 139 ++++++++
>  meta/recipes-devtools/python/python3-git_3.1.43.bb |  31 ++
>  32 files changed, 3349 insertions(+)
>
> --
> 2.35.6

Hello,

I only review the 6 firsts patches and I already found basic issues:
* Unneeded changes from upstream
* Removed metadata
* Wrong CVE references

I'll stop my review here and hold the series until you review it
yourself under those comments.

Same goes for the scarthgap one.

This is a really long series, I have to ask a higher standard than usual
in order to not spent all my time reviewing it.

Regards,
--=20
Yoann Congal
Smile ECS

