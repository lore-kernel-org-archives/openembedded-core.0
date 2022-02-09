Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B1AC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 19:13:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.31657.1644434013645523031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 11:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aH9cIUH4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id f17so5799213wrx.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 11:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1nBetqtYIfd61PG5651aEZXzm1UBmQryLbv4JdEe2tU=;
        b=aH9cIUH4fID+dJZvvGejQ4PbX8T6tQGYorZ8ukyyi5Wiuhr9KUX5XagW9MjTvnuLuN
         ANVtL3qCJsKISohvgfR2XecXakgJnnAfJeosyo40YiB6zq26/2Nj8n+NG3IpJncJQjQc
         NIjULsH60CtNuUyWJDklsfyiFz0dNbOwPS3Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1nBetqtYIfd61PG5651aEZXzm1UBmQryLbv4JdEe2tU=;
        b=VcEhAt0n0WTHsVBdkv/6BrwvG1inGKANCdpghgPrD10aF2sH1lv0MkcW3L1i/b0bBP
         Lt8EWwqgLn1JpuXL0vK9EZlnUaidPXfDw7Qy2tuC6u9lFrxsjVMX+kFqjBWKBi0qFUZO
         ykLPue3cWYA+944eFInJ1LZQjNNMjgOGxwTG6JxyFRdrtI/ppYi+lKGo3v5Q0i3xlQoK
         DfZgQZr432Ja0RRIZTpd1DcI2Yt1xllMLu9VaATJ3+ucJi0mnvaoU/ScY/ZIvXB49YcK
         eoWZQjEV9nsMQfD+bFPJ7BGh6WJdMpFbh/EClluRZSg4PaQ4jY3pDOUglStHpwrzF1Qg
         Hkog==
X-Gm-Message-State: AOAM533aTfbVXuCWwcGXjNmVNSPwopXDx/b9lcVlDpbYcktopk4xAUrX
	onkko+L8S8RQ/uF+yaZh9IlMGw==
X-Google-Smtp-Source: 
 ABdhPJxnCnKMhNyjlJYLUYr+fBHAVYSaY3Cygx10bVOeyFUz0FeApDf9UcQ2O4tZSRAx/I4DKv6PZA==
X-Received: by 2002:a05:6000:85:: with SMTP id
 m5mr3232560wrx.75.1644434012124;
        Wed, 09 Feb 2022 11:13:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2250:1cae:83bc:d91f?
 ([2001:8b0:aba:5f3c:2250:1cae:83bc:d91f])
        by smtp.gmail.com with ESMTPSA id
 m14sm20542744wrp.4.2022.02.09.11.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 11:13:31 -0800 (PST)
Message-ID: 
 <43fe0dbf3548f549d1c0161d2a55f633a9c27122.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] kernel-module-split: modules should
 recommend the kernel image
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Ross Burton
 <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Feb 2022 19:13:30 +0000
In-Reply-To: 
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
References: <20220209173036.3823144-1-ross.burton@arm.com>
	 <20220209173036.3823144-2-ross.burton@arm.com>
	 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 19:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161587

On Wed, 2022-02-09 at 12:36 -0500, Bruce Ashfield wrote:
> On Wed, Feb 9, 2022 at 12:30 PM Ross Burton <ross.burton@arm.com> wrote:
> > 
> > Currently each split-out kernel module RDEPENDS on the top-level kernel
> > package (e.g. kernel-5.15-yocto-standard). Whilst at first this seems
> > correct, as modules obviously need their matching kernel, there are many
> > situations where the kernel is provided out-of-band and forcing the
> > kernel in via RDEPENDS in the wrong thing to do, for example an
> > initramfs really shouldn't contain a kernel image, but can contain
> > kernel modules.
> > 
> > Change the module splitting logic to use RRECOMMENDS instead of
> > RDEPENDS, and tighten the dependency to kernel-image instead of kernel
> > to pull in just the image, which also means PACKAGE_EXCLUDE =
> > "kernel-image-*" is sufficient to ensure the image doesn't get pulled
> > into an image.
> > 
> 
> As much as I hate to suggest it, I think the strength of the image
> dependency needs to be configurable. I know of situations were
> rrecommends are disabled AND they use quite a few out of tree
> modules. While I can't say that they are counting on RDEPENDS
> heavily in this situation, I also can't rule it out .. so this is a breaking
> change in behaviour for those configurations.
> 
> That being said, if RP doesn't want/like a conditional at this particular
> spot, I can understand that as well .. and am happy to be ignored
> in that case :)

Isn't there a case where the main kernel "image" package is empty so you just
have to break the dependency at the main image level rather than messing with
the modules? or am I half remembering something badly?

Cheers,

Richard


