Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.1354.1610655508342095035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 12:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OJkeg2j2;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id b24so6435844otj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 12:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4tn/iyPaI+tMjyFBQ5Jf4/ZNAQ2YaoYaL6iLkjw/Ml8=;
        b=OJkeg2j2b6vZ+KBE5iLt9qjUGiZta4hyBLqsJqTdto3PRDdH7IbLiQOYUFo5bbdN+j
         Ka2OAdgaKNAdE9MpOj6VsoLUaXqXuilO5PrV+LuuYAgeQe6LTuDpXbNR+JGOEKSJqFEv
         Y04Ys0v6Jbr06Twfo6iItf/nmEFO8gXzy2iXHkx9bLwsbPUe9ncLTPxsvg201ixobT9F
         M3YN1mGId2ckwtWzr+UPGB2jteMdwaZrL7cKhSumWyK0hVFucMWhihGkEeM7k2xiUsF+
         6X40Ne17xF85NNVW7p01lJUH7ExgpM+zJ5Hkh3+g49FSHjOWzVCxH5ipixR+2Of9VvRZ
         UDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4tn/iyPaI+tMjyFBQ5Jf4/ZNAQ2YaoYaL6iLkjw/Ml8=;
        b=QgbfSaErpK5lO6GzF+BcXrBG8Fq3W9FqLJq+LSurO0Ir1HhDjnGa7WQmhjpXKaJtt/
         kaEUP98xsBWB5FTLwgcOcYe5G3/5wULoxEEZIH3dl7drrt/WR/4Pp2/mt6q8jyiQUML0
         auwnV46Rkz22kry3RFZGF7xDUpnO0ZCJXeLTbGw/A3VRwy30mnf9vY6IF80EnzbmuoN4
         MAuBZ93RBl7SbUIQJZY+5TyurU+TMXbF897QelG0cB1DpxPYZAI3ENDc15wt2mAf4V8M
         vcHWeYdbP50xswgoGVbEiZoU2TjRkX0hriV5qnlf47j5NTPDti6HkqCbqUAFcxZPkpDi
         13QA==
X-Gm-Message-State: AOAM531+bTtta14ja7blqLIhlDTjqRPGGFT33tZn5y6/k7Fk2U6dHYXv
	96I50eOMUuRGTHv8smxmCv0=
X-Google-Smtp-Source: ABdhPJzmW4OOQ6W4PgrupobYxDli5UD+B0h8hhhFMyELAJdAm9rOiDNon9BiFg9nsbOMXwoqP6Ek+w==
X-Received: by 2002:a9d:675a:: with SMTP id w26mr5721194otm.340.1610655507701;
        Thu, 14 Jan 2021 12:18:27 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id l142sm1247217oih.4.2021.01.14.12.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 12:18:27 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] fetch2: git: Append the password to the username on git URI reassembling
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Dominik Schmidt <ds@technokrat.ch>
References: <20210114161153.17719-1-JPEWhacker@gmail.com>
 <ebf409f9-54d8-177d-a19f-3f7e3ad0a539@gmail.com>
Message-ID: <dcc64ae3-023a-c5fd-2755-8f8a81462f4d@gmail.com>
Date: Thu, 14 Jan 2021 14:18:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ebf409f9-54d8-177d-a19f-3f7e3ad0a539@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/14/21 2:16 PM, Khem Raj wrote:
>
>
> On 1/14/21 8:11 AM, Joshua Watt wrote:
>> From: Dominik Schmidt <ds@technokrat.ch>
>>
>> This allows the users to specify SRC_URIs of the form
>> git://user:password@host.tld/path/to/repo.git
>>
>> which allows pulling in private repositories.
>>
>
> will this appear in package metadata in rpms/ipks etc ?


Possibly. There are a lot of problems with it, so we aren't accepting 
this patch. I sent it in error :)


>
>> [YOCTO #14065]
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   bitbake/lib/bb/fetch2/git.py | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
>> index df9538a60d..a1356ed9f0 100644
>> --- a/bitbake/lib/bb/fetch2/git.py
>> +++ b/bitbake/lib/bb/fetch2/git.py
>> @@ -606,7 +606,10 @@ class Git(FetchMethod):
>>           # removing the password. ssh keys, ~/.netrc and 
>> ~/.ssh/config files can be used as
>>           # alternatives so we will not take patches adding password 
>> support here.
>>           if ud.user:
>> -            username = ud.user + '@'
>> +            username = ud.user
>> +            if ud.pswd:
>> +                username += ":" + ud.pswd
>> +            username += "@"
>>           else:
>>               username = ""
>>           return "%s://%s%s%s" % (ud.proto, username, ud.host, ud.path)
>>
>>
>>
>> 
>>
