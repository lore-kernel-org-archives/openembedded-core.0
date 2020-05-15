Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.8131.1589522031515763444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 22:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ChD8wNl9;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id z22so795717lfd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 22:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=hQjtfGpB9X17JEUxyW0E3pVu9lLmEMCU3fe//3Hjh6Q=;
        b=ChD8wNl9jcN4E5uNP5ck9Rofv6/bVMpf8813hocZkzjWbqWcHDQ+WAlaxJelRd62GO
         3VnwEuD+kCUNMvOGouK4rX2Ei6Q8KVVYK5psy8HYgYb6KVnzquLjOAVK/iA+unr2imii
         L0XIT4xeNgQv7Ddpvc6pgE+WM2AdM3s+GPQewmm4fKwi0Hstdp7J2Ik0cLI0IW2x9oF5
         Ux3sCzkQg7bNqfdR4qw2jorzdX6Tz5WifR2kXWlW+9m+Ky31ktDmSKpjwMH7AUlwWE3b
         XsOsUhCxa3qwv5gxi8faZZFn5rg6v4T3r40S8CH7d0QDzeAHGWwwfVqnhoJVwr+Oqq73
         PD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQjtfGpB9X17JEUxyW0E3pVu9lLmEMCU3fe//3Hjh6Q=;
        b=KKhVVqEwPjIjuC/B55RqwAgksi5FYLR1YjElbtsmtSwM7j86wJG0C/3JM+6yN9gGQj
         HNuz+G7r0HxuOTVidzePjl/NhXo+JkZZqmrIXmbEQuIa7HTXO/djq+EYyng0yszEG3yc
         NooK9RVxf0W09zcDiYVgrJrMOSlrcTeOJg5MwZ7EaebgeB0CzlRNfsm8o6U//O8uat7Z
         NKvGencp/heKYH6DOPaZ2onWEjZT5jfZrl+a2ztZUius3P3F+BKFkpDPEeSUKZRWM+B1
         eZE6tqcg7MlT3KmY25zCH0flTBWAkIMjEI77aZCYHoD6kAoQm3NJvE56d8rRTQYR6THU
         +nkw==
X-Gm-Message-State: AOAM533PCpg2v7sYMo4tdd+wL+5eAjzLv98egFKhOSeI4TVoIL++b7/e
	FMwJbEI1nIeXlxdGuHUurQt0bD/xuww=
X-Google-Smtp-Source: ABdhPJx6aPW/gNeJW+O5Brb0naApwtRuv7AMppXCTV8gHyC+Oh09/3T6RBiKswEM4SBlPpX8ssU/cg==
X-Received: by 2002:a05:6512:6ce:: with SMTP id u14mr857795lff.157.1589522029028;
        Thu, 14 May 2020 22:53:49 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id 6sm683551lju.54.2020.05.14.22.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 22:53:47 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] bison: fix the parallel build
To: "Yu, Mingli" <Mingli.Yu@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20200514073936.40572-1-mingli.yu@windriver.com>
 <17e2ea0e-6588-355a-9f5a-b570a0e4cf87@gmail.com>
 <5EBCFA66.5010902@windriver.com>
 <BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0@BYAPR11MB2598.namprd11.prod.outlook.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <a0bd0c21-78b2-08ed-304c-3b5345d7e5da@gmail.com>
Date: Fri, 15 May 2020 07:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0@BYAPR11MB2598.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Mingli,
Thank you for fixing.
/Jacob

On 5/15/20 3:55 AM, Yu, Mingli wrote:
> Hi Jacob,
> 
> I can check the 
> https://lists.gnu.org/archive/html/bison-patches/2020-05/msg00055.html 
> link now, so I resend the v2 to add the link for Upstream-Status part.
> 
> Thanks,
> Mingli
> ------------------------------------------------------------------------
> *From:* Yu, Mingli <mingli.yu@windriver.com>
> *Sent:* Thursday, May 14, 2020 15:59
> *To:* Jacob Kroon <jacob.kroon@gmail.com>; 
> openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] bison: fix the parallel build
> Hi Jacob,
> 
> On 05/14/20 15:55, Jacob Kroon wrote:
>> Hi Mingli,
>>
>> On 5/14/20 9:39 AM, Yu, Mingli wrote:
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> Explicitly make the BUILT_SOURCES which
>>> are the generated headers such as stdio.h,
>>> fcntl.h and etc to be the dependencies of
>>> the gl_LIBOBJS such as libbison_a-sprintf.o,
>>> libbison_a-printf.o and etc to guarantee the
>>> BUILT_SOURCES is generated before begin to
>>> compile EXTRA_lib_libbison_a_SOURCES such as
>>> fprintf.c in parallel builid, otherwise there
>>> may come below error:
>>>   | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
>>>
>>> It does the same for src_bison_OBJECTS and
>>> lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
>>> generated before begin to compile src_bison_SOURCES
>>> which contains AnnotationList.c and etc.
>>>
>>> BTW, the MOSTLYCLEANFILES also contains the
>>> generated header needs to be created early
>>> in the build process, so add it also in to
>>> avoid below error:
>>>   | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
>>> file or directory
>>>
>>> [YOCTO #13825]
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>   .../0001-bison-fix-the-parallel-build.patch   | 63 +++++++++++++++++++
>>>   meta/recipes-devtools/bison/bison_3.5.4.bb    |  1 +
>>>   2 files changed, 64 insertions(+)
>>>   create mode 100644
>>> meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>>>
>>> diff --git
>>> a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>>>
>>> new file mode 100644
>>> index 0000000000..c3be91a109
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>>>
>>> @@ -0,0 +1,63 @@
>>> +From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>> +Date: Thu, 14 May 2020 15:23:16 +0800
>>> +Subject: [PATCH] bison: fix the parallel build
>>> +
>>> +Explicitly make the BUILT_SOURCES which
>>> +are the generated headers such as stdio.h,
>>> +fcntl.h and etc to be the dependencies of
>>> +the gl_LIBOBJS such as libbison_a-sprintf.o,
>>> +libbison_a-printf.o and etc to guarantee the
>>> +BUILT_SOURCES is generated before begin to
>>> +compile EXTRA_lib_libbison_a_SOURCES such as
>>> +fprintf.c in parallel builid, otherwise there
>>> +may come below error:
>>> + | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
>>> +
>>> +It does the same for src_bison_OBJECTS and
>>> +lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
>>> +generated before begin to compile src_bison_SOURCES
>>> +which contains AnnotationList.c and etc.
>>> +
>>> +BTW, the MOSTLYCLEANFILES also contains the
>>> +generated header needs to be created early
>>> +in the build process, so add it also in to
>>> +avoid below error:
>>> + | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
>>> file or directory
>>> +
>>> +Upstream-Status: Submitted [bison-patches@gnu.org maillist]
>>> +
>>
>> I can't find the patch email in the bison-patches mailing list archive,
>> do you have a link url ?
> 
> Good catch, that's why I didn't paste the link in the Submitted part.
> 
> BTW, I also cannot find at
> https://lists.gnu.org/archive/html/bison-patches/2020-05/threads.html
> though I indeed sent to bison-patches@gnu.org.
> 
> Thanks,
> Mingli
> 
>>
>> /Jacob
>>
