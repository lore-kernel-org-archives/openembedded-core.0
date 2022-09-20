Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95ED6C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:39:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.3587.1663713596530902677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CMKluhaM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id c11so6885601wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=di5GqYDdyE8hOtVGyK4VuFQRZu5E8PwpSUs7SrnwiSw=;
        b=CMKluhaM5vR5u/DKR0UBtDCDDWnxCW6bVPbDka9PnuuSL/YRFmHUQJc6UVFVjfyIBf
         Kfj0TE5rKxLFb4vqolTqAu9PNri/LWNqc7q6cUWq6Wg3gdOVJBtBW5YPUPz7JZiA1EEH
         SJarthlzJYTvBr0dMgRKhfhakZPDdw/UXA+9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=di5GqYDdyE8hOtVGyK4VuFQRZu5E8PwpSUs7SrnwiSw=;
        b=ysamYfgeW0vR2h/fC3QTHr+nO+Uwd4eHYWT7IkL7/ecac3cEic7NMpWrlxQhKfJpJd
         h5r+h9D4rXs9t8DJNRSM47fKNWzsuVzpk/1fvBwACZAxe5mDvGT6wasMZp141X5cp7ud
         HIdXx+2/epz9VziH1lKIleAafqFHl32Ulh6OfnoAJxY1VJgPtxh50slKDiM1jtaoi1SX
         UvD5Xdz+STpsK5ifHj3Tfvv9Ivyu/QhcV5eXxzw8j01Gk7WOLThyx8rd5xz+GhsG5diS
         62Q+ogYbVPDi6jRwajoYxjq+vAsM+2yDjqdLoOgrGv7Ga0XVgN7Fkh4QnK0o64qarGgO
         JohA==
X-Gm-Message-State: ACrzQf1esyUufhg2h8d9pNb3zV8dETIf6TIJw/rLAUXsSPFuL4PyZJWe
	hsbSkupQx3qZrhD4jsZ/iid9ZQ==
X-Google-Smtp-Source: 
 AMsMyM43JhNFD2iAa/SH5h/ErLV8wxVGPJBk1mLBsmWzOyzx7S3565TsLAOkpoh1+M4POXNGjBIxow==
X-Received: by 2002:a5d:6f14:0:b0:228:e3c6:fa2 with SMTP id
 ay20-20020a5d6f14000000b00228e3c60fa2mr15452820wrb.516.1663713594612;
        Tue, 20 Sep 2022 15:39:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b663:b06:b4c5:e314?
 ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 cc4-20020a5d5c04000000b00228de351fc0sm978372wrb.38.2022.09.20.15.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:39:54 -0700 (PDT)
Message-ID: 
 <5bf33a2e228ba1e20d843b8dd3b16c3fbdcda3cc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2 v2] rpm: Upgrade 4.17.1 -> 4.18rc1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2022 23:39:53 +0100
In-Reply-To: 
 <CANNYZj-3C7jdhZFcu5XB7zHqbaiVtfgvDoOFrm+Pu7QOJ8w60Q@mail.gmail.com>
References: <20220920221250.1544461-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj-3C7jdhZFcu5XB7zHqbaiVtfgvDoOFrm+Pu7QOJ8w60Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 22:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170916

On Wed, 2022-09-21 at 00:27 +0200, Alexander Kanavin wrote:
> Is it possible to submit fifofix.patch upstream while the issue is
> still 'hot' in your head? :) Should be just a github PR.

I had already done so and just forgotten to update the patch:

https://github.com/rpm-software-management/rpm/issues/2195

I did also realise just after sending and updated the patch to
Submitted. I opened an issue rather than a PR as I'm not entirely sure
upstream will like that fix and may want to do something different.

Cheers,

Richard



