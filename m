Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.8063.1589251673984539620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 19:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=m4TeerLW;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.210.68, mailfrom: jpuhlman@mvista.com)
Received: by mail-ot1-f68.google.com with SMTP id z25so9324219otq.13
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=+VdsTE5Q9kYVpJ8dR4GzHK9XlfMjl9JyV5vEut+EddU=;
        b=m4TeerLWRwae9msm8eKT+ibVkSiOnfqCx7KEHxUBATmI+GGKC/5BeJa/+v4yuPQzb9
         puKwEYJPLXN6EGygQmao4J7PWSM0TYMpQSbf1SieKouI0hOW+xwCGozNNTljEuYz9LVn
         c+Q7VsamiWwd0PFDhOZJXGUmX4xHquxaULxmw9rwYYgkbOFfFN9p5zrfcAhJ1luAWY5Z
         cJ5EhSqouuwuqJF6c6vCeoGy7IqaeQtV64NywWSXbKubfCtqVFJm5/uvkXiwZVyMEniR
         lyn74zFMMKCgXom5VfCfXkrpBrrcn/GqKw+YV1Epr54aIJcp6T7L7so0Vvq83cZl0mnk
         gJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+VdsTE5Q9kYVpJ8dR4GzHK9XlfMjl9JyV5vEut+EddU=;
        b=Z+epMR8VKBXBaaAd6V0hBgODkblJjiYy162yRM7AcAJMiWPl0XqwfO+ZrBGHrelU7Q
         0AWe4O37aTXRsLGsgdnhDUKjtzNI2OxmEz1JKPrMY+nXU20XlkQcA8RvkDRZW58GC3ty
         0R4OOQTCxB5r16g9m7L29F4sVKv9giqwtmjlY2VXKcMeKtMVuW53cw1/mfSYc4xl18cv
         GfM8nBWviHFpv8MPYmR5IW7u3hKz5ZttlbD2HeWMk5SceON9q9+BxDOOQvWF/4uT77wv
         7jG/+ekrNTwN6q83M0b/c+xjDpVAvUNQvZXpfP28OFvB8APrho6z/i9FnEndGXNygVbd
         k+Pg==
X-Gm-Message-State: AGi0PuaetJH1+V/rrUQAM/1/xHc1Y7iYbJuOZDfiJqP8YRvLJBdw4KSr
	up3uW8WnOVat2vYYGTjNNqf2DCTj2wg=
X-Google-Smtp-Source: APiQypJriYC+Cdz+d3xWBa6DTbYVXvTLnSddHduN62aKF9r256fX5NGxNenUGu2DHsZ4YgBfd8Xd/g==
X-Received: by 2002:a05:6830:1e25:: with SMTP id t5mr14398874otr.358.1589251672949;
        Mon, 11 May 2020 19:47:52 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from ?IPv6:2600:1700:4c90:60a0:60de:efe0:93f3:c162? ([2600:1700:4c90:60a0:60de:efe0:93f3:c162])
        by smtp.gmail.com with ESMTPSA id b63sm3142656otc.23.2020.05.11.19.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 19:47:52 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] buildtools-extended-tarball: add nativesdk-glibc
To: Kang Kai <Kai.Kang@windriver.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200506015447.13003-1-kai.kang@windriver.com>
 <080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org>
 <f35dd49c-f52b-6d35-9d1b-56775e065bbd@windriver.com>
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
Message-ID: <38eed4f8-2fb6-0853-19f7-845e988b2fe2@mvista.com>
Date: Mon, 11 May 2020 19:47:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f35dd49c-f52b-6d35-9d1b-56775e065bbd@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/11/2020 7:30 PM, Kang Kai wrote:
> On 2020/5/10 下午9:40, Richard Purdie wrote:
>> On Wed, 2020-05-06 at 09:54 +0800, kai wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> It requires gcc 5.0 via OE-Core rev abc741a. On centos 7, the gcc
>>> version is too low then it has to build with buildtools-extended-
>>> tarball
>>> which provides nativesdk-gcc.
>>>
>>> But it fails to build nspr-native:
>>>
>>>> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib
>>>> -lnspr4 -lpthread -o abstract
>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>> undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>> undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>> undefined reference to `__clock_settime@GLIBC_PRIVATE'
>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>> undefined reference to `__clock_getres@GLIBC_PRIVATE'
>>>> collect2: error: ld returned 1 exit status
>>>> make: *** [Makefile:379: abstract] Error 1
>>> Add nativesdk-glibc to buildtools-extended-tarball. And it increases
>>> size of buildtools-extended-tarball about 3K from 48356989 to
>>> 48360329.
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>> This doesn't make sense. Does it mean we need a new uninative version
>> instead?
>>
>> Cheers,
>>
>> Richard
>>
> ```This works in dunfell, as of right now. This should have been fixed 
> with:
>
> ```https://patchwork.openembedded.org/patch/171584/
>
> Hi Jeremy,
>
> I can't receive mails from maillist for now. So reply here.
>
> I suppose when I build oe-core master on ubunu 16.04, it already 
> contains the commit. I'll double  check it.
Yeah it is in master right now. I am not entirely sure why you would be 
seeing it. There was some discussion on
the list about twiddling with the location of /etc/ld.so.conf and 
relocating it in the generation of sdks in general, but
I have not been able to poke at it today. If that went in, it might have 
caused the issue. Basically what I saw when I was
looking in to it, was the sdk ld.so.conf was not getting loaded(in the 
case of the patch because it was looking for etc/etc), but
if it got moved or something similar, it might cause a similar issue.

If you are still seeing the issue on master, strace the link of the file 
with -f and look at what is going on with the load of ld.so.conf and
that might explain what is going on. Also make sure that ld.so.conf is 
still there and has reasonable content.


-- 
Jeremy A. Puhlman
jpuhlman@mvista.com

