Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id DECF67EDF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 16:27:37 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z3so839446iog.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=MolBhLV02NGSiyLFUP0wr4zoNXr+4KViQdP6LbF8i8M=;
	b=SPpbBUG2AApe3QUsUkdGnfbDwemL9QCsxHPERynptMIesMtTgUynCFalXrELcKA03J
	7TNo2T5ZOHIQQXa/WKm6C5mglfLKYO2KUW0AA2rh7nAfyTjE1GYGtUu8KKJzA/hsnUrv
	3TFdj9LbDtGFd952jSUJ124on0loaMFHZetQ9Ygqt7zTlEKwPYbRsj44whrAt/vkPG8H
	blEmGcQ4ZXN5DAxt5/GK7RtCPC0K/Bo75XRZxs2VwT8IMt8Sq+XEvpqiCjGyKg49SzdA
	DHIDI2Yr0ZIJfJtJgAJf8cHfgt+3lBaILyjgaRxs79KoQivIPHz72vQ1KPRtffPLR1Zp
	Zv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=MolBhLV02NGSiyLFUP0wr4zoNXr+4KViQdP6LbF8i8M=;
	b=tUlAq/mMNcsW4LWhmMPhPaiKd+4BEcYzkdQmW4zEc+zTW0+o5egMIrVUnG+K3Oiclw
	9eFUjiDwEMvj8Ai5n/NYsQ+2KtjfaTPHLHGlPvEV3YiAQrgMmHkh6N8TNZZGcsjgm+3R
	rvaQuMUnzLAGzZoddmX8XEh3a5IUiKNX/fAx/B1w4iLzcZr3dlZoCYBtP7dXOEb+V8Qo
	dAIfguRJokjMYdxgkqvMg1q/WNfjTMs4rpvtvQIm0BXdvlTHOgJ8pdaNXAC9xl+RLV/q
	mJD08hlewj00MbeHjQJn/7xVCzWvWZTGaNCnjOyx5OL/g2yLD4IMUjFk5Txm2I/KcB+K
	5khw==
X-Gm-Message-State: APjAAAUBtk+YP+SK9nBIauCTqAOLAC0R9BmQj4uew+Jsf6h0bIjF9kK9
	/si1xkDJhOAGXim2Ze4kJYJMNeO/
X-Google-Smtp-Source: APXvYqzVYqac7BZ2TDmaRY0lYwQiBNU6k7RKk9zEup0I1mDM3Ff4IyGmQhayGfplu9VGpJaH8RPegw==
X-Received: by 2002:a5d:96cb:: with SMTP id r11mr5502709iol.200.1567009658475; 
	Wed, 28 Aug 2019 09:27:38 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id b17sm457707ioh.6.2019.08.28.09.27.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 28 Aug 2019 09:27:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190827124546.18114-1-JPEWhacker@gmail.com>
	<893793eb5d13e0da6f32b446bb876ab562cd8f52.camel@linuxfoundation.org>
Message-ID: <8cd4e5be-e226-a297-daca-1cce33f5af31@gmail.com>
Date: Wed, 28 Aug 2019 11:27:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <893793eb5d13e0da6f32b446bb876ab562cd8f52.camel@linuxfoundation.org>
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Wed, 28 Aug 2019 16:27:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/28/19 11:09 AM, Richard Purdie wrote:
> On Tue, 2019-08-27 at 07:45 -0500, Joshua Watt wrote:
>> gettext is required to generate the glibc locales in do_compile. If not
>> present, glibc will skip the generation which isn't reproducible.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/recipes-core/glibc/glibc.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
>> index 252fd56c13c..f1a6ae2a245 100644
>> --- a/meta/recipes-core/glibc/glibc.inc
>> +++ b/meta/recipes-core/glibc/glibc.inc
>> @@ -6,7 +6,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
>>   
>>   PROVIDES = "virtual/libc"
>>   PROVIDES += "virtual/libintl virtual/libiconv"
>> -inherit autotools texinfo distro_features_check systemd
>> +inherit autotools texinfo distro_features_check systemd gettext

FYI: I forgot to send this one in-reply-to a previous patch. There is 
more history here: 
http://lists.openembedded.org/pipermail/openembedded-core/2019-June/284158.html

> I suspect this may not do what you expect.
>
> At least as I read the class and recipes, glibc sets
> INHIBIT_DEFAULT_DEPS which means no gettext-native dependency is added,
> instead, configure has --disable-nls added.
Ah, yes I see that also.
>
> Is that what we want?

I guess I'm not sure exactly what we want; It was a while ago so I don't 
remember exactly what glibc was doing, but it looks like it was 
sometimes generating locales (e.g. the first time it built) and 
sometimes not (when rebuilding) depending on the presence of gettext.

>
> I'm curious to understand how glibc locales are ever generated
> correctly and what we're aiming to add here (a gettext-native
> dependency?)

I'm not sure how it ever works correctly :). Perhaps it would be best to 
just drop this patch for now until we take a more serious look at 
reproducible in the presence of partial recipe rebuilds. I'd rather 
focus on getting the existing QA test running ATM.

>
> FWIW gettext-native is a very heavy thing to add in as a dependency
> from a build time perspective.
Yes, that was discussed which is what led to using gettext.bbclass that 
might use gettext-minimal-native, but as you pointed out this isn't 
whats happening.
>
> Cheers,
>
> Richard
>

