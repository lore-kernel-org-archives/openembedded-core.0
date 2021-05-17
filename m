Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.175.1621274227309123350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 10:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GBuweH3f;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so41611pjp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=QtjxfGfSqjzeI9ytLPdvzOlVSmvrh5tm0tk3vmmvaPk=;
        b=GBuweH3fVOgNrmn4bohSWg1WMuCdh1DijxnyYHHacTqyE+Puvf67Q7Ma6OCsYpUYz/
         jEvSNzH4Gbyj4ZRP5GY8PO+5z7t0JKtljBR5TuRzSkVqGhfpN09Tde4iqnVtCW55N6cd
         UD9H7K3CcW/GsfaA2AEt9xsSO/LMZQGeac6ijm0N2tuzxTm/8X+R1NlD8EfvBhIDxG82
         pFQ1xYIiTQPS1W+UqTpzFEKFwTYYHvEaL7kReuFKKMOGUbePxBasMT/yFfOHj7RUeOyo
         WogJjik8lyQHFZ6eVl564/HzR7vjmXeXLAvM3OdRQllmsREu8/U5Z084QCH294NUUhcH
         Qcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QtjxfGfSqjzeI9ytLPdvzOlVSmvrh5tm0tk3vmmvaPk=;
        b=n2WfpFE4+wfj5EzyTSHHrzsNDsSTI5ACKMJZ5AG7t/HyK4izMnq0abhb73d2TWj3TV
         uOJ6P6OM8jrf/w5apT5jW8X7e7xd2+vn7hqkBb1MozsSJzCqqqc/+5Q0N7FjbFGcA7WC
         0UBaCKYQFbrmLPNlX+stJJ7b6NTeKzEGy8WE/1/ICEu5/02fVDgjDHXxPkVW1ekwrdLo
         EhGprYDh1D3zlZXzC2q8ybfY5FqaDuL4oVHeAkX0+99e9y8RDjC/Sjal7nYocMrKbhgF
         mjdylfUsIXAmVmfb1iCHnT1NlgcstXWjX0e9rxWf3FAQhs/5qYg0wEED/FgPyNwfZkUE
         VBOA==
X-Gm-Message-State: AOAM531QeB6Ac5zn+xyRrSLvdTxSXZeCN/USYkNjxDybKa8DPRxbDz/Q
	ytedYfCSXIO4Gg9BT2NAEE8=
X-Google-Smtp-Source: ABdhPJzwKT63zVWqb2eMevccGDo/6+P2YvmV+TZns8efZRvohcLRfMsZLXaQKsmpfIi+7rhTreXLKA==
X-Received: by 2002:a17:902:c60b:b029:f1:55a:7fe1 with SMTP id r11-20020a170902c60bb02900f1055a7fe1mr1258776plr.33.1621274226864;
        Mon, 17 May 2021 10:57:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e1a5:920e:5720:62fe? ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id j7sm10298672pfd.129.2021.05.17.10.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 10:57:06 -0700 (PDT)
Subject: Re: [OE-core] Recent runqueue changes destablized hardknott release for multiconfig builds
To: scott.branden@broadcom.com, openembedded-core@lists.openembedded.org,
 Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <331b520c-6c5f-76f3-f1bf-ec15180e3e39@broadcom.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <1db039b5-729a-5888-0ab0-c6eb125e71de@gmail.com>
Date: Mon, 17 May 2021 10:57:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <331b520c-6c5f-76f3-f1bf-ec15180e3e39@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/17/21 10:29 AM, Scott Branden via lists.openembedded.org wrote:
> I tried updating to the latest hardknott and various multiconfig builds now fail.
>
> I had to revert the following changes to get back to a stable build:
> Revert "bitbake: runqueue: Handle deferred task rehashing in multiconfig builds"
>
>
>
> This reverts commit 58cbdaecf75b0248f96780b6882e8d4f232d038a.
>
>
> and
>
> Revert "bitbake: runqueue: Fix multiconfig deferred task sstate validity caching issue"
>
>
>
> This reverts commit 8aad4c243a542c8720cd23b6d1c4267916393df3.
>
> Also note; I see other changes sitting in master-next attempting to fix runqueue and multiconfig issues.
> So I tried cherry-picking and still have build issues.

Can you provide more info like error messages or even a way to reproduce
this?

-armin
>
> Regards,
>  Scott
>
> 
>

