Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7D40560637
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 19:56:31 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r19so8779455ljg.3
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 11:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1mz27nEOm0ekuPDqDy8yoLkximKGoUI0HDgJ7Yf5WGc=;
	b=fAhWp6OlASyScp+QD/Jrf6vnSI5pUj5xhQmgSLR43MtT/K/GX9m2YB+k/erUAFsNNA
	X1AhDsASPUbU07sTjVq446p0+Tk9UAHRzkZqwzOAJGwZvzxMmlisws7QoKapuD6hgxya
	copQOQoELE9vUVUkY0slCsPfCdoug73WlXXrvR8tp5+ortt/5nCBJaMItKabMeLL//AU
	jzzPJ3yogOmUfWkmbJiGksaxOqe2cEVAdrlyYVvJNc3O596dAEwZkjPQGXU2Aqg80AiN
	rn/x2HD7D9dWe07LtkSY/9q/hOw2ez3GcdCPh3N7SrYhXaQZc+4ETguinKKwkwn7GKWB
	PNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1mz27nEOm0ekuPDqDy8yoLkximKGoUI0HDgJ7Yf5WGc=;
	b=VDnlO7xST7EBjTBtZGfHUtyNEXQm4ECS63FzKPHRVYktNhqV+vYCZvG61msrzenWK6
	eb1vZ9i3mtkMEwBihrFEXEFOWyC8dbFWXS90OpWY2/CLeyx8OtGcmOO3j7w3Ttu4/XCv
	jNJoFu8oJ5UF8DcreW18OfvhGkHOJnU+1PxySGdijiXg6hEgIIbU+U75n3gyYu1dYPuS
	OgM+5ZTpEHsx6rFJ5Ox954I1NU78HvZJWK9er7D4HbLBh/SfRn40UmOtLfMPU9mNQfPy
	k3n9k3d8e7kxrLjVZJOxgEw2L3gp/taNlQfzLOW3ZEWpUmnGU17XL7lLY6LG4G5bLd0v
	tmug==
X-Gm-Message-State: APjAAAUsk49LF0mE1bQPycFXHiy/TYZMg74XZHExm6Q75sG7aj1x1COn
	nZVmtuIKncltmV4riQlXrA936HWUU4k2R9ciEiA=
X-Google-Smtp-Source: APXvYqwNdmB2JMR7oYtE5qrq7uhdQKb0dPDWyNHy0GzL5uQ/6avzxzVj+IAVMZf+U7sivvnMqINHgy3/qbRLQ3EOYX4=
X-Received: by 2002:a2e:8197:: with SMTP id e23mr1806422ljg.250.1581364591839; 
	Mon, 10 Feb 2020 11:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20200204184113.16070-1-alistair.francis@wdc.com>
	<bd2c5b87416b5d77d7b1405666a6a333be2fb135.camel@linuxfoundation.org>
	<CANNYZj-PpRueMjDaoJy86xpe_iEA6rePRTfiVaD-ECcpQ6MbQg@mail.gmail.com>
In-Reply-To: <CANNYZj-PpRueMjDaoJy86xpe_iEA6rePRTfiVaD-ECcpQ6MbQg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Feb 2020 11:49:13 -0800
Message-ID: <CAKmqyKMGAgiQVZTX6rtKtO6ZU3XV_4Mdd_nPh8cwEhwZwokTjg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 4.2.0
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
X-List-Received-Date: Mon, 10 Feb 2020 19:56:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 8, 2020 at 10:10 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I think this backport should address the problem:
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a88c40f02ace88f09b2a85a64831b277b2ebc88c

Thanks for that!

I have sent a v2 with this patch included.

Alistair

>
> Alex
>
> On Sat, 8 Feb 2020 at 08:45, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2020-02-04 at 10:41 -0800, Alistair Francis wrote:
>> > While we are upgrading let's refresh patches and remove the outdated
>> > patches.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> I think this stopped qemu running on the autobuilder, we saw many
>> versions of:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1538
>>
>> Failed to run qemu: qemu: can't parse 'vga' parameter: Invalid argument
>>
>> Cheers,
>>
>> Richard
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

