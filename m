Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 810097F278
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 13:46:11 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id g20so167400845ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=b9t/I7rrYvND6i90bvxeshYRiOu7rJr3qJsMO7Slj5s=;
	b=N0d72Hkyn/Qe/j2hklxeYbIypMffYXvqca3ynCakyZ+PW4vx6HVijgbiWw7INkPQkN
	gsS4mNZyqVPgMEDkAVwjJ0OEf72DhQIQjwpnIutay2zpujGh6vWwJf1CASmGj1ZxHD5L
	T01CCJORgFESIp/4EtOhvJ+ybhaDBMGbctE7v0g5KAxQSCO6KF7JRdog5o/Zl7Blj9EP
	6C0KnSUPltfc4GPNGEBwQgo9BYUQTU0bJaECsBBWalxMy6XBOPUROgF2eut1jxMmMZYr
	PJFAeHv7lz5gQkmFLwHyqDfNzqsp/dqBz12QPD1kIpkQXl7T3C6ONbAfECTEtrx/ZfiI
	h9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=b9t/I7rrYvND6i90bvxeshYRiOu7rJr3qJsMO7Slj5s=;
	b=aG+V5Od4r6Z80NJtcZ2VyUWq1DLyIygf1mkCGdvUv1FFnTLZjsHGPGGeLH7qKwrTUn
	Gyn+kCTufEJZSDvVMPi1IQl+gV15BEdmVArG8PTs5Gg/WmxbQpBmpu5kldA3T4V2K2IK
	XvUVoQNBzv7du2HK7KulHbS9PcMQTaLfCkZnmjQZRq2smZLUOhSjLZnCjsfGieptoJn1
	PhQ9AWHjGNrt8LU6Novk2akilVDJjJKFYRR4ZdgNX3e54a/3pKuAVg10DE6QbRdLx+hR
	sRvJwwOtX0slBCu23DoKfgLAzg2kocuvxBBRsdeZ2yXiDJvzr6S266GvWNYqmUMTmCYT
	rakg==
X-Gm-Message-State: APjAAAUo4Ce58czggLMdih1q1GPJvFnSYzFjpHhBmpafqJsl68X/d5mS
	ZbEQC5nm8LvHRb1C/deQtoM=
X-Google-Smtp-Source: APXvYqxXEMjvCbGRVEsbFjBWAzIlTcAKnu9glWPloSVYvTKbWUlJYpyOr3lZWjNeVvj4T1kq2N3HHA==
X-Received: by 2002:a02:c95a:: with SMTP id u26mr1372226jao.15.1565012772444; 
	Mon, 05 Aug 2019 06:46:12 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x22sm62823022iob.84.2019.08.05.06.46.11
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Aug 2019 06:46:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Mikko.Rapeli@bmw.de, richard.purdie@linuxfoundation.org
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
	<a020143f53511171dc4d407e0d8dde259af3852a.camel@linuxfoundation.org>
	<20190805072121.GM3459@hiutale>
Message-ID: <423417c6-cf67-1456-0a0a-f071dc1ba0bb@gmail.com>
Date: Mon, 5 Aug 2019 08:46:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805072121.GM3459@hiutale>
Cc: JPEW.hacker@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Mon, 05 Aug 2019 13:46:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 8/5/19 2:21 AM, Mikko.Rapeli@bmw.de wrote:
> Hi,
>
> On Fri, Aug 02, 2019 at 05:17:21PM +0100, Richard Purdie wrote:
>> On Fri, 2019-08-02 at 16:53 +0100, Richard Purdie wrote:
>>> With the patches in master-next and this configuration in local.conf:
>>>
>>> BB_HASHSERVE = "localhost:0"
>>> BB_SIGNATURE_HANDLER = "OEEquivHash"
>>>
>>> $ bitbake core-image-sato
>>> $ bitbake m4-native -c install -f
>>> $ bitbake core-image-sato
>>>
>>> will result in do_populate_sysroot of m4-native running, it will see
>>> the output matches the previous build and it will then skip to the
>>> rootfs generation pulling all the other pieces from sstate.
>>>
>>> Note that for this to work, m4-native has to have previously built
>>> with the hashserv running, otherwise it has nothing to compare its
>>> output to.
>>>
>>> I think this should be a "big deal" for many developers, reducing
>>> unneeded rebuilds and hence speeding up development.
> Awesome, thanks for pushing this!
>
>> I should have mentioned, this code relies on reproducibile builds as
>> its comparing the binary output. The more reproducibile builds are, the
>> more likely sstate reuse will happen.
>>
>> This is one reason reproducibile builds are important!
> What else do users need to enable to get more reproducible builds, or
> are poky defaults enough?

You can test with what we currently have by adding:

  INHERIT += "reproducible_build"

to local.conf. This is subject to change though as we are still sorting 
out some of the details.

>
> Are there some tools available to debug build reproducibility issues e.g.
> when task hashes suddenly changed?

The current goal of the reproducible build work is to create and OEQA 
test that checks if all recipes that are required for a given image can 
be built in a reproducible manner. This QA test will be run on the 
autobuilder to detect regressions. We are currently working toward 
getting core-image-minimal reproducible, but I think Ross Burton 
investigated core-image-sato and determined it wouldn't be too much 
extra work, so we might try that one also. Either way, the test is 
designed to be be easily extensible so you can write your own tests on 
whatever image you would like.

I think that there is a significant opportunity to improve the reporting 
and tests for reproducible builds, and much of this complements hash 
equivalence. For example, the hash equivalence code is (or can be) 
really good at reporting why a task's output hash changed, which would 
be really useful information for debugging reproducibility.

I also have some patches that should make it easier to debug packages 
that didn't build reproducibly when the QA check fails by allowing you 
to run diffoscope on them.

>
> Cheers,
>
> -Mikko

