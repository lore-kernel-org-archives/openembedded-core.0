Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 461EC74901
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 12:17:51 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id e20-v6so8607431itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3ejuTzH7TIaG+sjmIKbiTBP30jBo7SiDfipVLegJosQ=;
	b=H+vf3CXfn5L12M1VxKC3Q/IZT3U4td8ESByQCgjZrwQvg2sIzGLFBVnx4C/kgEJ/ER
	lW+HO8J8ouYH77hrAlwR8d7VchFYFrZr2pEBdT93Ei8vzbuSX+QojBhiWrMuWaH1zMVW
	aklJxniVSg6aiOIdtWOYo5lSooDafrUtC95puNSKnpD7R8cdxcKEKPF7TlAQTdJVnsVP
	ifCllRCLpREMDYefNqgxRXnj98JqHIjG3bUr8U73Pum93ih3qyetvOmmMXDble7SW63A
	p+zOlVBCGJYzayV5X4uQ5dmi5gYpALqpt0xvHCwY+d7j3FqeNicz/hcj9683tl70qDPW
	LFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3ejuTzH7TIaG+sjmIKbiTBP30jBo7SiDfipVLegJosQ=;
	b=jytKo/21KJlfM/BJolPuURFlpBTDA7ziHU1Q737P0SWyWPu+SzDB8l6HWz1mBy+lcX
	qC6Kc2ZBHZpa6zafPGnGEYr7qk6NFY2GAI2Uqf4vRQrYf/0mFm8DvRBz5cjgXuxryu41
	873/lbx7FabF3hXXazk/YjL+baHZB1kNEPoQmAiLZyNHDfjQLtFGpAadPH4HNBHs5sZY
	a8ZdAuJp6l2kVjOnKEOOBJg6Fdhv7mOkc20rSqpSxAEziCv5cbJ0UUajmlDKnS5vl1BQ
	zYFTkFbNMBzIWcAaFDdN1y+aPr3t7DfPZcUTj/H3WrV2zSGJCJdcj21IWVegMtnHK1VZ
	uAug==
X-Gm-Message-State: ALKqPwd3/lwyyEr9VXl1xqnlHFxvgQaGE2nwoCR0n0RKJhw3Aidh29cW
	Smd8bSSA0I5sPND555r+Uo8/Vdhx0DyoBRODq2sClQ==
X-Google-Smtp-Source: AB8JxZrTV0ugIMD7twDHYN/c41JdU82KxBdmzsvJFqGDtqp+J16rHj+SOv3QOTWL9CptFpkJHiLcVQvKmB5ncC9mgnE=
X-Received: by 2002:a24:496:: with SMTP id
	144-v6mr2301813itb.131.1526559472979; 
	Thu, 17 May 2018 05:17:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 17 May 2018 05:17:32 -0700 (PDT)
In-Reply-To: <8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
	<CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
	<3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
	<8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 May 2018 13:17:32 +0100
Message-ID: <CAJTo0LYrs-=LVN2YSx1KqMqGRdkeF4pnYbGi4QmaDTyvX8TG0A@mail.gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: auh@auh.yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Thu, 17 May 2018 12:17:52 -0000
Content-Type: text/plain; charset="UTF-8"

u-boot is excluded on the machine type that the AUH runs as, so
there's no way it can build the recipe.

Ross

On 17 May 2018 at 11:33, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 05/17/2018 11:53 AM, Alexander Kanavin wrote:
>> On 05/17/2018 12:56 PM, Burton, Ross wrote:
>>> Looks like AUH runs as a x86 machine, which is why it doesn't catch
>>> u-boot.
>>
>> Also we have already discussed this 2 month ago. Marek, as the u-boot
>> maintainer, can you look into enabling u-boot on qemu please?
>
> Wouldn't it make more sense to fix the AUH so it handles U-Boot and
> similar packages correctly even without the qemu dependency ?
>
> --
> Best regards,
> Marek Vasut

