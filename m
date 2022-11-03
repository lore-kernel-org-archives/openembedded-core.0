Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F9BC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 16:20:44 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web08.553.1667492441189085373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 09:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZDeiQ45S;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13bd2aea61bso2778217fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojy/dixiIe8l4upL9ft8H44cEVosUwTckelQGXVX0gY=;
        b=ZDeiQ45SfyvWP8N3c4fiDcNIk4Mw1yW+RRi9WqT7oGupOTjzuCN5nC0ciP36EasOQw
         7m2nYWm6XNYkYIu/ygDx67e6kNKAmxbBA5iW9HhcikKARtXn4YnFhwievqEVhLZDwsEE
         uvrGWDWFLd8GkBh4ZVJtH8w1vZgLxQbJYLUCzpIHpVR6Iq4figEjJcQoDkmD+21+GqUY
         FqLHR/Pl/8ulcJI5gnbRNOR3bAysAJNtUyXXsTuJUezASf+zN9XD4DvHmBDuU82F/rGn
         bMTvqyKIyhRyr2JsR1eQe3Wd6oFeCr3MHNY9GtD8fTlvu7E4IIjJlJLMqaMujHuXvuQQ
         MjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojy/dixiIe8l4upL9ft8H44cEVosUwTckelQGXVX0gY=;
        b=HGRQfy19m5CULwACy9DGE674MtDgJ4j0tlNGRvzjXwm1aDjHThZR4o1GmNc0bLcykN
         PFKdumyY95lv00tT/W3h+WHIj9nthvbg2hJfatYdSNMkFI/nBOy2Rg3vGsqI00xflov8
         DmZTwokqDh908Cd5JTeRnclf3ny131Tcvwk0B+Po1EzBZ4O1+ATlWksmwTqCeq1CXhXP
         BWaNCW86XIOPe/V5s3CGtO5RvsbjOJPbFw9Y9JmbVedMN4hiYVsK7EclfiDlYKJBnhDC
         syg4ORdfmgFfFpYvau4+jP1IQERlw9GHLfKKweKLQiiNBWmJc7L7tNOoEdEYB57/yGlC
         HyMA==
X-Gm-Message-State: ACrzQf3GfqJW8Xgf8biSLqXV/amVi8bM+VENxbjAd0aGH9xYQM1yEMf8
	jZSjQw4O9+MWzi+cyMtGR0g=
X-Google-Smtp-Source: AMsMyM5HxrxEMo2ommn8+/DZ8R5FIV9xH/eq1UFW5Sv8rDgM/H6dLbVrqf4o39f3xMzhu4pIrrYuZQ==
X-Received: by 2002:a05:6870:e30e:b0:132:e934:5c0a with SMTP id z14-20020a056870e30e00b00132e9345c0amr18346277oad.202.1667492440498;
        Thu, 03 Nov 2022 09:20:40 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y10-20020a056870b00a00b0013b0b19100fsm558708oae.32.2022.11.03.09.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 09:20:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <40a86fb6-07d3-5491-9202-4114cf963f4a@gmail.com>
Date: Thu, 3 Nov 2022 11:20:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH 0/1] create-spdx: default share_src for shared
 sources
Content-Language: en-US
To: Konrad WEIHMANN <kweihmann@witekio.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "steve@sakoman.com" <steve@sakoman.com>
References: <AM8P192MB09633133388817BF0814341EA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
 <164f7e3d-59f7-98c7-f75e-e67fc949f462@gmail.com>
 <AM8P192MB09632ED64CA52FB9CA30C13CA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <AM8P192MB09632ED64CA52FB9CA30C13CA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 16:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172642


On 11/3/22 09:49, Konrad WEIHMANN wrote:
> so what's the conclusion? I would be okay to add a var like 
> SPDX_SHARED_SOURCE (default WORKDIR) or something and reference this 
> as a default - when using a weak default ppl could override that to 
> their needs...


Ya, I think what you have is fine with a minor change; the limitations 
of not handling non-kernel shared source very well isn't changing. I did 
leave a minor comment in github, but otherwise LGTM


>
> Would that be something that would work?
> ------------------------------------------------------------------------
> *From:* Joshua Watt <jpewhacker@gmail.com>
> *Sent:* Thursday, November 3, 2022 3:28 PM
> *To:* Konrad WEIHMANN <kweihmann@witekio.com>; 
> openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org>
> *Cc:* steve@sakoman.com <steve@sakoman.com>
> *Subject:* Re: [OE-core] [PATCH 0/1] create-spdx: default share_src 
> for shared sources
> I see the problem, but I'm not quite sure this is the correct solution.
> It *does* fix the problem for exact recipe that provides the source code
> (e.g. the llvm-sources recipe), but I don't think it will correctly pick
> up the sources for anything that actually uses that shared source code
> (e.g. clang); this isn't necessarily a problem in your patch however, I
> think it's actually a problem with any non-kernel recipes.
>
>
> On 11/3/22 09:15, Konrad WEIHMANN via lists.openembedded.org wrote:
> > https://github.com/witekio-kwe/poky spdx-fix
>
> Witekio GmbH is registered in Frankfurt. Registered office: Am 
> Wartfeld 7 - 61169 Friedberg. Registered company number: HRB 95432. 
> VAT number DE287400071
> This message contains confidential information and is intended only 
> for the individual(s) addressed in the message. If you aren't the 
> named addressee, you should not disseminate, distribute, or copy this 
> e-mail.
>
> We continuously commit to comply with the applicable data protection 
> laws and ensure fair and transparent processing of your personal data. 
> Please read our privacy statement including an information notice and 
> data protection policy for detailed information on our website.
>

