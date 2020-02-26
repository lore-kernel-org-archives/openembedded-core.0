Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C694361082
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 19:44:49 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b1so160314pgm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 11:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=m7kStP9cGICEZjLN29J1l5AqEdzae04B/h1y0cx3TQA=;
	b=IXQp+G9pP8C3szcjGnc32bb3pYnswsaiiAoegfAgSnZEOQEUobGzLlCRjT2nh29Toe
	thh8VbkHp8kUlmowm09OEqyUbsuhIk/zBXS2crWmzhNIsypcgZ1MJsVCnThw9g1iGQIH
	ITlCzv198fKdKK8YUEwEb+sSYsgIziSFtX5vb60BJlv22zOHRF1WeVoFMyVygp5HI8Is
	Gzx49b5GOEcG5WHVX4xkvNMbU+FXbL3NFDKdLbcxtjxrWPw1x7xnM5Dwqq3A67IxcWia
	zB7lHQfm875DCQpNzrr5G3ThIMm+gzLL6aqEG6ffzCMbZIdz1LAZv/veQH15DfzaBvcZ
	kehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=m7kStP9cGICEZjLN29J1l5AqEdzae04B/h1y0cx3TQA=;
	b=CZr9i+T92W0e8akFZb7+SwuFfAAz4+AQQMvo31XyD8uAC0kx7HcMy8FgkcW6B+xGNy
	GtGkcdaAcbo3rYTAm/AZu3xhzl3FN/PwRLEjbXGpPZYLBXH4I//lDBXeZuwYDXvQIvVk
	i/rjBZt5At7ck4bQJQ15bqPMUEfYpJUksgTFy6HEgoFVneyKRi5omV30rGxAwchFOAof
	rVQRPeXh2B17heFrUis2FELQbvP4NfXWimGbvbA3WSdcHk+zXq0VuDjGOHSNtCe3t2Da
	MFMLV23gFdE05fSQybIzbL7bnQFByFrGCE4sN+JJPXc+Ftn4KBmg/iBIOz3Y8nKiik9t
	9+cA==
X-Gm-Message-State: APjAAAVlocD7LD2r11vd3XstS4iBllJjfQ0k817dTMFuCNiDl9YOzPh8
	u1PE1M9Fs3IJ71GShalzks7iEKT7qbo=
X-Google-Smtp-Source: APXvYqxjuLovgdxi+hYQY95ivc39gvv8IG9GIGxJJ+t6ZKBMPABEDTVjNQvWOO4oCvTjnd0tEr023w==
X-Received: by 2002:a63:1e06:: with SMTP id e6mr462894pge.134.1582746290078;
	Wed, 26 Feb 2020 11:44:50 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:19c7:2796:79bc:80ea?
	([2601:646:9200:4e0:19c7:2796:79bc:80ea])
	by smtp.gmail.com with ESMTPSA id u3sm3649105pjv.32.2020.02.26.11.44.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 26 Feb 2020 11:44:49 -0800 (PST)
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
	<3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
	<CAMKF1sq+8VCveK48+FqpnPRU_MH6_g9+bVfzo4f2Bbto_d6MJQ@mail.gmail.com>
	<1753b549-7a12-ec88-a1e5-f23ff05b060e@pr.hu>
	<CAMKF1srD6BcwvQQ7cs3fdw1oQUxO+8K6dRWVn4DozbrkUgy+Cw@mail.gmail.com>
	<8a163a56-9558-222a-b24b-03001d7e3b1c@pr.hu>
	<3a2f7872-9f55-f27a-3db9-66aa2fc786f5@gmail.com>
	<e1137d64-5be8-9667-fb3f-3ea264a1a5ad@pr.hu>
	<dca27a23-5bb1-bfae-8736-d29a0faded96@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <cf075d34-c566-8284-8e16-3eb3b030e12c@gmail.com>
Date: Wed, 26 Feb 2020 11:44:48 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dca27a23-5bb1-bfae-8736-d29a0faded96@pr.hu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 19:44:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 2/26/20 9:14 AM, Böszörményi Zoltán wrote:
> 2020. 02. 26. 18:08 keltezéssel, Böszörményi Zoltán írta:
>> 2020. 02. 26. 17:51 keltezéssel, Khem Raj írta:
>>>
>>>
>>> On 2/26/20 7:58 AM, Böszörményi Zoltán wrote:
>>>> 2020. 02. 26. 16:30 keltezéssel, Khem Raj írta:
>>>>> On Wed, Feb 26, 2020 at 7:20 AM Böszörményi Zoltán <zboszor@pr.hu> 
>>>>> wrote:
>>>>>>
>>>>>> 2020. 02. 26. 16:13 keltezéssel, Khem Raj írta:
>>>>>>> On Wed, Feb 26, 2020 at 7:12 AM Böszörményi Zoltán <zboszor@pr.hu>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> 2020. 02. 26. 15:58 keltezéssel, Khem Raj írta:
>>>>>>>>> On Wed, Feb 26, 2020 at 6:05 AM Böszörményi Zoltán via
>>>>>>>>> Openembedded-core <openembedded-core@lists.openembedded.org> 
>>>>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>> The package name exploits sstate.bbclass so it's not added as
>>>>>>>>>> implicit dependency to packages.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> what is the use of this recipe and why should it be added to 
>>>>>>>>> core ?
>>>>>>>>
>>>>>>>> I should have added a cover letter, shouldn't I?
>>>>>>>> See patch 3/5 in the series for enabling gallium-va in Mesa.
>>>>>>>>
>>>>>>>
>>>>>>> recipe seems to build full libva, so why not just use that instead.
>>>>>>
>>>>>> You don't seem to be reading mails from openembedded-devel that
>>>>>> you were cc-ed on.
>>>>>
>>>>> don't assume things
>>>>
>>>> Understood.
>>>>
>>>>>> http://lists.openembedded.org/pipermail/openembedded-devel/2020-February/205142.html 
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> I am trying to make us thing if -dev package can be used somehow to
>>>>> avoid this
>>>>> or have we exhausted all possibilities.
>>>>
>>>> Why is it a problem to exploit sstate.bbclass internals implicitly
>>>> by using a *-initial package name for an arbitrary package?
>>>
>>> it is not a problem, however, it is a work to keep such setup going and
>>> also it has to be considered always in dependencies etc.
>>>
>>>> Surely it's not reserved for libgcc-initial and friends.
>>>>
>>>
>>> they are different usecases, libgcc-initial is a veneer/trampoline used
>>> to bootstrap toolchain, and that too we want to remove at every
>>> opportunity we get, we use to have lot of initial recipes and they are
>>> very few left, so we have to be mindful of adding another one.
>>>
>>>> It solves two problems nicely in one go:
>>>> 1. by using a different package than libva, the libva-vs-mesa
>>>>     circular dependency is avoided. mesa needs a crippled libva
>>>> (pkgconfig + headers)
>>>>     to build its VAAPI state tracker and the VAAPI drivers
>>>
>>> I see archlinux using full libva for this. how are other distros doing
>>> it? is this problem unique to OE
>>
>> Fedora also uses the full libva.
>>
>> However, the chicken-and-egg circular dependency is broken by history
>> for these distros.
>>
>> Koji and Mock build one package at a time with all their dependencies
>> already available from the staging package repository and the results
>> will be eventually uploaded to the same repository.
>>
>> Bitbake doesn't have have this loophole to download pre-built 
>> dependencies.
> 
> Also, somewhere on 01.org or in the libva sources the same solution
> I presented in this patchset is suggested:
> 
> 1. build libva with --disable-glx (it is needed when Mesa SDK is present)
>     but it's not needed by not depending on mesa in libva-initial
> 2. build mesa with libva build in (1) as it only needs the pkgconfig files
>     and the headers
> 3. build libva with --enable-glx. It's autodetected, set to on with
>     depending on mesa in the full libva recipe.

looking at the nature of the problem, it might be the way to unbreak the 
catch-22, does anything else needs this bootstrap header package ?
do we need to ensure that content of libva-dev and the bootstrap 
packages do not overlap.

> 
> Obviusly the same libva recipe can't be used to build mesa that depends 
> on mesa.
> 



