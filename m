Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAC0C61879
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 19:27:25 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u17so4882501iog.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 11:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FDEuYhbEdqcAKJ7oxGIDn6XkYk+bdjwE9z9GCmBbIsQ=;
	b=aBcuvBirXgbOdsD8k0bjhuerJiTqvXNIk1MZTv0BtvbPUtgrLvFXbJUI8C+ym2E262
	52cntmtM7IkIvyKCNtssARxYNS5OcplL1Jw7SAVdjv+MtrP0e42EgCVqijtdr/Zw2zdE
	aDCQAQ/QvgShlV9Rpn3nWBntPa5/9IXqj4YGIbUaxV6HZzNuZjIlXckfKaTOjLTgkLNZ
	VMDZNZk8/Ok/oSQYalgmiyiGsyjLhy1a89KvyRW9Xid1nMFC1+ksj/YjtdMhm62Lj35y
	Mavrw3tbAHGceKjqT5qARq1yi286uNnhTxHSOeL+9bYxPbFHmPfEkAtpv/N3tLA6IejI
	ZSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FDEuYhbEdqcAKJ7oxGIDn6XkYk+bdjwE9z9GCmBbIsQ=;
	b=WM3J01lOANiEcWZJ45KdNSpLVs/EXJqNWiCxoG/uEdZjYaGfrQ3HasLKJdQGyZnwab
	VI1LdKogMrb+7gi2QMNJW4qcdGY5Tmd+xBZhw4mnsYlgLh3rNKRAR4/DIOr1zgsZu3sF
	dhInSvFs5VeVn9O/JDDiHMvhXZaTu0zUbBftu96HsOCYmYf9swWXvejpcfMhkv3CfF5R
	0mwOIy0m6TOX9UhTC/scR/MvQVRhRfV/iihtjGheNep/YuP2yCZBlNHzGpng0PJi10LB
	2G/s62fP14euN4/RsbsAx3MO6vil3Ani8Vhf8Gb563LgK1suWhE3esnUd1AXNL7BNOqo
	7AIQ==
X-Gm-Message-State: ANhLgQ2d6gwCeZlgLq7NxchU5As5u5z4L4AiuZcKc2KWgSpUIVRsVCQw
	ahpOiLInou30n7CzP57e9Qk=
X-Google-Smtp-Source: ADFU+vuA6qtAbB/UrLZm7vwlzz8pNGCnfStFbm+ponN5FW3XA34DHME2lQ+2xf6udB01e6Ng6BnGkw==
X-Received: by 2002:a5d:8f14:: with SMTP id f20mr5004839iof.307.1583263646543; 
	Tue, 03 Mar 2020 11:27:26 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:31ff:997f:e0c7:a3a0?
	([2601:646:9200:4e0:31ff:997f:e0c7:a3a0])
	by smtp.gmail.com with ESMTPSA id q1sm8186408ile.71.2020.03.03.11.27.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 11:27:25 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<20200302213441.GA13148@localhost>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <782f99dd-dcf6-6e02-e7fb-08539711b1d7@gmail.com>
Date: Tue, 3 Mar 2020 11:27:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302213441.GA13148@localhost>
Cc: wangnan0@huawei.com, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 03 Mar 2020 19:27:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/2/20 1:34 PM, Adrian Bunk wrote:
> On Mon, Mar 02, 2020 at 10:29:37AM -0800, Khem Raj wrote:
>>
>>
>> On 3/2/20 9:11 AM, Junling Zheng wrote:
>>> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
>>> "aarch64:", which has the higher priority than TRANSLATED_TARGET_ARCH.
>>> So, for aarch64 big endian, the variable '<foo>_aarch64' will override
>>> not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
>>> incorrect variable.
>>>
>>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>>> ---
>>>    meta/conf/machine/include/arm/arch-arm64.inc | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
>>> index 53f4566815..32294bd218 100644
>>> --- a/meta/conf/machine/include/arm/arch-arm64.inc
>>> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
>>> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>>>    TUNEVALID[aarch64] = "Enable instructions for aarch64"
>>> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
>>> -
>>
>> if its removed here, where is it being added for other machines, question
>> is, should we treat aarch64 as LE equivalent of aarch64_be
>> or should be treated as common aarch64 and a new define like aarch64_le
>> defined.
>> ...
> 
> As far as I am aware all other distributions and config.guess are
> treating aarch64/arm64 as little endian and 64bit, unless suffixed.

this is effective only in defining overrides and like we have for mips 
there is a common override like mipsarch, that apply to all mips. and 
mips in itself does mean MIPS BE, so my question was if there is a value 
in having a common overrrided across all aarch64 variants we have 
irrepective of endianness or wordlength, its fine if we want to treat 
aarch64 as LE

