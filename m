Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.21288.1589571175561894766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 12:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DYitKSSY;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id n11so3740250ilj.4
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zec+f7IbdwzZFO8Jd9egyObOun2BD5hNtUf267URrAo=;
        b=DYitKSSY2DBqyn2zSfKqTgD9LiEpiogeMqOKQa92E8UwIK0ck6f7/IcB7m/BqHDxra
         c274bEsGuZpmih3Jsr9Oe4H+KdU1BTtL9ChNCzL3UiJqv/W41inG4D5fSyIcnxYq6ROf
         yy380uqZLwAPrgGH/DK41sXxXACnPKP6S07qaNdbZZSNw2qsVR/Fr6rj/YBSHUCpUqaO
         1nr2OKwNz2bSSN7DNh8ZxA/nts/LZxL8jDGCy9ZGarCJLBy/Zrl1EUJGnxjXTnBPa/AG
         QjT5EaOiIMHenuF3XjPQJ7hISnps65rdkFDLojIhpnxgo6Rqmza8ossWdNn5IQXYdh4M
         CMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zec+f7IbdwzZFO8Jd9egyObOun2BD5hNtUf267URrAo=;
        b=QBFYDBvC1R0nCpqwfJ3JMhzOx/srK8FhasMIunCob0W4OmV0hvZdpCY0fX6DaoQj06
         tHeBIBtZO7bS6b8P+l1p3b6u8g2Yh+oKrxcF2KHUa3uK0FVtneOf4mHKrmn2UebbzxVu
         CzvedFjhtx3cvNg8gYQAce34GQCBuMG2LUVK+63J33nKfdxwCQHCFHVUTS1Aw8+JoZQS
         SXlPKON4lIz/4TFj0RVCpY7EXYiieKvie1jsvK1Ybuwy1z7KWERdEEqxgOYEdbhb6ohG
         9yGqG4EttVZvxd53qMvJjvG5Tta5VWrFgQlRVNq+OayMfMp8OWOJak/W0l2aAYKN78Pw
         iTPg==
X-Gm-Message-State: AOAM532f7nR9l3en+lnrAPksdSMNlDy+vxGchIvV0MUvrOSqIMApONNq
	Vb8Rn2UzN93WlgI6T3p4RSQ=
X-Google-Smtp-Source: ABdhPJz47MaSCSXNp+V33M8RyL71sP97Sx8A6j8dH1xi26AFkeWgV8medDZKMc7ZmjuBbZNc3os2sw==
X-Received: by 2002:a92:8b43:: with SMTP id i64mr5084556ild.171.1589571174822;
        Fri, 15 May 2020 12:32:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:33:f6fe:2ae3:dbd8? ([2601:646:9200:4e0:33:f6fe:2ae3:dbd8])
        by smtp.gmail.com with ESMTPSA id g3sm1249470ilq.16.2020.05.15.12.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 12:32:54 -0700 (PDT)
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Joshua Watt <jpewhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org, jdmason@kudzu.us
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <faff3240-ecfa-2f3a-4601-a7ad41952b99@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <d8d2af4f-9fa6-d27c-41fd-6d214012736d@gmail.com>
Date: Fri, 15 May 2020 12:32:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <faff3240-ecfa-2f3a-4601-a7ad41952b99@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/15/20 12:12 PM, Joshua Watt wrote:
> 
> On 5/15/20 2:05 PM, Richard Purdie wrote:
>> On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:
>>> I see Richard has merged these to master-next, thanks!
>>> And thanks Joshua for volunteering to maintain these recipes :)
>>> I submitted removal patches to meta-python.
>>>
>>> So, it is good we are getting this extra dependency resolved in 
>>> master. The
>>> question is - can we get these backported to dunfell, does it qualify?
>>>
>>> Otherwise Jon wanted to finally branch off meta-arm into dunfell 
>>> today and
>>> we'll have to live with it until gatesgarth.
>> I put them into -next so we could test them, see if the autobuilder had
>> any surprises. Good news is there weren't any.
>>
>> The question still remains whether this is the best approach or not and
>> some people I talked to were not convinced that a consensus had been
>> reached.
>>
>> The question I guess is how widely used is optee and does it warrant
>> adding this? Its a little ironic the thing people want is trusted-
>> firmware...
> 
> FWIW, after having gone through the exercise of pulling in TF-A into 
> qemuarm64, I think I've been convinced that op-tee and TF-A belong 
> together since they are sometimes tightly integrated together (something 
> I didn't realize before). As such, having both in the same layer makes 
> sense. Even if TF-A was in oe-core, you'd probably want op-tee also, 
> which means the python modules would have to be there anyway. I think we 
> can still have the discussion about moving the whole lot over there, but 
> we don't need to do that now, and moving the python recipes at least 
> cuts out the meta-python dependency.
> 
> My last concern was testing of optee, since there was no platform that 
> could build it by default, but I fixed that by implemented support for a 
> qemuarm64-based machine that's defined in meta-arm which uses TF-A + 
> optee + u-boot and can successful boot using TF-A and passes the op-tee 
> unit tests, so I don't have any concern about that anymore.
> 

I think getting oe-core qemuarm64 boot with uboot+TF-A as an option 
sounds good, and if thats more common solution that armv8 devices are 
following then perhaps would make sense to have this tested in core too. 
But I guess that can be ironed out. As such python deps I think are good 
for dunfell too, we have to ensure meta-python removal happens in 
dunfell as well.

>>
>> Cheers,
>>
>> Richard
>>
