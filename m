Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9696.1614790891491733821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 09:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@enlyze-com.20150623.gappssmtp.com header.s=20150623 header.b=sfLcRel9;
 spf=none, err=permanent DNS error (domain: enlyze.com, ip: 209.85.221.44, mailfrom: c.finck@enlyze.com)
Received: by mail-wr1-f44.google.com with SMTP id l12so24472199wry.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 09:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enlyze-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=sc+5zd+HgREaWnTy3Rh0oxp5u+UBzY81IWgPHmA8hic=;
        b=sfLcRel9nmU4vJHeHbPcHsXwwPrpc54Q7oc/pK0Rrw4s5w521bi7FHnZCkg7/igWNo
         8za6h4qdp+mNDUBjgd1+w4nReMM2pMtmP2GC6KXlzeDqkY4w6dUfi6l1oSyeA1FVKWKe
         XPzMz6hwpejP3rlRif3k7SrUvGOW7K6u5c5fzzpx4b4ZGFJnGzfLXQXNM0dtfl+R/uB9
         4OVYy05ny/zwusw15ZqTpYGqNuIua1LCKe8Y0+E0fnFQZvL+tL5+ZlBI7PPl6c1pLuVr
         BLyWGj3zFNv0WJs7NDqVMFg8P7py+RHqCUAzLnJjJc6JpUCXyyzQJXOaxIwFWhJprLZD
         0gAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=sc+5zd+HgREaWnTy3Rh0oxp5u+UBzY81IWgPHmA8hic=;
        b=gfmtfZDErK1EcLc07SefUj70xOJsZUwpfAe9mNWRN0R0jwV9xuDbOKKVPEBG/RNQIL
         ztzarsJwNe0m3x+9WHP8zNxPj31sGjoeB2EVfmXJL0DI0/EMZaDpTtkhQo+8BUj+cAOT
         1MQ6U1V3IvPQLirldmzer7pJoyIoQK3j1T2Jf6J4Gs9VWIU5oTvENThXtFtZC3pqJxAA
         YDKiV8H5D5ez2vz7tOqA9dPDZS/O5KB7AFGa8ngy+tgHbfNeO5ZXReGhvnx2zsHvMiqJ
         ac3VdttS+ywVluoGG+zGSENnKguZA2h+85PRz9DhLTzh4LvBZdsHxQ2j6wtphJ5bcfou
         iRQQ==
X-Gm-Message-State: AOAM532fcGB4mvlV821Q2ZCWIISy+w3eotT3Kh3QffNO0zBJ5r0gYDxF
	9Vk2t+DiB4AdvzOP4xUZLeRtWQ==
X-Google-Smtp-Source: ABdhPJwauwiThkUOx+Qp05jjX6JV0R/6x3D7qIns/D/Q3qEECkbbBkARr7pmZjxYL9fAAWI96i+rEw==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr2302557wru.78.1614790889959;
        Wed, 03 Mar 2021 09:01:29 -0800 (PST)
Return-Path: <c.finck@enlyze.com>
Received: from [10.24.0.160] (xdsl-81-173-161-42.nc.de. [81.173.161.42])
        by smtp.gmail.com with ESMTPSA id j6sm2530380wmq.16.2021.03.03.09.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 09:01:29 -0800 (PST)
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Steve Sakoman <steve@sakoman.com>
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
 <28099.1614691555012100324@lists.openembedded.org>
 <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
 <CA+chaQfg4EKGfTu1d-ZXrfeE=eKwD=YYJFt7ydLP3ANZ7eWStw@mail.gmail.com>
 <CAMKF1soua2c_EkEXDgPOiCaqH0W4+_UKVYjUtu9iXZGMs1pHVQ@mail.gmail.com>
From: "Colin Finck" <c.finck@enlyze.com>
Message-ID: <0e6ba13e-886b-2dfc-ef83-0099116465c0@enlyze.com>
Date: Wed, 3 Mar 2021 18:01:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soua2c_EkEXDgPOiCaqH0W4+_UKVYjUtu9iXZGMs1pHVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.03.2021 um 17:34 schrieb Khem Raj:
> On Wed, Mar 3, 2021 at 8:16 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>>
>> Steve, Colin:
>>
>> keep in mind that this version also introduces some new restrictions, e.g. rpi-sdimg IMAGE_FSTYPE in meta-raspberrypi is now failing with:
>>
>> mkfs.vfat: Label can be no longer than 11 characters
>>
>> not sure how common this will be in other BSPs, but people might be surprised with such failures in LTS (like they were from the need to update oe-core/dunfell checkout to get python3targetconfig.bbclass recently when other layers started to require it).
> 
> thanks for this info Martin, 4.1 was released in 2017, so 4.2 is not a
> bugfix only release by any means. It should be out of policy for LTS
> backport. since we have different tools and techniques to partition
> storage media
> this tool plays a vital role and we should be very careful making
> changes to it, especially in releases.

Thanks for all your feedback!
I understand that an upgrade from 4.1 to 4.2 may look like a risky 
undertaking. On the other hand, who else except for the original author 
is qualified to decide if a single change can be cherry-picked and 
backported to 4.1?

I have been advocating for a full upgrade to dosfstools 4.2 not in spite 
but actually because filesystem creation and checking is crucial, and 
should not be performed by our own frankenstein build of dosfstools.


Cheers,

Colin
