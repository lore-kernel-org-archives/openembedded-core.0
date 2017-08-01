Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 84421782E1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 15:17:13 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y192so3139786pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=1OdUoXHUMrDU9Iepz1bwKDx7QKL2+pKMDfKbP1un3gM=;
	b=j6gyFCDNI0EMh+V+7SzZBPgiasB3tjB9puiyyNIdKFTEUuXWM2yCkpsVl5BgRd4X5n
	NjV1JDT6k5WDVxV3KvEyaQhTNqkW3XOR3jsRZWkzBvompZwvvsAkQwdr+sE96fhZBycH
	ojViARIqRm19g5YPIvaseZotKrG121p3QMDf05AqvE8e7h2oWquuFWOKF8yUj+9mXxcL
	voPFo95iVXNqc2kJxdK02vExhWQ4tZeVEaEakcPph/ZxGSH5y7W4GDP9/cCrPrk0kJDj
	c+YvZMQCTopcm5qdaW2WADrhyvqqnppACwClvJA90TamshWLiQpCv7Rg5zLIt9Ehgsuj
	kuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1OdUoXHUMrDU9Iepz1bwKDx7QKL2+pKMDfKbP1un3gM=;
	b=J+iwSOpA5PzdqySFUN1gmHN5hDqdXQjocoFZ0VuQ/PwtrkS+m3jX/JhMgxt3bAQSPr
	ckG0ctx9R5Ke5+Yz2IQI7zYPiQ5NjPq51j4N5eKNf3HM9BFjhzXchB0xm803a8uk+2WD
	1OZ1evuAX1w12pkUYVtUQ0JLgMmZjiaStKawHatZrp8n/rGXp+6x7ECFWibR8dY59TS6
	Zzt5oIrRD/AOrgJiwRhu/Q8BvaLAWrOb3y1VZmFpiOaPDcpHzw44FGf62Tol1ieeEbPF
	5TqkRyzQ+Pl1yd4ishp/nqu2vryDhEYoTKrZjtPl9N3h2j/HglY4U5uwWzSlFK52MJbj
	oRXg==
X-Gm-Message-State: AIVw112K2UmHkWa6mwr84yTBNl2Py6Eo07BrNP9cWU0OMfMdwVHcx+NE
	rzeJ4PvDgwA40p9D
X-Received: by 10.84.232.15 with SMTP id h15mr21310312plk.189.1501600634497;
	Tue, 01 Aug 2017 08:17:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2ddd:cc9a:59f3:2754?
	([2601:202:4001:9ea0:2ddd:cc9a:59f3:2754])
	by smtp.gmail.com with ESMTPSA id
	t186sm60539301pgc.28.2017.08.01.08.17.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 08:17:13 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
	<1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
	<c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
	<e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ef1580a9-9643-f8ad-1865-78fc5f6aeec4@gmail.com>
Date: Tue, 1 Aug 2017 08:17:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Tue, 01 Aug 2017 15:17:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 07/31/2017 12:04 PM, Khem Raj wrote:
>
> On 7/31/17 10:51 AM, Mark Hatle wrote:
>> On 7/31/17 12:40 PM, akuster808 wrote:
>>>
>>> On 07/31/2017 10:31 AM, Mark Hatle wrote:
>>>> On 7/31/17 12:16 PM, Armin Kuster wrote:
>>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>>> ---
>>>>>   meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++++++++++
>>>>>   1 file changed, 25 insertions(+)
>>>>>
>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>> index 5e832fa..dc1ba5e 100644
>>>>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>> @@ -1 +1,26 @@
>>>>> +DEFAULTTUNE ?= "armv8-a"
>>>> do we want the '-a'?  The other arm (7) are of the format armv7a (no '-').
>>> works for me either way.
>>>
>>> While we are at it. How would we want ‘armv8.1-a’, ‘armv8.2-a’, ‘armv8.3-a'
>>> formated as?
>> My preference is to drop the '-'.  As for the '.', I'm not sure.. not something
>> we've run across before.
>>
>> We could just drop it (the '.'), but it really depends on if armv81a would
>> confuse someone (familiar with arm) or not.
> I would suggest to also sync  with other distros and ensure that we dont
> do something different. Its very costly later. Since applications get
> ported to most common combination
Sync what part? naming of file? ( sorry lost regarding your comment)

- armin
>
>> --Mark
>>
>>> - armin
>>>> --Mark
>>>>
>>>>> +
>>>>> +TUNEVALID[armv8-a] = "Enable instructions for ARMv8-a"
>>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', ' -march=armv8-a', '', d)}"
>>>>> +
>>>>> +TUNEVALID[crypto] = "Enable crypto instructions for ARMv8-a"
>>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
>>>>> +
>>>>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', 'armv8a:', '' ,d)}"
>>>>> +
>>>>>   require conf/machine/include/arm/arch-arm64.inc
>>>>> +
>>>>> +AVAILTUNES += "armv8-a armv8-a-crypto"
>>>>> +ARMPKGARCH_tune-armv8-a ?= "armv8-a"
>>>>> +
>>>>> +# Enable Crypto extension. This also enables Advanced SIMD and floating-point instructions
>>>>> +ARMPKGARCH_tune-armv8-a-crypto ?= "armv8-a"
>>>>> +
>>>>> +TUNE_FEATURES_tune-armv8-a = "aarch64 armv8-a"
>>>>> +TUNE_FEATURES_tune-armv8-a-crypto = "${TUNE_FEATURES_tune-armv8-a} crypto"
>>>>> +
>>>>> +PACKAGE_EXTRA_ARCHS_tune-armv8-a = "aarch64 armv8-a"
>>>>> +PACKAGE_EXTRA_ARCHS_tune-armv8-a-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-a} armv8-a-crypto"
>>>>> +
>>>>> +BASE_LIB_tune-armv8-a = "${BASE_LIB_tune-aarch64}"
>>>>> +BASE_LIB_tune-armv8-a-crypto = "${BASE_LIB_tune-aarch64}"
>>>>>


