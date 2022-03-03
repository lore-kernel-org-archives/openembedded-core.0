Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C603CC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 11:23:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.9708.1646306630873214674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CbsqIB/n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id m6so7297163wrr.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=doY7b4RWp+G2l91AwbS2KJGtUg/Wj1RKRwAZgkbkNdo=;
        b=CbsqIB/ns3jg6itbQIdETYAFc5lSCv44J67GisWnkhjSq5AQKEETVt9B7xbWTwbNwU
         4bhKWl1rZpoiwYtsoHO0xdF5o3oJi+cd9ohtppzKQ8uaZ8HpJQw/5+LtjT4O/VR4jHCc
         ZytmNNPQJfNrTM0yNNHIC/dW0xDaAVWTnGFO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=doY7b4RWp+G2l91AwbS2KJGtUg/Wj1RKRwAZgkbkNdo=;
        b=sQMCqO+ReQaYM3Mjhg7v39uBQ0QAiUGHiG1MHbg+dL3hC8n04dO7Y6wBXwsB6QlYg2
         Xk9dQgM2EOnrya6SJe14YiAkdsutJ1M4fYWhqeGt0f+xa8+72A2pGfF0mcZdtwCUxmmr
         fbvFPry9j/I7E7Aa4REyNFAaN1Q3frNyBNTR+uxJOE2Gsj3SAnkw/7qSbxozVNpuQO8D
         fYR9F0Gtkt/UzVB9htfLxCaqZACKyk7rn85CimVhlOvkroph0HeYQYTAsWU8BYsbqrZ5
         og6KypcMhHuSecxyQ9vS+zzNOEVFKsRGGUagU1Jsv66LlSUOvU7CjfB4bQFLOaheGOpR
         +H9A==
X-Gm-Message-State: AOAM531nHdMFl65h8PbDSTVaVkkq3ilP0dYhDUJH9kM+NPl5TSMXScQM
	DKhwzVuL4YwCf6FeU8FOgc5JA6WAgBweIDXX
X-Google-Smtp-Source: 
 ABdhPJwEVNqKdlwIUyEymrFVBmXF1cIhZcsLUZTrimlgNrNsz/2evnwEKPfS3kDVgt0hKPsCIjc+Ww==
X-Received: by 2002:a05:6000:1445:b0:1f0:4865:c772 with SMTP id
 v5-20020a056000144500b001f04865c772mr3554190wrx.83.1646306629272;
        Thu, 03 Mar 2022 03:23:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1?
 ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 e2-20020adfe7c2000000b001f04d622e7fsm1838744wrn.39.2022.03.03.03.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 03:23:48 -0800 (PST)
Message-ID: 
 <eda53a5cb864d7dfec2f8e7d180f4e291419a921.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libsndfile1: bump to version
 1.0.31
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2022 11:23:47 +0000
In-Reply-To: 
 <CA+U=Dsr74n=NT7w-TrrpQwv0_9iHQYnGNCU8BobebjKQ5sbJXg@mail.gmail.com>
References: <20220224153034.5140-1-ardeleanalex@gmail.com>
	 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
	 <12d5c909469e4ced0ab136d0ca5f00cbe45567c7.camel@linuxfoundation.org>
	 <CA+U=DsrXewjnaWp2DQM8u=V9AS49vGKcdt17b5kyZ8eth_8LOQ@mail.gmail.com>
	 <49dbf7f4492322649e7876c110e94de4f82bcf77.camel@linuxfoundation.org>
	 <CA+U=Dsr74n=NT7w-TrrpQwv0_9iHQYnGNCU8BobebjKQ5sbJXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 11:23:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162651

On Thu, 2022-03-03 at 12:54 +0200, Alexandru Ardelean wrote:
> It didn't look [to me] like it would be too bad to me either.
> I wasn't sure what the decision would have been (from OE), to
> [1]patch-out libopus? or to [2]add libopus? or [3]revert?
> But your patch suggests [1] is preferred for now.

My reasoning is that:

* libopus is in meta-openembedded, I'm not sure we have a strong case for moving
it to core.
* I was happy to see us move to a recent more up to date version with the CVE
patches dropped so reverting seemed like a less attractive option too.

I just wasn't sure if patching out libopus would be possible or not. I therefore
had a look at a patch to do it and that shows it does seem to be reasonable.

> Did you get a chance to test it?
> I can run a test on my system with it.
> But it may take me 1-2 days.

I've turned it into a proper patch and will test it on the autobuilder.

> In the meantime, I was a bit busy with this:
> https://github.com/libsndfile/libsndfile/pull/812
> 
> It kind of seems that libsndfile people are talking about maybe
> splitting up their configuration.
> Let's see. That will be in a future release anyway.

Thanks for discussing it with them. If upstream were willing to accept a patch
to enable/disable opus, that would be our much preferred way to handle this!

Cheers,

Richard




