Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323EBC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 14:48:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.37904.1702478871597214441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 06:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=cn9z0TJb;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3333a3a599fso4329737f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 06:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702478868; x=1703083668; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aa+3/1MImVjM8Yf9yjBeLqq5BjkBbqv9/M4nrUz6uVQ=;
        b=cn9z0TJbXF+YqB880j7RKC2ypDdktRvyJZ68NPAv7idFK3vGb98mJXlht3Ct8r6GO/
         DigjKNcUa7JqOp+5nVNAEAoxl5Q/ISTrVU98+E0v6rTncTKTRLWcUfoilIq+aKyzpLCB
         aKl0ZMPFEew7IaIAm8/Xy2XgM4CdbBiNsSno94dpnBmc/fcCsBCEw3xFnhY9Ilfy3yZ+
         ILjtBopoM39rZff2lcEiMi2z8VADQtIU8A0OHA9CV4MsD50qwoit8F5sHbtFUbjvL5oI
         ZyhagBkDTpDFXJC6NljAkxLQgPahj1saoxgMRxnkBX4l6chjHtu7bV4vH7y2WgIToubb
         W/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702478868; x=1703083668;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa+3/1MImVjM8Yf9yjBeLqq5BjkBbqv9/M4nrUz6uVQ=;
        b=VVMZ2kNzV2dXYDqPbhqFErkeN0JCTZeNxs9rdO+/1RqKR1OE3AemXLSALTsnAhO2F2
         G0FBm6q7JX9xVeEZFd+AvgVZwRvRRx8G2BN6crKT4SfQXmW4K5OuohBy0qd4bdHl7Gu7
         6USsyMhuyfGjktLZhNOqe5OkwGogoHg0og98NvrdCGU8q7EiKxlmtblNQb5Iv2QX0GBP
         lzoRpSvH/qAmDRxNemzCP+PJJiitoBzMipl0mqhcSs3ZjOKn2qUYDgx/fiuz1Fv4jM9D
         POUNtQ8lO1QwZmHHOl04/7DDAuLNlx7Qk9RNI01RIH3REpGCIgfM0C56490/k3Q4aExF
         DL1Q==
X-Gm-Message-State: AOJu0Yz7DhU+bWEtqJeYulTN6P5MsFmZShLE8b4Nik0Z9WKr0GFgslCS
	2MTIB+yRp7wHUDobcdTXpiT0rWKGxvmPn/GGgaKweQ==
X-Google-Smtp-Source: AGHT+IGxtcfIOLHRA5PSho0mg3h4nxbcdjaMO5vPCUM969XOo1/DXSzCcATZ3mCT2MIpG3J7iX0Y4g==
X-Received: by 2002:adf:f80c:0:b0:333:3b79:27d7 with SMTP id s12-20020adff80c000000b003333b7927d7mr4301465wrp.59.1702478867986;
        Wed, 13 Dec 2023 06:47:47 -0800 (PST)
Received: from [10.1.75.166] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id u10-20020a5d434a000000b0033342338a24sm13672226wrr.6.2023.12.13.06.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 06:47:47 -0800 (PST)
Message-ID: <06b5a060-5097-4e2d-afca-13af1c849e72@smile.fr>
Date: Wed, 13 Dec 2023 15:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/3] Hi,
Content-Language: en-US
To: openembedded-core@lists.openembedded.org,
 Jonathan GUILLOT <jonathan@joggee.fr>
References: <CXN9OZ7FYB2C.Q33EONS2A1HX@joggee.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CXN9OZ7FYB2C.Q33EONS2A1HX@joggee.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192296

Hi Jonathan,

Le 13/12/2023 à 15:15, Jonathan GUILLOT a écrit :
> Just playing with cups and observe the main packages includes localized HTML templates in /usr/share/cups/templates. Locale packages were only looking for files in /usr/locale. This serie of patches allows to add extra directories to be scanned.
> For a next patch, I would also like possible FILES:${PN}-locale-* variables defined in recipe not to be overriden by the split_locales() function.
> 
> It is my first patch proposal on this project. Thanks in advance for your feedbacks.

First, welcome! (If I'm not mistaken, we did work together some time ago :) )

Rapidly glancing at your patches, I noticed they miss the "Signed-off-by:" tag.
Try to follow instructions at https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#implement-and-commit-changes.
Basically, you'll need to rebase your commits and using "git commit --amend -s".

Another thing, the subject of your coverletter mail is "Hi," (you may want to use a subject that provide some info on the content of your series)

Regards,

> Regards,
> Jonathan GUILLOT
> 
> Jonathan GUILLOT (3):
>   lib/oe/package: replace in place PN-locale-* packages in PACKAGES
>   lib/oe/package: add LOCALEEXTRADIRS to define extra locations for
>     locales
>   cups: use LOCALEEXTRADIRS to split localized HTML templates
> 
>  meta/lib/oe/package.py              | 33 ++++++++++++++++++++++-------
>  meta/recipes-extended/cups/cups.inc |  2 ++
>  2 files changed, 27 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 564339afb73fc52a66c1a08437587cad1c4d46e7
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192292): https://lists.openembedded.org/g/openembedded-core/message/192292
> Mute This Topic: https://lists.openembedded.org/mt/103149509/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

