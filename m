Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB777D3DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 02:12:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v12so422377pgq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 19:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kSTxLyCPTy7O/SX7NYOrA50jQqryndmrzp7tDU9iQRA=;
	b=nglROtbncKiwfJF8OUW6L7fuQkIpVRGdDK6cUoxIMalXJYl7b68qjTcuDDKl6F+GVT
	VdsMOpBCAKmFcwQeVNVB3oZCXmI3y2jupjm8EmjcvOkKuxNCV5BGcqREWJAwujpwWP9x
	s+Si4dEaOflPHt2QjdmNalATcNZXTR2SWJo14H/+o8PfzH63bwqMV3WaGJNMntELMXWe
	Qu+xv+9gRBufKlnnTODHRd9FV9LJFoc1BpznJ0qtIUmbfOtb0IUEezNP9YDzjE3hnwmZ
	hVxTT8npEElT9nABODjq0EzCFPsLSFrSC7ViGtY3FtA/xx+AcqGajckr3SPbCKAfOrn+
	SCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=kSTxLyCPTy7O/SX7NYOrA50jQqryndmrzp7tDU9iQRA=;
	b=ZGHr0FzCHs/ucT8WKCXfMh9qqN1ljreWopFrmrNRYIU4IGjTAdGZ/HmhSivUxetnSD
	o1O0dS/prPVlgmBOuQwzmDfbJJWhqpaqhH2QOYVPtmPkKbcT21+QQ2OX8b/lmt/1uBsM
	QrMst4ZqiaCy8pj3Zp+Q9eM9eRyBtG/bIgode1zm+/2wiWVPN+8ZE0mRLnkx4+nDNZsW
	wvh1XXze00Uua7DdS89abHVC28weUrONAue4HrWH4OIUJ5czy5OgOzwagKKVn5nMhZxy
	etrxh49QCKv1Q2dv4o2r2oFxKAleydP1SM7YAnXYgyriUX2ub9DoVyOnUmWj9UYcyz5I
	ORWw==
X-Gm-Message-State: APjAAAW5+7a+jXx/o/2GyxJOiRxwPgknJhlCqsRtJclHnv6fUsFG9Kkp
	1duoZbZqg7+XFkGcCtg+M8Lg3GYtK6I=
X-Google-Smtp-Source: APXvYqwZg9UIrvC+eFYyBMAi40wwymLum0mX18a7L+td6KAZBAmviK3SoVWVphyV9+l2Td5KRXKmcg==
X-Received: by 2002:a63:e818:: with SMTP id s24mr3135384pgh.190.1554343948738; 
	Wed, 03 Apr 2019 19:12:28 -0700 (PDT)
Received: from [10.240.241.171] ([116.212.180.67])
	by smtp.gmail.com with ESMTPSA id
	q10sm21198579pgh.93.2019.04.03.19.12.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 19:12:28 -0700 (PDT)
To: Philip Balister <philip@balister.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
	<BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<6fe6cbadaf29e01975ec71a1b005d2fdb7885484.camel@linuxfoundation.org>
	<BYAPR02MB6005A0C02E838863D370C7B4B97E0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<853fdac8bdfc6fc7222fce906172b08852a4eed3.camel@linuxfoundation.org>
	<2fa17d30-9a97-635f-541b-89313ee63793@balister.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <285f0b42-00a6-c891-86f6-a83fabe326f1@gmail.com>
Date: Wed, 3 Apr 2019 19:12:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2fa17d30-9a97-635f-541b-89313ee63793@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
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
X-List-Received-Date: Thu, 04 Apr 2019 02:12:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/3/19 10:35 AM, Philip Balister wrote:
> I appreciate the nagging about testing, but I just did an update and
> realized these patches never made it into master so I could request they
> move into thud.
Thud needs testing too, its not just a master thing.

It needs to be in warrior first ; )

Either send me the master/warrior commit ids or send a patch with the
proper subject so its clear to me. 
But this looks like a new feature or am I misunderstanding?

- armin
>
> Philip
>
> On 02/21/2019 03:37 AM, Richard Purdie wrote:
>> On Thu, 2019-02-21 at 03:53 +0000, Manjukumar Harthikote Matha wrote:
>>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>>>> On Tue, 2019-02-19 at 19:34 +0000, Manjukumar Harthikote Matha
>>>>
>>>>>> PREFERRED_PROVIDER_virtual/dtb = "devicetree"
>>>>>>
>>>>> Yes, I should have added this in the commit message. I will
>>>>> update it
>>>>> and re-send V2
>>>> What may also help a lot here would be some tests. This is
>>>> currently a blackhole in
>>>> the tests :(
>>>>
>>> Are there examples of having tests only for bbclass in OE-Core? 
>> There are. See meta/lib/oeqa/selftest/cases/wic.py
>>
>> I appreciate wic is a tool, not a class but the examples there should
>> help. You can trigger them with oe-selftest -r wic.
>>
>> Another example which is a bbclass is selftest/cases/archiver.py which
>> does use a class inherit.
>>
>>> We need a recipe or create-one to inherit this class and probably add
>>> that as a testcase. 
>>> I am not sure how to proceed, any example would help to implement the
>>> same
>> See above, they show how to add small config fragments. If you do need
>> a full recipe, then the meta-selftest layer of OE-Core should be able
>> to help too.
>>
>> If you have any other questions or run into issues please do ask!
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>


