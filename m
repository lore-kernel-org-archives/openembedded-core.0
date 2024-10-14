Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09474D16243
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:21:36 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.52643.1728904895309577919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IxnsLMH6;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f7606199so786285e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728904893; x=1729509693; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhYHDc1CtNkm8+XnSFtM6DONT5VpKYNcUDTMPDLwOuA=;
        b=IxnsLMH6HfOWgV3FI3Dybo6e9/vz2AZDVWMLVNvaqu0F+0Z9EqFUtV3MMIuYAd+V7R
         tKB8vx2hVG37r6RO/4EZ9NEhAa8Uqkdqp1vZR7tAhaXZNctvUgLFny0SJweKMyeeaR50
         mwCpf3qf+GA4MVUSw6v1Zio5S2PEyRKbuNJ85coPqN4eyq3PiSCap5Npu3VhDeFaq3m1
         1USjk4b2sxisyYnaKFY1/X+dpOlt4cqJm99VQUsigkfvb4lwJacSYaDq2Pm4zG31txEV
         6QCBKTsFrMPwYD46sMVjl0cnRiClylyFrQ564AuYelzws6bZ17e1557iUjcc+HWZCi6S
         r5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904893; x=1729509693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhYHDc1CtNkm8+XnSFtM6DONT5VpKYNcUDTMPDLwOuA=;
        b=UpFrTffRL1oYH8NxSL2iDh3Gdh6gTQUbzyZpgXRXuvHevjaiwWPgBLI9Q0yrlWMZMZ
         KlcGTExMMZWMWmfnLkGWaVa7Z87AZejxaQAwvwWxnzcV6VhARMJ8GFBjFvyZYzly8a7o
         AEMLNHg3HrwfGN4ey7L1/McZTVn3Y5g7faXYirRmn4h4w6gi1KGXHGLwy3g08V4IBDfe
         ZgP9RBzbFnZ8mIgg6WLJqpveaPCi73N+vcbpYvjaYi2iBTZKQzsQ8YI1r9pVNDd7fBH+
         DMXdKyvmEsabmhQqcoJJ/lRqZphS9Ln5QPJ/DZbaADGNBjc7Muzi9cyGGszLvPGpcjTl
         0IrA==
X-Gm-Message-State: AOJu0Yz321FZE/vOVmZAzepXbZvZcEPhookRxa+AviOkIqWEQZaJlK1n
	xIu/sDhNUkESfJ7WY4ZS3hfVP0DOJkzEv4Qnn8Jb0KaBlYoNZW7X43W3s8w1lX8=
X-Google-Smtp-Source: AGHT+IGKoHV7231GLabe4AFgX4XRV9CVE2VIjkxdM7qd4o+CAvWfJUH7Nl1IRqASVc3QQOGemM1Qiw==
X-Received: by 2002:a05:6512:2808:b0:539:f961:f485 with SMTP id 2adb3069b0e04-539f961fae2mr1067233e87.29.1728904893358;
        Mon, 14 Oct 2024 04:21:33 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ebc799b8sm685193e87.2.2024.10.14.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:21:32 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:21:30 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
Message-ID: <Zwz-urTA8Jj69agg@nuoska>
References: <20241014102817.40298-1-mikko.rapeli@linaro.org>
 <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205752

Hi,

On Mon, Oct 14, 2024 at 01:05:51PM +0200, Alexander Kanavin wrote:
> This doesn't quite make sense. Why is the problem specific to .pyc
> files and not other files ovmf installs?

I don't know. At this point I'd rather remove all tests in uki
support which are causing so many issues.

I tried to dig deeper into ovmf native but it looks like a mess.
meta-arm edk2 doesn't compile anything for native but just installs
the python scripts and gets away with it. Same did not work for ovmf.

Cheers,

-Mikko

