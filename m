Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F6DC433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 04:59:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.30708.1651381184075237062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 21:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TcKwvfEr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id x18so15760770wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 21:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=m9XJW8CYW5f4unUo+23zQAEtuTqvdDXdJhToGIBQt4Y=;
        b=TcKwvfErfGIE0S4vrtvWzZsVTe5o2RgJom7+s94OPhysmwoPq7gquoK0VS5u9Sm7L0
         sNRbBRZez2e/nUHMH961YdsEsvm+yYI9uriUf2zW8aLKez/Z/tsNZSArgkFzARy+wR4O
         QVcqTZwf51Ycqi4Px3+lY5YbY9lGQBwrP0BpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=m9XJW8CYW5f4unUo+23zQAEtuTqvdDXdJhToGIBQt4Y=;
        b=HLXJdTvg0qm8hlYCnCA2fFKpY2Jz2uhQaXwdbEuatYOv4uLnhyoGFzi0NFuz0jkmWY
         Nx8j7u3XTVmXod0H17tXc/4jKOzOP2MYnN0M53nqUs/ZtDvAkVc8F4FA+o+S3fIOwmAx
         ed2yso6aCh7klD4rsRQVCjRZKOnFJiliQrYTdhEIHOWLOrJsGTN1otg0h1p/RKMnJsj5
         Egj2C0BjSnFog/p2BgGaAxKJbcsBRzVKAwbk6QGyd9MA90qsPlP67ayt4vFDbgU2y1zr
         4DvGoXRYQR2L94QC+HvY2/bdziLeC8maF6CDG3tkrTu5RPAbcwdwm4C/zPfMb4x8JQcG
         LbpQ==
X-Gm-Message-State: AOAM531EO/FQ37JxZLw/3zGtLyWjwcvoq3Rdfcm0sDAaoQmCQKDXvUNL
	fkmP24rwHBXbWCRvzNaMafs/sw==
X-Google-Smtp-Source: 
 ABdhPJxjUVziwuTxoNU85KPCNMVemaS24LmI8i/eDnSTfjOnHdQNQM3PJXjiLXvKi7CE4NwiQWhPQA==
X-Received: by 2002:a5d:5954:0:b0:20c:4d55:1388 with SMTP id
 e20-20020a5d5954000000b0020c4d551388mr4984830wri.90.1651381182569;
        Sat, 30 Apr 2022 21:59:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b1e5:d274:7a89:e67a?
 ([2001:8b0:aba:5f3c:b1e5:d274:7a89:e67a])
        by smtp.gmail.com with ESMTPSA id
 q14-20020adfaa4e000000b0020c5253d91fsm3834649wrd.107.2022.04.30.21.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 21:59:41 -0700 (PDT)
Message-ID: 
 <f52bff6a24a5c2a015ed595ab09da89b2e249e75.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/15] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
 Jon Mason <jdmason@kudzu.us>
Date: Sun, 01 May 2022 05:59:38 +0100
In-Reply-To: 
 <CADkTA4M6NzCMVtEhiu+Hyaqp4gMZViP1XRH1qP1t2Ds3S6TL1w@mail.gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
	 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
	 <16EA5E7263695663.11702@lists.openembedded.org>
	 <16EA76835C38B7CA.4798@lists.openembedded.org>
	 <16EA920E59E6B6F1.28542@lists.openembedded.org>
	 <CADkTA4M6NzCMVtEhiu+Hyaqp4gMZViP1XRH1qP1t2Ds3S6TL1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 04:59:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165076

On Sat, 2022-04-30 at 17:35 -0400, Bruce Ashfield wrote:
> On Sat, Apr 30, 2022 at 12:26 AM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > 
> > On Fri, Apr 29, 2022 at 4:02 PM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > 
> > > On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via
> > > lists.openembedded.org
> > > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > > 
> > > > 
> > > > I'll see about running the strace locally today. Hopefully it pops up
> > > > here so I can debug.
> > > 
> > > FYI: I have the landlock test case passing here, there's just an
> > > output difference from the kernel. The test is passing.
> > 
> > I have located the exact kernel commit that changed the output, hence
> > why the test is failing.
> > 
> > strace upstream hasn't adjusted yet, so I'll spin up a patch, and get
> > send patches to the list over the weekend.
> 
> The two patches that fix the strace ptest fail, and qemuarm graphical
> boot are on the list.

Thanks Bruce! I've queued it and started it running through testing.

Cheers,

Richard


