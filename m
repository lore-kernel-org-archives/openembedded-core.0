Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE41C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 14:28:54 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.16828.1668695327659323193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 06:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GRz83md0;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id l12so3062505lfp.6
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7OMR8YdE0Xbf7MFenJ9vxfZLM8oKHxN+qs/0WjEzc8=;
        b=GRz83md0fRhkEkU7HdliMdCHLHemghQvjjnn2y+ueMbPeVTXOGP2OYkmSlw61hRGsg
         k+4rXQnF2Q4C4t2VR0yEOURRKZt4a/3BxW9JzG7UbsEo14oKUlnKeF+2bcWkjPpktlpd
         ooqFpcRVfB/wtqGyb0roFeAnACjzICQ+3MRTHgKrJWEszRD/2qTa9dobiseZRBB/zqf2
         oP2+mWj8BQDcVimJP+xFIBM3bDBO5kYWRR3d+15QLsC7BfOFe1kwztLJhLByh7ukZ/ad
         9sn7lfjOhRcC+9cfyp42ZcRhkY/XN1XyBhbUNDEkmZAkbnxEzR6hUhqvTwHwyfgnZN1G
         NtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7OMR8YdE0Xbf7MFenJ9vxfZLM8oKHxN+qs/0WjEzc8=;
        b=UN95YJWmbiyJ2a3/oF3ojV5cv8pWFNZMO3FY83yrnkbckWIjIPCQFHB7MWZDZQ84LZ
         huoXTnn7eEwnzZRaU9gjf5Kzso2GJRHvh6AjW42TegCwLmJacNgg06P+OplZ2VjIJD+/
         f0fT/YYHAOylNWvkssO4w012tFp69ODnvsH6Vk2WF9w3djK4t2+u5yhUAv/QMnzWwfVr
         BtpLVuge0TDBI4jHrTvNPDHbiYUK42A76EcQqkGKrb1XXmGOcKOux2abWOgWj9DnGDOP
         yHi6pVe5mMQfzVHxGek7eXC6/qigQwiinAPQRnn3sx7QR2l7xt54a7zyLwDYjkFjGawv
         J9Vg==
X-Gm-Message-State: ANoB5plzUCHClLyi+bAGt2uUwHVwecCPr7C1z5sGRLStXJLbTfDWlXpJ
	WuBzUJ1c63fULlyC+2whJcoZfw==
X-Google-Smtp-Source: AA0mqf6dTdxQCdPzoVfCAbKmUJ7mX1FREPpZEu79ddF+QPbPfVjkiU0ITt50VLlkoD76u8O0KS8Vjw==
X-Received: by 2002:a19:430f:0:b0:4b4:661a:1ce1 with SMTP id q15-20020a19430f000000b004b4661a1ce1mr1097383lfa.136.1668695325800;
        Thu, 17 Nov 2022 06:28:45 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id k27-20020a2ea27b000000b0026c4305e5e2sm227751ljm.53.2022.11.17.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:28:45 -0800 (PST)
Date: Thu, 17 Nov 2022 16:28:43 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
Message-ID: <Y3ZFG9jTChWRQFNV@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
 <Y3ZDnOCC+mzyjdEl@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3ZDnOCC+mzyjdEl@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 14:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173426

Hi,

On Thu, Nov 17, 2022 at 03:22:20PM +0100, Alexandre Belloni wrote:
> Hello,
> 
> With this two patches, I have multiple new warnings on the autobuilders
> for qemuarm and qemuarm-alt
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6185/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/5064/steps/12/logs/stdio

WARNING: core-image-sato-sdk-1.0-r0 do_testimage: No ignore list found for this machine and no valid testimage_data.json, using defaults

I can change these to be info messages to be at info level. Previously
these were only in the test output log, not in the bitbake output.
I think they need to be in both.

Cheers,

-Mikko

> On 17/11/2022 09:12:21+0200, Mikko Rapeli wrote:
> > Many runtime tests would need customization for different
> > machines and images. Currently some tests like parselogs.py are hard
> > coding machine specific exceptions into the test itself. I think these
> > machine specific exceptions fit better as image specific ones, since a
> > single machine config can generate multiple images which behave
> > differently. Thus create a "testimage_data.json" file format which image
> > recipes can deploy. This is then used by tests like parselogs.py to find
> > the image specific exception list.
> > 
> > Same approach would fit other runtime tests too. For example systemd
> > tests could include a test case which checks that an image specific list of
> > services are running.
> > 
> > I don't know how this data storage would be used with SDK or selftests,
> > but maybe it could work there too with some small tweaks.
> > 
> > Mikko Rapeli (2):
> >   oeqa: add utils/data.py with get_data() function
> >   oeqa parselogs.py: use get_data() to fetch image specific error list
> > 
> >  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
> >  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+), 4 deletions(-)
> >  create mode 100644 meta/lib/oeqa/utils/data.py
> > 
> > -- 
> > 2.34.1
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173404): https://lists.openembedded.org/g/openembedded-core/message/173404
> > Mute This Topic: https://lists.openembedded.org/mt/95085492/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

