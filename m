Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D868FC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 11:51:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9134.1651233096227147882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 04:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RE1LQwKg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id e2so10460249wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 04:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+S0qjUywLSiPDxoEYl3E6bEKWTiM0jDB03LvolorymE=;
        b=RE1LQwKgt8FKMpgb0oPTXJ7I2lHnF0l0sz2gaqHcSfz7dfp2JzBAm3DzpxzBSBZxq/
         yTyMNu3IZyv/zU5FkbqGhwUh0TphGNap5Dl1P9eVd8jxXUvdpm4dj3/F2GkocmoFE78E
         baS9JRRaHr7xovpDB6uU8LgKO6He95q9mEiJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+S0qjUywLSiPDxoEYl3E6bEKWTiM0jDB03LvolorymE=;
        b=slb5FpDMsjg7jcPqsUQDBblZXIlfiIcSeSRLVAF9RyZwf7kCadrPb2xZR7nMdOa32a
         qwFicNixeriFMvM5Js815wAG2gam4VGbdQPBroADqY0LEAevfImd1oajgUdnCBk/Oji2
         WrsgFKo9ZHOqd2WI4Q+udGDRSgd8q7K0u5aFRKKgFjUGKjzEtHIRh/7JMTgU8zEaTdRE
         CDc2SgWGiImkLZF6NSHsQ+CfGcMAyZGam5EAgJOQz5vWqnxRwKU+rpdlwTTSJp0b135k
         xNunMk1/afr3lYdWAIZvvnxArADe73J0YmvzXCZosYSs0HXHqb7lRXx2V4JkI/Dp0DW1
         x+qw==
X-Gm-Message-State: AOAM530lAKhsunX2ebFnp4KJ1zJwwUV0NEpXivoR0+eeJhMr+776SyM+
	+3U66Cx3YcivUagcj4ikYr81RA==
X-Google-Smtp-Source: 
 ABdhPJxo0yI3ktB2qPn1Yh0vtd0+AW7FKzOJ3OfMBB6AvcCt+9FsAGu7UWxdWadOz011S/1r6fVUNQ==
X-Received: by 2002:a5d:5309:0:b0:20a:cee3:9e3f with SMTP id
 e9-20020a5d5309000000b0020acee39e3fmr26780354wrv.570.1651233094535;
        Fri, 29 Apr 2022 04:51:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:480b:fc7a:f316:cb3a?
 ([2001:8b0:aba:5f3c:480b:fc7a:f316:cb3a])
        by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b00393ec8be5cfsm6980981wmq.24.2022.04.29.04.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 04:51:34 -0700 (PDT)
Message-ID: 
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/15] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	jdmason@kudzu.us
Date: Fri, 29 Apr 2022 12:51:32 +0100
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 11:51:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165006

On Thu, 2022-04-28 at 09:47 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> This is mainly a resend of the pull request that I sent just before
> the release builds.
> 
> At that time, there was a ppc boot issue, which I've fixed. There was
> also a ptest warning, which I couldn't reproduce, so let's see if it
> pops back up on the AB.
> 
> There is also a known issue with some of the arm reorganization done
> for the -tiny cleaup. Jon has been working on fixes to that series, and
> I've cc'd him here so he can add context. It was some boot issues,
> even in the -standard kernel for sato (last I checked).
> 
> The issue with the ARM changes is that they've already been pushed
> to my repos, so everything stacks on top. If we can't get them fixed
> shortly, I can temporarily revert and do a new patch on top.
> 
> Khem has also indicated that the 5.15.36 -stable has all of the changes
> required for gcc12, so it would be a good bump to get under test.

The testing says this is mostly good with two issues. Firstly, strace ptests are
regressing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3435
and I suspect:
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3188
will too when it finishes.

There was another patch causing other ptest failures so I had to do a second
pass but I think the strace issue above is from a kernel change.

Secondly, qemuarm graphics fails:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5132

I did try adding Jon's other qemuarm patches:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5136

and it still fails. I've not looked further as yet, just reporting what the
varoious combinations of patches in testing showed.

Cheers,

Richard






