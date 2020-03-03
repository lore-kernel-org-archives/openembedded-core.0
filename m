Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFC6261975
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 19:31:45 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u17so4897010iog.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DNYxM73VdlKYlvR++H7yJLnBK+oAMkJw60SvcogAcLQ=;
	b=r6KJyFWWRY0k79oBXCwP4RfFbSFi0ls1S6mI1E+Tgvha/iKtdUTS52XCR9/TsNMdWP
	NjTlx2bug265QoZbzr8+oM/TsQJt4OWqndQ2AYJgSv9SmWSEqoSsUOxNOh9wEz1jMvWn
	hVnwdNUG9LlmYxIxnji1pNw4mVqy0ZrvlWi//1EwOWAN1/92Ts5RFZeT15EsjiEr2fj5
	AiZJPtuV3aGFiO9JGk7ITx9NruanpGtgoAHme2G07McBiSRtOs9p3HM1uejPVMfhd2DU
	eh/nejYCCVNto4rcaK5pGA9HXXKROubMBvyN6dBOCJdxgA34NxNGEztxekp4YbEmoZvO
	fdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DNYxM73VdlKYlvR++H7yJLnBK+oAMkJw60SvcogAcLQ=;
	b=eg3wGCkVOlCe/9yZKsnwFX4260sQ/DdQltCAzVUhhFjRNDogsz6xrBEBG/vqwfXDsh
	hVAXdGSVaE7ND85D2vO+Ea/J0YURQnPjjSz8PR7Aaqe3emraYsygyo14T7ZJk3giMJt7
	Uh8AwYnavq3oj+LZIpdOrELjCYGYBYkP0fny1V451pFqFe8PVFRkMGhHDHFCXeI5uKYA
	RVsaQyeRpBbfjkiu+WvaQdyc4vvajpFFBse0hHz0Ax0i+O0D17NogHbkyZHcKY3YOnWF
	q9ZI14gTbEDm99p3BQQuscpheKrRjkGVInAx+AROvJFzu5/06+XGKiigM2dXlC4uz0Rv
	xnrg==
X-Gm-Message-State: ANhLgQ3DNIXEglzjWAwxpQK+cwkkzZknskcBhPtcheHytVskV8givq/Y
	1ZurAkLKbizKZ/miEk/7Jx0=
X-Google-Smtp-Source: ADFU+vtOfmk0YE2A1/wwFstXBbtq+0kgLyRoT7eEknFov7/TUX9zaiSH3smVI7IQoM4MiO0kHdA9jA==
X-Received: by 2002:a02:3301:: with SMTP id c1mr5230946jae.136.1583263906472; 
	Tue, 03 Mar 2020 11:31:46 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:31ff:997f:e0c7:a3a0?
	([2601:646:9200:4e0:31ff:997f:e0c7:a3a0])
	by smtp.gmail.com with ESMTPSA id
	r13sm4341191ioj.79.2020.03.03.11.31.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 11:31:45 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Junling Zheng <zhengjunling@huawei.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
	<41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <395e6f3d-7223-4322-9f65-3117a68c17af@gmail.com>
Date: Tue, 3 Mar 2020 11:31:44 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
Cc: "wangnan0@huawei.com" <wangnan0@huawei.com>
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
X-List-Received-Date: Tue, 03 Mar 2020 19:31:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/3/20 3:59 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Junling Zheng
>> Sent: den 3 mars 2020 04:11
>> To: Khem Raj <raj.khem@gmail.com>; openembedded-
>> core@lists.openembedded.org
>> Cc: wangnan0@huawei.com
>> Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
>> MACHINEOVERRIDES
>>
>> On 2020/3/3 2:29, Khem Raj wrote:
>>>
>>>
>>> On 3/2/20 9:11 AM, Junling Zheng wrote:
>>>> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
>>>> "aarch64:", which has the higher priority than TRANSLATED_TARGET_ARCH.
>>>> So, for aarch64 big endian, the variable '<foo>_aarch64' will override
>>>> not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
>>>> incorrect variable.
>>>>
>>>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>>>> ---
>>>>    meta/conf/machine/include/arm/arch-arm64.inc | 2 --
>>>>    1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc
>> b/meta/conf/machine/include/arm/arch-arm64.inc
>>>> index 53f4566815..32294bd218 100644
>>>> --- a/meta/conf/machine/include/arm/arch-arm64.inc
>>>> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
>>>> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>>>>      TUNEVALID[aarch64] = "Enable instructions for aarch64"
>>>>    -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
>>>> -
>>>
>>> if its removed here, where is it being added for other machines,
>> question is, should we treat aarch64 as LE equivalent of aarch64_be
>>> or should be treated as common aarch64 and a new define like aarch64_le
>> defined.
>>>
>>
>> Currently, for arm64, we have aarch64_be to represent big endian, but no
>> overrides to represent little endian only.
>>
>> So, IMO, we should treat aarch64 as little enaian only, like arm and
>> armeb.
>>
>>>>    # Little Endian base configs
>>>>    AVAILTUNES += "aarch64 aarch64_be"
>>>>    ARMPKGARCH_tune-aarch64 ?= "aarch64"
> 
> Please, before removing "aarch64" from MACHINEOVERRIDES, add "armv8a" or
> similar. This is how it is done for the armv7* based chips. E.g., I would
> expect to see tune-cortexa53.inc have:
> 
> MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', 'armv8a:', '' ,d)}"
> 
> Which corresponds to how it is done for armv7*.
> 
> At least we currently rely on being able to do, e.g.:
> 
> COMPATIBLE_MACHINE = "aarch64|armv7a|armv7ve"
> 
> and if you remove "aarch64" from MACHINEOVERRIDES, we need a suitable
> substitute.

I think armv8a or somesuch might be better in the above usecase, but so 
far I think we have treated aarch64 as common arm64 notation, so 
removing this might have more changes needed in rest of metadata, which 
would be not good.
> 
> //Peter
> 

