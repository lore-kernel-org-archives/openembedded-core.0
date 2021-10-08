Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA15C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 12:34:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.8420.1633696483834679987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 05:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S9MOmfpn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id v25so29324875wra.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=b48R88klwzbbrDW3fFbcMWP+pgeNC3Q52UrP17PHOgo=;
        b=S9MOmfpnNI+Cu91+pFlI+/lSuByDtQJia6OkIWmTEkZcTgmsoDGXDooePR+wVPcOgz
         WADba7Q0TfGHMPCww72ESlHkYAeRRwfOiitO+kre+RRCWiElzNX+M1GfYU1np2EB95Fo
         +SUUTwyyxs2Drj6LXsgZBzq6TBIg4GPJfZuTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=b48R88klwzbbrDW3fFbcMWP+pgeNC3Q52UrP17PHOgo=;
        b=kg1QQ641qobKRcer+bVoc4pa1//mbanjvnNDKPJ5d4LKu9yxLRZOpZzNLa8HSMtK6c
         YyPAfUHlROJJItKLDZEf0ghClc1F1j7vciMzcWValtBap4PB5XD/F5CwCuSPL+7GwGB7
         xDImEmKQam9t7JelkRohwGPaiwVcAfQAdt4pvvKLa+dOJnB4KadzRJbht0HxI1yMSh+G
         zIeejfIGWFY3QQyzU4jLpaC9D65y5fXVkaEQ7COZOvduJC18JZXJ34EP7k0CcIFdIZP6
         qcIgx5OWyxoxVeJeWjjCaenIGEVna1e3l5xxs4MBKZqJJXh910G6O1AyuoiHtIEbXVRT
         O21Q==
X-Gm-Message-State: AOAM533Ykb38FF/xb6FQZ34zI2kIKdz9r//BzTdeQLotQPNl9HSu9DmG
	ny3UzvWC33UcvteVENf2gsWHeg==
X-Google-Smtp-Source: 
 ABdhPJw8XAUnuD3EEfOJrqTnc3pDA7NDWjYuZGzD9Nc1Nr6f76KX4fXF5M17WjRrR/b0FedwD9Br8g==
X-Received: by 2002:a1c:2b02:: with SMTP id r2mr3131120wmr.55.1633696482067;
        Fri, 08 Oct 2021 05:34:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5719:ccd0:9969:333f?
 ([2001:8b0:aba:5f3c:5719:ccd0:9969:333f])
        by smtp.gmail.com with ESMTPSA id
 q10sm2387664wmq.12.2021.10.08.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 05:34:41 -0700 (PDT)
Message-ID: 
 <4f24a96686d8fc2035e84d10822447c0991552ac.camel@linuxfoundation.org>
Subject: Re: [PATCH] oeqa/selftest/reproducibile: Include rust packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy MacLeod
	 <rwmacleod@gmail.com>, alex.kanavin@gmail.com, umesh.kalappa0@gmail.com
Date: Fri, 08 Oct 2021 13:34:40 +0100
In-Reply-To: 
 <CALY4987+J53GmzMtgzma=J1AtjvV+k3WwOrHgfDF-J2cr18rpw@mail.gmail.com>
References: <20211008083758.156759-1-pgowda.cve@gmail.com>
	 <7c45856599d0602f115788604a07b0105cd762aa.camel@linuxfoundation.org>
	 <CALY4987+J53GmzMtgzma=J1AtjvV+k3WwOrHgfDF-J2cr18rpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 12:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156782

On Fri, 2021-10-08 at 17:29 +0530, pgowda cve wrote:
> Hi Richard,
> 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/764
> 
> Thanks very much for sharing your inputs and comments on the issue.
> 
> I could see some more builds where rust exclusions were unused:-
> Some of the example builds are:-
> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/757
> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/755
> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/751
> 
> Can you please let me know about this inconsistent behavior?

The reproducible test runs on different hosts and has two builds it compares.
The first build can come from sstate. The second build is built on the specific
worker the builds runs on.

We can see from my link above that the build that shows reproducibility issues
ran on fedora33 so it is probably something specific to that distro.

The most likely way to reproduce the issue is therefore to build on something
like an ubuntu system and compare the packages with those built on a fedora33
system.

> I will try to check the issue based on your inputs.
> 
> I tried to build the reproducible with and without rust exclusions on
> many poky sources.
> Could not see this error on any sources ranging over the past two months.
> More details on the issue are shared at:-
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14525

It sounds like you're only testing on debian whilst the autobuilder has multiple
different hosts which is the difference.

Cheers,

Richard


