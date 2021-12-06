Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5FFC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:41:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.54164.1638808900393178153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M+q6wLlw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so273956wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BmYCVfw1Pjf2ZVL5emODvVKb/TZ8UHWUWvylNzjxwgA=;
        b=M+q6wLlwNeHDUDCxZliIrIQM1+5dzWfO446cg2wX5yIhOBPirMNXb5qtdcZsTETVTd
         0p6lPsFLMBsQVSSg/O2JDOQdWq46Oes+e0Yx43yrVaOnXjBb/HawUkzla6gw7P6Rb2HV
         Zjuxd/a8N9Ljmu5rh5tQtmFD9ZkTMMd83st3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BmYCVfw1Pjf2ZVL5emODvVKb/TZ8UHWUWvylNzjxwgA=;
        b=3zrZ2MQ0xIr/VjpxfD6GsJrMXP61abM0MHX8zhp59Z67LKvbd7oL4wZHf/SzYTppfB
         yBFQDQzjYm14R3+t0IeK/rJJhJc8Y1hQGxqjZuXskFqaUvfbEOXATkMvLwn6w6n+yUIL
         SSOuO8ovfbDFd/mmohA7ZYKxyRDZcWF4cmlJy7C1sm8juS85PbDyuN4o+br8S288dB6x
         smrQK/vou0oEJ/TJbQpF3/ceT2WzypivMQalHDZwIRJgUTDJ5SfLUn3+XSw0wNttNTjZ
         /xMrGunLOEb7FI+vosS6VwMwgib2lA6gZPuUc12KMOToXDcxshHW76+TopGP/3gn7yQM
         tAfA==
X-Gm-Message-State: AOAM532ik8Mve7TOVKeXqw2pijutErNct9vQmvKelLpwoOl3HnpjBA0v
	wuFcD7ZCYztca/r3im8PXi+nmrE/B988Ug==
X-Google-Smtp-Source: 
 ABdhPJyKdKxYdScCPjVHHG8kIC7hkJlYRemWkcRNVDHLH7ogqkNCGTHf286FQDYvivPObEKpbvtjUg==
X-Received: by 2002:a1c:5414:: with SMTP id i20mr41024695wmb.88.1638808898977;
        Mon, 06 Dec 2021 08:41:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50e7:dab5:2141:24aa?
 ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 o4sm13676684wry.80.2021.12.06.08.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:41:38 -0800 (PST)
Message-ID: 
 <0bc6a9322d9ec2fd38047e2223b337596306c098.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 06 Dec 2021 16:41:37 +0000
In-Reply-To: 
 <CANNYZj-B7LY5egzLTb8h4ApXVe_d0XdUJQjM8tfH+Q6KSfiOCw@mail.gmail.com>
References: <20211204071323.2480163-1-alex@linutronix.de>
	 <20211204071323.2480163-26-alex@linutronix.de>
	 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
	 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
	 <CAAnfSTurVLUFAPSVtoD1hvvqOdKWduAiD0Qgc6L38Fh8A_YdTg@mail.gmail.com>
	 <16BE34F09726DD19.18170@lists.openembedded.org>
	 <CANNYZj-B7LY5egzLTb8h4ApXVe_d0XdUJQjM8tfH+Q6KSfiOCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 16:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159256

On Mon, 2021-12-06 at 16:50 +0100, Alexander Kanavin wrote:
> I mean, if you insisit, we can add Upstream-Status: Defunct, but I do not
> think keeping patches in Pending state when there is no upstream is right
> either.

Maybe we should add an Upstream-Inactive status?

Cheers,

Richard


