Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.954.1596603948427908170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 22:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C4Z/yDHi;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id k13so23604805lfo.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 22:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kfDi6QM4jaMj/BFE6Xwy4GEqhoMVhBkDi8jfdJXsc4M=;
        b=C4Z/yDHikRdRvIDjP6EJBbtIJkL0sAfCSyhrYO6mbl66qF5HlHM6qXurmxyy+/axBp
         MsGI6uT47W+1V3wXlxe2KiC4eEty5QY4+5CyDfhVfmVUpMQ9cHx9q/xGuxN6rrCgGc0S
         8zu2eOqpRD4JSH17KE8C01gmyh9qaVJ7iI2K2NZW3vUNDZrLsG1abhSWIzYeQphQXg5l
         eiKqTxYDVUMIo2kdADFaQp2jTsK4TBnZbH9iksv6AODbaC5y/kAuwz7c6HXHiCi3IP30
         xxC2yYjbEgmqC4XOsvHl9huDAHgrJ1Delb8hokzICZFcziGCn9IQe5m1FQE97FXL/j6w
         4SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kfDi6QM4jaMj/BFE6Xwy4GEqhoMVhBkDi8jfdJXsc4M=;
        b=ElFBqednBDCWa0RGQbZoiTh4NfD3TmOIUjbujhtIPK08PMm5nYkWUVyktdDOTt4Ypv
         j3VfkfjrBqOkiMzqd1y81mePGv2NfJPGAMKiCaSeqZArRrHy+OQIS8sSIz9MH6J/9q5D
         wB/rtLBRsNOROEzArZzB1y2/ie+E9Q1zsnvwMpZcRkMsdH6jp05G8TdDErKZTOtFzj0V
         M+Zxfq3JvOrozhuqqd7owkiH0IVO4kfHn+AyyK7JvYsRCL3zeJ9KB/UK5BpHrPAMutGE
         S4RQi4ycXRDJMeCP2RTGuhLyJQNjSG+3uO88dFKFCZLsYDSOtyaFexhbNic8JJhRvcKr
         LFyw==
X-Gm-Message-State: AOAM5335vioaY3LOWufyXD0ZK1cKbUFxly12z7K8b5OPHF5UuZ9KZDb8
	ANxx3M7Mp+6gSx63PpxskP1c7/xp
X-Google-Smtp-Source: ABdhPJyYI0G5Cb3GgJX378LSTgzowI6VMNvONt04AdOi/h6FTxkKBA04yUfZCgaX4sn+u/emQD8kSw==
X-Received: by 2002:a19:ae0a:: with SMTP id f10mr710916lfc.100.1596603946224;
        Tue, 04 Aug 2020 22:05:46 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id k12sm361892ljh.95.2020.08.04.22.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 22:05:45 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200804082019.76320-1-jacob.kroon@gmail.com>
 <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
Date: Wed, 5 Aug 2020 07:05:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/5/20 2:14 AM, Khem Raj wrote:
> On Tue, Aug 4, 2020 at 1:20 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>> It has been almost 3 months since the upgrade to gcc 10. Switch back to
>> relying on gcc default configuration (-fno-common).
>>
> 
> have you done a world build with this? In core+meta-oe I still see 70+
> recipes failing
> what will be good is if people start sending fixes before switching
> the defaults.
> 

Ah, that I haven't, only the images I use. Is there a list of failing 
recipes available somewhere ?

Jacob
