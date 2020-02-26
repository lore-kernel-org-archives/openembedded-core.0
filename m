Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD4C616C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 16:50:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so1566256pgr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ddTlqUMDy6Rrt9AhidQkFmFt+L5IKdd8vQaWeOFvEvk=;
	b=dt4Zab1TBvarMZupxHsSGasSoowoO3lzEsN3FACBFRUoxDBdqoMEfDkSP6YTP1aaxb
	r3G8d8BaJvoomQFEFram56RtDBcZajBx1XW7dIXCVvbYIqFHg/sH/Xf1tQvJdOkDwaMG
	zEUYq+xpdCGUibu6ak9dFpSZT8vd/SXxMx6C67elrIWhvtmJoP1Apxhplpx6SG35XPFZ
	e6RpxrETG8/MbdtyNp+WQpXwXNXiWb7lQEzh7hhRF9S4vDIkQwag+Nbk4kPuB2FAcP5q
	RHQTf520ZWiTuHMq141F0a2ZH15DNYabl5Sy2QxHdEbw43o7MS6YYEBowNQLEbR6zvqv
	+aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:references:from:autocrypt:subject
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ddTlqUMDy6Rrt9AhidQkFmFt+L5IKdd8vQaWeOFvEvk=;
	b=VbMvKsaDDGhRbZemReZO2lLXX/LQjKbbX0y/ed6O43MxDtSKwQa/Rs9A5wxSIHsGVQ
	PUHqU07nXl+PJWSzfHh5n4daabnSxnN7zKPwt2QmQr0HlJyNbq/VbHtrwCLZk3IJja/A
	ajRpNQ5JG6ZrnEI9KsmnhhWggi8gHLd3mcrbuAOawfPLbGwrzPUYGi/gKacnrSgjYWel
	pRxdXJF7XSKkAJsraPABKZsEZDvw6MUKcOKuiYLT58FuAfiiNWw/ljQx0fgxXHgscww2
	a6mzkKjuqAFurJ/IX5vjkUc+rdiUvEsRUxCFG2K2F7+ziLMPO3VsdvJFCABxy9+rketK
	FmUA==
X-Gm-Message-State: APjAAAVw7QfF627glur/vr7wXiM6g8VUDQTTZkyJitw4nxgrzYxnXZz8
	C12jzKggzCX0lFuSOUlJNLuMSg8vw8k=
X-Google-Smtp-Source: APXvYqwL9pD9bO/vOZyBA4DspB9b1Hvss9gpnrUyUsb7SfU316SdK11G8+LLaWfJhIxPzk4kCxHvKw==
X-Received: by 2002:aa7:8096:: with SMTP id v22mr5236713pff.240.1582735848443; 
	Wed, 26 Feb 2020 08:50:48 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0::98a3? ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	200sm3705609pfz.121.2020.02.26.08.50.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 26 Feb 2020 08:50:47 -0800 (PST)
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
	<3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
	<CAMKF1sq+8VCveK48+FqpnPRU_MH6_g9+bVfzo4f2Bbto_d6MJQ@mail.gmail.com>
	<1753b549-7a12-ec88-a1e5-f23ff05b060e@pr.hu>
	<CAMKF1srD6BcwvQQ7cs3fdw1oQUxO+8K6dRWVn4DozbrkUgy+Cw@mail.gmail.com>
	<8a163a56-9558-222a-b24b-03001d7e3b1c@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <3a2f7872-9f55-f27a-3db9-66aa2fc786f5@gmail.com>
Date: Wed, 26 Feb 2020 08:51:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8a163a56-9558-222a-b24b-03001d7e3b1c@pr.hu>
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
X-List-Received-Date: Wed, 26 Feb 2020 16:50:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/26/20 7:58 AM, Böszörményi Zoltán wrote:
> 2020. 02. 26. 16:30 keltezéssel, Khem Raj írta:
>> On Wed, Feb 26, 2020 at 7:20 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>>
>>> 2020. 02. 26. 16:13 keltezéssel, Khem Raj írta:
>>>> On Wed, Feb 26, 2020 at 7:12 AM Böszörményi Zoltán <zboszor@pr.hu>
>>>> wrote:
>>>>>
>>>>> 2020. 02. 26. 15:58 keltezéssel, Khem Raj írta:
>>>>>> On Wed, Feb 26, 2020 at 6:05 AM Böszörményi Zoltán via
>>>>>> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>>>>>>
>>>>>>> The package name exploits sstate.bbclass so it's not added as
>>>>>>> implicit dependency to packages.
>>>>>>>
>>>>>>
>>>>>> what is the use of this recipe and why should it be added to core ?
>>>>>
>>>>> I should have added a cover letter, shouldn't I?
>>>>> See patch 3/5 in the series for enabling gallium-va in Mesa.
>>>>>
>>>>
>>>> recipe seems to build full libva, so why not just use that instead.
>>>
>>> You don't seem to be reading mails from openembedded-devel that
>>> you were cc-ed on.
>>
>> don't assume things
> 
> Understood.
> 
>>> http://lists.openembedded.org/pipermail/openembedded-devel/2020-February/205142.html
>>>
>>>
>>
>> I am trying to make us thing if -dev package can be used somehow to
>> avoid this
>> or have we exhausted all possibilities.
> 
> Why is it a problem to exploit sstate.bbclass internals implicitly
> by using a *-initial package name for an arbitrary package?

it is not a problem, however, it is a work to keep such setup going and
also it has to be considered always in dependencies etc.

> Surely it's not reserved for libgcc-initial and friends.
> 

they are different usecases, libgcc-initial is a veneer/trampoline used
to bootstrap toolchain, and that too we want to remove at every
opportunity we get, we use to have lot of initial recipes and they are
very few left, so we have to be mindful of adding another one.

> It solves two problems nicely in one go:
> 1. by using a different package than libva, the libva-vs-mesa
>    circular dependency is avoided. mesa needs a crippled libva
> (pkgconfig + headers)
>    to build its VAAPI state tracker and the VAAPI drivers

I see archlinux using full libva for this. how are other distros doing
it? is this problem unique to OE

> 2. by using libva-initial as the package name, the per-recipe sysroot issue
>    is avoided where prepare-sysroot for a 3rd package like
> intel-vaapi-driver
>    would fail because the real libva the crippled variant would install
>    identical files
> 

right, this is the problem I am afraid of creating almost duplicate packages

>>
>>>>
>>>>>>
>>>>>>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>>>>>>> ---
>>>>>>>     meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
>>>>>>>     meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
>>>>>>>     2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>>     create mode 100644
>>>>>>> meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>>
>>>>>>> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>> b/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>> index ca1386d80b..5b1cdee7e3 100644
>>>>>>> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
>>>>>>> @@ -17,10 +17,12 @@ SECTION = "x11"
>>>>>>>     LICENSE = "MIT"
>>>>>>>     LIC_FILES_CHKSUM =
>>>>>>> "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
>>>>>>>
>>>>>>> -SRC_URI =
>>>>>>> "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
>>>>>>>
>>>>>>> +SRC_URI =
>>>>>>> "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
>>>>>>>
>>>>>>>     SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
>>>>>>>     SRC_URI[sha256sum] =
>>>>>>> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
>>>>>>>
>>>>>>> +S = "${WORKDIR}/libva-${PV}"
>>>>>>> +
>>>>>>>     UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
>>>>>>>
>>>>>>>     DEPENDS = "libdrm"
>>>>>>> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>> b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>> new file mode 100644
>>>>>>> index 0000000000..828ef6fbca
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>>>>>> @@ -0,0 +1,5 @@
>>>>>>> +require libva-${PV}.inc
>>>>>>> +
>>>>>>> +do_install_append () {
>>>>>>> +       rm -f ${D}${libdir}/*.so*
>>>>>>> +}
>>>>>>> -- 
>>>>>>> 2.24.1
>>>>>>>
>>>>>>> -- 
>>>>>>> _______________________________________________
>>>>>>> Openembedded-core mailing list
>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>
> 

