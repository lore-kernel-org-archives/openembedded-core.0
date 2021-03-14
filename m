Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.8597.1615740936169601465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 09:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NK7kWPSN;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so919490pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7s7EuhsEJi40AGlJ+67myqU3fG6GBGeCKL9rom+Lsu4=;
        b=NK7kWPSNgU5wtzScUx94PVSZpmVe+zQB44v4p5xl9t6u0L0Nwm99mXdP+x4S8B8B27
         9LSGROAECKi2rrzvTEz5qW0mcZBOE7jWFL8iBFej83wWiHu1k+KCtQDJ9arYHeGhPfBA
         lbuoKk/RPh30zzjcXebq/s4ub4AcRAbw97Fc7VP+bzY77Uog4JtJv+1+Z4V6PzzZ5Bqe
         zrOFHQUdQaesOL3XngGr+qRvJkOE81GhXuXx5Xn9CfI7FA96rQNu2OVa4izHJ+ksAvZi
         XsQxmNxcLwWzOQev29XPCcl3xSGGICONxLfmarlEMfnHoqvFKt3V8BT11zKrVXgaizzY
         fjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7s7EuhsEJi40AGlJ+67myqU3fG6GBGeCKL9rom+Lsu4=;
        b=qJdyL+Pkr8JqSRUSQgom2Vfw6vrDHGKleHMoIlN0AJknsni1wowKPHVrI0ro1KWY22
         sH9MALwMHSfmAwGELGgrRLCa+gIMu2n4sPR2R0i0orN387qKR6ADSjz8UWDjwb1tgMdX
         MFdi+DU9v72FufUoPwD5IZbTzRwWv+VoO4EJDeIyBG3ul5o2ptlaNqRkUN/i3XZGW6kU
         7mqYTGmm6Smv2z1RJEU+ZEpnKEpb9O+BCP7iwLRBXdGVuoxLovU+peR/cgfQG12AguuN
         nm1QOAK5hgAUtmtsH0X+nZVbczjuaiSLbojmBBHAMwA/OhpMHfli6Tql372wiHbw2Kd5
         391Q==
X-Gm-Message-State: AOAM5319vdMU1H4TSswF6f/De684eRqeI1+Pk79YeRvDYglfHQMwbN+U
	HOfMU7viGqviIeodLx8Q4yd4CPXsl8cNGQ==
X-Google-Smtp-Source: ABdhPJxBf5YzdiOdv7nYAdF70yMmikJW1p0ccvIsBLQ+7WtYx/CYpHP93FAI0zfNwdLrdWDDWihHKA==
X-Received: by 2002:a17:90a:8505:: with SMTP id l5mr8578829pjn.100.1615740935510;
        Sun, 14 Mar 2021 09:55:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d2c6? ([2601:646:9200:a0f0::d2c6])
        by smtp.gmail.com with ESMTPSA id x14sm11707639pfn.162.2021.03.14.09.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 09:55:34 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 4/4] go-dep: Remove
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20210312062107.1549935-1-raj.khem@gmail.com>
 <20210312062107.1549935-4-raj.khem@gmail.com>
 <729a07918ea4baec2608d1f462c4a4bdcd593551.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <018649b7-1694-41a6-373d-21786c38c86d@gmail.com>
Date: Sun, 14 Mar 2021 09:55:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <729a07918ea4baec2608d1f462c4a4bdcd593551.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/14/21 9:31 AM, Richard Purdie wrote:
> On Thu, 2021-03-11 at 22:21 -0800, Khem Raj wrote:
>> go-dep was an effort for dependency management before go modules, which
>> since 2020 has been deprecated in favor of go modules. Since its not
>> developed any longer and go mdules is officially supported, this should
>> be retired from OE-core as well.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
>> ---
>>   meta/classes/godep.bbclass                    |      8 -
>>   meta/conf/distro/include/maintainers.inc      |      1 -
>>   meta/lib/oeqa/selftest/cases/reproducible.py  |      1 -
>>   .../0001-Add-support-for-mips-mips64.patch    |     54 -
>>   ...bolt_riscv64-Add-support-for-riscv64.patch |     33 -
>>   meta/recipes-devtools/go/go-dep_0.5.4.bb      |     30 -
>>   7 files changed, 145701 deletions(-)
>>   delete mode 100644 meta/classes/godep.bbclass
>>   delete mode 100644 meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
>>   delete mode 100644 meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch
>>   delete mode 100644 meta/recipes-devtools/go/go-dep_0.5.4.bb
> 
> So we also need to remove the go-dep tests?
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1950/steps/14/logs/stdio
> 
> If so, is there some other go test we could replace them with?

thats already replaced with github.com/direnv
but this failure seems to be related to go 1.16.2 upgrade. I will take a 
look.

> 
> Cheers,
> 
> Richard
> 
