Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3572D78A6B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 22:10:18 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z12so18924264wrg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 14:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=O20m9O8irBE+VLEBkHSqOvde5LmuuxDLfoSYNxcXaYE=;
	b=ZIDwP5nuAax3h2IjFBiXaLvixtDWpS5lTfShNAuwu3lEdVOAYWLV+W5x+TU7Edpfe/
	4rnelqKCrN9/OIk+zoN/4YhTiDOnrm0yxQiqSSGHZqbDBquXmx8JIBwFXOKVaJD2nnhw
	Re+MyBaydvnsZ7sD0XxDJMEyqTmQnRpJJadwFJJwRO3aVsIvpi9gfOPo5sl6AyADV6j4
	KeIF5YWXuW2+JihBASh2ziSOmUP7O6I21pRxJbvtdkm7Qf2huo20UPiFiK/pHC5K2Q5v
	JaVKzaP7k68sgR/X0mAb1vxK/2UTctOtl/tdaGyIBFUvBp3/G0BYsCyKQUko4W8u+oJd
	Q0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O20m9O8irBE+VLEBkHSqOvde5LmuuxDLfoSYNxcXaYE=;
	b=p6ovvgsQ+NbyTFuG3BuHr+Jq70l99Ns0sr6QU4k3JwfkB1m/pEItSKew7cBs/2V1Mh
	PzktSM2d5FXb1FvsWRggWWuGRPK7pdpV8TX+z1CP0+yNwoT84+gItU20GiI6wAmEAe0b
	qrv1p3xKdfEu7p7tfowbaT2sKp7K8us0EQ1skJ2CrrJzNEvIovYfU2cWKPpPblJ48OGu
	DmUWSSMNXaLhhm6Ax4WiLT7uR4vtDc6vCfyhuEfeyVJjiUU0MR8lBQFRdt5pM12/sl00
	HsaF1JqngVN7QlMhJwOo6d2Lb19T9DmboOkgEKozf3YLjSgrW3BJFondS+uPBS6MrSVX
	bAtA==
X-Gm-Message-State: APf1xPCYD1OJVRKPFpDiP5QHZtpURlx0UVIip+u1waOi5K8X4b8pHzYj
	KP8j2FyJ0T4UkOJU+OqUjkxQnneU
X-Google-Smtp-Source: AG47ELtY1lKmVYEWNwebFv0915YetzkNPRop42OZ3CIaD3hjlDnC8QHYsbmMkQ0g3aJVN+xnmYBy3g==
X-Received: by 10.223.177.132 with SMTP id q4mr13437901wra.27.1520287819578;
	Mon, 05 Mar 2018 14:10:19 -0800 (PST)
Received: from [192.168.19.11] ([109.181.41.150])
	by smtp.googlemail.com with ESMTPSA id
	p78sm12541167wmg.47.2018.03.05.14.10.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 14:10:18 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<1520101306.3436.60.camel@linuxfoundation.org>
From: Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <82357905-d251-7d83-dd8b-5787e65d8a0a@gmail.com>
Date: Mon, 5 Mar 2018 22:10:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520101306.3436.60.camel@linuxfoundation.org>
Subject: Re: Need arm64/qemu help
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
X-List-Received-Date: Mon, 05 Mar 2018 22:10:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 03/03/18 18:21, Richard Purdie wrote:
> On Sat, 2018-03-03 at 09:00 +0000, Richard Purdie wrote:
>> Hi,
>>
>> I need some help with a problem we keep seeing:
>>
>> https://autobuilder.yocto.io/builders/nightly-arm64/builds/798
>>
>> Basically, now and again, for reasons we don't understand, all the
>> sanity tests fail for qemuarm64.
> 
> Another failure:
> 
> https://autobuilder.yocto.io/builders/nightly-arm64/builds/801/steps/Running%20Sanity%20Tests/logs/stdio
> 
> In this case one testimage failed, the others passed...

Interesting, re your comments on host load affecting all runs.

I was going to ask about repeatability over qemu/kernel builds, but here 
we have 3 instances of the same qemu and kernel binaries only one of 
which fails.

I've done some limited testing, but haven't been able to reproduce this 
on my single build machine. Every aarch64 boot works ok for me, and the 
ping test completes. I only tried core-image-minimal. I tried 
cleansstate'ing the kernel and/or qemu-native and remaking, but no 
change. Poky commit I tried was 
master:bd5424f5b05a0a65471a77632efe7b9907370217

Regards,
Ian

> 
> Cheers,
> 
> Richard
> 

