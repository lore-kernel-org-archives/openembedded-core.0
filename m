Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0261A6086F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 11:13:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t3so7552027wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 03:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=zP2RHD4SSIQn6ryXtsA3vmaR+I+mtpHqFphNj9vno48=;
	b=GRqbu81mm1TKYwyzoiVL2/RHbYf1Ud1/QHvui9C7/xH9CJLyMTfCUUvOKixT8Z0T25
	HCPrjaw3Fn6wOrE0WojbmbC1zNor3FrOacxLU2Gge6+ybthmZbZggf9SKsn+wnoq3EvN
	B4xv/iJ7MGol/FhbywzGHj1JqAa6jfzqzokwblfeEaDMDWJrA7ZjILT55li9YvL0MGqY
	9JY+md+QZD/2vg/ty7zhq86RkJKTjH45hFJNticeQLLBlxbvUhMKxrLJIakrMx3Xvz7D
	yh/LoE950j9bL4D5Rxt66saKz72PvuANZGzq5j36m6EfEE7mjSE0bcTKh/I9w0fAyACY
	r6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zP2RHD4SSIQn6ryXtsA3vmaR+I+mtpHqFphNj9vno48=;
	b=OkmnQ2vbn0cQK7fD3pJalW5Fv6kfs6z5Um6guQIoAd9ts8Dmpv777ktQxFVkOx3moZ
	viidEFrdVTVIMN+HIxw8eZmNrt359iV5A0SxaZDhKVqv9sWls8aN5Fr/WJ4Lm3mhCxfP
	0uljJw5tW+2uHrd5+C4WYIkSrTxoRHourmWfezikeZJIuu9Fz9u3IIqpefVfsejRKkxE
	1g71JHs5zLn1JgFyV710zuUmTal11vbeiHiNGFCKlFpbj8firleqzmT20Z2OW18tWTK1
	5x2C5AmRcw0rE6HdKTxQMxF244Gd1xo701ueu0k6UCKSgebMCv6/VEX3IA+wyiDS0by7
	Hi/w==
X-Gm-Message-State: AElRT7Ea5gttlQ+tXUn7a8VHh6Xch3jh7H7pa8iruDs3hX5N3OcRqQgG
	okMAfohH5F/E3rJFaX25mjCU7tht
X-Google-Smtp-Source: AG47ELu1+vAeKn3V8/kZsRXw3y026d5qCf0YT303KxTQI9dCGka1Jw2lYBPiX9TlPe2eC6orPXEuOw==
X-Received: by 10.28.139.19 with SMTP id n19mr3962144wmd.40.1520075601399;
	Sat, 03 Mar 2018 03:13:21 -0800 (PST)
Received: from [192.168.19.11] ([2.28.103.57])
	by smtp.googlemail.com with ESMTPSA id
	m15sm7790675wrb.58.2018.03.03.03.13.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 03:13:20 -0800 (PST)
From: Ian Arkver <ian.arkver.dev@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
Message-ID: <412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
Date: Sat, 3 Mar 2018 11:13:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <91616f15-f805-22db-6073-8698f49bab86@gmail.com>
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
X-List-Received-Date: Sat, 03 Mar 2018 11:13:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 03/03/18 10:51, Ian Arkver wrote:
> On 03/03/18 09:00, Richard Purdie wrote:
>> Hi,
>>
>> I need some help with a problem we keep seeing:
>>
>> https://autobuilder.yocto.io/builders/nightly-arm64/builds/798
>>
>> Basically, now and again, for reasons we don't understand, all the
>> sanity tests fail for qemuarm64.
>>
>> I've poked at this a bit and if I go in onto the failed machine and run
>> this again, they work, using the same image, kernel and qemu binaries.
>> We've seen this on two different autobuilder infrastructure on varying
>> host OSs. They always seem to fail all three at once.
>>
>> Whilst this was a mut build, I saw this repeat three builds in a row on
>> the new autobuilder we're setting up with master.
>>
>> The kernels always seem to hang somewhere around the:
>>
>> | [    0.766079] raid6: int64x1  xor()   302 MB/s
>> | [    0.844597] raid6: int64x2  gen()   675 MB/s
> 
> I believe this is related to btrfs and comes from having btrfs compiled 
> in to the kernel. You could maybe side-step the problem (and hence leave 
> it lurking) by changing btrfs to a module.

Actually, this comes from a library (lib/raid6), and in 4.14.y's arm64 
defconfig BTRFS is already a module, so please disregard my hack suggestion.

> Regards,
> Ian
> 
>> raid timing measurements.
>>
>> In the past we've dived in and handled these kinds of things but I've
>> run out of people to lean on and I need help from the wider community.
>>
>> Can anyone help look into and fix this?
>>
>> This is serious as if nobody cares, I'll have to simply stop boot
>> testing qemuarm64.
>>
>> Not sure if there is an open bug yet either :/.
>>
>> Cheers,
>>
>> Richard
>>

