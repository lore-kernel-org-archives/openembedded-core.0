Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.259.1593103476205647615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 09:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cbYboVRl;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id l63so3515219pge.12
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qf4bVZsReoKORZ/7FyRghyd6kmeSLVZp7ybnfKMgVa4=;
        b=cbYboVRlTDTU/JqSlGu1AKtwi4TmNyWXR6y+9S3fOv1dotW33KtncNkIcn7njDlYaD
         FZ1B2lMnouGZz0Y2ymOoUsQ20+cCBWsyq2Pjs/eqpSUwEa+wQOrAG3kS2uFQbgsjY9m3
         setnzaUS31Drm+pOYHU2d6SOhmzvQZflDoDJLffeycmRd70pJgbMmGBuvRj+ybcP/o3h
         IlgcjNaqBvGVEUgJJKfMzWy3CMmnkisuYJdG7gA/7dq5jMujgGVimQYAia92jWuST6iC
         ETMGGLihOH8WUaAk0cMcVVc7dIcNf4vaQlWBqrP1Uh7D7cUmN7Uhx0SwXdWYKb/c55wS
         kl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qf4bVZsReoKORZ/7FyRghyd6kmeSLVZp7ybnfKMgVa4=;
        b=DuLLU1qpWBCtDpaMWFrhili3WaXncx+FIriq0fKkqhcOAwWrgkQEVMXJaNltTvvPhT
         w4cFd2O64nD4eVMTWKv3y/3iru4CqImc4ZlriFHwwPi5h6zzJYR+sKNMKfnznjH9BOCf
         5fRVXpnY46uhkoL4GFoYmUkOCTqHX3sB1GPmvizmbKpBdZ1zam7vL8iWY3xT5kdEn/25
         kHZFyzWEDuMzDkHQgx5+zuYMXfhK7btaNTSXAISyouOQ0RkIXmWwr/kNlapOkf2O+cfj
         mE0Xog+ng14Rbrrd32Sx1TBljbBM2eMlpkCiDFU9zPTBgfVRXf4SS0Fjh9rH4LCORojk
         iJ2A==
X-Gm-Message-State: AOAM5315N9WR7GY/sDCTfI3MeuGs64ndzl8N26T8QFjzjmmt5LDz8upa
	47sbgxygZl59bUJLo43A6UxuuGHtv4I=
X-Google-Smtp-Source: ABdhPJyaU8bajo2+lDbMkm7PPcoHVLOx+TlahSXuLYFrBQiiuWDG3zH0Fku9rjOAzW11JlZOq6heuQ==
X-Received: by 2002:a63:1444:: with SMTP id 4mr25664861pgu.388.1593103475110;
        Thu, 25 Jun 2020 09:44:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::dedc? ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id y9sm23219827pfr.184.2020.06.25.09.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 09:44:34 -0700 (PDT)
Subject: Re: [OE-core] Status of Go support
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com>
 <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
 <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com>
 <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
 <CAP9ODKo=41yAPeMvLU4uX=0fj+x3rv5DiAHMCFu_BwYWWm3uQQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <da227c4a-c72a-1645-96b6-30de31ef0150@gmail.com>
Date: Thu, 25 Jun 2020 09:44:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo=41yAPeMvLU4uX=0fj+x3rv5DiAHMCFu_BwYWWm3uQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/25/20 9:43 AM, Otavio Salvador wrote:
> Em qui., 25 de jun. de 2020 às 12:36, Stefan Herbrechtsmeier
> <stefan@herbrechtsmeier.net> escreveu:
>> Am 24.06.20 um 22:24 schrieb Otavio Salvador:
>>> Em qua., 24 de jun. de 2020 às 17:17, Stefan Herbrechtsmeier
>>> <stefan@herbrechtsmeier.net> escreveu:
>>>> The go-mod.bbclass download data from the internet during do_compile. If
>>>> you cut the internet connection after a do_fetch the do_compile failed:
>>>
>>> Yes, this was the better we could get without hacking go mod tool
>>> itself. It would be nice if you can provide an alternative way to
>>> improve it.
>>>
>>
>> What are the alternative?
>>
>> a) Add a fetcher to bitbake to create a vendor directory via `go mod
>> vendor`?
>> b) Add a `create_go.py` to recipetool and create a recipe per module?
>>
>> The solutions are related to the npm (a) and python (b) solution.
>>
>> I don't like a) because it breaks the best practices of OE (for example
>> one major version per project and avoid embedded dependencies). On the
>> other side b) isn't so simple because of the circular dependency between
>> go projects. This means we need a package (recipe) for the source and
>> the binary.
> 
> Honestly, it is hard. It kinda conflicts with the way go mod, cargo,
> and similar tools work.
> 
> Offline build, using go mod, I can only envision if we somehow provide
> a local server which uses the bitbake cache as source. This by itself
> is not a small project.
> 

I agree, its a losing battle
