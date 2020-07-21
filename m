Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.2803.1595358443813059205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 12:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YuCe+hgM;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id d7so1895024plq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 12:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EoRjr1M/+xjqXwvj8JFyZ8tICERVPwwQgok+hfXOIbY=;
        b=YuCe+hgMLUIkNwAP2jdnXWxEGM7C1ETrtzU1Ej5gXkuJoJ3b2UKxJ4pcJFfZjmOb1y
         GcD07MDkUFddWTVg1SHE7m/rqo2YoJKCGzfjI2UM908uMgy3AGCxosiqc312uS9FaTpt
         2jhVStFxpv06xpVsc93wKsx6/qp9FRAGbyKW14c7R5fx9U3UKYbPsm1UkixVE35hZzkU
         NX5pbxPSmBq+1Aj1OvNxnrldWK+On9cjA5vESrD2j7M694nsafpqZo3i2RVQfLP7TOXk
         aycINNRuUJ6YbcAbNr+phti8bFMfns7vPu/4o+iVGsCz6wwE75LIV4h2ftgk4HMqNEwi
         WzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EoRjr1M/+xjqXwvj8JFyZ8tICERVPwwQgok+hfXOIbY=;
        b=d+7pS/kc6Laq3CmT1D18QByVb8vrO6srinKg/AgeN32EYUfmXS6wVMIlcDDIs+sUUc
         U73K2ovl2rLidwyDu1L2QxYfAKitdxvn/r8Shk/eDu1+gF4fsdm5H4iF3A9cmuAfbdC3
         dEKYa/GHbDCIM4WYQ/llNgO9YG+WmKOC2QggEPR04ZqEt/XTFR+DRcVFw7cqRt1mq+bZ
         7oHat5bsfb03zewVNDQm4SY0fevWeuuJ+HkY4+U/XyCliRtOlyVcSS1hN6GIr0y3gMCk
         dnivnJ9nIOlRmHnqKINAtwn5QeVhYaTW24yiI4gFNxmY9W47Z+NA/lJh5cbZYdNfSjem
         yU9A==
X-Gm-Message-State: AOAM531eWav3kz8QS+lj7/9CWPqJ0KhT2BSyzl3E2qJr/dXUUwBn678W
	5D4mOIJTHBY8poUqa4YSit2nub0uYQ0=
X-Google-Smtp-Source: ABdhPJyt4D6FxACPofqkWfkS7uo6hb/Vl/O2O8d7MU9AIYwnGAbYXh/fC4i7RqMRwjOQq2K12ZWWHw==
X-Received: by 2002:a17:90a:ea84:: with SMTP id h4mr6320491pjz.128.1595358442973;
        Tue, 21 Jul 2020 12:07:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::6651? ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id 200sm21537067pfy.57.2020.07.21.12.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 12:07:22 -0700 (PDT)
Subject: Re: [OE-core] [dunfell][PATCH] busybox: make hwclock compatible with glibc 2.31
From: "Khem Raj" <raj.khem@gmail.com>
To: Sakib Sajal <sakib.sajal@windriver.com>,
 Randy MacLeod <rwmacleod@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20200721180054.38185-1-sakib.sajal@windriver.com>
 <CAK6=ix5bcxMfGME1jnf3hKFUMRFmHjaigCrxR-zOSjpad_LyhA@mail.gmail.com>
 <e38a0f69-f72f-3826-7105-70dd41b06431@windriver.com>
 <0ebff3d6-7325-5263-9ebe-760bc25e8e3b@gmail.com>
Message-ID: <f1bb6b95-5de6-e99f-347a-834c0ebd213a@gmail.com>
Date: Tue, 21 Jul 2020 12:07:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ebff3d6-7325-5263-9ebe-760bc25e8e3b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/21/20 12:01 PM, Khem Raj wrote:
> 
> 
> On 7/21/20 11:54 AM, Sakib Sajal wrote:
>>
>> On 2020-07-21 2:11 p.m., Randy MacLeod wrote:
>>> Hi Sakib,
>>>
>>> Did you check this busybox fix against musl? I forgot to ask you this 
>>> when
>>> you showed me this patch yesterday.
>>>
>>> Randy
>>
>> Yes, I built core-image-minimal with musl and everything was fine.
>>
> 
> build alone would not be sufficient, runtime testing would be required 
> too. The patch however seems ok to me. Also send it upstream to bb ml as 
> well for review

oh there already is another patch proposed here [1]

[1] http://lists.busybox.net/pipermail/busybox/2020-July/088133.html
