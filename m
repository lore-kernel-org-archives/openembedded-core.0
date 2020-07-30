Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2059.1596085954591084034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 22:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HPZ4D9VN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id w19so159273plq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 22:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Qu/Yg0nnLtZUUWdSyDJ/59UaRM5FI/ReoDcVZI1UFKg=;
        b=HPZ4D9VNMLx5H/P5fgvUvmQrNmJ53pIOS7rfO5HPQ2XCwrimi4jz7XFRXRRILwJlg4
         h0lBARrEkXUiFVkCzomjrQcgRjYzxFqd7DYFAZdxOfVzmrz5G0FfapyWioG6v6Aphgg4
         gd9XKTrQM0rp1fVFMG8oYuFD1+VcwGFTqJBfDL9mZ6s/u/UAh8OMTtTgdB36JkI3orox
         Cjfi6xmn1c1Rw72fOq2NGxnot9xtZmUA5j+2CqZ0k5UeNjb7IVLWh7mN7v+u4vsVKNIt
         R9m7RbNV1oXAHzukjv/VknAXLcPhd/98NARG8hKD/IgrmgNPxnfoIWLFMwjKDJlrxrBW
         eQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qu/Yg0nnLtZUUWdSyDJ/59UaRM5FI/ReoDcVZI1UFKg=;
        b=GUNT0mQiX5YjtzQ16Yd55LybQmPUdOoQisZFPhDrizKvlX+bVTy69etD8T740lFubl
         Dwsl74G5fna8O+fvGygQZuQMPPR5PQ7N7Hhu9UD0+MWD2SZZfMrK7+EmO5VxJ8ExRgvB
         90HXHwiBJV67YwceHOFH3XogFR6SfET7GyxK2fwD8QtjLToF8V30iB9vTUEWJgIZaFMR
         BIRcxTW8k88UEXmzcfOAG+FErk/TaJb0G2HmEa54mu4XsnhFP1nAdLkg1V5t3wNRMLUg
         A8JF6owb3atA9y7wD0MqKlajNiKdRvxYNCDo+j8ihojr7ep5vXl1UjVnXjUdRVbTsd8b
         RtXQ==
X-Gm-Message-State: AOAM532edgi0qL/3AL8k/dJK0Hi7z8ln6P8evKmKPjpS1vw1LyFcdGzf
	+ZlC8c/ETAUs2J5K9E5/JwmGmEluZ8o=
X-Google-Smtp-Source: ABdhPJyurvlFzTCmsEWEBrAI5Q+l+QKbzHQpJcQiKEE9kXyuBlZgsSAb9fO3Zj6gnYAzQm8sNis/+w==
X-Received: by 2002:a17:90a:338a:: with SMTP id n10mr1470252pjb.50.1596085953478;
        Wed, 29 Jul 2020 22:12:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5ba:2655:68eb:112e? ([2601:646:9200:4e0:5ba:2655:68eb:112e])
        by smtp.gmail.com with ESMTPSA id k12sm3879125pjp.38.2020.07.29.22.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 22:12:32 -0700 (PDT)
Subject: Re: [OE-core] systemd-getty-generator present but undesired
To: Mike Looijmans <mike.looijmans@topic.nl>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.7dd10c12-9e0b-46a0-8ddb-524a671021a4@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.391a6b1c-c9c3-4223-bc80-85775254cd6c@emailsignatures365.codetwo.com>
 <62bf02bf-7ec6-83fc-3d84-9ae93b07b4ed@topic.nl>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <ebf0e077-41b4-2285-8ffe-883f9d588fa0@gmail.com>
Date: Wed, 29 Jul 2020 22:12:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <62bf02bf-7ec6-83fc-3d84-9ae93b07b4ed@topic.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/28/20 6:33 AM, Mike Looijmans wrote:
> I had a hard time getting a serial attached bluetooth device to work, 
> untilI discovered that systemd is running a "getty" on that port (which 
> happens tobe "ttyS0").
> 
> The cause is that "systemd-getty-generator" detects that the port comes 
> online (runtime, it's inside an FGPA) and then dynamically adds a 
> service for it and starts a getty on it.
> 
> So when I went to solve that, I found that OE already attempted to solve 
> that. There's a "systemd-getty-generator" PACKAGECONFIG that suggests 
> that it should not be installed by default, but it gets installed 
> anyway, even though this config is not set.
> 
> Is this something that needs fixing in OE?
> 
> Any better pointers at preventing systemd starting a getty on ttyS0?
> 

you need to add serial-getty-generator to systemd PACKAGECONFIG to 
ignore the oe provided serial getty recipe.

I think it also has to do with SERIAL_CONSOLES setting for machine, 
perhaps it contains ttyS0 in your case.

> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> 
