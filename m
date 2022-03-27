Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29EDC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 10:24:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.4365.1648376653411947006
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 03:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=48cCtbhs;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id p189so6761122wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ovi9uD+36QP/Rq/kw5TX7VboN+hR/48bQhozyZz48EU=;
        b=48cCtbhsWdiKQDxq2wYhpCUheySYa7PUOKP8Q+bzFInM93qCDzRUVyZF0PU/B8074V
         D+u4mMypXG70ioZNoqwIP0ymX5TWKbaxAVNHsRVLF2Tfidzhozr+hKNbs2t7FRTGbdh+
         QI6w5tRQbA4dSE9f5t8aINywWLO85Du77NTYRGC3N2EiOzYxxji8TJCaMCWXqGNAnph7
         eSX6LeEXDfAriACjVJhO+JdzQJEJTZKmSrWSxOlaclNhX35g//9lZgXe2P52vHmSSLwX
         D9AUzJTMEKPqh5aETo96wlC4gU6tDjBTGB+uw+KaKWj6bCEGwS8fgI+RzK0qGaBqFy32
         WUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ovi9uD+36QP/Rq/kw5TX7VboN+hR/48bQhozyZz48EU=;
        b=G9wmQxwu81OKPBPAllwpFc02BPP7ATLtEoENIuF7mgM6TiB8uyoDsHBzbr5IJEsyAE
         dMRh7fQyMoUiZ3/UKdRuaopjbSFN1SkqWY6wVuitntAubKiqcwB/OfsorAvw8NadOjtK
         +0BwD5enQXHnCV9OnIfVm4y4JVnXbuUYJkcsOkBJsJ6+8WpqEeAHMdqMO456jUD4SDmQ
         N0PIEs6fPeT1Nkf1Z+suhxhJ11YDK9TcgjSTfEKR40F9GKn4QNNNWD64zeVpbesNOwBY
         hB2e8FYINEBKVg9pPJcX+rsAsUXyU6tpAT5RXWldSkc4O5b3lHLFmL6rxUMH6ZQoTbsM
         +lNA==
X-Gm-Message-State: AOAM531ytTOaLXNZBmwD1GbSNHrNmXMJ+BpHuwIJhtLbyADFcCNMC/Q4
	X78y5LpSg6vFT3NL3ILuOmHzkWJduUVlJbCqPQKLow==
X-Google-Smtp-Source: 
 ABdhPJzpXvoaTSnoUVFrbWRMhi8NrY77SEwiksDhLBv0wMCQhlQM7SoowSJfNpHlBTTfIOWdWOgaIRcNTuPsnAC37UI=
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr18949525wml.72.1648376651435; Sun, 27
 Mar 2022 03:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <rAGk.1648358467578549439.5IXP@lists.openembedded.org>
In-Reply-To: <rAGk.1648358467578549439.5IXP@lists.openembedded.org>
From: Ross Burton <ross@burtonini.com>
Date: Sun, 27 Mar 2022 10:24:00 +0000
Message-ID: 
 <CAAnfSTtfH14DNySVhDGYp76OH84TZ8EdZMTT5X_Sn_-gogjCGA@mail.gmail.com>
Subject: Re: [OE-core] Proposal to change the SRC_URI source reference of
 neard package.
To: Rahul Chauhan <rahulchauhankitps@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 10:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163663

On Sun, 27 Mar 2022 at 06:21, Rahul Chauhan <rahulchauhankitps@gmail.com> wrote:
> I am building neard recipe. And neard recipe fetching source code from "https://cdn.kernel.org/pub/linux/network/nfc".
> https://cdn.kernel.org/pub/linux/network/nfc/neard-0.16.tar.gz
>
> In this tar file few plugins (eg. tizen) and tests scripts (eg. Test-channel,test-see,neard-ui.py,ndef-agent etc) are missing.
>
> I observed that,all missing files are present in below tar file.
> https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.16.tar.gz
>
> Is there any specific reason to fetch the neard source from https://cdn.kernel.org/pub/linux/network/nfc/neard-0.16.tar.gz insteed of "https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.16.tar.gz"

The /snapshot/ tarball is dynamically generated so checksums can and
will change over time.  If the tarball is incomplete then start by
telling upstream that they are missing files in the tarball, and
switch the recipe until the tarball is fixed to doing a proper git
clone.

Ross

