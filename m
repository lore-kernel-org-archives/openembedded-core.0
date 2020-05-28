Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.18502.1590690112726105388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 11:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f2nar7eL;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id i22so21279oik.10
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=5zerdFgSqXDrJ/eACqn91s5zqtgjiAj/ZmFDqlmiyRo=;
        b=f2nar7eLu9cPxMOSNwWrV4i976KyEf/ksp3JpGeE9aCnGGGl+wF1HBT1eOCY30Ji9E
         c3msqvKQWp5h+N3/UBDvvU8B25t1prAMDfVgF7PwKXIwkp3klQCY5vIZjnng3pC5adqH
         QRUATK4C0BDVxdb0Y4EWnMqfWFWmaGXsSnBEFzVQ1xMrgAgcMxBhL4v2E2M73whJh0p6
         ja8rYPT9HPEZp6QgZsKBi79hUkD+qyq30+PShSX4s7JXUW1+BRixmI6QMnyTmglgTn+8
         nHMw9Sxu7USaZK+rv6BOxME9XoSkNKKRG0icg95lxfLoc1EYXTl6TBomDObh1pf9PACI
         HMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5zerdFgSqXDrJ/eACqn91s5zqtgjiAj/ZmFDqlmiyRo=;
        b=Xjp42cE9Y4fn54ul+9Nk/nb5FPq/WE/EHXbZUAEqycRg0HTY4NuTcjeLiEDuxPX/jL
         /Q4LXfT8RoT2O5yTtNG0JPMHag49q2w1ueUu9Hwxb+Ny6dLBwpa1a4QolPnbRH0z04sN
         /NQmx9Ijyu8YgdE8Y5Upweon2+ctLfNMy0k9yQ1WO943Tc91dnb9vuVFlnNGlK8/8wIy
         rwH6viNjCQFptanJ3kncRVqxeGaSD1ic0icXDIKKv3x8lpwe2JRTPncuQws0G+ufnypc
         eMYD7JTt0JiadO67G7kxnojfwhkc4uDA27yZo43Kd2E203qg5Vi4Y9CXm+zM75Skz+Y4
         khjQ==
X-Gm-Message-State: AOAM530t9P4xAoKwwk9AG5tgPI5cZhnsjshbM1CZKIoBRxQiiPzG2wJF
	zbgRWHDfi/IEdgkKFmCN4o5ufIlergM=
X-Google-Smtp-Source: ABdhPJzIyjXl8xoYfjnPEYEFQbOYJnSGFmZ5e0THmCMNbxa13K4JsQNSTIqwSeM2aVwOY/BoISm1rw==
X-Received: by 2002:aca:3746:: with SMTP id e67mr2999538oia.112.1590690111675;
        Thu, 28 May 2020 11:21:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id n9sm1766942otl.76.2020.05.28.11.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 11:21:51 -0700 (PDT)
Subject: Re: [OE-core] go-dev and go-runtime-dev overlapping files
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>,
 openembedded-core@lists.openembedded.org
References: <e04a859c-e00c-e537-7301-6180e052b91f@bytesatwork.ch>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <6db4fbc1-8ba5-8008-3cf2-be1a3f59e3f4@gmail.com>
Date: Thu, 28 May 2020 11:21:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <e04a859c-e00c-e537-7301-6180e052b91f@bytesatwork.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/28/20 7:40 AM, Daniel Ammann wrote:
> Hi
> 
> According to commit 60dcae509a210f2cae8eda525a1b006663aef9bf, there shouldn't be
> conflicting files in packages, say go-dev and go-runtime-dev. As far as I know,
> this is generally true.
> 
> There are however many overlapping files in /usr/lib/go/src/cmd/. Should the
> recipe for go-runtime modified to not include those?
> 

This should be fixed with
https://git.openembedded.org/openembedded-core/commit/?id=307ad88822950e8523b313d70a1fbab87048fa8d

> Thanks and kind regards
> 
> Daniel
> 
> 
> 
> 
