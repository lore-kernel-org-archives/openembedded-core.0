Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE83731AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:43:27 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id cy9so382487819pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=TZp9v6ZctcPtvbWohnYiACegoGTa7Waql9WN7pPJVXk=;
	b=mGM02eRg4MO8R8axLNp0bSmrY7CA/EYtSv/hMgExz4y/mA0S/SQ1Rmlyqigv4/EsrA
	xm4gsWtuxlQdV/FdkZ5cUPl0xIrahaxXoz5FP5KiU2dVYdZKWkIS4Q5r3hhimOz09FLc
	R4DQIRvgvliKiOI2eh26XFiE8+BRtgQGLEYwM3OH/w1J1VF+U01UsPI+NFeMBdW0v4qk
	hxEInGXLN1MhCdrb0P3MH5kZUYpD1tgDnRORhkx6FruBTEw1agbRTKqi63njTDOhdFoj
	3raNkEOvankWe/s7ZgeFnV50W4KStoZZ9dm9NdfrxQRd1gtqvQ6KFPdcXCd65+zlKXAT
	JRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=TZp9v6ZctcPtvbWohnYiACegoGTa7Waql9WN7pPJVXk=;
	b=cr85Cc6RohCGRKEPQNT0r2t4Cy+bfAkFTsCeRuozgHJFzWZAN5k4D1S5mPZqkzIZKj
	NO4HMP1tuo/XIfEFdSlQi+ch7vx3Vlyn6l9wuuiuYDTunkHRkgDI6ZyyHI+yy1FL97RW
	cdid/RGrvkMH9omjYNjcNP8RhYATxDCAJtph3fefiIs5uPlfmpZuHFLDrFfW8ZrZ/ZNC
	475GjQCYjrJcw5Di0Q58JP4MJv4g77NpI5UzSFQpWP3qqXvrAIlKDXY1uInEfGBgzEzN
	ufznEQqQKIjlwDOfbcDBZ3OAQ8oUzOC9afoGM9huyI5EVEosA0rMV/yrFznY3RPMIQSQ
	PjJA==
X-Gm-Message-State: ALoCoQk7n8WlmwobW1SuAUvkLGIaKbEb3t1s4w3rT3TFuRpBEVkqjp43MvyqZDnhYz4vRVamoUbsfLFPEKpWjH4wJVVhZ9n+fQ==
X-Received: by 10.66.236.69 with SMTP id us5mr9092539pac.93.1452804207711;
	Thu, 14 Jan 2016 12:43:27 -0800 (PST)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	e82sm11174672pfb.76.2016.01.14.12.43.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jan 2016 12:43:25 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f50.google.com with SMTP id cy9so382487334pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:43:25 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.255.97 with SMTP id ap1mr9135821pad.135.1452804204906;
	Thu, 14 Jan 2016 12:43:24 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 14 Jan 2016 12:43:24 -0800 (PST)
In-Reply-To: <20160113220943.GS3359@bill-the-cat>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131534.58933.marex@denx.de>
	<CAP9ODKohVDvN=bnowqXaHa_3yNvOf70EevWwV6T9rrNLbEHxOA@mail.gmail.com>
	<201601131653.11865.marex@denx.de>
	<CAP9ODKo4fvFS0wWtQJfO_kVOZMyNqfNohHw=wRC5z2M19Bu9kQ@mail.gmail.com>
	<20160113220943.GS3359@bill-the-cat>
Date: Thu, 14 Jan 2016 18:43:24 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrwXxORtat0pP_J3MgQ2CkfYrBMuGPCnAynEM__xZmjnw@mail.gmail.com>
Message-ID: <CAP9ODKrwXxORtat0pP_J3MgQ2CkfYrBMuGPCnAynEM__xZmjnw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 20:43:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 8:09 PM, Tom Rini <trini@konsulko.com> wrote:
> On Wed, Jan 13, 2016 at 01:55:56PM -0200, Otavio Salvador wrote:
>> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
>> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
>> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
>> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
>> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
>> >> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
>> >> >> >
>> >> >> > Repair configuration of U-Boot during build. It is no longer
>> >> >> > possible to run "make foomachine" in U-Boot. Instead, it is
>> >> >> > necessary to do "make foomachine_defconfig ; make". Fix this
>> >> >> > in u-boot.inc and u-boot-fw-utils*.bb .
>> >> >>
>> >> >> Please drop this config suffix, from u-boot.inc. The config value
>> >> >> should be used as is and the respective BSP ought to be fixed to
>> >> >> change _config to _defconfig.
>> >> >
>> >> > If I don't have the _defconfig there AND I define UBOOT_MACHINE in my
>> >> > machine file, it will call "make machine", which no longer works.
>> >>
>> >> I know and the right fix is to use the right value to UBOOT_MACHINE as
>> >> we do for KERNEL_DEVICETREE.
>> >
>> > So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ? This does
>> > not sound right at all.
>> >
>> > And what is the right value of UBOOT_CONFIG then ?
>>
>> foo_defconfig.
>>
>> This is what we pass for make to configure the board and should be the
>> given value.
>>
>> As we does for device tree, where we pass for KERNEL_DEVICETREE:
>>
>> foo-bar.dtb
>>
>> and this is also given for the make, for the kernel.
>
> This is not the same thing in my view.  In the kernel you're also
> getting that as the output file.
>
> What we should do, and I've wanted to do for ages but always never get
> around to it is:
>
> do_configure() {
>         oe_runmake ${UBOOT_MACHINE}_config
> }
>
> do_compile() {
>         oe_runmake
> }
>
> As _config has worked for forever.  And modify the above as-needed for
> the env recipes and so forth.

Any change like this need to be proposed as another patch; please
split this patch in upgrade and logic change. So we review and test
them separated.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

