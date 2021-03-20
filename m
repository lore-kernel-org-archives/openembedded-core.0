Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.9663.1616277054562625416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fIXWFJ0l;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id l1so6073996pgb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 14:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rQEJbi+4ATJF8xiIzsTsF5aRR48qGQAQCT1LdTRqstY=;
        b=fIXWFJ0loISNjjraGyqWgV1kr4U2e9VhrICatj60ZZA3EeMSAqkOHYsuY3Q7lObw5v
         vGW/rfBPUBb82EzLACT0M15mtR2AimXJVG7Hk/jWbCcIX+I05W/poADfbG3tAPcGUa4z
         DK1zvKO9TlAEk1xqn+DxXIFTcqmQpgEOu+JYuRa/wAcst7o2gSCYxtmpbA4TrS4bbXEc
         fF2ZVtMOy+H4bJyZ0Ak5DXunVMi+nBoiHAUHfA7ioBOfdUObJiJ8qPu80TpSMr8cap6X
         0BhXFznUXHI5EVLOt5lOidZ6/pKi8F80L6JevOGqK7M0PuOZ7z9dLAwXgU1zXlF/1JuW
         zqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rQEJbi+4ATJF8xiIzsTsF5aRR48qGQAQCT1LdTRqstY=;
        b=p5JNz9WF/xOwyrptIkKoVv9I0wmasOz05NcvF5J4Nv5Nf1+MSsxSV294g+kbo22yZX
         gjLzDdve5PNgI4HMUulAfnR6HO8XeLfCf52Xf80ghR6Pg3faFKHcul+iv86LAvZAxyRJ
         LFUmyaQTi0m77YrS+B7igqV/w+DfcfuTGKZUF3k/jwqQbeoKnbf4PKDWY5K8iC8BcqLp
         vPI6L585InMuwnSmV51s4NsGifBA0vkh4xBArF7G5zUCEQszk8h3RHk3q+8+2i7hiSm7
         1qSmQ03Ti7fGMQ0CRPoR88Vuxpmcd8PkiRuZjidBjjA8JvHjjbQ9ZYVwN7w5tcoqSnrs
         S28A==
X-Gm-Message-State: AOAM533lgB+iFfw+tD0hr/eHh7Bfs54kzA81MTTpkn3fv+7jRu9FfqMS
	NWTvji+ZpiZq/Z1yE/jtTDa6ivgBKQ0uEQ==
X-Google-Smtp-Source: ABdhPJzVYEM4EG65fK+vKTZ0SY4LpnaU+Dy7ytg8jufOHJy+uCWKqfTuzd+QDLv8rCJ9Jau1wgiusQ==
X-Received: by 2002:a62:f207:0:b029:1f6:11a4:1b81 with SMTP id m7-20020a62f2070000b02901f611a41b81mr15108142pfh.19.1616277053814;
        Sat, 20 Mar 2021 14:50:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c4a9:4187:9c07:8080? ([2601:646:9200:a0f0:c4a9:4187:9c07:8080])
        by smtp.gmail.com with ESMTPSA id f11sm8785850pga.34.2021.03.20.14.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 14:50:53 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
 <20210319084401.576728-15-alex.kanavin@gmail.com>
 <722122d5-7fa8-56b2-116d-10169ada8051@gmail.com>
 <CANNYZj9shi535X8emj0uYof5ysabLJ9PpHEHyeqhFM=yr=N=sw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH 15/16] apt: mark as incompatible with musl
Message-ID: <e7e9b512-5f9b-9377-e6e0-dc8f3cc4ea08@gmail.com>
Date: Sat, 20 Mar 2021 14:50:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9shi535X8emj0uYof5ysabLJ9PpHEHyeqhFM=yr=N=sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/20/21 2:13 AM, Alexander Kanavin wrote:
> On Fri, 19 Mar 2021 at 17:58, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 3/19/21 1:44 AM, Alexander Kanavin wrote:
>      > There are multiple failures with the new version; unless
> 
>     Can you share details of failures ?
>     it would be better to not regress whats working
> 
> 
> For example, here:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3213/steps/11/logs/stdio 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3213/steps/11/logs/stdio>
> 
> home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc: 
> In function 'bool GetSrvRecords(std::string, std::vector<SrvRec>&)':
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:67:8: 
> error: 'res_ninit' was not declared in this scope; did you mean 'res_init'?
> 67 | if (res_ninit(&res) != 0)
> | ^~~~~~~~~
> | res_init
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:71:38: 
> error: 'res_nclose' was not declared in this scope
> 71 | std::shared_ptr<void> guard(&res, res_nclose);
> | ^~~~~~~~~~
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/srvrec.cc:73:17: 
> error: 'res_nquery' was not declared in this scope; did you mean 
> 'res_query'?
> 73 | answer_len = res_nquery(&res, name.c_str(), C_IN, T_SRV, answer, 
> sizeof(answer));
> | ^~~~~~~~~~
> | res_query

this is because apt started to use newer APIs for resolver but then 
disregarded older APIs, I have sent a patch to actually user newer APIs 
but have fallback to older APIs also available.

> 
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/recipe-sysroot/usr/include/locale.h:53:7: 
> error: declaration of 'char* setlocale(int, const char*)' has a 
> different exception specifier
> 53 | char *setlocale (int, const char *);
> | ^~~~~~~~~
> In file included from 
> /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/apt/2.2.2-r0/apt-2.2.2/apt-pkg/contrib/netrc.cc:14:
> include/apti18n.h:25:25: note: from previous declaration 'char* 
> setlocale(int, const char*) throw ()'
> 25 | extern "C" inline char* setlocale(int, const char*) throw() { 
> return nullptr; }
> | ^~~~~~~~~

yeah we should not disable NLS but remove PO generation. I have sent a 
patch for this too.

> 
> Alex
> 
