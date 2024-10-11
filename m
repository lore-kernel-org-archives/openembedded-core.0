Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BD2CFC61C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:20:39 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.6723.1728634829635351252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KbnWnPDF;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fadc95ccfcso18695291fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 01:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728634827; x=1729239627; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3mUilXN8RkchzFUVCplUoesVTbJmxlzMXcBm+L6skfs=;
        b=KbnWnPDFLlvdFJ71xRLBNf+CvtICMAtmWZCMOPC+ebZxgbavQQqB9GrBIMzhwQR0mv
         Gc3un4tpPqzY2yIlCXCVS1HXbJBVZm//APFQgy34TW1YGQfrGNKZJCy3JVfOTTbLEHRU
         Hpn4gbNqcDhx4+WvmJPVCrkSU5zXPT/Jl9KDg91H0eB2GxKPyPvq1MMs1HsggmWRbRoL
         VbCBFF5SA5vqRtudV+4Vd0Ep1cQg8WsA9ndcLKoNGvD5GTrHGIzv4eCwvOyctrMH8AbM
         dov7rZ1ccCZEUZmHB+152vahwICfWYPyajQFzkACZddJPmat++jAKQ5WntAez44WW91z
         Fhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728634827; x=1729239627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mUilXN8RkchzFUVCplUoesVTbJmxlzMXcBm+L6skfs=;
        b=MkuUqg/nRHXB8JlctUqIMNwaUYqo6grtvQFs+k0SQ0Vkg2AiM/CHS//DslnVMvXFUg
         gf2GkN2i1i602zV6XlvchZecyJYp0/8fq0+inYh3srRtHmUm86lsqOTOQRp+B7ponxJB
         R8g9rTzFEh8ayxcyfJCj3Oe4WxflTItEcLtR3+WZMzcgcPFOo1O5v2iEhILdW4O4hJty
         QCdpknrgXbNuPoTOyMqhUDnAUSRGumFjL17k5vUqfkqPN1MCwWuJQ7FfUjhMDb1g/6C8
         SsLC95yz9cyTtRFcveBRdY2aq3f3x8cjMiwkFDJ3/gDyy7qQ/2Gzp4pOfjKAB0aOyHqU
         4ftw==
X-Gm-Message-State: AOJu0YwnLpsdenyGSssk5JU1Chk1dwfJfrD3q9Y+WkK1SnukiBQXGb9I
	M5X0iFYaOK8VsCx3pJ+0V5gJ6oyNVbJtDMn6RHn4Woh1XDAJjmtKeZyW7AGDmaT+vwNLlHKfuk+
	LhnqY2vg8s2PIqDaozs7hjkn0PGc=
X-Google-Smtp-Source: AGHT+IE3amxBqUuKu/czAL3DFRIMD56WCmkUBpLabZ3yBzAT5of7xn0mvtzaa8LYRe53++XJIKwhXnO2BvARJpTXQvI=
X-Received: by 2002:a2e:4c1a:0:b0:2fb:2b5d:215d with SMTP id
 38308e7fff4ca-2fb32705966mr6010771fa.7.1728634827289; Fri, 11 Oct 2024
 01:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241011070204.7276-1-brgl@bgdev.pl>
In-Reply-To: <20241011070204.7276-1-brgl@bgdev.pl>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Oct 2024 10:20:15 +0200
Message-ID: <CANNYZj_72dfGm5kOCy43wnAiH1i30GmU8MVrS-txvHbJ8hWh6w@mail.gmail.com>
Subject: Re: [OE-core][RESEND PATCH] python3-pip: add missing RDEPENDS
To: brgl@bgdev.pl
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 08:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205662

On Fri, 11 Oct 2024 at 09:02, Bartosz Golaszewski via
lists.openembedded.org <brgl=bgdev.pl@lists.openembedded.org> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> pip3 package is missing the runtime dependency on tomllib. Add
> python3-modules to the recipe's RDEPENDS.

If only tomllib is needed, why do we need to pull in the full set of
modules? Please add only the specific missing dependencies.

Alex

