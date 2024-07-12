Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D75BC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:05:21 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.3637.1720775100920346238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZg2IkQL;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ee910d6a9eso13971081fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720775099; x=1721379899; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns9ZC+255VCrgd0X9E/M6Qvyby0JLdG7HPykrVVmvJ4=;
        b=fZg2IkQLmYRzI/sUEU4eZIgk9vukxhET0JzFuvqZTuf/NnX74bGA8OLBbvTBY5s1s2
         /Z0i5onLFV3Sf/L4uoTOBK1tCFUzb4I6iz4ncKNPCdM1Rw5mdsCItHeOF3x1Lz4mtJy9
         Ix3Q4lQi8tDI7SUv0fpPmPW+L4tBlhYoqhs3RCmif5LJFvrDtJc5ozDEbmxkY//Zl1iG
         yb6EriKSdiVD+BhsnRIzSTdkyUOL0St7mZyOzxW3QS8Q++0vGnoqLEx8cP8Ia+6V/KVX
         gPT13irTg8/oSK9/kFnQjb2ErUvL3v+BvhYTYvn5AcsIeqiY+55ApWrjGRy/gW6kp3aO
         vlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720775099; x=1721379899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ns9ZC+255VCrgd0X9E/M6Qvyby0JLdG7HPykrVVmvJ4=;
        b=QCo2Z5HAEHxLlNBhJnnQeKxgR/SrZfh9ACwiKTbOqfq8t+4FueyudzmncltigWt0mR
         /d2hJJqQV4QDnx5juU8+JTn0dD7iBb/qaazvzbxTTVnOEVP7ctyaA/1Cr8qOR5SqhRGC
         i1EiD9Z0wkzFMrvH//jfY7kqG3vHJDpov0Z/s5Kgn7poqdrjAghP5M1p3S/vEhicARC6
         /ICPUH2oflSbFMnPnwTTDavMCemr1t7YKPKe0NBkwDuiEnhPX4OdaKLGfOSe4mHNVIAu
         BZWJxozP/1tGq0hSiuxubhGSHGO3qjCxQ32ZljlRSL4+uT7DNQD1zyOpeo+DTvNK50XP
         rFNA==
X-Gm-Message-State: AOJu0YxPG/GglNPeTp++DJeB6akOiT41rhMos4aU84X0wOCrNaF1Fmpn
	QS+Uql9HtCE2kLNVki9sPlk34Ex5TiyYEbowZMRWalP4mSH8s9ItOBVgwidWKT8BJjQSpbdiEoo
	eNEZjUC+8X+6Z37zNLQbNNUCo77M=
X-Google-Smtp-Source: AGHT+IFYxEqH+hPYRBk0B7Uj9RSXZxreTrd6MXYCBbuME9nuTcX6LSNyOO8lQGiIk9jIcezDvAhvqANYUu7SI8Z93es=
X-Received: by 2002:a2e:701a:0:b0:2ee:7b02:7fdc with SMTP id
 38308e7fff4ca-2eed57c5202mr3440191fa.20.1720775098888; Fri, 12 Jul 2024
 02:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240711234203.3841594-1-raj.khem@gmail.com>
In-Reply-To: <20240711234203.3841594-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jul 2024 11:04:46 +0200
Message-ID: <CANNYZj8u7dMXZab6dHYfp0wdtRrimYBjeAdep+4n14KQEqJ7kA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: Add packageconfig knob to control
 tegra gallium driver
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201814

On Fri, 12 Jul 2024 at 01:42, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +PACKAGECONFIG[tegra] = ""
> +GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"

Why nouveau as well? It's already enabled elsewhere.

Alex

