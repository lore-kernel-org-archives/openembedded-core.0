Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788D3CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 13:05:26 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19783.1781096721872970102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 06:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GSQRN4Wg;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso52951245e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781096720; x=1781701520; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atKwJK7cu44yNOt1DWAWMBK3+lnq9E5vyiHfguXW/Q0=;
        b=GSQRN4Wg4juaBAVXGWWviWY+bG6493z2Efcgj/R3lCsuKpbr8Vsf50bcYVmfw+HrW1
         +iWR6TSftIcP16R2lnHDyi/CjEX0zTCqFxgBBbqDglCBOo5V/mWZrrcZtTN9esGRsI4S
         ykzP5nbXGLfgeS0kqaBbUsMyHTg3EOfw7mamA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096720; x=1781701520;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atKwJK7cu44yNOt1DWAWMBK3+lnq9E5vyiHfguXW/Q0=;
        b=qmZ0ANpt6VDgI9mENW5EJdikZzXFvvO1gaNuG6Kqs2bq9JXuo3vh44RuOldY+ZEdJY
         6ANDeZ7bNlakDmrV+InoTxYH2/wt48XhfEyD7dOkU92iXuOg+Lg8d6iinsVMYTXc8jvv
         6AancczB/9aSt+S5iK5S2RZnxmjauma1OIGJeg2FCv9gPUy4ENxiK8ATzjYglp5x6MO3
         HPgnMPObIRat78JP3sayzsDqY7ixrvu6BE9vNqv9jhzZDt7YzsQCkQvmsVWE/LMEnOO0
         D2S9xTQ5qL1qQEB7KqU36zwZI4qg0SSmr/Tk0xtgXZxjjlRJx1MQSCvcoUBAYPKkkKub
         CO4A==
X-Forwarded-Encrypted: i=1; AFNElJ/nvxuo6CuPvbIn6gn9+cqbCMW8ChkDjYxfhPK6AmeddVIEE1Ac8IRiBM7impJSRQJY6SwEGDRFqhpf1eBLGel1jg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywu0GMYvcWyUEjn1P1RZtR2gPnRSh6OPUeGB01l44xvjzjUbEst
	yTEJHqMfkNNYHCsRO+qD5VxEe9u76gSiOHuSkjzrXgbfqk4vmYdegA7wFdzUarKzbcA=
X-Gm-Gg: Acq92OH6WRZ4ZMcwNRbrSV0Uf/hVbqrFtDc0p22GjVTRtEqPPbLveYx+tWfI8owhE7R
	pbEE3KrIpHm2e/TktoKb060HS3nB52MnlryFLpHd8AwqcnbOFmRm4WGTnc6KK1aZ86rlbgGoPrP
	9n+JUVTEGaMNA/hHP5CpEXo4p1ksCyoYnH+l0Lt20zFYU83ZPNVQfgUWtTv/VazyEjVDbbXkzuv
	2+0QkahJbwcUyxWhLAwhllqcUtBANSf5Zz3GPAmyR1tZLO1lty4mihn5wjSeTzktL4iPr74YgsX
	xhZSqA9B4XSrziiVokpbrclZjgNjUdOxsWbviS9Va5NzDXr/zk413Qs2NKrwz2YiGdRox9RyBs9
	fkW0GBFZsMegEr1Th53PeXdVbyw3Of0UYtFlwbOYe5aYg+3cC83sTiW4chQHbrIHsgS1IpeGHKn
	uYlQCTbqMMpgq/hIOUFj8ZxyHWHzfakRGfCHQbMvELvsOBDFsIe8+KnXT6duaFNheok9OrmCcX0
	/K/xWgIS0EFBkH/KU7PjoclB0I=
X-Received: by 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr357491485e9.8.1781096720242;
        Wed, 10 Jun 2026 06:05:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm562974835e9.11.2026.06.10.06.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:05:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 15:05:19 +0200
Message-Id: <DJ5E3D923H0R.27OMYEGWGBE2P@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <yocto@pengutronix.de>, <ejo@pengutronix.de>,
 <openembedded-core@lists.openembedded.org>
To: "Frieder Schrempf" <frieder.schrempf@kontron.de>
Subject: Re: [OE-core] [PATCH] devtool: prevent 'devtool modify -n' from
 corrupting kernel Git repos
X-Mailer: aerc 0.20.0
References: <20260323232008.3456362-1-ejo@pengutronix.de>
 <afdbd1da-826b-48fe-b24c-324e32b14670@kontron.de>
 <DIO7KBAHLD5C.WFRWBJQPZE1N@smile.fr>
 <9ddb97e5-f2c4-46bd-a9c3-ee79b78ab149@kontron.de>
In-Reply-To: <9ddb97e5-f2c4-46bd-a9c3-ee79b78ab149@kontron.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 13:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238358

On Wed Jun 10, 2026 at 2:32 PM CEST, Frieder Schrempf wrote:
> Hi Yoann,
>
> On 21.05.26 10:23, Yoann Congal wrote:
>> On Wed May 13, 2026 at 12:41 PM CEST, Frieder Schrempf wrote:
>>> Hi Yoann,
>>>
>>> On 24.03.26 00:19, Enrico J=C3=B6rns via lists.openembedded.org wrote:
>>>> Running 'devtool modify -n' on a kernel recipe that inherits
>>>> 'kernel-yocto' can unintentionally corrupt an existing Git repo or
>>>> worktree.
>>>>
>>>> The work-shared optimization introduced in 3c3a9bae ("devtool/standard=
.py:
>>>> Update devtool modify to copy source from work-shared if its already
>>>> downloaded") is not skipped when '--no-extract' ('args.no_extract') is=
 set.
>>>>
>>>> As a result, for kernel builds where STAGING_KERNEL_DIR was already
>>>> populated when running 'devtool modify -n', the existing source tree i=
s
>>>> overwritten (via oe.path.copyhardlinktree()) with the contents of
>>>> STAGING_KERNEL_DIR.
>>>>
>>>> Fix by adding 'and not args.no_extract' to the kernel-yocto guard
>>>> condition.
>>>>
>>>> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
>>>
>>> Can you please pick this devtool fix from the following upstream commit
>>> to stable branches scarthgap and kirkstone?
>>>
>>> d383ea37e4 ("devtool: prevent 'devtool modify -n' from corrupting kerne=
l
>>> Git repos")
>>=20
>> Hello,
>>=20
>> I've added it to my scarthgap review branch.
>>=20
>> Thanks!
> I'm not seeing this in your latest scarthgap patch review. Am I missing
> something?

No, I did, sorry: I simply lost this patch.
I've re-added it to the queue, it should be in either the next one or
the one after that.

Thanks for the ping,

Regards,

>
> Thanks
> Frieder


--=20
Yoann Congal
Smile ECS


