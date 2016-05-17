Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id D9089731D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 13:19:52 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id e35so1285173qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sPkgI01bP9yfPoxyJmzIkL/xKoFCK9slD8Dv+QVY8Cw=;
	b=QU76fB/M7zRawGgP3UJuomo8DQbRVLGxhrpuDyAv4D48fE8ozYKja6fDvNFD8cASNq
	yYFs1EGjfo9Q6S1335ZPHujjdxNKAm6IVRCY6E41gn02ikUMNW9ZWLlh7QSnHiAsyFtB
	dUwwA74rLJUzYkebK9i/bLWcQUJjWkD8LTYf1HNI9rRXOtkFadLVqT3K2vzOBXiL0UD1
	E9BBHijCAmKu1e+b9PuQmZlQ60Mzfly+nkYt5w6EE8Gp6MAfZ1C1vCvobJ9ObAOv6AaS
	+GzGV+OR324T71q2zoX4SSF6o+HFlO+FfYkaoAqBYH6q22hr8uZfoj49mkIILiWubEYs
	5IEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sPkgI01bP9yfPoxyJmzIkL/xKoFCK9slD8Dv+QVY8Cw=;
	b=E/5VvudUEBDxU0g2kt9xlVCtTDwItP6+fmih1jCbkZtOvRSvzwrgZKmi4+yjxjH2ZF
	3xmmkxrjSY4fykEHa+rjd8zu9gqCjJhyHqJmcBVsnhOsLkCpnjHaLhxEDrAIu5vyuQy1
	uzoEo8vldI5NORrq7ts6VA9/HXnXLTp/BKqRh2ymJKtVrSh0uDXViUz1WEh7qTVBM0EK
	DNFDQk17gTA97iFJF8G7pGb+z6CaftVznRSD8yv0TWhYpjM3o+H7eH3SkO2HRqzhMwxq
	9b6KwavgdI5ChTde17yiWbFPJfSzBU3gN1reK3U46jeAjBZ+GxWGXE+qtUtZi+WpdSJv
	Mfvw==
X-Gm-Message-State: AOPr4FVDjvvR6sRGU1dFIeMeItFG1qhNNpGYUnElGl2FfJFxgFjKI2FX0UwCNjximZRKtg==
X-Received: by 10.141.47.66 with SMTP id y63mr1396200qhe.74.1463491193334;
	Tue, 17 May 2016 06:19:53 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:213a:5f79:bc19:2f7c?
	([2601:202:4000:1239:213a:5f79:bc19:2f7c])
	by smtp.googlemail.com with ESMTPSA id
	a123sm1238044qkc.23.2016.05.17.06.19.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2016 06:19:52 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
	<9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
	<73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
	<FA10CE49-93CB-4CB9-9F20-F8F5396020DC@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573B1A78.7070907@gmail.com>
Date: Tue, 17 May 2016 06:19:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <FA10CE49-93CB-4CB9-9F20-F8F5396020DC@gmail.com>
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
X-List-Received-Date: Tue, 17 May 2016 13:19:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/16/2016 08:35 PM, Khem Raj wrote:
> 
>> On May 16, 2016, at 8:34 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>> On 5/16/16 8:09 PM, Khem Raj wrote:
>>>
>>>> On May 16, 2016, at 7:26 PM, akuster808 <akuster808@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 05/16/2016 09:44 AM, Khem Raj wrote:
>>>>>
>>>>>> On May 16, 2016, at 9:17 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>>>>>
>>>>>> From: Armin Kuster <akuster@mvista.com>
>>>>>>
>>>>>> numpy/core/include/numpy/npy_common.h:149:10: error:
>>>>>> |          #error Unsupported size for type off_t
>>>>>>
>>>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>>>> ---
>>>>>> meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h | 1 +
>>>>>> 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>>>> index 191e5a1..109deb0 100644
>>>>>> --- a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>>>> +++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>>>>>> @@ -11,6 +11,7 @@
>>>>>> #define NPY_SIZEOF_PY_INTPTR_T 8
>>>>>> #define NPY_SIZEOF_PY_LONG_LONG 8
>>>>>> #define NPY_SIZEOF_LONGLONG 8
>>>>>> +#define NPY_SIZEOF_OFF_T 8
>>>>>
>>>>> Why does the test to select size of off_t fails ?
>>>> core/include/numpy/npy_common.h
>>>>
>>>> #if NPY_SIZEOF_OFF_T == NPY_SIZEOF_SHORT
>>>>       #define NPY_OFF_T_PYFMT "h"
>>>>   #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_INT
>>>>       #define NPY_OFF_T_PYFMT "i"
>>>>   #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONG
>>>>       #define NPY_OFF_T_PYFMT "l"
>>>>   #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONGLONG
>>>>       #define NPY_OFF_T_PYFMT "L"
>>>>   #else
>>>>       #error Unsupported size for type off_t
>>>>   #endif
>>>>
>>>> its gotta match one of them. X86-64 has NPY_SIZEOF_OFF_T  value set.
>>>
>>> yes thats the use of it. i was asking for place where it is set, most probably during configure
>>>
>>
>> There is no configure for this python package. It uses hardcoded values
>> in config.h or _numpyconfig.h per arch. X86-64 has the NPY_SIZEOF_OFF_T
>> defined in _numpyconfig.h. To keep it consistent, I put the Aarch64
>> changes in the same place.
> 
> is this config.h or _numpyconfig.h generated too ?
> see if thats the case

Sorry, missed this email last night.

Not sure what you mean by generated. Both config and _numpyconfig.h are
files that reside under an "arch" dir and brought in when building. I
don't know why this needed to be done this way. Don't you recall, you
did a patch for this package too ; ) Maybe Ross remembers,  his
fingerprints are all over this package.

- armin

> 
>>
>> - armin
>>
>>>>
>>>>
>>>>> we might need similar fix for mips64 too.
>>>> yep, I just built mips64 and ppc64 and they both fail like aach64.
>>>>
>>>> will send v2 to fix those as well.
>>>
>>> OK
>>>
>>>>
>>>> -armin
>>>>
>>>>>
>>>>>> #define NPY_NO_SMP 0
>>>>>> #define NPY_HAVE_DECL_ISNAN
>>>>>> #define NPY_HAVE_DECL_ISINF
>>>>>> --
>>>>>> 2.3.5
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

