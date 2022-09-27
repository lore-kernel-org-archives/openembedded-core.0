Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53656C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 16:47:45 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.13268.1664297264095041160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a5e18SRP;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id bu25so14699310lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BMw5HEn2EjwFiSIzvmjzxXklNdSWAdl5iYZ0+zQGeQs=;
        b=a5e18SRP/w/krXUg59FFdSyBvxnt7a1hf1qcNMQop2xJ09CnVMZ8fi/Niy+Y9H5cAK
         x6d+Y+l+9KNBS2OpajoRFIpQf0Yaw1tlbPKQ2GUoqWa8vOUfujryk7EHbAmiqEo/ugB3
         YYXBYkudgsX2kC8gSPpFfxcZbbrxDAGJB/dD/bd1Gin/DJtRBW0/KVO0v9WC3P3w5AkQ
         spLyhuwBKeCE2UqlfB7qHk6k677UCVkSI8gHJ1xHzg0KOIDBX+vU+HXm4GpCTo9x70OR
         CmG5AVH3ewFwPdatpCOqojH0W1uT9zbghLHSwZPCmynhvJDOrni77drro88EJmm962Tb
         hjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BMw5HEn2EjwFiSIzvmjzxXklNdSWAdl5iYZ0+zQGeQs=;
        b=G/Ipyf8/pfn8dSSb5JOR9cAi5o/7uCjMBu2LiwOwBeL8PG6twWdN4Zr4QHU7Q2mx7F
         bxoM07qypG51ZhO9HlS1VVrBA209XGnkJuzOQjvO/Iw5Roea4BeHW7qWZl9BIartF6SZ
         pdHGE4Q04WQRVTlOI1XGp2VfQ1N6J6oiETDpSpVe5/E1BtZ10FFqeCBJO86Yonj4RHgM
         DFITOABoMk4FQbQDPzepWZ+eDXJFxgyM8TcKbYU2KtFt+q3ToWIu9TMJaPlOPky43U03
         IlsTOCYaQyvkrPAm8mzKO6DjTjjNxiy2TkWBhnkCZRsCto9Yk98Zv5ZpJerSq0Fr5Tnw
         y4pQ==
X-Gm-Message-State: ACrzQf3MhD6HokJ/8a5knGtyzDOtQCxxO2kJHnbydOCWsTuNJEzSu/A7
	emEUrUScitDZ801o8bK3I8E82wIYWJoxsdnrtAQ=
X-Google-Smtp-Source: 
 AMsMyM4Ecx6mckxXIXUIxCr8CCgFv4rxFtZM2SA7M1BFiuhPNcgP2QZaUqCm1FPhqXxY/XT8qOPvlXqFXDj8toEt/mA=
X-Received: by 2002:a05:6512:40c:b0:4a0:5b27:76f0 with SMTP id
 u12-20020a056512040c00b004a05b2776f0mr8795986lfk.358.1664297262058; Tue, 27
 Sep 2022 09:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220927120922.137422-1-alex@linutronix.de>
 <74fb01f41d54453992cbd6ccad52a9ce@axis.com>
In-Reply-To: <74fb01f41d54453992cbd6ccad52a9ce@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 18:47:30 +0200
Message-ID: 
 <CANNYZj-G+GuNpGN5jZKZDPeGntFVJg9G84+v8BXCFNhpSeb85A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] githib-releases: add a class that
 consolidates version checks
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 16:47:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171111

On Tue, 27 Sept 2022 at 16:17, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> Is that really useful? It cannot be many recipes where the owner
> part of the URL actually matches ${BPN}? Wouldn't it make more
> sense to instead use something like:
>
> GITHUB_OWNER ?= "${BPN}"
> GITHUB_NAME ?= "${BPN}"
> GITHUB_BASE_URI ?= "https://github.com/${GITHUB_OWNER}/${GITHUB_NAME}/releases/"
>
> That way it is more evident in the recipe when GITHUB_OWNER and/or
> GITHUB_NAME is set, rather than the entire GITHUB_BASE_URI being
> redefined.

I ran some stats on the recipes in core that have been transitioned to
the class:

total: 39
same owner/same name as the recipe, no override of GITHUB_BASE_URI: 11
different owner/same name as the recipe: 14
different owner/different name as the recipe: 14

I would rather avoid adding abstractions and reducing readability by
defining even more variables, perhaps recipes that use different
owner/same name can use:
GITHUB_BASE_URI = "https://github.com/custom-owner/${BPN}/releases/"
(some already do, but not all). I also find it very useful to be able
to click on URIs on recipes, and don't like having to copy-paste-edit
bits of it
to get where I want in the browser :)

In any case, the major point here is to fix upstream version checks so
that AUH can continue do its work. A minor point is to define the base
uri (the part up to 'releases') only once, or use a default where
possible.

Alex

