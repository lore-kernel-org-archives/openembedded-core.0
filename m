Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0558477155
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:34:19 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id b66so508871pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=DftltjspWImangSC/5mGkdxEacGu60yvFH2RoL7oaqg=;
	b=umHm3hbQR8s2oUv0QrB2kN/y09xVfnwW1AA0Tgm7n8Qv1JMBs0SzzHMT5wvBvh48ZX
	1+S837R7wqUgNv5z+6UTIgaNLwCRiSQ91kEiKlcp2nExWmiOFIiIT5Jn0fWY+EmeTd6T
	77ehMbbW2cPuKMjb4REdyJ5of5aykF8uQW5+bv5LeuoxhlwvTRCW0fU807QltkBeoDJB
	HqAk/0x5ags/ofND5eaNhKt6hghP9nQMVGa3eg1ItR9kmFkxzGLdOGY8Py/NPidPXvXL
	f77LCEfL1l630sDo/H9uQ0xvMiQWqNGafwFZLwRO8Yxxu0dMO0zpqy1kmSgMGtvin8zT
	1ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DftltjspWImangSC/5mGkdxEacGu60yvFH2RoL7oaqg=;
	b=i3/7Pg/bWOW+OpnyGsw3D4FGeG5UjvFM/ec4j0QwBKUZocRAUKxndAPw0bfrtRT8nD
	AK4U4OBboTmpHki9pIWlhFl/u16LDjHTe1Gm/10DpoCpWdUHXp3iiwLYPY1ztudcDTVf
	NqxNbT41su0JlxPbF+luSuHJOhddxVCKynqrSp+GAaSUk7B+Aluy9bXdgT4dClK6Q8pT
	0sF7vMF2lBOYYh/InQY3RxN/0n4jRUctUQ32Bo6guBWIpAwwi6B1BB+8vD9oNXdEYP6g
	nVXdrzweCKUuBeOIFcG8UkXz0EzVCovIseXzGAFMlaC773ozVEjWaVpHRvcVY5x6xmKe
	oqdA==
X-Gm-Message-State: AOPr4FWG1Fob1rV8V88B6Ra1hS+lbRNkv3GYwEMkV8tUUxEmOqosrJT5X4fOWHS74reC6g==
X-Received: by 10.98.35.12 with SMTP id j12mr50738874pfj.73.1463456060017;
	Mon, 16 May 2016 20:34:20 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:3d90:6282:2f17:9ca8])
	by smtp.googlemail.com with ESMTPSA id
	c2sm575886pfc.40.2016.05.16.20.34.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 20:34:18 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
	<9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
Date: Mon, 16 May 2016 20:34:20 -0700
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
X-List-Received-Date: Tue, 17 May 2016 03:34:20 -0000
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
> 

There is no configure for this python package. It uses hardcoded values
in config.h or _numpyconfig.h per arch. X86-64 has the NPY_SIZEOF_OFF_T
defined in _numpyconfig.h. To keep it consistent, I put the Aarch64
changes in the same place.

- armin

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

