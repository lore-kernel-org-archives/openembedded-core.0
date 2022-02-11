Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6D8C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 08:04:23 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web08.4755.1644566661438829321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 00:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I1ZFjjkJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id t14so11394754ljh.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 00:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hMhxFQG9aXbud3BcPcKFWy6DgC6jul6zGIGP+lPhUNc=;
        b=I1ZFjjkJip6YvhjYfWDceFQSCTjEWIdUjCgYyaCNRHxDG6+Cw6M4dDQ85fLZBkbwHm
         8i6hyg11oRq0zVgF7TiweS6BFUcDJuY6PQlE1yA+39ExE2ZaskI7x159hdfaispo+iNq
         AYguZz3sOzpSVIUZabU2cf7ww2vp6+kEo0g8YBUMn2k/EmQeJ/xY1r1Dyepfh9PQcxSD
         WwLAKtKsCd+WWQ1grXVuXlmLZfUBkOWNkA8Iuyf9Lmy4MwGzjc4v1Og8kG0s2Y18kP9D
         am1Y4HznVTJF2ttqGdCMeyidPCRRc4KHeNC/QLlcibo/lFqswxshuCW8ZQCMM0cykPGG
         3pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hMhxFQG9aXbud3BcPcKFWy6DgC6jul6zGIGP+lPhUNc=;
        b=1WENaY//24yf/OOo2et/xDD9cjB4JFIxGAwYR0gmoh3vl7BIrLso0qtkqIYXy+FDz/
         J5q1Ksr7WRvjPM2CxjfWYtwT+mCA8T65WYB5nvtQHOZDSLMSms6lPSrcT2xtLwc0qGld
         TMvCE0UUldJIAV544lQewI5q/eAYKCPqeFeAmOUn8L4CQEWwuSGFlcbVSozbWTYstEH8
         BnTskQv4dnr55NUgmUbhHhkcV5OdzERwMpDb6tSzK0Q4yYHTyUfP/0OVxOsAH2JeHv2w
         I74vyJLu56PVLHLuZsjKX3zudPtnRAG75GDT8V4+z2BN4X5YMLkwm8OiuozkaUf9E600
         T4FQ==
X-Gm-Message-State: AOAM533JeMiOnrdTt1pXULr7H82zE3oGuO8hWgqWWDbtkJbnbK/VUMgv
	CkD2i+wGijQPRd2G3qTDH4o=
X-Google-Smtp-Source: 
 ABdhPJxM+OvrUG3Xv/cUzgSoZ8BtLrT8rNDM8JKelCLKejmgn58xMHt5+nmZW0bS0itqgg+pv9S9fg==
X-Received: by 2002:a2e:b7d5:: with SMTP id p21mr320774ljo.522.1644566659455;
        Fri, 11 Feb 2022 00:04:19 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 g26sm3059851lfj.176.2022.02.11.00.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 00:04:18 -0800 (PST)
Message-ID: <4dfb7861-35e7-3e5b-3339-4a25c8166a2c@gmail.com>
Date: Fri, 11 Feb 2022 09:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@bmw.de>, bluelightning@bluelightning.org
Cc: openembedded-core@lists.openembedded.org, sanakazisk19@gmail.com,
 ranjitsinh.rathod@kpit.com, richard.purdie@linuxfoundation.org
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
 <YgPPaRecZGTG2MF9@korppu>
 <6b2b59da15e0889c58c2a79515870994aa29a5c8.camel@linuxfoundation.org>
 <1811908.CQOukoFCf9@linc> <YgYXl34nOhA1c7Ea@korppu>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <YgYXl34nOhA1c7Ea@korppu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 08:04:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161636

On 2/11/22 09:00, Mikko Rapeli wrote:
> Hi,
> 
> On Fri, Feb 11, 2022 at 04:49:21PM +1300, Paul Eggleton wrote:
>> FWIW I'll just chime in here as the original author[1] and say I agree with 
>> Richard. If folks are needing an alternative SBOM generation mechanism to 
>> SPDX, or have other use cases for extracting build information, then I'd 
>> prefer we take a step back and design such a thing properly. The original idea 
>> was (1) to expose changes in the output that might not readily apparent 
>> otherwise, and (2) expose selected "input" values that would (or could) 
>> materially influence the output, so you hopefully have a ready explanation for 
>> why an image / package increased in size or dependencies got added etc. 
> 
> First of all, thanks for buildhistory, Paul!
> 
>> I will accept that over time buildhistory has added things here and there that 
>> further the idea of using it for SBOM, folks no doubt have been using these 
>> for such purposes, and I'm not 100% opposed to making small additions where 
>> they make sense. However, even with this proposed extension, buildhistory is 
>> still not capable of recording sufficient information that (I believe) is 
>> expected in a modern SBOM - for example, the list of patches applied / CVEs 
>> resolved as a result - and I don't think it would be wise to extend it to do 
>> so. We certainly don't want to give folks the idea that buildhistory is good 
>> enough to resolve their SBOM requirements when we haven't designed it to do 
>> so, particularly as for many folks there are legal and regulatory concerns 
>> involved.
> 
> Maybe I'm "abusing" buildhistory then. The way it enables to have a git repo
> view with full history of releases on metadata available in SW builds is
> really invaluable. We seem to be abusing it to export various bitbake recipe
> variables from product configuration so that we can later on do some QA checks
> on them and record the details in nice git history view.
> 
> There could be other ways to implement the same use cases. We could have real
> QA checks in the bitbake builds which make sure certain recipe variables
> are correctly filled. We could export them into image manifest files or even SDPX
> to record the details per release. Then we could manually diff the files between
> releases to check for delta. Or a custom data format, maybe in json.
> 
> Yocto CVE checker uses a custom text format, a bit similar to buildhistory as output.
> There is the json patch from Microsoft in review.
> 
> Currently I don't see SPDX output replacing buildhistory and CVE checker output completely.
> 
> Then there is the current discussion about ABI dumps and how to store and export them
> and buildhistory was at least initially mentioned there.
> 
> Gah, now I thought about saving SPDX, CVE checker and ABI dump output in buildhistory too.
> Would actually be nice. Sorry, yet another use case where easy access build metadata
> to compare over time and releases would be really handy. This never ends.
> You've created a monster :)
> 

I want to add file checksums to that wishlist.

Jacob

