Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64801C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 16:11:50 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.138.1635178309540350157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 09:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YGVshvdU;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d5so11233790pfu.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=q2dG+cRw5KL39xwCwtdFVAHoO1cjPHG1xWzbB9FQIe8=;
        b=YGVshvdUokiSLjG8chJ86ubRUDRWpn95xZZ9DrAjWl3sEhqu2JQLT7lT8vBGqvunp5
         EyJ19u3E0ORUY5EgHUuEuL97U5IrmRW5aLVPzuGC6JFptQCIpwIswhlcTRKXA77nWMoY
         qS0CV2LK7rTmCZSnm40CNGEDsJDcA48GGQEsL6M6BluQfN+2w0zLCCjMeJ1ZZ7eiur2N
         Oqjzte/GrxW/fhH6OQtKKFBeWtujUPLywMP7B5m5iMzIQZa6mF52+YyeTfFljNaH0siN
         tFzltorRE8vt476V2twTUcalDu6hew2BWHsVBQ/LwW2NNqfGpHDI4V1DYc4YhCnh33Ea
         kKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=q2dG+cRw5KL39xwCwtdFVAHoO1cjPHG1xWzbB9FQIe8=;
        b=vWzYuAFbnMGEFQho7Jsj6WtqHE+KZtJ/YZLmqGkD5s73XRWgGVjcK0JGTXIzcXqXOM
         cyvYho/sOfBwXHg7/dpOq5RtY2yiHKVO2fR4dl6LMcf7EK8kkT4ZGcORYNIKh+vTzuCT
         eYDmH/8ULSC4bkLRiOO/pVrDIvcM6zA7vAx8ETK85imuAryOOs186nqHraxI1h5J+4Uz
         OpZl8ou/7szgsWAGt8YJeSCtjFb29ddSL0YViSCQzB+e4dcHC3D65UbKp3CR+dAChZWi
         MSkvBNNhGec6IJdic0+0Dl8BqCNrueH9rFBYy4exnBHm1GFpPOUTvgO2ZpFZkda2e1vb
         X6lA==
X-Gm-Message-State: AOAM532rU/wvexCeliGaEnfwf4hsMSRAzzIenxa6+hW6C8tpxeXgivSJ
	UNamt5Au71aUKkY7Co8HjsY=
X-Google-Smtp-Source: 
 ABdhPJxuxlcK8Ffm5vfQkoO2y99vj59t4uaeLh5zKsvKjsxlXltfshnoyuZEmercZ1mlHvUrhro3Ow==
X-Received: by 2002:a63:e216:: with SMTP id q22mr14210600pgh.3.1635178308569;
        Mon, 25 Oct 2021 09:11:48 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:38ee:f227:46a3:aa85?
 ([2601:646:9200:a0f0:38ee:f227:46a3:aa85])
        by smtp.gmail.com with ESMTPSA id
 w13sm22180424pjc.29.2021.10.25.09.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 09:11:47 -0700 (PDT)
Message-ID: <10b9c847-dcc9-0596-2fcd-7e01ad2e48db@gmail.com>
Date: Mon, 25 Oct 2021 09:11:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [OE-core] libtool patches and possible release
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <e91fd7eb9c529d07029e3a326e4c65cced626cfd.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <e91fd7eb9c529d07029e3a326e4c65cced626cfd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 16:11:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157350



On 10/25/21 7:55 AM, Richard Purdie wrote:
> Just for info, it is possible libtool might make a release. Some of our fixes
> are quite useful and would be helpful if adopted by binutils and so on so
> getting them upstream would be good. As such I created a git recipe for libtool
> locally, rebased our patches and then sent a curated set of 12 of them upstream:
> 
> https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00012.html
> 

good deal

> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157349): https://lists.openembedded.org/g/openembedded-core/message/157349
> Mute This Topic: https://lists.openembedded.org/mt/86578943/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

