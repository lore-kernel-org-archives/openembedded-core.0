Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 70BDD784FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 23:42:14 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id 108so25564908wra.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T1sL4YZHvsdlcQrjbLdA/h1SCLBxG5xlpiEJ/7gMvDA=;
	b=WJ0fmRSHTyf/KdBimAg3FXHYYUCB6H5hOKw7eDLuDi1AaIAb1KoH/eTlJGuD/L4Qxe
	y8kf2ce2LrhmOFsGDb1p8hZWbZrpC/wNsaC4FErJShZYxBFfMxlIug3R9hbNlRGLeuxc
	stFAkImRHlOIhvlmJZQECrhDHcEgSwMIEnGZrCtfeMftUIG+f8bL22Ue5UMO/cO/2Za2
	uS+dAkKx9WXPxeyRu2/mKGYNUZ1gWw4VkgpwgGrdsTWdWxHak26tEceKey9NQvf1Dw4T
	nOmFf4l9ABAFZ8nkYHZeZpiwWv4N6Y3+M/GV/etqvZqJgPB1HF9wWfA/wFirbyGKJtt7
	Ee6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T1sL4YZHvsdlcQrjbLdA/h1SCLBxG5xlpiEJ/7gMvDA=;
	b=SYMdU9MuqpEfT1Otp4b0qyoh3+w2fOXCzmy+hpwiRsOuTgbHPA1FCoDoUG7SKp76XZ
	qur4Q0CzFT5seH08XCmKdFQFYJrFipmuHAY661MXgVcfvsYRkbY3BWUCe+Z9XIWJyJp9
	8N1wlXB2hfp+k5dHFk/Wa4ZlW3DDAP9NsZVC2mcrJY2R1v07gWYQue8D2zS6jqQT40Nc
	s4hvUWEmm7s28+RnYN8Fd0AbjCkjbRUTMaEsGrPGY5UInAN3T1PMYhnUET+dkJwFwgsn
	GMyKmin6yKr+E3lzSmwL03MwfaI+8Uisku4x5X0n52bfgiVgFZaQ7XCje/EtJepvcRQ/
	SfMg==
X-Gm-Message-State: AHPjjUitInwKLK8B18cKXsaaJm8vsH064mMZ/8/nLaKJSt93dheKp+UA
	R7CQ/6H0CR9Pukq/Yo4ACxSlF4PgEfvJsRYo0TE=
X-Google-Smtp-Source: ADKCNb7i9Q5vXzoDHDEGyLom9I127y2KhcPUgdWNIZwUP01+NwK7aO2HxsXgyofm4p6sGk9UYlIOZaHDne73I0doUOQ=
X-Received: by 10.223.184.181 with SMTP id i50mr12795279wrf.136.1505259735186; 
	Tue, 12 Sep 2017 16:42:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Tue, 12 Sep 2017 16:41:44 -0700 (PDT)
In-Reply-To: <CAHUNapR12cWeetX_ZgCrN0-G_AQcPi6asDuCaXp==Mocdwn57g@mail.gmail.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
	<CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
	<CAHUNapR12cWeetX_ZgCrN0-G_AQcPi6asDuCaXp==Mocdwn57g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Sep 2017 16:41:44 -0700
Message-ID: <CAKmqyKOXUzsyhKmUDgGWz=Dt+_7mX49u6tZPXJ133xw=Q7z=_Q@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Tue, 12 Sep 2017 23:42:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 3:56 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Nathan, this is awesome!
>
> (haven't tested it yet, but it's great to see this effort!!)
>
> On Mon, Sep 11, 2017 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>>
>>> Please note whilst this series is sent for oe-core it may be better
>>> located in another layer? (e.g. meta-oe). However since the recipes and
>>> the tools they build are not specific to a single BSP it did not make
>>> sense to keep in a BSP specific layer.
>>
>>
>> Sounds like a dedicated FPGA layer would be ideal.
>
> We already have meta-xilinx (and friends) and meta-altera, looks like
> a meta-lattice is in order?

For open tools like these I think a meta-fpga layer makes sense.
Hopefully then others can build off it.

Thanks,
Alistair

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

