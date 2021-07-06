Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web11.6352.1625578964798821476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 06:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=NF4SIZxd;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=UbWd2MXd63z5zUYDDtqt5skBhoG8S07uAxl5flliLkA=;
	b=NF4SIZxdkYY6VrmzrZxGZairAB7T7IdXN6WuhoEHyEbPMsTghqm1wqfXJFJRuTSSYrIAho42vu086
	 0x9JWy5lt9fgTVNyQ/Frkh6BUqV3XrM7RsrY5myfOAN9x4qCtuDGAMSOb0j5jykeWnxGZoo/qQdGOu
	 lBTbTTA/1+RQiE2gVHW8hh0ztPzkk+NFIKTPQtooMiYLwis4YkyZ5Lmm0ZHVXUFrmXTKTt9ilYfWHX
	 mfLZbteuO0WLDQU4TsFwPqkUqOBUdOPXNdlE7vI844gwdNFP5fDnKrvu9NbV0Iye4xibZAXiQW5uLM
	 cNU9G9jueZ2Sh76uW43gdXmCSvNrR3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=UbWd2MXd63z5zUYDDtqt5skBhoG8S07uAxl5flliLkA=;
	b=xjxOxFYE1ApS/VguSyad7umOqFI+j2/PPfK5LmVHS7wfMsu3XBHi19Nkc4FYXPRERwFlCq1twChjt
	 28+Hdifj9qiJs/Xe7sTNMXeu6SZYgwggwu7uxzqL5gsS8jBaTszyJ2ELmvcHwHg/aONmOPUtjCiUjS
	 mtPHEe5qZgG4JexhAleunP4kNx/NZzW+6PUVJqHUWlDh0QeGZVkbHEUy7zdSxQI7LVLFMHDBIgZdjo
	 NJnqZ5THhjQ4leTmb4jL/AGuCOhHj7nSYFbmpALA+6hLFn5WbDSUy1AFwUUAmbiaPpZ+xjiBnN+2Ul
	 g+hJzu+2P7ebtsgcJQl7tmF67G0G8NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=UbWd2MXd63z5zUYDDtqt5skBhoG8S07uAxl5flliLkA=;
	b=prcJaUgPdN0kTKIcb4N9lojqU0MT0ShAcs5VezJw1v7K6Le9a5bz0GZxifPV2X6vHL+kS7OQAynqz
	 FqvgPL0DQ==
X-HalOne-Cookie: 33f6e0724fe061775ffb974340af396d5995424e
X-HalOne-ID: 08ded33c-de60-11eb-a90d-d0431ea8bb10
Received: from [192.168.100.145] (ua-85-227-233-29.bbcust.telenor.se [85.227.233.29])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 08ded33c-de60-11eb-a90d-d0431ea8bb10;
	Tue, 06 Jul 2021 13:42:41 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Anuj Mittal <anuj.mittal@intel.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
 "liu.ming50@gmail.com" <liu.ming50@gmail.com>
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
 <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
From: "Peter Bergin" <peter@berginkonsult.se>
Message-ID: <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se>
Date: Tue, 6 Jul 2021 15:42:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 2021-07-06 04:44, Anuj Mittal wrote:
> Hi Peter,
>
> On Sun, 2021-07-04 at 10:21 +0100, Richard Purdie wrote:
>> On Sun, 2021-07-04 at 10:59 +0200, Peter Bergin wrote:
>>> On 2021-07-03 16:55, Mittal, Anuj wrote:
>>>> On Fri, 2021-07-02 at 13:59 +0200, Peter Bergin wrote:
>>>>> This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.
>>>>>
>>>>> As there is no build dependency between libubootenv and the
>>>>> configuration
>>>>> of u-boot there is no reason to check for UBOOT_CONFIG or
>>>>> UBOOT_MACHINE
>>>>> by adding the class uboot-config. Revert this in order to
>>>>> remove
>>>>> useless
>>>>> workaround in bsp layer (meta-freescale).
>>>> This was added to address failures in world builds:
>>>>
>>>> https://lists.openembedded.org/g/openembedded-core/message/141757
>>>>
>>>> If this is not required, then I think we'd need to address those
>>>> failures.
>>> Thanks for the pointer about the reason for this patch. I searched
>>> a bit
>>> but could not find it.
>>>
>>> Can you please help me define 'world builds'?
>> "bitbake world"
>>
>> i.e. build everything
>>
>>> By reading the mail thread my thoughts are that the obvious thing
>>> is
>>> that the build has a bad configuration as u-boot is skipped. This
>>> should
>>> be the thing to solve.
>> Not every MACHINE will support u-boot or have a configuration for it.
> Do you have a fix for this? This patch was applied and now the world
> builds for MACHINEs not supporting u-boot are failing. Do you mind if I
> send a revert of your patch?
>

I don't mind but I think it is the wrong thing to do, at least without 
analyzing the failing builds and get to the root of the problem.

My view on this, correct me if I'm wrong here. If you just want to build 
libubootenv you should be able to do it for any machine, with or without 
u-boot support as there is no build dependency between libubootenv and 
u-boot. If you have libubootenv in your image there will be a 
RRECOMMENDS to u-boot-env and in that case you must have 
NO_RECOMMENDATION=0 or a valid u-boot configuration. If the world build 
is failing I guess there is a configuration for a target without u-boot 
that includes libubootenv in an image. Or what is the exact failure? Can 
you send a reference with a log to the failing build?

/Peter



