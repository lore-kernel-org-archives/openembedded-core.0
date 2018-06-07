Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 78CA078658
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:58:49 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id g126-v6so6588336qke.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LsMBi+X0RKcp9x4nGMRTRHjG6grdFCH55uZlIJ8qLVA=;
	b=ZPRYsLq+RagA2fR3zyykWfwDA79QVqRYQwa58e8vy1jFetmDD26x2gmCkXtwPhCEeD
	U6ceYjoEljOoGudI49AkMKNNTjeB8QJsSo9+MjdGeYeU4vxzAobgYzJBIYbcxEXQfbD2
	pEnMdXdI8fTRIgXkEYfJgJuKlxGM6sYJfp2eWNtRzLg7OeNWN5VKN5oxwcR/b5rQFS21
	UiD2KRx8hZ1jErMcgZd+MbIXg59Ecp4wYTAKfi3lHc8tqERjnRqfWIoKOYrYcsebgBF7
	vM5St/Rfrwx+/L0dwmvZbOsmUazg4ZhAyW4CbcIuCTRqAOiNRrarK3kXB8FHOtjMQVK7
	rcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LsMBi+X0RKcp9x4nGMRTRHjG6grdFCH55uZlIJ8qLVA=;
	b=q3O5m4awJqJ3UjUqKigtUxRYx4bmNQNme0Yo+wDW3NoBxjUWJORD7JeKg1aB6u5c64
	DJ7NPCCvvuYu1+CQWh2N1dTlsIGOIvd+UI3L8f7Hh0ABwE0eebb2K/vJwEfYwUHk+mEc
	XRUjNiE0MMK/DH0IScEYlmYhrNPe4GF2Nt+swtRyLtr41DF8Rz6EBgN8OMZoxAmxTeFh
	WSW9iVY2XOVAF9tg14kEFpxxkRWaa5YjXR1OBCm2scTDapsIoyl19nI3rLygX+iTTiCH
	GMJzFZQ4YPbZgWl7gI43s6Df8JNHqM2alhM3z1rFd2eQcecugMK2oxFD90EomWfh/zM3
	dzWQ==
X-Gm-Message-State: APt69E2WvP4wLHmNykyuFbc3w0Yc6BrMoLV/B1UUXF1qtBF92ju1pgU5
	Pj178QroiKUKcLCimWhGx31mVp/8VVfZ+szxXmM=
X-Google-Smtp-Source: ADUXVKJAwj9AY1nlnIzB7QXeBYM42mQK4Ixyjz5JettDC7Eoe2Vqzdxfy9YHqM7bITgC5t15mHFs0jBbZoB7hlfM5/Y=
X-Received: by 2002:a37:cbd3:: with SMTP id
	u80-v6mr1543376qkl.290.1528379930204; 
	Thu, 07 Jun 2018 06:58:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 06:58:19 -0700 (PDT)
In-Reply-To: <8224f706c78b5e41ce6a3673d221a983ccbffe77.camel@linuxfoundation.org>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<CADkTA4OwmjAJwxauPDWpxsoxENxSHpiNWkSm-Y8Gi9_CNdrMqg@mail.gmail.com>
	<8224f706c78b5e41ce6a3673d221a983ccbffe77.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jun 2018 06:58:19 -0700
Message-ID: <CAMKF1spb1hneH+nyMAQWBOVo87A0CTnop5pWGTz-rRUgR2_AbQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 00/12] Add GCC 8 recipes
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
X-List-Received-Date: Thu, 07 Jun 2018 13:58:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 7, 2018 at 3:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-06-06 at 20:45 -0400, Bruce Ashfield wrote:
>>
>>
>> On Wed, Jun 6, 2018 at 5:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > This changeset is including the review feedback from last patchset
>> >
>> > - Fixes ppc such that we dont have to change machine options so it
>> > remains backward compatible and folks can still use gcc7
>> > - Tweaks arm tunes to set -mtune instead of -mcpu, this avoids
>> > conflicts between -march/-mcpu
>> > - Removes workarounds to avoid these conflicts in valgrind
>> > - Add mips 74kc tune files
>> > - Linux yocto changes are also part of Bruce's kernel updates but
>> > this makes it complete until those changes are pulled in
>>
>> Correct. I have all of the gcc8 patches in linux-yocto 4.12/4.14/4.15
>> and linux-yocto-dev.
>>
>> They should have been covered by my last set of SRCREV updates, and I
>> noticed that
>> some are in, and some not.
>>
>> I'll resubmit my SRCREV queue tomorrow, and that will cover the gcc8
>> angle.
>
> Thanks. Khem's series failed since it doesn't cover 4.14, Bruce's
> patchset helped a lot.

yes I only fixed 4.15 since that was default kernel

>
> It looks like we have kernel failures with:
>
> MACHINE="mpc8315e-rdb" DISTRO="poky-lsb" in linux-yocto 4.14
> https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/1051/steps/BuildImages_1/logs/stdio
>
> MACHINE="mpc8315e-rdb" DISTRO="poky" in linux-yocto 4.15
> https://autobuilder.yocto.io/builders/nightly-ppc/builds/1066/steps/BuildImages_1/logs/stdio
>
> MACHINE="edgerouter" DISTRO="poky-lsb" in linux-yocto 4.14:
> https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/1040/steps/BuildImages_1/logs/stdio
>
> MACHINE="edgerouter" DISTRO="poky" in linux-yocto 4.15:
> https://autobuilder.yocto.io/builders/nightly-mips/builds/1044/steps/BuildImages_1/logs/stdio
>
> I realised the above may be due to missing BSP SRCREV updates (cc Kevin)?
>
> With gcc 8, it seems we have a problem with meta-mingw:
>
> https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/1062/steps/BuildImages_3/logs/stdio
>

yes I have patch for this sent to yp mailing list just now.

> The build isn't finished but I'm hoping these are the main remaining
> issues.
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>

