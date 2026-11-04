Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20203.1793827199995876039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 13:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=W0b23/cu;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so7334635e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 13:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793827198; x=1794431998; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ohY3dWO7bwIagoWaFFF29x5pm8kcUxHDltUVrQGm9cQ=;
        b=W0b23/cuROmKNUS4kp4Yxh8QXxqllIJ7LBoicx2cufE8vlGRK0AZ7PCUGbGGwvrR1O
         gKzlgY32eDsoNBdiuALHQIPfl30QL65SQe7jgyF1P3Xl6av/Tl9WAdoZrBdFWzJYeIi4
         C6l8+0ezgRu+5I0vsePJiuOTOC7Cr0rkMXKMYdBwKhHLVgX05MrUTjs8UbdYfUmz3CbG
         uqXlrj3zfeT9VkYHlS+0CKZpdAugRzipbNlUzeZ7rjwrpY8Bcxd5swGxBOmYP2yCzUGQ
         egaHHsxsahj536UxtK7W6bwjlZgUyUh59jCNosPva7eKl8mF3LA5mhMHNQZsENI/iYdb
         1w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827198; x=1794431998;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ohY3dWO7bwIagoWaFFF29x5pm8kcUxHDltUVrQGm9cQ=;
        b=Xnp42uLisPBX8wLHo/ycyJcD9pMhHrIgDamMTXjq71oKIqLM0x7O54cTlOIDNdSaxI
         Y5qDMWXXCzHyMkq2P8bh4bxT9WkZVvAEagLVhtci+DzCcq+lT2W5edK4RCiPDlOS7h7x
         iK322CAH2RKG/txatUgXuRDpHjjV3tRV7FBK0QmVKMnRqt5lIo+E4+bv0l/r+kW6Le9h
         ROgHuKoJjq5ty5rtJEM7odJoTTqamuQgba/7GhbZXEheCPClsNFej+eQO0L7U8coKe9Q
         Os/gH5dTyrPCIs7P4BEWcELp4NCgYcAgtIN0mPb466io9w0MYm5ZEnQFav+glcN5K1qc
         ezKg==
X-Forwarded-Encrypted: i=1; AKwUvBzZd8LWsSo51fRzZ8zQ9MZ9yHw/P16QiL1NExBBrVQxr5yzLpXJw4aX+C+/I2tkjw+2/PLT9MdkG1Sz/Dl7sBoY+w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z86TIrV6eGXZVHeOuOLW1EMTLNQ3PerFs1TmrEkdgi0sC30Nc7Z
	icp+lqk4Nehjq6WYVWYPDS5ztKsLMywMD+b4YaanJ278eGRl4id/Ig4doR2I0h8RUGE=
X-Gm-Gg: AYBFou28tXWecC6p9fUFtqm/QQIthV7KBexm1o6rFTuSlLJkKF9xunKWp4JQCE9OQhu
	bFMV3xdsyY2vIYpRm9mRrUGkaFDyXAhdjLZp8H/P1zcNPCb5uJSNMho4/6SqxFmo544BQbAZIgt
	Y4gyS20jNWZEfvzOxPnqDjOYerVUhcVozyzdScNMZJpnJZeN9U+YpAlxTq+AMwZSyDgGYp3h2g1
	Gz0wJypF0HeGmRQkXUTWzGsiZXttzDSALyB5dgzoc2dw4AC2wulCVQEAyf9QzC/bWcvK5w9481G
	8G3tguUWRP+kpyrHTUMsBCtoGLqUcRKa8feVGI4+jpqRmBaLFzAM5F0mwFliLOoADZpZCzOgyEW
	ftpLclh+56/ad1h5PzUC+FwN5nr4ObcYKEI6Clf+LPBezBJaW89O53Kr7Hd9ivTV4jiJKqsOarG
	pZoontygOt9vTyayAmHe2jOue33IJS3OdLyOqRfviVV1r9EEDvaSU7PHP8k+q3v+hvosnX23x/e
	f6S+/fC//m82VVFqvCkP0+azCxB3D9IqZaTG76QskJ3VLjWhJRwrqcjME6WE3Fb59yr/su9Md7/
	XsEaTjInADxVRB/cAg7K1JYFx8HCsEUkShVM5ydWSsmTT2Y6TTyOj7c/L5wevfthyv8lR41jbY4
	MMz+k9VdWgYzcFlTQ
X-Received: by 2002:a05:600c:6099:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ac180f2ac5mr356951565e9.16.1793827198213;
        Wed, 04 Nov 2026 13:19:58 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm5765986f8f.36.2026.11.04.13.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:19:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 22:19:56 +0100
Message-Id: <DMMQO5OTJXPD.WW6MQOZ8JTK2@smile.fr>
Subject: Re: [OE-core] [PATCH] musl: Keep clang from raising spurious FP
 exceptions
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261028051959.2975770-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261028051959.2975770-1-khem.raj@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 21:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249412

On Wed Oct 28, 2026 at 6:19 AM CET, Khem Raj via lists.openembedded.org wro=
te:
> With clang built musl's math code assumes
> floating point exceptions are never inspected and speculates FP
> operations across branches. expm1() then evaluates both scaling
> multiplies and selects one, raising a spurious OVERFLOW, and libc-test
> math/expm1, expm1f, hypot, hypotf and sinh fail on qemuarm64.
>
> Pass -ffp-exception-behavior=3Dmaytrap from musl's configure when the
> compiler accepts it. GCC does not accept it, so GCC builds are
> unchanged.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  ...p-exception-behavior-maytrap-when-su.patch | 46 +++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl/0004-configure-use-ffp-ex=
ception-behavior-maytrap-when-su.patch
>
> diff --git a/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception=
-behavior-maytrap-when-su.patch b/meta/recipes-core/musl/musl/0004-configur=
e-use-ffp-exception-behavior-maytrap-when-su.patch
> new file mode 100644
> index 0000000000..dfff81299b
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavi=
or-maytrap-when-su.patch
> @@ -0,0 +1,46 @@
> +From fe310a5e2fe6be3c28f800bde383d7df5aac4b49 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <khem.raj@oss.qualcomm.com>
> +Date: Sun, 25 Oct 2026 21:54:26 -0700
> +Subject: [PATCH] configure: use -ffp-exception-behavior=3Dmaytrap when s=
upported
> +
> +The math library relies on floating point exception flags being raised
> +exactly as the C code would raise them. GCC keeps that by default
> +(-ftrapping-math), but clang assumes floating point exceptions are never
> +inspected unless told otherwise, and may then evaluate both arms of a
> +branch and select the result. Built with clang 23 for aarch64, expm1()
> +computes both y*2.0*0x1p1023 and y*twopk for the k < 0 || k > 56 case
> +and picks one with fcsel, so the unused multiply raises a spurious
> +OVERFLOW. libc-test's math/expm1, expm1f, hypot, hypotf and sinh fail
> +because of that.
> +
> +-ffp-exception-behavior=3Dmaytrap tells clang to avoid transformations
> +that raise exceptions the original code would not raise. GCC does not
> +accept the option, so tryflag leaves GCC builds unchanged.
> +
> +Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2026/10/=
28/1]
> +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> +---
> + configure | 10 ++++++++++
> + 1 file changed, 10 insertions(+)

Hello Khem,

I think this patch (now merged on master) is a good candidate for stable
inclusion. But upstream seems to have rejected the patch[0]. Any advice
on what to do regarding blacksail?
Merge like this or wait for a fix that is accepted by upstream?

Thanks!

[0]: https://www.openwall.com/lists/musl/2026/10/28/2
--=20
Yoann Congal
Smile ECS

