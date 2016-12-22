Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75A53774DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 00:04:44 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id p9so17446998vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 16:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p53hyF0bSlcccwfTnMvJW6GWAWs/MT42HB41D4KDLVU=;
	b=nh50FiX944qwiAhWKUKEsGgZAXvXMldzlOV97DLWhqTuIp9B8OxqNVi5M0GUdnIxH3
	Mlh5SGj93LdY6+1rRUygp0ZxR4dNBQjNqOV5D38+7O9i0NAGrWLFdIyxapnqlRBiRnal
	2ZkPnJGA/nRT0a03MazstlORuJxEhlFgtnKtqkh9rA5Uc23cFfQ82n4w6CHw33SUPYRu
	TiU8s3+o8HjCSQ0IntGinGgl1bdi7SiwbVlLKHn8NvVp7XLyy9gA2P2NGOn/zNn3I7hb
	K2BGg/vKcAW20ogP+RCgpr5xWzdctomHn76OGaGGolqGolOtgTn8SiEkAA1g5/Lwi2wZ
	LsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p53hyF0bSlcccwfTnMvJW6GWAWs/MT42HB41D4KDLVU=;
	b=URG4EX5Rj4ysG/mkP8lssH8vW7ra2Slz4n+eQyM2od0FuG1RoRXL2X6BhYe9DBiTko
	umvFiwLAA/GkJp3Bze5djSn5HeZOFgarUhf4x3WEbIM30XzJAZRBrZuPgO8BRXfku+EL
	RDQNZaU72HodF3GHWVP+xTNw60oEyZiSZ/9cNO4Y9jJnyGUXbmx5FnDrGluvB9P3FQio
	3rNquwuMdwjwut1ete6QnFj5sBjnBnWEgC82eRcssKvS3o0cWn/A7k1Z3KbLo7SAMO0Z
	SecV5yYa7BO5jBauT7g6eprE8OgbKCRpjS+Umggn8elaw5kKw6TJ/CUV4n7+/D9VFv+X
	HHyg==
X-Gm-Message-State: AIkVDXIMjAF2V3yMH75ljWwqb+9k8H/3oMzFLMu1Gh5VJcq5qnA1adjAzGerOQM5SaYMDP9fsaRCm+zqvQ+dQQ==
X-Received: by 10.31.234.199 with SMTP id i190mr2890507vkh.31.1482365085247;
	Wed, 21 Dec 2016 16:04:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 21 Dec 2016 16:04:14 -0800 (PST)
In-Reply-To: <CAJTo0La+8XsrPGY+wT9G8pf6cHTcEoiLX0QPH=Z4uUMA5XBv_w@mail.gmail.com>
References: <CAJTo0LaRcmKATHBTRzosaFGAOLGc6R_1ioZfGbr4CU_7zShN4A@mail.gmail.com>
	<CAMKF1sqZjBsjwSkGQ0+pjpaYpxSxT9fcYC0J0KA_6_EPquh9dQ@mail.gmail.com>
	<CAJTo0La+8XsrPGY+wT9G8pf6cHTcEoiLX0QPH=Z4uUMA5XBv_w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Dec 2016 16:04:14 -0800
Message-ID: <CAMKF1soifoou_KzboyeW4X4t8ZUet0aDQnbse-B407-4oXD9eA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Broadcom firmware alternatives
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
X-List-Received-Date: Thu, 22 Dec 2016 00:04:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 21, 2016 at 3:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 December 2016 at 22:25, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> arent they for different chipsets ? if they are not supersets then
>> they should be able to
>> live together.
>
>
> Yes. they're different chipsets.
>
> From https://wireless.wiki.kernel.org/en/users/drivers/brcm80211:
>
>> In kernel priors to v3.13 the SDIO driver used generic firmware names.
>> Below are the instruction Use the nvram file installed in your system and
>> copy it to /lib/firmware/brcm/brcmfmac-sdio.txt The firmware can be found in
>> the linux-firmware repository.
>> For 4329: cp brcm/brcmfmac4329.bin /lib/firmware/brcm/brcmfmac-sdio.bin
>> For 4330: cp brcm/brcmfmac4330.bin /lib/firmware/brcm/brcmfmac-sdio.bin
>
>
> Which makes me think that the non-versioned name was used by older drivers
> for *all* chipsets, and you had to know what chipset you had to create the
> right filename.  Modern kernels (post 3.13, January 2014 onwards) use
> versioned firmware names so this is all redundant.
>

I think dropping it would be ok. Others might have concerns so lets
wait for more
responses.

