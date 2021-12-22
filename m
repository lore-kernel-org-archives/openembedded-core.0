Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8A2C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 05:41:00 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web08.15951.1640151660209891261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 21:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YmgIOasG;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id u40so2438456uad.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 21:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MYNXkG3nEEMT5KbSH7NqleBqV9wEGZduFiszmxcUTmw=;
        b=YmgIOasG5pWc6tvcVG058BPPDFpShTabvIkXUxRph1cKOh3iAzM2fdyd79EpFZ0Rxx
         DMziSxBTuOczP1NfGw/lJcWRB4j9LdxEsxB00QC1oSi9uHwZprbojKxSXwPu79ItNTk5
         AaEuc9O2SRO2Z8WWKoRdbA0BgIg4UmY40m5z8+zzQ/M3Du0QLZYNK+yailmE3/ogik2T
         pxp6LuIOP6uaO5u4jYELaAYhEPQGL4Pzs6ptyIDJQNQ2O/AHdbMA8iBXbdb3NSMVx58F
         4Mlu3FWO7xSEZOGI4pr6F84usjSDeV4aplqsZ8MHNmN53X7G04cqiEarojKe411CsHqC
         9Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYNXkG3nEEMT5KbSH7NqleBqV9wEGZduFiszmxcUTmw=;
        b=czBKlKgEoJ4GXi25Zpy8jmQhwWQA38ZWCe0NZyfUDn+ieOx+KetO5FtYBWRTWT2E++
         MRPu5Z7lqvxGJcf3wUiLmEe++2RXTf2ukMftuAYDNp/ARr/5bW3Kz9GglfqPzlaGa8pK
         59Tp3KWHKyheS/X4NGWpphGZKHx7Yl7zj1kV2gIdGeAyiUbOiDeUH+WE2OuklYMiSa21
         OqOlc0tfxd4bP+tEwxqfuoB/EJZPvXs8yksaaY5EWK3+Ro0fmyVPiZArOK5+OJzAYj18
         gWJWe4JFIKfA4SQK8A3B7QJCO033n2vBSONZGpmQONtb3y/5UFEgxWlm3GlrrvtUqbq8
         VlBA==
X-Gm-Message-State: AOAM530Qn9CySThrRszIeWEPDu5qNjbkN08tQzInIy7P+u17rXaxfMEQ
	ByyZ7Cu6hh3de/6TT2PJV/NJvCpX58HHqm+jh9M=
X-Google-Smtp-Source: 
 ABdhPJwGAw49RrI4G4NTFH49c5IpV0S5vAzt3zDOZBG3JTHKne222JvDP8zQ5hxt5WGZgSEsaE0W7ECKPNEEVz3+OI8=
X-Received: by 2002:a67:f799:: with SMTP id j25mr447858vso.75.1640151659415;
 Tue, 21 Dec 2021 21:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20211220095009.120251-1-pgowda.cve@gmail.com>
 <c481f5aa97ace18b76976698fca3b7d1b36595f5.camel@linuxfoundation.org>
In-Reply-To: 
 <c481f5aa97ace18b76976698fca3b7d1b36595f5.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 22 Dec 2021 11:10:50 +0530
Message-ID: 
 <CALY4986oto7TrwtiU+wRHno-goWa4rtGtXR++pTzYaEPz6fQBg@mail.gmail.com>
Subject: Re: [PATCH] Binutils: CVE-2021-42574
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>,
 umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 05:41:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159942

Hi Richard,

> This fails to compile on mingw:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4502/steps/12/logs/stdio

Thanks for pointing out the issue and build error.

> I suspect we also need:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=795588aec4f894206863c938bd6d716895886009

Updated the patch and tested on mingw and ran regression for
"qemux86-64" without any regressions.
https://lists.openembedded.org/g/openembedded-core/message/159941

Thanks,
Pgowda

