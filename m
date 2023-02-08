Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921B0C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 11:12:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.6008.1675854720348453714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 03:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WV8IWPaN;
 spf=pass (domain: linaro.org, ip: 209.85.218.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id gr7so50301481ejb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FDg8gJY1dDjHBJ0GUSLd1Hy0jSSWaXwaOhJGAvB8z0k=;
        b=WV8IWPaNi7lCpp1YUIMl9uTl8as2nMyBhCSegkEb7s4sBR1kAoTzEDr8EW2KS3BuvA
         FcqZN8IqPhGAB038A9Kw9wp88lhW3Z0TN8BsBf6Te4qboF5wBd0rOLtxeU3m5UFCmsl6
         fzNQKqCYjDQuh+JBJ82vOmlfm69t9ziymvfQcGhX6QrtVgZNiqRzN+iw/FDcGgJCel5Z
         bFkM4ZA7AYHiXxzoTyLc+0qc9+7+mEKnh+rn6upXgzZwgSsXfbNgI+Remhu3xtinQcXO
         Po7vB7yqFA1O44wO09qI8jIsAOsvd86hx2eAi99T6PWxI4wYQfduU5RFxkv5IVZR7zcd
         aiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDg8gJY1dDjHBJ0GUSLd1Hy0jSSWaXwaOhJGAvB8z0k=;
        b=iEQSTC5z6edV3HgSFdsCSTsz3ZZOLGQJRw5oCcXoClcwkXdwDPGOli/TxR5X3lUYFo
         IsxQYHeJVOGyVfBmmEsZNNS8jJAjybdD4bGr1RnppUIuQ2EE/YY9uS1N5jXUvOTz6Hk/
         tqf0LnCNtLkljAl1IqUo33o09nM89WvloZqiCEWLJY2H6i4ANz/+nbLCa2FHkssXSf95
         fdPUOpfivVgaXihoXNwbA89tLOfsjPReFrqECRAcS/FRcGRKs2SgbFVKpU/cSuc3s0oc
         pyIBiRQgEjOaq/HfO1wCK7WwnTyW+P3aBtXg4LhR4HwxBKAnfEVzv2li/PBfC35Mj7Ux
         HyZQ==
X-Gm-Message-State: AO0yUKVOUxKf7HcVvjQxpeQPQou5j94IyHsttG/x5Rf0QZw4k8A8/RuU
	/o4kOFffMQQN8mDzD2RYKeZ/KQ==
X-Google-Smtp-Source: AK7set94wyCgIMGzvucPzcUZ+ot0HHEFbEBiIc+KkmZNrtl6xjdBAfDvkEyMFRgYIxq9ni8CagCJuw==
X-Received: by 2002:a17:906:746:b0:854:6e3:2388 with SMTP id z6-20020a170906074600b0085406e32388mr7592003ejb.12.1675854718683;
        Wed, 08 Feb 2023 03:11:58 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id lv3-20020a170906bc8300b00883410a786csm8049337ejb.207.2023.02.08.03.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:11:58 -0800 (PST)
Date: Wed, 8 Feb 2023 13:11:55 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Marius Kriegerowski <marius.kriegerowski@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] bitbake: bitbake-diffsigs: Make
 PEP8 compliant
Message-ID: <Y+ODe9axjto3kA1f@nuoska>
References: <20230207095023.1115763-1-mikko.rapeli@linaro.org>
 <777dd7c0c335480f82f31f1e1b36b751@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <777dd7c0c335480f82f31f1e1b36b751@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 11:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176900

Hi,

On Wed, Feb 08, 2023 at 11:00:22AM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Mikko Rapeli
> > Sent: den 7 februari 2023 10:50
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marius Kriegerowski <marius.kriegerowski@gmail.com>; Alexandre Belloni <alexandre.belloni@bootlin.com>; Richard Purdie <richard.purdie@linuxfoundation.org>; Mikko Rapeli <mikko.rapeli@linaro.org>
> > Subject: [OE-core] [kirkstone][PATCH 1/2] bitbake: bitbake-diffsigs: Make PEP8 compliant
> 
> This should be sent to the bitbake list. Also, when cherry-picking 
> Bitbake changes in the poky repository, you should remove the "bitbake:" 
> prefix from the subject line as it is added by combo-layer when it 
> imports the commits from the bitbake repository to the poky repository.

Thanks, forgot all about this... I guess the version/branches is
different too.

Cheers,

-Mikko


