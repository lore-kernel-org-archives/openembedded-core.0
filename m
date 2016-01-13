Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 23C546FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 17:56:37 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id cy9so361957118pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 09:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=kDV/mubJnvNtzPkD//socPXOwQgzgRSaybCDCGTFxGY=;
	b=yU9H1ZeBayIOPcIL3DDr6f2lUTMF2a7XfK9QRUXhKc7NwepaRi/31a7GJf6kaJoqfx
	E6SQsIYaZwyudbbNOAdFStTfbZY2PrieIsRt1cvpwSST2+KrS+RfPVLXWIghkIlnUdSC
	7gNy2gjbreYlIJspl/gLe6wB8jbwl7y9cCJMOLOz6T5l8HA8DjgIrpl0tgTO2V83ZB6t
	Acs+GhYjSdcfZLRlfp/qtIgBK6XneDP2neqXytXr06ydgpkrwMKJGRGV6BIfQnghfpJV
	/U+L3cWhvQNaJTweUHXrDfC87Ds/cHmsD0Cjws8gBcd+PmUoIyX4CFidGPlfYcFbkj8Y
	oGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=kDV/mubJnvNtzPkD//socPXOwQgzgRSaybCDCGTFxGY=;
	b=mROrHTVyRuvN2iOl+oAhG3YQk+AV1PazWGUhAHLUUAhdme4R45La9dtx1KX0xQiNmx
	EMzY9D0WpjRVgLIVp3iF/qVeod76NebYhu9EcXqvfRMzcOL0BbJicW5IkrSzvzP+4ki7
	V0+oJQNDyl2lL0Tie+PVb4JFe3JU5ig2ATXvC9gM9hYoegEmWDBah4vGvleSb+GcjDRU
	04pKuUba28ldzQrP7K4DIhd2824G1LUhBuxueMpC8JMy5po9DFlnG59jqILFDVxRjFwd
	AzJ2W34VjOlxFemyzezBe0UN8s/ZYLPvW3gqAONbHV6kNjnh7CtfQio6DVHG1fPGfa8E
	bR8g==
X-Gm-Message-State: ALoCoQlq/VnQIEpizXN8lrEA6Ux/UpYzCcwZ3WwEMyTPgo+7nAPhi0K/wOqbKtRn4Zv0C9MnPDMxPZmAAULjAmL/YkUSOY4YJw==
X-Received: by 10.66.144.37 with SMTP id sj5mr34795154pab.69.1452707798769;
	Wed, 13 Jan 2016 09:56:38 -0800 (PST)
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com.
	[209.85.192.170]) by smtp.gmail.com with ESMTPSA id
	e14sm4051831pap.24.2016.01.13.09.56.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 09:56:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f170.google.com with SMTP id q63so87320601pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 09:56:36 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.87.81 with SMTP id l78mr44824449pfb.101.1452707796230;
	Wed, 13 Jan 2016 09:56:36 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 09:56:36 -0800 (PST)
In-Reply-To: <201601131842.35661.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131809.49390.marex@denx.de>
	<CAP9ODKr-L6dqnsuSQW3M=W5o3vUMfNTzAnX96udYaHa4G2Ku+A@mail.gmail.com>
	<201601131842.35661.marex@denx.de>
Date: Wed, 13 Jan 2016 15:56:36 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrfxXs2pZDGU+5xq41-NKSss1CiDWa1czTTmC8juNp+bQ@mail.gmail.com>
Message-ID: <CAP9ODKrfxXs2pZDGU+5xq41-NKSss1CiDWa1czTTmC8juNp+bQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Wed, 13 Jan 2016 17:56:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 3:42 PM, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, January 13, 2016 at 06:16:01 PM, Otavio Salvador wrote:
>> On Wed, Jan 13, 2016 at 3:09 PM, Marek Vasut <marex@denx.de> wrote:
>> > On Wednesday, January 13, 2016 at 05:40:20 PM, Otavio Salvador wrote:
>> >> On Wed, Jan 13, 2016 at 2:30 PM, Marek Vasut <marex@denx.de> wrote:
>> >> > On Wednesday, January 13, 2016 at 04:55:56 PM, Otavio Salvador wrote:
>> >> >> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
>> >> >> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
>> >> >> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
>> >> >> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador
> wrote:
>> >> >> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de>
> wrote:
>> >> >> >> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
>> >> >> >> >> >
>> >> >> >> >> > Repair configuration of U-Boot during build. It is no longer
>> >> >> >> >> > possible to run "make foomachine" in U-Boot. Instead, it is
>> >> >> >> >> > necessary to do "make foomachine_defconfig ; make". Fix this
>> >> >> >> >> > in u-boot.inc and u-boot-fw-utils*.bb .
>> >> >> >> >>
>> >> >> >> >> Please drop this config suffix, from u-boot.inc. The config
>> >> >> >> >> value should be used as is and the respective BSP ought to be
>> >> >> >> >> fixed to change _config to _defconfig.
>> >> >> >> >
>> >> >> >> > If I don't have the _defconfig there AND I define UBOOT_MACHINE
>> >> >> >> > in my machine file, it will call "make machine", which no
>> >> >> >> > longer works.
>> >> >> >>
>> >> >> >> I know and the right fix is to use the right value to
>> >> >> >> UBOOT_MACHINE as we do for KERNEL_DEVICETREE.
>> >> >> >
>> >> >> > So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ?
>> >> >> > This does not sound right at all.
>> >> >> >
>> >> >> > And what is the right value of UBOOT_CONFIG then ?
>> >> >>
>> >> >> foo_defconfig.
>> >> >>
>> >> >> This is what we pass for make to configure the board and should be
>> >> >> the given value.
>> >> >
>> >> > OK, that makes sense. You didn't answer my question about
>> >> > UBOOT_MACHINE though. Any thoughts on that ?
>> >>
>> >> If using UBOOT_MACHINE = "foo_defconfig" will work just fine.
>> >
>> > This makes no sense at all, does it ? How can UBOOT_MACHINE contain
>> > _defconfig ? This sounds like a crude hack, not a systematic solution.
>>
>> I think it makes more sense than it adding _defconfig suffix behind
>> the scenes...
>
> The machine is just that, the name of the machine. For machine foo, the
> UBOOT_MACHINE should be foo , not foo_defconfig . The _defconfig should
> be added by the recipe, but certainly not by the user, since that would
> be a dirty hack and confusing as hell. The "foo_defconfig" string would
> only be sensible for UBOOT_CONFIG variable, but no way for UBOOT_MACHINE.

UBOOT_CONFIG is different on this context; it is more like PACKAGECONFIG.

You can see, for example:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/machine/imx6qsabresd.conf#n14

So I understand it is a little confusing but it is indeed how it has been done.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

