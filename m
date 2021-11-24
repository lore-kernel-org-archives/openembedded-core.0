Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB68C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:14:49 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3316.1637784888647375899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=laQWV1Ie;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id b68so3700915pfg.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=zv6RE/pM6u8SsOK7ZM23IHQw/sL+fz+nsrDaDDoHK7M=;
        b=laQWV1IeJLkW57w2tv3REWImCDEjrQA4lIuxpy5aqLIshu/8Y+x6Zo4+dbUj3HLThG
         tN7bygRQIXA6CtyvmFX6Wesr0E2TYo9R5cWO0LgEEuChvIh2j+22nE4PPoTzVcV18D3l
         jIF/5Geh2HhNggjwQRB5F/bN2czMdvhcS42TWhnhgEbsdNz7TBZmV6YsIXs0Yuf64hQf
         jTz78meG8Mi7CmZmc82Zv68B4eugioXiiBK6zoit0K1Fh6D5tZH7xBB6ek8Lx7iiMiX6
         csa2BTOTFxTm74HZ+Rr3XaxgOTM9LCv7/XpIbp+X1qI3G25vUEvC71w1ptTcrbETDa20
         cTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=zv6RE/pM6u8SsOK7ZM23IHQw/sL+fz+nsrDaDDoHK7M=;
        b=RLYOR5gDA8NrFBDgU7p+b1fnh4pD1kSmgv3ci8arBbKpk4ihZnxtGkhrKInL5uLSct
         QtOu3WumQB7XF/YLZWXZyeQVT+qfaXOd/+hZqiiVOtxCTtlzU7RF8LWk9xfZ1WykWikf
         2sY+y9ShjksiPVjLPNrWQQR3vAjGui4EMo1clSbysN01QZwKxRhy5HV7883jFAgKbuFp
         D3dLI2sKO8uVvbKbY0M/8igblE46C/RqfkuEmamSrF/DTr06RTOFG9+q5RSJytlQg6T9
         NZ+6S5aBHau+Nf3ZUaiXOSMSYSwlgZ9cHN7WKqaliJijJmpj2GuxpggD3+8tGjmNF+ly
         4auA==
X-Gm-Message-State: AOAM532iAjgPXrsVb17+gUyaVliWzegUUccHWqIDQllxL99SJ/KMB5ru
	fcyaJVKLH42j04p3hTZt/fnHQ0/Yw7TMlQ==
X-Google-Smtp-Source: 
 ABdhPJxWjQyiAd+sDpa6SDw1oPmkz1rrln7BEBXL3LT2MC/LaJD8e56lKQv0UFKwqj6T/y2IxV+m9A==
X-Received: by 2002:a62:dd54:0:b0:4a2:93f7:c20a with SMTP id
 w81-20020a62dd54000000b004a293f7c20amr8852843pff.46.1637784888034;
        Wed, 24 Nov 2021 12:14:48 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:d96d:2678:a69:27d6?
 ([2601:646:9200:a0f0:d96d:2678:a69:27d6])
        by smtp.gmail.com with ESMTPSA id
 h18sm561435pfh.172.2021.11.24.12.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 12:14:47 -0800 (PST)
Message-ID: <fbd5e08f-dc57-f796-d4ec-072b457873e3@gmail.com>
Date: Wed, 24 Nov 2021 12:14:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] rust in SDK
Content-Language: en-US
To: Peter Bergin <peter@berginkonsult.se>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <b92810a3-656a-8ad2-a8d9-960ec64cc616@berginkonsult.se>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <b92810a3-656a-8ad2-a8d9-960ec64cc616@berginkonsult.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158740



On 11/23/21 11:59 PM, Peter Bergin wrote:
> Hi,
> 
> I'm looking for information about how mature and tested it is to have 
> rust tools in the SDK. In README-rust.md [1] there is a phrase "Once the 
> Rust SDK support is added to oe-core..." which can be read that it is 
> not ready yet. In the first bullet "What works:" it states "-buildsdk 
> and -crosssdk" which I can't connect to oe-core terms.
> 
> I have suceeded to add rust tools to a SDK by adding 
> 'TOOLCHAIN_HOST_TASK:append = " 
> packagegroup-rust-cross-canadian-${MACHINE}"' to my config. With this I 
> have succeeded to cross-compile the simplest hello-world example for 
> aarch64. Is this the way to go or is there work to do (reffering to 
> README info)?
> 
> Any information around rust and the status in oe-core are appreciated.
> 

SDK usecase would partially work but the relocatable part might have 
issues since we have hacks to expand on install paths at SDK install 
time which may not work out of box for rust compiler tools.

> Thanks,
> /Peter
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158655): https://lists.openembedded.org/g/openembedded-core/message/158655
> Mute This Topic: https://lists.openembedded.org/mt/87277113/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

