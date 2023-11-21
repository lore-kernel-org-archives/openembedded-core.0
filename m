Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF53C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:25:49 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.39812.1700573139305738967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCo3DTwn;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c50906f941so74805991fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573137; x=1701177937; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig1KSOrZtacMgS3vwCPHmlpxymqFhAJzFR1Jri1hvTg=;
        b=BCo3DTwnsp1H4ma9I9Eu1S+SOlwvGBLghX+zFAtfL/ZgCieI9yXYJsXxDHGoyTMfoF
         EODsw+x4gGt802PQqmuVtsgjIcMNWLovfJZ4o574qqy3bIPk0bJZ07MWPgYwdIK7gjwJ
         7+XmHQHsa12ThvILQKQYDrKCZU9iJACsokTOV1qexDEvGY2OkmpcfhVCw60yPaxPU0yu
         nEhAAzxQRrxlqD8AQWufTBMTUkqGHdlYi6+vPlEVyos1l+Hz8DvxfSmL+/NZhPdOyJkq
         M5hMhSuBrLAVFtSd53zgHb2YhVXZU6U3z8g4QKnXd64bIETQ6T3JboL6UfL4OQhisOft
         sCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573137; x=1701177937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig1KSOrZtacMgS3vwCPHmlpxymqFhAJzFR1Jri1hvTg=;
        b=e1FXRCZBgDBq5QKQF3x3p0RZWtHPpq9xnL1Y4dQejN5xDfAy9PXP6aN7fC7MfsaBiE
         1g2ongiotjZCkEyvOE3RdqSp6dxhQhMntCyvSdpukEYMYrgmXoqmLU4+pH7wudx1qqQA
         9/mQLaD+a4+2cNxh+I3oN2fD40R4h9swZicaHQMVZkz08xxo4UjvJHD84xnNkYOQaaSY
         36m+szhE35BA+WRWMbD+tAi71pgSP1mJJcot3FTD+/XJHe6Y1xl1vQWmhpzc16tFFwvu
         hdc9n/M0NoOwZzCVM827JrukaGk6HHGwPvHYjVcpJWGPEYVQm2hM7SGTp9dFwT5QF88A
         wfDg==
X-Gm-Message-State: AOJu0YwicSyiFxBTb4pcoabeErUYUKpGMNaUjEUAulNLONTytPAsR9Pe
	Cp0RX2cvLKXbe0vQ5rf/2HmOIkSoIjU4uMhOaVM=
X-Google-Smtp-Source: AGHT+IHULh2I9w5dIAeTIr1vkUdSU2Twa5yqjzHgYbMQOWji3MP/QD7BCoX6VkTVOxR0NaoFZiBc8u4tGWMRX4YUDCk=
X-Received: by 2002:a2e:9114:0:b0:2c5:174b:9a53 with SMTP id
 m20-20020a2e9114000000b002c5174b9a53mr6911127ljg.26.1700573137146; Tue, 21
 Nov 2023 05:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20231121132440.933298-1-ppjadhav456@gmail.com>
In-Reply-To: <20231121132440.933298-1-ppjadhav456@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 14:25:25 +0100
Message-ID: <CANNYZj-qUdiTsLBVsbMhD8+yFoH1RQ5w6uyEUa98LcMZY8Yvyg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ptest-packagelists: Add sdbus-c++ ptest
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com, 
	ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190977

Same comment as for the master patch.

Alex

On Tue, 21 Nov 2023 at 14:24, Poonam Jadhav <ppjadhav456@gmail.com> wrote:
>
> From: Poonam Jadhav <poonam.jadhav@kpit.com>
>
> Add sdbus-c++-ptest in ptest-packagelists to run ptest
>
> Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 5c6a30635f..f8047b27ed 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -65,6 +65,7 @@ PTESTS_FAST = "\
>      python3-webcolors-ptest \
>      qemu-ptest \
>      quilt-ptest \
> +    sdbus-c++-ptest \
>      sed-ptest \
>      slang-ptest \
>      wayland-ptest \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190975): https://lists.openembedded.org/g/openembedded-core/message/190975
> Mute This Topic: https://lists.openembedded.org/mt/102727878/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

