Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96033C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 07:32:27 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.12684.1698132739518282659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 00:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EiRn4vMG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso6394151a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698132738; x=1698737538; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhzB45o3K/gKNjioMBFHuxWweUzXz5W960fEJn5Wckk=;
        b=EiRn4vMGazQKHPD5yzWGKCab68WCB7DK7sxfxDlUFLnsSQOn4lkT/vOIeb2jwOsXkj
         9r+zvDeT9SVd5Xfp7JFyFHmA80pLtG29iROYjqznJiulbZGHa/bz/KwZTog0SwrpIzIN
         c3FllK/3sQiKK5zoiXuocme6yNFX7dpLVRhIlxUBBsPvJbSBB4X9OssfdH+tzZNAa1Ct
         +J/KC06MtANydCaCelxS80WYvcLuSmHQOjw08bPEeTEK3C0zklHku3w0l1OYM8J7Wj54
         40mh2QQSPj3jqIgWHO9Q1gZ57oNs3pFjpd8ueRTnQqMjqH7usbgjvtfaepsOjpCJri/y
         zuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698132738; x=1698737538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhzB45o3K/gKNjioMBFHuxWweUzXz5W960fEJn5Wckk=;
        b=jwK6/UD8FD3WeZQ3GQPEQmYXskY5VESCBYlXHYxllFmh6PMj2JZkzYJ4p0w40Qddzi
         uDwr3IZ4ygLPDSS8/HxAEoPTxuLkKrSGAOWdxZiDtVAGJANWemAb7aD0rxniwTstWqlf
         kWbRiYwr8tq3MVeq1wXcX9iaEDaBspgJoYWAEkRnAegzLwIvN9Ps4tZH6eyaCt2lM8Iy
         /9WHJFsVsFs31xOeXjT5aSfOEFlGKrSGGSSH2xzlCAfosvGqlEGIOb7Xg5y6dtBNE7Ll
         GG04XhDS8UstASM94VbzQNf+rYxcs0TsnADIrACiZ8qFERXvpxIW6fekQkgZrDZeenOq
         igbg==
X-Gm-Message-State: AOJu0YzjaT/QXCabs+pmncl2QUjYnqQ3EJxTnLB7DMlyfM5zHyNqySVj
	QNT0vCylYO9MFxTIHsRb7Cc=
X-Google-Smtp-Source: AGHT+IGRL2bK9CJ2WHj6K/GjU2euRoUIQLZS4kzrXLHVJs1jlPhby6Dt0vA/vTssQZZxiCs2rwPE4g==
X-Received: by 2002:a17:906:dc92:b0:9c7:59d1:b2ce with SMTP id cs18-20020a170906dc9200b009c759d1b2cemr8124227ejc.5.1698132737424;
        Tue, 24 Oct 2023 00:32:17 -0700 (PDT)
Received: from [10.134.49.234] ([89.249.73.141])
        by smtp.gmail.com with ESMTPSA id b24-20020a170906039800b0098669cc16b2sm7705225eja.83.2023.10.24.00.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 00:32:16 -0700 (PDT)
Message-ID: <434baea6-40f8-4933-ad38-e43a55c96106@gmail.com>
Date: Tue, 24 Oct 2023 09:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
Content-Language: en-US
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
 <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
 <201d71f6-835e-4079-8c75-bce3d59504e9@gmail.com>
 <31a2b61c-ae3d-4726-88ae-8b2cd2bf21d3@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <31a2b61c-ae3d-4726-88ae-8b2cd2bf21d3@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189639

On 24.10.2023 08:19, Lukas Funke wrote:
>>>
>>>>
>>>> - Could please clarify where does the version from go.mod hide? Is 
>>>> it taken directly from go.mod? I'm trying to understand what should 
>>>> be the workflow when a module version should be bumped up in the 
>>>> go.mod. Will that be reflected in the recipe in any way?
>>>
>>> No, currently the go-version doesn't play a role ATM. Except one 
>>> case when you have a go.mod file with go < 1.17. These go.mod files 
>>> don't include indirect dependencies.
>>>
>>
>> Still trying to wrap my head around... When there's no version at 
>> parsing stage, how this will affect reproducibility? If it's not 
>> known, then whenever the version is bumped up in go.mod, a manual 
>> 'clean all' will be required? (It's probably the same as now though).
>
> Maybe I don't understand the problem: Is it required for the go module 
> to have the *same* version as the golang package in yocto? In my 
> understanding, when the golang version is greater-equal to the go.mod 
> version we're good?

I think I mixed up with revisions here a bit. What I meant is how the 
bitbake would know if versions of dependent components in go.mod have 
been updated.
The easy answer I guess is that the revision of the main recipe (that 
contains go.mod) needs to be updated for that, and I hope that bitbake 
would refetch new versions from go.mod, but I didn't check it yet.
The more complicated scenario, what if I use a devtool workflow? Will 
the fetcher be able to reparse go.mod in this case?

Slava

