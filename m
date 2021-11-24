Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00550C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:46:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.6859.1637765192797248139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=79tL3USQ;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id a18so4644891wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pf27nJsQNnMKxJCaX447iYVdDTFP0226j1vNcVfF5UQ=;
        b=79tL3USQnP0nMQtcdcS8MLUYOB4r3PBQbgPyu6QgFT7X3V/tkCXr16XHUTGTNqVp2N
         R8w/4v6J3dJkmizJ5ZHJIs8lnz1Y6LcNvCaOLgnXfT2SkQCv/SUPDhLuICXFOfYYIllZ
         jRgTO4OaeuG9VyQ4pKCKzxorbf2zbohK+DFoa9v7/jzLUs4yakv4e+gTcfiQEpxzzoxF
         rXSkgi46OZS5Kxm09bLFJDHuhq5skyAuduMURM3LpiLhVtp9GxeSiUHzksrjiT+muBM1
         Ykx+8G6DKD0iM3Flye87u0hCKbbuJG02OW5/1nP4bUb77V/UiSJmMZWTU2FJIFETDq1P
         MXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pf27nJsQNnMKxJCaX447iYVdDTFP0226j1vNcVfF5UQ=;
        b=WPFFttJD/1afGPR4sinJHjlqj+AoO7XN1YthyIfM30ArRPSGQKMuJSlssaaODl36DC
         8dvP2t70sT2MJdXd3dRzsms5ckziWfEcmyYIMif4vTKIZONpsp81+n/A7iU+AIVbLF5s
         CMDxbH2cYG2l506kAkFSx/GebISerkjy60y1QiqNe+lpHB4PQy+0Ui1ab6E3hxjru2Co
         B7XFFRQ8c5swE1rGJlQiCwqwsbhmWFUsRn2jRAdKghaXOokF2Pd629f3ufRrtgF7S7lM
         BQ3Gg+hc0LGM7Dp5w59f6+IJQyioJYiOFGL3v82kOmz1FgvKglRtW5sPgW4IsFrnmSUz
         /mfw==
X-Gm-Message-State: AOAM5315hB1Bn/cKpuwhDklGYUdxiqSyRrEGNR96QdLf6dk560BSQK37
	tcDgYuRBnvgV3gqDoosm27Nqj2VBINN9HKKaLhLjrQ==
X-Google-Smtp-Source: 
 ABdhPJwVduTF1+CzT7uu+VoG0SJftvgK6tUgzAygjHnovTtV+DaOmyhOo+tDD4Mo6yrLUvbIY2cHjb6lnfHjXYJcukg=
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr20390556wrq.94.1637765191137;
 Wed, 24 Nov 2021 06:46:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 24 Nov 2021 14:46:20 +0000
Message-ID: 
 <CAAnfSTuyYHJk6BnGMTMq0_QA7wuxmLA5x0_rwN5Oe_kj3Mc1aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/20] kernel/kernel-yocto: consolidated pull
 request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org, ticotimo@gmail.com,
	trevor.gamblin@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:46:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158694

On Tue, 23 Nov 2021 at 21:57, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> We weren't able to even run the validation at all, due to the kernel
> calling pkg-config directly to check for libyaml, which is the target
> pkgconfig and failing on missing dependencies. Rather than patching
> the kernel, I've finally given in and made the do_compile task set
> the PKG_CONFIG variables to point to our native-sysroot.

The correct fix here would be the kernel should use $PKG_CONFIG (or
ideally, BUILD_PKGCONFIG or similar for host lookups) and then you can
override it with export PKGCONFIG=pkgconfig-native.

I see that some bits of the kernel already set PKG_CONFIG ?=
$(CROSS_COMPILE)pkg-config, but others directly use pkg-config.

Ross

