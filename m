Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id D096E605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:48:59 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id r78so168299938oie.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 23:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xT/eECrwYnXmjFoj/3xdkw2LRepMMaSAHUiTxhPDus0=;
	b=KZKWQPrVokIq9a/V/+5fYytO67momuaE3NGi3/nl+AFRhTtCqg7baVjCG4eNXfms3n
	17VXcpT50w17zAb6Z93AdE9QZlsgU1hkZkIJrZOanHPROzsWB2xuMYTf6+XnMG9MAxM2
	uF12HeBy1DHPhpMYaYxe4z4apo7RgeGVcHTyThgHuOW/Flq3aAC55aLL8Viv4+6k/R2O
	FM1K29EWkn8/Hv5v/h3yP5e4plcghcPJPT6QkUsPtelnBlL7DtesinW7FlaDoXNw+yLQ
	I10Kr+GH5/pMON3sjjl/lGkDyeD45Z5bTDZK41tcQbBj+i6LVMQS0M9q68aFOK6nthag
	/lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xT/eECrwYnXmjFoj/3xdkw2LRepMMaSAHUiTxhPDus0=;
	b=dUFygAawRZeMTxEg1VOjelpu0z6shiWGxesuSY053xFANIj15w+p1K4XK5CT+aIj8Z
	LfbA1fTr5PQ/ZUq3T3a4e7JYY77I4zEjcivUeoo5jWLC1ShyNUXEpdt6zOrCGcdfrv/G
	v9Qd7sEf5qHyaJF3FwbIAGsmqaFAowLoavcV8DrQrZ/GEHShBpluhQu+bx7d6/80+gCn
	HfBKMhJFCGVttnNO5KOf98IHfNa3dZLc8Nv8ktRh/GWH8y0HFNwKSxqQyQmCGiJz+nYW
	zHaXsacKvIqLkuV2CUbIRrFkSm5nIQ11f3JtR3nESxWGhqMK1mNph8riv1DIfLG8d0nf
	IaZg==
X-Gm-Message-State: AOPr4FUIspLRTBPXJmghSU1LqL6aIaQT3FDG5rNl+wCReuasla+Y+DJSgGRfgonFAIt+adisSr2fJhOkEWDdcfiD
X-Received: by 10.157.12.168 with SMTP id b37mr12737680otb.4.1461566939945;
	Sun, 24 Apr 2016 23:48:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.173.193 with HTTP; Sun, 24 Apr 2016 23:48:30 -0700 (PDT)
In-Reply-To: <8CA21060-E04D-4FFF-97A9-4AA7E5FB780B@gmail.com>
References: <b0e90c378280d55e73abbb3464b08c77bde64867.1461329608.git.jussi.kukkonen@intel.com>
	<cover.1461329608.git.jussi.kukkonen@intel.com>
	<d0ca3b62bef9534383af9cbaa6b6a4e1e8a15862.1461329608.git.jussi.kukkonen@intel.com>
	<8CA21060-E04D-4FFF-97A9-4AA7E5FB780B@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 25 Apr 2016 09:48:30 +0300
Message-ID: <CAHiDW_GpSd1YYxNQx=XiL8jFWBtL+TcTy9VkFahEkQmiiW87ow@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-sanitizers: Depend on target gcc
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
X-List-Received-Date: Mon, 25 Apr 2016 06:49:00 -0000
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
>> On Apr 22, 2016, at 6:26 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> Without this the target gcc might not be in the sysroot
>> leading to configure failure.
>
> you might want to correct the comment to say cross gcc. Thats whats added to DEPENDS here
> and not target gcc.

Thanks. I've force pushed the above change in the repo:

  git://git.yoctoproject.org/poky-contrib jku/more-build-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/more-build-fixes

Jussi

