Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDFE73257
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:16:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 145so469819pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=PaAVHQWZeK1A/fwdOocBovF0AUfNNTsJdG/3Ml9lFsk=;
	b=jLs2Bh9CnIb3W9gqIR0aA45y5ZOB2xAUMN7tzjP7GjxwlFDIYypPa2pHcxLryxfyiz
	EGynYrBN8s+V5lU1qGh+zdQ2d5k6Mvp98ILmULW8LPzQiSsR25Vkar4jL9nkfz/MyIkr
	FwwJBldSTW2RqORWuarSW5TeTz8irkk1+jkS86ooxhuxtHeX6wJIWRNbLP65M6MDyua8
	gRfOKtrwfLhFKAODjVwjXbphtyPjgpSYwDsH8uJBTVISVvy1MbiAU0SyF4nkIcDTqqcu
	05F+0UKlAQu5OCcgDXnQQs8OtYbevEqu9w1ZnIXLhMXbsgSvRpegJ62eplTMpfgwDV9+
	e7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=PaAVHQWZeK1A/fwdOocBovF0AUfNNTsJdG/3Ml9lFsk=;
	b=kHWBaBuHgiTVrsW4Xt6ncoLFT2umsw+f9RdN7dBKU4JQUhyhG9yPIowLs7myQNv/fQ
	Eu0hiewCWCl+fbVzFh43/xwsXie7ui48CsbbJydJyjmtljQSmAbxzP8T4bQQBnhJDCAt
	40W3gPpAZmhduneDA0fKJGO/lseFcggYaFilNMfmfW2sK/REXcgeVFT/hD7TO5l0AfJ8
	IgNuCzfrHUoBEGve030T5a4rWV8vtwz1m474AKr0ocZOHF0AOYARbYYR1Op+t7hJlIFi
	B/e6DrEJPROtnbi130733N0RL42mmOlCHGcbsK6s8gr8jkqC/+5wAjW0YRIN1s2jK6ic
	Iusw==
X-Gm-Message-State: AOPr4FUTb75LXqXjZfm2/AQA8ISBkqgWMs9z/+Hg1fh+KoBNlAz8YzLcB3ki05Fd1B6KMQ==
X-Received: by 10.98.24.208 with SMTP id 199mr49811241pfy.160.1463455017387;
	Mon, 16 May 2016 20:16:57 -0700 (PDT)
Received: from Akusters-laptop.local (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.googlemail.com with ESMTPSA id
	g84sm511605pfj.42.2016.05.16.20.16.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 20:16:55 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
	<9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0d15a63a-a78f-5916-ed4e-f2a7d0b99be1@gmail.com>
Date: Mon, 16 May 2016 20:16:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2016 03:16:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/16/16 8:09 PM, Khem Raj wrote:
> 
>> On May 16, 2016, at 7:26 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 05/16/2016 09:44 AM, Khem Raj wrote:
>>>
>>>> On May 16, 2016, at 9:17 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>>>
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> numpy/core/include/numpy/npy_common.h:149:10: error:
>>>> |          #error Unsupported size for type off_t
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>> meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>> index 191e5a1..109deb0 100644
>>>> --- a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>> +++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>> @@ -11,6 +11,7 @@
>>>> #define NPY_SIZEOF_PY_INTPTR_T 8
>>>> #define NPY_SIZEOF_PY_LONG_LONG 8
>>>> #define NPY_SIZEOF_LONGLONG 8
>>>> +#define NPY_SIZEOF_OFF_T 8
>>>
>>> Why does the test to select size of off_t fails ?
>> core/include/numpy/npy_common.h
>>
>>  #if NPY_SIZEOF_OFF_T == NPY_SIZEOF_SHORT
>>        #define NPY_OFF_T_PYFMT "h"
>>    #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_INT
>>        #define NPY_OFF_T_PYFMT "i"
>>    #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONG
>>        #define NPY_OFF_T_PYFMT "l"
>>    #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONGLONG
>>        #define NPY_OFF_T_PYFMT "L"
>>    #else
>>        #error Unsupported size for type off_t
>>    #endif
>>
>> its gotta match one of them. X86-64 has NPY_SIZEOF_OFF_T  value set.
> 
> yes thats the use of it. i was asking for place where it is set, most probably during configure
oh. hmm, let me check.

- armin
> 
>>
>>
>>> we might need similar fix for mips64 too.
>> yep, I just built mips64 and ppc64 and they both fail like aach64.
>>
>> will send v2 to fix those as well.
> 
> OK
> 
>>
>> -armin
>>
>>>
>>>> #define NPY_NO_SMP 0
>>>> #define NPY_HAVE_DECL_ISNAN
>>>> #define NPY_HAVE_DECL_ISINF
>>>> --
>>>> 2.3.5
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
> 

