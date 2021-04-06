Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.1068.1617724520066006835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 08:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gXetPmEa;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d8so7740031plh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0EvL8jJoY8Wmyd3qy12dvPN9AvUhpaO2B2/gQTfxrDI=;
        b=gXetPmEa7ZmcRmW/hrQnT2n4AOjKlMRAzrbKdbVfEOVFBAU4pl2npRCxaXTUnamb8d
         UAwjuhsP1hlSauLRn+i50AG50bjSlMZ0v2H4BiEbm3CGQDpMmDOkPfPMFbCOxmidVGCe
         OFqM/IJQyMR0LB8IQC7wtZ3VnRlBKr2ygjIoNZ0kPvJCtnvCOm/ziA4QwzMcGjjVfeXj
         zY25FrcZ+l8AUro6h6L55fa+fD7fGh7WdEYsPoS4GhKbiQUpg4WNFUALHYEp572/oDmt
         h41CQ6Qy/jA3luL3oqvtVI8dyIbXfgno+rCOIX3nHkhV21xL9Wx4Mh2FjoUIdQOorI2h
         fYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0EvL8jJoY8Wmyd3qy12dvPN9AvUhpaO2B2/gQTfxrDI=;
        b=a9RpOX9PCArmBjJ4Y9xhusUQAc93wuueaX94D8U2xauX3jwyJslsCN3bEsoNimE/jt
         M5bLs2rW1XQRl7ndBKoNpFqYEyHa1dhtvbhdsoTisoqnIO3ENsFA3lwqOvOBEQ7a3yXZ
         HYBRpkyrpkAs/TIfbEDEypLU8mxkLngo4Xk2ZQcQY1QSuGyxPIz4QTK2eTsL6z3ChfxN
         oW/LIfeYxka2WRI19mNAni0gZJH8GJuJecRGhnldhpdWWGcbPviSUnzlfcy34PqHu7JY
         swrGqhtfyNR5plD5bydV28IzBaYo/wJY2/UsobTThoQ1Zvi1SjjPqHwkXu0GMfHIqlAD
         7ycw==
X-Gm-Message-State: AOAM530Jj/Bs+cZd9aosx+ywrpIsFTona9oCnLIhS0CbuCcygvYXIYzb
	v92ux1NPPZ+QENCI0df4M4ObXawF42rMxw==
X-Google-Smtp-Source: ABdhPJz1NFg+/BWaCnwr0a7PNMJBmYhf4rH8L7Ujrj7EHQeCHRrDxBOIsP9KudXwZYvWSdYgvGpy5Q==
X-Received: by 2002:a17:902:eccf:b029:e9:3dcf:a59a with SMTP id a15-20020a170902eccfb02900e93dcfa59amr3800673plh.55.1617724519357;
        Tue, 06 Apr 2021 08:55:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6? ([2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6])
        by smtp.gmail.com with ESMTPSA id d20sm18794009pfn.166.2021.04.06.08.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 08:55:18 -0700 (PDT)
Subject: Re: [OE-core] WiFi P2P support
To: JH <jupiter.hce@gmail.com>, Yocto discussion list <yocto@yoctoproject.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAA=hcWRmH9m3ynX9w7_FXVfeK=ofrbneqZ7Z8QQj6ShftESteA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c3bd4663-7820-aaba-8c6c-2e432c867609@gmail.com>
Date: Tue, 6 Apr 2021 08:55:17 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAA=hcWRmH9m3ynX9w7_FXVfeK=ofrbneqZ7Z8QQj6ShftESteA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/6/21 12:33 AM, JH wrote:
> Hi,
> 
> I am building WiFi wlan Linux image on Zeus using Linux WiFi
> linux-firmware-sd8801 and connman, I need to add WiFi P2P support, is
> it sufficient to create wpa-supplicant_2.9.bbappend to enable
> CONFIG_P2P=y (it is disabled in wpa-supplicant_2.9 defconfig)?
> 
> Do I need to make other changes on OE configurations?
> 

I dont think there is a canned recipe for P2P so you will discover on way.

I would suggest to look at

https://w1.fi/cgit/hostap/tree/wpa_supplicant/README-P2P

Once you get working it will be valuable if you can then share what 
steps you needed for it to work end to end.

> Thank you very much.
> 
> Kind regards,
> 
> jupier
> 
> 
> 
> 
> 
