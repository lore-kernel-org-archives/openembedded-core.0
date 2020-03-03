Return-Path: <jpuhlman@mvista.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9101261992
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 19:20:42 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id o21so35009pjs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 11:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=dXCV761Kj9oaz/La9bJkvhvZpj4IYzwl1sOo95zinXY=;
	b=Hswgfh3ekepJc/LK0irhlrjBQO3Tq/CX5CIJHDTT/K7nz7p/zhOgGIJVJpmwASBedy
	czk/HTOS64kRLG9fEtkQwv+HCUdj97a8uhvAFvaGMYrGJSWb1XxivSfNdZK8VDQh1guB
	pZZzYpthH4NvbqiI2rH2H2txP0Lbre9fe+ASpFk0op/SL37WjLMEmkwzLwqeN8dwOm6T
	URa1YnH+PTFnLBj/pm33h8MOiFFdO3L7vZ/25fcr7pOzWQFZrSohdKLZ9Kp7AyvCA63R
	efpfvXlyiHI4cMSlg92fv1zTbtM27kOTeQPogJZ3OrWeUaq9hti19GxkSHYFVo8j477h
	NKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dXCV761Kj9oaz/La9bJkvhvZpj4IYzwl1sOo95zinXY=;
	b=sbvNa4DhhSZpEVJ0Nk2gfMx/bW5q+5pOC/mCXtQ2MYKdRLZW+WSH3u48g4ylOiF5fk
	pPwZI92bqc+KKafuKD+kSAWG88KHZ/JptfzfUSNG3YHNEw51Rky3wNG2+Wt2hBbRjuk7
	J5TXXx5+Bp3bCf0g9yt4A0dHlWsgu//JzcNzMlxHLIx8At3B8vxp35TUfTkLqIzVKeVQ
	hXfZuxZoKjs2ZNdtZPcOnXgPAmKbYUbphRnNsLdtYPlukbmQ00Wgd4JY67PZLbkIRC1J
	zADMfLxYv1AlT3pEDkje6Vrn0qbh+Uoh77sibdQHTEH6F9bPlUM/YwofgZ+dhWSrDYfW
	6a6w==
X-Gm-Message-State: ANhLgQ3oRh9az5MaiucYDXclvYTbnx9Plz6F4aG8yGUlPr56/RaRnwtV
	IRNmRYjH++dCU2YmExjkFi9vqjY2A3k=
X-Google-Smtp-Source: ADFU+vsiRIafejum6y0+WDB3SWBwz43Bx29R8EzB8t8gt24hD2MS7x8C3jbd9ZBFnUzFzhQDZkcBbw==
X-Received: by 2002:a17:902:aa98:: with SMTP id
	d24mr5670786plr.106.1583263243294; 
	Tue, 03 Mar 2020 11:20:43 -0800 (PST)
Received: from [10.20.245.7] ([45.19.219.178])
	by smtp.googlemail.com with ESMTPSA id
	z19sm8204220pfn.121.2020.03.03.11.20.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 11:20:42 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
	<41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
	<20200303133931.GB13148@localhost>
From: Jeremy Puhlman <jpuhlman@mvista.com>
Message-ID: <64fa9ad2-55e8-1283-bd34-c22bf5d14cd5@mvista.com>
Date: Tue, 3 Mar 2020 11:21:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303133931.GB13148@localhost>
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 03 Mar 2020 19:20:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/3/2020 5:39 AM, Adrian Bunk wrote:
> On Tue, Mar 03, 2020 at 11:59:58AM +0000, Peter Kjellerstedt wrote:
>> ...
>> Which corresponds to how it is done for armv7*.
>>
>> At least we currently rely on being able to do, e.g.:
>>
>> COMPATIBLE_MACHINE = "aarch64|armv7a|armv7ve"
>>
>> and if you remove "aarch64" from MACHINEOVERRIDES, we need a suitable
>> substitute.
> What does "aarch64" actually mean here?
> Does it also cover 32bit-only aarch64 CPUs?
>
> Similar to x86 there are 3 ABIs, and aarch64ilp32 is different from aarch32.
>
> Different from x86, there is no ABI that is available in all aarch64 CPUs.
> They can be 32bit-only or 64bit-only, and aarch32 support is optional.

In our past work with ilp32, aarch64 usually covered both because in 
general the abi's have more in common then
they are different. If something specific for ilp32 was required we 
would use the aarch64ipl32 override to resolve
the issue. Not so sure about aarch32 as  I haven't done much with it.

-- 

Jeremy A. Puhlman
jpuhlman@mvista.com


