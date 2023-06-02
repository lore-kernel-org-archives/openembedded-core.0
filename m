Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D04C7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 05:21:30 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.5789.1685683287152102592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 22:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mgc9H90m;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f4f8b94c06so2221607e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 22:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685683285; x=1688275285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a/R/Wn1VG/wn+yLVJmuw+ldfgCGXr9kx0ghZkd1yclY=;
        b=mgc9H90moHyvMLYV92IlGv6rg8Tp8HNeFWEmFPDGYFEFcFHaNWaruIKiaKdkbgy3at
         DnJactUI9sbKhHRvhvROO8s+KSOfNcGKvVWlOLHsqYkelrF97e45/pssIgPO/ky3GBRp
         rZW8UMLNnCdZKsXryb/ZFTpcVqAwxoFKexQ1hOnp1me0TERGByIDXzq3d6XGoylq8WhW
         y4vzt2Fim5TZPUUQ1RBmdM7aMqD8Yltmdo6Gp2nd3w2jIV8rD6OYLbkJaa9o+/can2Iw
         95sLUbZCE+Kbseby0Yv+gCjfT39rrsjKC940xMM3n0kPzVwEwCKFFoqnXopIiybG7Ri/
         9xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685683285; x=1688275285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/R/Wn1VG/wn+yLVJmuw+ldfgCGXr9kx0ghZkd1yclY=;
        b=BQcTd+Pwz1jWmV8DJeUi/YFtt7jAswU7qkFfi83GLEey988MvLaPctdisLxAT878ha
         q9AVKVZv3vq1RLzuyyLrONpCCsggdcy62uHHvaINQBZxP4YxlWvv430v5liAvKywoCwq
         Ww3KVnFJStDaVbclf5hvVB1K4s8Hc5pYJTNBWIDMoks2je/232fkhmhj7/k8v6N9lb6K
         qej/lkYWHDM5NsxEU9JuvX1epGc0nE2VDVCBwW7VJKTKcvXlN8xi0PBE6I0D8NyBVD+A
         wLZ94oITe3cS8snLCKrv+p/bUftv9CL5htUNK0IOpxHkKK1Mdl8G/E+PHqrp1Nl9cStt
         woJQ==
X-Gm-Message-State: AC+VfDycbKxAKiYTp6tsJip0lIy8K9DYGtLssox4wco41sck2flUuB9+
	EoOlkfqXN33uon6DXY2iBrTU1peEQBP9zln2fYo=
X-Google-Smtp-Source: ACHHUZ58y4LbA0m9Cy9Y608hrmCuDoMAzxZuNYgY0wCBplBm350adJwVZ5nMQbVqM53xCzn0QptSNN5br88LvtTQUWQ=
X-Received: by 2002:ac2:514d:0:b0:4f1:496a:de8e with SMTP id
 q13-20020ac2514d000000b004f1496ade8emr1172000lfd.27.1685683285040; Thu, 01
 Jun 2023 22:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221114152347.z67ftsylidd3tfjt@amazon.com> <21434.1685656554319162310@lists.openembedded.org>
In-Reply-To: <21434.1685656554319162310@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Jun 2023 07:21:13 +0200
Message-ID: <CANNYZj-+shiYOgREJM65W4-5=toqiJ_5=HuJEz1tN6vfTGs9-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 05:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182139

Given that this was in November last year, I think the best course of
action is for you to take the proposed patch and fix it into a state
that can be merged.

Alex

On Thu, 1 Jun 2023 at 23:55, Vincent Davis Jr <vince@underview.tech> wrote:
>
> Hello,
>
> Is there any status on this? I'd definitely benefit from this.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182122): https://lists.openembedded.org/g/openembedded-core/message/182122
> Mute This Topic: https://lists.openembedded.org/mt/94945225/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

