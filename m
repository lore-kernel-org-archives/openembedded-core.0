Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD4BA7FBEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:58:07 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k3so12103273pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PNfFxg7x6VJjFnwsD4dd4UZc3vo+VFQWndCZ49h2Mg8=;
	b=Fr62D1y5gZUj7wRqakbyHC/zjODC4GwdN+49bj9lXGZifxj9x+UAFfsEFm/B6uRnKU
	mSseCFn77ngBaGJSQKDdZye9KI2xMyVV1CtXtiwinkCMnByGWW1NoQYuHQbrjz2ri6dw
	K2l3i+Oh1t3LCFHByYl2Jvr0/50WccNoJezBuPrnxmG4SaRij6dYXHGxhU6CAIR/Q0Rm
	F34IPTom9gM35GsxviM25wgnXQuf4QZW1Cs4ytQeBKaKtkYFn6lDc5kB2ZTC5yUobeFm
	V4IeG3J4zviJW6i2FbnCDIonz1oE0POwYe3dbinFEpkOYp4ncyO5dnaHIQjJjR78rcj8
	D7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PNfFxg7x6VJjFnwsD4dd4UZc3vo+VFQWndCZ49h2Mg8=;
	b=D3W/LMeQKWA+G0gI0hvyfkrt8t7M1XMCBQpmziZRLF8pau/nzgOykk4Md1fi/lCXB8
	UXvGDAtMPMeOgOY7NThgSYf4vph/M7xnPkZDw0I2FoMt0WDu4TdMaQ2ceCDjn3e9eAVY
	QxvRIZo7IjSZUxkuWCptR9ysoaKdv+isZmUR6WokjXq2Qum6+oy+cqiBVPr5vNdH9wHD
	t6LAS3clQfKO3gA2EhAyxcgvRwsYSNhZKhkIxiouTmed1T9yQOqcoPVcOd3Fzdr6J3+p
	+4SoWiScjkG2iu1Fhlp3kINEjF0L5bFWUQHC1P4ftMu+puSqcOstE+V60Z8D/K/WgaFm
	Qepw==
X-Gm-Message-State: APjAAAX6bqpn6eryDfTNbS0c4veN5cZnQ9s6j/WxnKJSe7ZZOb6jWkhi
	yUAd5W7PfP+Q3esQr5MdaZw=
X-Google-Smtp-Source: APXvYqzxwRzJDS6/Tb668flOA7UqEmfXy5r6NZCILW9lOkBNsCWcEBS/LrWYT79u5FHpuZVduUD7ag==
X-Received: by 2002:a63:2e07:: with SMTP id u7mr46465027pgu.295.1579287488750; 
	Fri, 17 Jan 2020 10:58:08 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:6d1f:200c:159c:4a81?
	([2601:646:9200:4e0:6d1f:200c:159c:4a81])
	by smtp.gmail.com with ESMTPSA id j8sm77019pjb.4.2020.01.17.10.58.07
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 17 Jan 2020 10:58:08 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
	<f0bf0f91-b6a0-f22b-37a4-8d72daf8a2cd@gmail.com>
	<3e7abb573ad9f471089adc7e78dc94c0f640220a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b3218744-4246-1301-0ea8-0281855f5dbc@gmail.com>
Date: Fri, 17 Jan 2020 10:58:07 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3e7abb573ad9f471089adc7e78dc94c0f640220a.camel@linuxfoundation.org>
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>
Subject: Re: Building older releases on modern distros (and vice versa)
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
X-List-Received-Date: Fri, 17 Jan 2020 18:58:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/17/20 10:57 AM, Richard Purdie wrote:
> On Fri, 2020-01-17 at 10:39 -0800, Khem Raj wrote:
>> On 1/17/20 9:59 AM, Richard Purdie wrote:
>>> We've been discussing how we could:
>>>
>>> a) build old releases on newer distros
>>>
>>> as well as
>>>
>>> b) how we could build new releases on old distros.
>>>
>>> Our proposed answer has been "buildtools-extended-tarball" which
>>> includes nativesdk-gcc.
>>>
>>> We need b) so we can install this on Centos7 and stop having to
>>> work
>>> around its really old compiler. In general this should improve our
>>> ability to support stable branches in general.
>>>
>>> I wanted to stress test a) a bit, partly to prove that b) could
>>> work
>>> longer term.
>>>
>>> I did this by attempting to build buildtools-extended-tarball on
>>> pyro
>>> which has a gcc v6 and then using that to build morty on an Ubuntu
>>> 18.04 system.
>>>
>>> It wasn't plain sailing, I had to:
>>>
>>> * Upgrade the uninative in pyro
>>> * Switch to xz uninative to allow latest uninative to work
>>> * Patch binutils to fix an ld.so.conf relocation issue
>>> * Add an ld.so.conf to buildtools
>>> * Add the buildtools-extended-tarall recipe
>>>
>>> Patches are in:
>>>
>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/pyro
>>>
>>> (some need forward porting to master)
>>>
>>> Having got the output from the pyro build, in the morty build I
>>> added
>>> buildtools tarball to PATH before running the build. I had to
>>> disable
>>> uninative since it was going to get in the way and conflict:
>>>
>>
>> do we intend to generate extended buildtools tarballs for all
>> releases
>> if it works out well ?
> 
> Going forward there will be one generated as part of the release
> process for each release, they're part of master builds already.
> 
> We only really need a couple of older older ones with older gccs to be
> able to support a range of different older releases but we should look
> to generate those.
> 

Perhaps it will be good to have one with gcc 4.8 ( pre c++11 days )

> Cheers,
> 
> Richard
> 


