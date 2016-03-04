Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 88E406FF93
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 23:55:47 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p65so39502029wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 15:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=lQiXrSwOxO2thu4Jqvo+zJQ4AL9k+ai+x5tjkiXgTZc=;
	b=npvxo9FG2dWVicNI1/ouiVcxd6msuMggFyeL6SomIUvRCFencK9oxxLXDNJYDuekMf
	tQOy+qlwU2Cv1mHk4aelgfrLtHfV8c6WFweA7dJLJx7CPxVzQeiFYCX3UnqdDUNhFMmC
	H8Rbc/1wHhcvHT5USKNCIuevCFv/qA3XhHvyseu9YVIGfjnHSv//DskEPDI6NGzKj8Ka
	0fc+OL4pyzICVmiUIOJTY8TGj3olbJh2atSpkEHr5nnmHnurwK44YgqaJYwGrn6GIIai
	65PtJfTZFVMCH+m4L8dTtDlohkvSypWosqrKX3hqwDHWZmxxZR3aL1FP8k40d992hbUx
	k+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=lQiXrSwOxO2thu4Jqvo+zJQ4AL9k+ai+x5tjkiXgTZc=;
	b=SiLfH0uxxTfdRn/LwoIBqFmXCwzLjrpzhhBlOMcLmrtqcSp9Hm9MGCJ/mslCHsxbkb
	1XnVzzWh1OFSpKq6NUZSWd+eiwCRJ1aXK9wGcktOAiYN0O80apfrt6lx3M/5QTNq5Z2q
	SgQ8TaR+k0vXJkT+zaXhCLljTU3Wi7OXGG7Wi31YMDakZUSq6YKiCGeuIEZAVVoB1vwT
	/OO2e8iLlTn0WCNmJr1OWgHL8C8sOZA8rgC08mqTZECAfY9xbsIusXDfqdaDBrvfCY7E
	hYjX1j+XAkf4ZwSevgJCkCre5OI8VIjJjtUTQtsWzY5SuWo7C5Mx+mndxx4gCTlG0Rhl
	wSzg==
X-Gm-Message-State: AD7BkJKFvA1jNIgKoLfxquJXeKH9JMDs2jraGxUbUVsPvME5lCzZSrtEUYZ4iK5KePf2kLiQn03t13+6UdBm8A==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr11365159wjc.3.1457135746993; 
	Fri, 04 Mar 2016 15:55:46 -0800 (PST)
Received: by 10.194.67.132 with HTTP; Fri, 4 Mar 2016 15:55:46 -0800 (PST)
In-Reply-To: <CAMKF1sqY+rsv8Hu5pi1tdvybQLp9Ro-HgZ3NZktvSiWhmVM00Q@mail.gmail.com>
References: <1457130807.2804.59.camel@linuxfoundation.org>
	<CAMKF1sqY+rsv8Hu5pi1tdvybQLp9Ro-HgZ3NZktvSiWhmVM00Q@mail.gmail.com>
Date: Fri, 4 Mar 2016 15:55:46 -0800
Message-ID: <CAJ86T=W42JcOp1_qDPFnFoipGO8qDTbg_XxVT528foXPT97itQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: uninative stdc++ abi
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
X-List-Received-Date: Fri, 04 Mar 2016 23:55:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 4, 2016 at 3:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Mar 5, 2016 at 6:33 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> +# https://wiki.debian.org/GCC5
>> +# We may see binaries built with gcc5 run or linked into gcc4 environment
>> +# so use the older libstdc++ standard for now until we don't support gcc4
>> +# on the host system.
>> +BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
>>
>> Is this the right way to try and fix this? Any better ideas?
>
> yes thats the best option we have given the myriad of build OSes we
> have to support.

An alternative would be to configure our uninative gcc5 libstdc++ with:

EXTRA_OECONF_append = " --disable-libstdcxx-dual-abi
--with-default-libstdcxx-abi=gcc4-compatible"

Not sure if that's better though. Just a different approach to achieve
the same thing.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

