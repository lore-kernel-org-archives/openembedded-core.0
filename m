Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1118771B40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 16:22:01 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b79so2546029pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Crq8aTSKXhg6Zhq/6Wu9aNek/otWtXGFa/YokqJSy70=;
	b=I7beQ7wtMjj8MAwU/mCvMCPkcRK9x/GrP/8ZzJ2vpxJO+dr0Bdl4SeaMUDQ+3LLaE3
	XDY9zB+Wc8A3cZrJ6WpbpcaVP3Kv6PTSPNVlW9KgZXL8WjwHSKOh+536gX1HvEHLx3aL
	t93pSDLJ5cdbJ/B6AUCfuDuBidr33CB9DoiCvjQ3kydB8GeguesYx25/8flPU38I5sFr
	SUmN5xy8R5YQqSQO0PX0F3pb9r17ahq2EKo44/r1ezSfRQsy6SI/uq0G7dxyJW7Yccq4
	FOrjjBT3v3wSu0IyBwcLwglwJ01UcSza8cPiNMDSKgRU7b04WwaRxPSvMIs265hHlcv8
	RMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Crq8aTSKXhg6Zhq/6Wu9aNek/otWtXGFa/YokqJSy70=;
	b=Reo6QIbjIDhktvG27TcuRg0UgDr/1dHlzgr7amMriOxOEDjLA/dgmLR0hlG02SQt8+
	CHUppb1kWYRStGqxWMY4JH0dL0wOt17fQb82BC92XZvtYGqmfpHeR4XZuViGFNW5lOuW
	F0FQwueVjGG5UaAkZO22WokB/v2OLZ3A4fldxNh00To87QMFQ96/GatIHvmUFESeMmvh
	dJq7bypy1wlhc+gilVu0CnzcME/QFmSdVaAaiZONO9PoQjfCvp2pj0tbnR467Yw0lsM6
	jkUc6jizm3dxUQjxUrgz+RTRFYqtmmBzw53QFd74+Nvo24y0tS8BiuG7m7OWmdV8QTNi
	Gwkg==
X-Gm-Message-State: AMCzsaVM2SdXbdHEAyYtQ0BTy9hxcOXvjE1nce31OxkpkZtvfgs+VmPp
	G+mfwqzQKkjR8zgom3P0RL/ZQ6Z2NlDmmwbWAQA=
X-Google-Smtp-Source: ABhQp+T7qPwhbRQv3/b2riFm7ZwjIiO7BI0hahEQDn4C8odMjPwguQEcaMowUl50aJ7SD/kUwUy4+QwJyWUpxyxmi5E=
X-Received: by 10.99.183.67 with SMTP id w3mr7611642pgt.329.1509726123069;
	Fri, 03 Nov 2017 09:22:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 3 Nov 2017 09:21:32 -0700 (PDT)
In-Reply-To: <264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Nov 2017 09:21:32 -0700
Message-ID: <CAMKF1spbYceq27hXw9pLauYz+BYjyU-wkvDCDN5ZsNACN36dzg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Fri, 03 Nov 2017 16:22:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 3, 2017 at 3:14 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/18/2017 03:14 PM, Alexander Kanavin wrote:
>>
>> Previously oe-core had a development snapshot of rpm, it's better to
>> update
>> to something more stable.
>
>
> Unfortunately, this also breaks grub and grub-efi:
>
> x86_64-poky-linux-musl-objcopy:
> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_aranges):
> relocation 1 has invalid symbol index 2053731167
> x86_64-poky-linux-musl-objcopy:
> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module:
> invalid relocation type 69
> x86_64-poky-linux-musl-objcopy: BFD (GNU Binutils) 2.29.0.20170912 assertion
> fail ../../bfd/elf64-x86-64.c:351
> x86_64-poky-linux-musl-objcopy:
> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_info):
> relocation 0 has invalid symbol index 1634754402
>
>
> Khem, any idea where I could start looking to see what's wrong?
>

try to capture all the libs and .o in one dir and see if you can
isolate the testcase.
it seems a linker crash to me.

>
> Thanks,
> Alex

