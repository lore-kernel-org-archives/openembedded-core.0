Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4450CC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 10:26:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.12065.1750847214732295785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 03:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EU9RzSVn;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453608ed113so56282935e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750847212; x=1751452012; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtEcmTt6E7HkRNRd+LFFeh1n0rXminsCDLh5jR5/MfI=;
        b=EU9RzSVnnMTVvviBjgFoNvwVu2sfuxpV396H2vN7Kn/EtwtApWw0B1aVN2KsGYr/dV
         HI3e6gS4GdpYciibrkwa2cknOqg931hyK5H57ylsGA+6MwWWz5AbuY9q1iwPtGWJ3Xpt
         aYDVz7eTol+RKPETBm3Qrc+iJL2qUBH2/C2yNc/A/82+v15DZEIzq0eUXHJqwH/bLTbK
         /M6992uqAZqvfmuNkZiXfoC5JszFo5V8SBuZd5Zk9RcMA4oC8GDY6plPzUjirgAxNN7h
         91xdfF6o2rhNvBfWIPv+t07NRHz8//XWGO3PgV9aT9KRvzfamUlzhC8+VAVWGHpTlS2K
         DJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847212; x=1751452012;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtEcmTt6E7HkRNRd+LFFeh1n0rXminsCDLh5jR5/MfI=;
        b=m+kVuGOUvsthe6xUlHcUIkfWQPYeXga+jSH6Xb3rNzBfNZVEX3wGJUQbntC5pe9q0j
         A6K3oeaZbLvRtekaJRMwen7qkn8kTxDdsRZMOnTDR0gm3pf8MnFXosOQUTAi7/B8q2oj
         FOXCfDNgkTneL+rZ6+CeP87S5bVJ9KR/NUvjTzv+CwNn0yoR1MRrOAu2D+uLwUSAprMx
         /zOp5t8z/IPyFPKMitL3htSLAmhSzz8NL+KaJNSa/5vf2Ky9+OgjTgDGHRk8HKYa3s+g
         rkpQw+NShr4uEn1xtjExRGqyEfuYTBuii62XvLS/LN3dXqRCyKDN+qmDQTOLb1WQ1a2L
         raUw==
X-Gm-Message-State: AOJu0Yz/yFR3ZH5mmQ0cRTOwtCqCrKuyzpmbmbT983yCVJg6QlSTghcL
	ekMNRH/0sgwd7pRLZxcsnzjIOS4XTnTE6cgyDA7yxeAMjPRfkl0i2vYuuR0+xQ==
X-Gm-Gg: ASbGncua3MS6mSqHpOajT930Oa1q/Jol8QWoRnddZL/L84Q1XR2qUuh3gwu/6V5KVJp
	XRZ6QddJbVlok2bkFLZhQBo+8IjPQ88hfb1FNtaRVpEYFlvRQep0KI1APa4VrGnUwlonN2I2gEL
	bDnYSw2Z78L1/YV9zVPxtt8gztrGjImv0ug1vYSyAD6RM3C/6n7GgFbSUxlGS4kUzTANUW3x8Kq
	w0QOJT484EOcrjnfDszIT6Y0Sv+BBe0zwyyoMkByZC7MYpM0wCPdQ1ZW2Eo8BhUdpdkA2P92l92
	Z6kfBrSAYHWk15tHUNqMm0OUMQCm6KVaDXfAOaJrqLK7PLhVB2us/tA68w==
X-Google-Smtp-Source: AGHT+IGg4bzyBJ2i3yIFDQV0IHt5Nt3jDsd0g84ZAM/0Vr0eJnD001tH38CWhCV0bTVmY5j/OuFKtg==
X-Received: by 2002:a05:600c:154e:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-45381ae3576mr26353205e9.17.1750847212175;
        Wed, 25 Jun 2025 03:26:52 -0700 (PDT)
Received: from localhost ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538236694esm15806095e9.28.2025.06.25.03.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:26:50 -0700 (PDT)
Message-ID: <12213779-fcd9-4091-b340-44eb200bc97f@gmail.com>
Date: Wed, 25 Jun 2025 11:26:49 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: restore
 BUILDHISTORY_PRESERVE files
To: openembedded-core@lists.openembedded.org
References: <20250115153149.1827119-1-pmi183@gmail.com>
 <089b2ea3388321570537e1f7adef3a24efe3250e.camel@linuxfoundation.org>
Content-Language: en-US
Cc: richard.purdie@linuxfoundation.org
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <089b2ea3388321570537e1f7adef3a24efe3250e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219314

Hi Richard,
Thanks for looking into this. I was wondering if there is a way to know whether BUILDHISTORY_PRESERVE, or another variable, is not intended to be part of the end user API?

Regards,

Fabio

On 6/23/25 21:48, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2025-01-15 at 15:31 +0000, Pedro Ferreira via lists.openembedded.org wrote:
>> From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
>>
>> On each build using sstate-cache, buildhistory will move
>> content to a temporary folder named `old`.
>> When buildhistory looks for the main dir, it wont find it
>> and ends up creating it.
>> As a consequence how code is structured wont restore any
>> preserved file.
>>
>> Code block moved to ensure if old dir exists, it will
>> attempt to restore those files marked to preserve.
>>
>> Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
>> ---
>>  meta/classes/buildhistory.bbclass | 15 +++++++--------
>>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> I spent a lot of time on Friday looking at this. The BUILDHISTORY_RESET
> code path is horrible to understand and basically just hacked into na
> don top of the rest of the system. BUILDHISTORY_PRESERVE was never
> really intended as a end user API either.
> 
> After much consideration, I've sent a patch proposing we remove support
> for BUILDHISTORY_RESET. I think the behaviour would be better coded
> into the CI integration in different cases.
> 
> If we do want in tree support for this "reset" functionality, it needs
> to be written in a way where the code can be understood and it needs to
> have test cases. It would also need documentation as these code paths
> are currently undocumented.
> 
> As Ross previously mentioned the interaction with an sstate cache is
> also horrible and is another reason I think it is safer for the user to
> do what they want/need CI side rather than in the class code. Sorry it
> has taken as long to work all this out, the code really is hard to
> unravel.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219219): https://lists.openembedded.org/g/openembedded-core/message/219219
> Mute This Topic: https://lists.openembedded.org/mt/110629321/6083838
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [fbberton@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


