Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 78AB678C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 22:13:46 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id x4-v6so13221954vkx.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 15:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ewSX8ZBIQacNSfL8lWNoYKvjWn1tGBvQyffjE3zTA/0=;
	b=baj75DhUygBaOPtp4casJ4S81z8PcoKpDTx0VE16zVt4pLWcdEDCbqGCDDG0OH4xY4
	L0bbMkk9lnmGkc5ZMpzja/fpfn4ZiFRahRbjmBKifRRLuZw9ZpFngk3k0qy5Pl55WzGY
	rUahzdB8Tm5po9aJCtJ3kJnERSodIECZDngJaHVmDKHp7YgNvFw+vmzBZ3QPrm7oTaZn
	bKK8aTmFGe6mZbTw1Tb6Jdi9SBiwt4KqiBo4cd3WDUlEb1m9TzwDNXn+W1Qpjf7X8P7f
	IdSE9A/6Z0L+I7a+mYXXh1t3KsoJHqMmjSP7DC5nTd5zw06KgS5Xi27NVVxA/pr68V8m
	aToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ewSX8ZBIQacNSfL8lWNoYKvjWn1tGBvQyffjE3zTA/0=;
	b=lFRTbW1m12klKtyVBMIi73drTsHdN5CJWy71tuiQH4UrWS4tuB7ZYSl0kwJpxQPaPX
	ACZx7rk40CoAZ3KrToUZjLAwu7/evah4GpfM05tvY5EKg3AKfJj74D3hBq+f14aLF5al
	bJefqFyx4zKMtmjnKrKLxK/n3sUHTt7cju5G/KZrIUjRJP+W/kGzRXFQzKBcNeqVxKrQ
	NaEPAjqD/mG+mB9Xn0VJjBeT9PvCOO2/ZjgJ1Ck3hLeqUI15KIvoFIdUvuSnSKvwrtrV
	BKBYA/KsI3/pPPEYg7lYsA1GGoyV/pA5QtL8AVNiccCSb8B+/BJZosP8CVb2Wc4MD/0w
	3Cng==
X-Gm-Message-State: APt69E10241ZnVEstg7KbUOHY9UAc+zLxPC5yp8MR8MRo8d8XwACHrWO
	S4oTDRa14aYYjEVyfyHB483FYSsdlWniL8fJ8cE=
X-Google-Smtp-Source: ADUXVKIFiHa8VrYeU0ssV/CLkUTkkaEN24A5tqmSAjkXp8098AcnaqbaOEOtB+PWx1MypE2Ii/ThFaUyOyRT/wIN8co=
X-Received: by 2002:a1f:142:: with SMTP id 63-v6mr640783vkb.2.1528755227218;
	Mon, 11 Jun 2018 15:13:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 11 Jun 2018 15:13:46 -0700 (PDT)
In-Reply-To: <CAJTo0LYtc4Cdo1zUzc-UK-BOO-J0dA5iQLGEn6vn2zfGhnbRxg@mail.gmail.com>
References: <1528754600-26824-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LYtc4Cdo1zUzc-UK-BOO-J0dA5iQLGEn6vn2zfGhnbRxg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Jun 2018 15:13:46 -0700
Message-ID: <CAJ86T=U9SjuBJ07aNq_ATukCxCQoEuAo6g4mUso6f71W-sU8cA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: remove myself as maintainer.
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
X-List-Received-Date: Mon, 11 Jun 2018 22:13:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 11, 2018 at 3:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Do we have anyone willing to take over?

Does having a designated maintainer actually achieve anything in practice?

> Ross
>
> On 11 June 2018 at 23:03, Armin Kuster <akuster808@gmail.com> wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index 628edac..08d7e1b 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -85,7 +85,6 @@ RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
>>  RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>  RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>  RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>> -RECIPE_MAINTAINER_pn-busybox = "Armin Kuster <akuster808@gmail.com>"
>>  RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
>>  RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
>>  RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

