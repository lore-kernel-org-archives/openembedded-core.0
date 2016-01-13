Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BB2727317E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 20:57:10 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id yy13so271496272pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 12:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=TYgcNB1KBxQItuvUEKDY0DH+bbfFqwFjXVFOQ1Oi/fA=;
	b=LIiqixUon4CdVeJFow5wDjczNV17oKjxttJNAvKXNNF8B4Vt7vSjRIBLjlCu8YfmVM
	tj+nOkoV6p0/6B1LgQEpC63p3dheBDfgkL+vR/CYItjttb2KMV1Uv+1/zbOJJ4bn6h4y
	noT1IBBI3LmY4jNSs14Ea/YTEc5s5xEDm2phPJVEC0SAoDXMPK0L+ZH2RMrK+d6HV5Yh
	DneWwbdZ9TRYhc0HUoP+fbxmifULwlrQaFDNcOoxGPeP8udv3fSN1xRzO+U6jul8lM3l
	0HAFsjHqzrRRTa2QXbTD7lpIlXbGMJM7WPHI+iupLyOKjVYBIbebaaqqApPp1vmvYDau
	ABjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=TYgcNB1KBxQItuvUEKDY0DH+bbfFqwFjXVFOQ1Oi/fA=;
	b=T+v/UiQteC5ZI2/Q9eu+NpTz2rpWUZtE0mkwVQ6G7WVq1os+1pq6MzxEkA5vtcTzWc
	e8WcZq/brob+YUCeHtKRskspLDo5NEpOGVCIlJGLOaarTBtq72GgO1Xa+1AGppV63A1+
	sgTT57fHkzNUFsimLqRXXjBSkbsj1NadQiG2wevCp3J/JGPiuZAncXfBcZqx5PJV1gT5
	Gaw78Zyx+6TxkLlsw2pWuVVSleNjYqVQDFMgD0CiJ3H5sTSt/XX2lWQfkF1AXMFkAGT0
	XNwvcq/NtVo7hRjYJVy69i55HUXowkeNcQd6Lhh/sZo3MwOcqqEneHu82NhARQXEhc8s
	LVjA==
X-Gm-Message-State: ALoCoQkTH7xoxXOvj3o+0Ki6uwkAyiSRa8p/NspxYf+C1vpMr1pJbsIOKJQguply8bXKA4Ouu/U4TvRWCOMBlVv9/uyhnhnN1w==
X-Received: by 10.66.161.133 with SMTP id xs5mr449352pab.70.1452718630961;
	Wed, 13 Jan 2016 12:57:10 -0800 (PST)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47]) by smtp.gmail.com with ESMTPSA id
	v71sm4532094pfi.91.2016.01.13.12.57.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 12:57:09 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f47.google.com with SMTP id ho8so103344505pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 12:57:09 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.255.97 with SMTP id ap1mr329427pad.135.1452718628988;
	Wed, 13 Jan 2016 12:57:08 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 12:57:08 -0800 (PST)
In-Reply-To: <201601132135.10606.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131842.35661.marex@denx.de>
	<CAP9ODKrfxXs2pZDGU+5xq41-NKSss1CiDWa1czTTmC8juNp+bQ@mail.gmail.com>
	<201601132135.10606.marex@denx.de>
Date: Wed, 13 Jan 2016 18:57:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo+P=3GaV1WLX110Buz1jmYsFU7z6+GgMLT0v2NNukbOA@mail.gmail.com>
Message-ID: <CAP9ODKo+P=3GaV1WLX110Buz1jmYsFU7z6+GgMLT0v2NNukbOA@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 20:57:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 6:35 PM, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, January 13, 2016 at 06:56:36 PM, Otavio Salvador wrote:
>> On Wed, Jan 13, 2016 at 3:42 PM, Marek Vasut <marex@denx.de> wrote:
>> > On Wednesday, January 13, 2016 at 06:16:01 PM, Otavio Salvador wrote:
>> >> On Wed, Jan 13, 2016 at 3:09 PM, Marek Vasut <marex@denx.de> wrote:
>> >> > On Wednesday, January 13, 2016 at 05:40:20 PM, Otavio Salvador wrote:
>> >> >> On Wed, Jan 13, 2016 at 2:30 PM, Marek Vasut <marex@denx.de> wrote:
>> >> >> > On Wednesday, January 13, 2016 at 04:55:56 PM, Otavio Salvador wrote:
>> >> >> >> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
>> >> >> >> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador
> wrote:
>> >> >> >> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de>
> wrote:
>> >> >> >> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio
>> >> >> >> >> > Salvador
>> >
>> > wrote:
>> >> >> >> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de>
>> >
>> > wrote:
>> >> >> >> >> >> > Upgrade U-Boot to latest version and drop upstreamed
>> >> >> >> >> >> > patches.
>> >> >> >> >> >> >
>> >> >> >> >> >> > Repair configuration of U-Boot during build. It is no
>> >> >> >> >> >> > longer possible to run "make foomachine" in U-Boot.
>> >> >> >> >> >> > Instead, it is necessary to do "make foomachine_defconfig
>> >> >> >> >> >> > ; make". Fix this in u-boot.inc and u-boot-fw-utils*.bb .
>> >> >> >> >> >>
>> >> >> >> >> >> Please drop this config suffix, from u-boot.inc. The config
>> >> >> >> >> >> value should be used as is and the respective BSP ought to
>> >> >> >> >> >> be fixed to change _config to _defconfig.
>> >> >> >> >> >
>> >> >> >> >> > If I don't have the _defconfig there AND I define
>> >> >> >> >> > UBOOT_MACHINE in my machine file, it will call "make
>> >> >> >> >> > machine", which no longer works.
>> >> >> >> >>
>> >> >> >> >> I know and the right fix is to use the right value to
>> >> >> >> >> UBOOT_MACHINE as we do for KERNEL_DEVICETREE.
>> >> >> >> >
>> >> >> >> > So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ?
>> >> >> >> > This does not sound right at all.
>> >> >> >> >
>> >> >> >> > And what is the right value of UBOOT_CONFIG then ?
>> >> >> >>
>> >> >> >> foo_defconfig.
>> >> >> >>
>> >> >> >> This is what we pass for make to configure the board and should be
>> >> >> >> the given value.
>> >> >> >
>> >> >> > OK, that makes sense. You didn't answer my question about
>> >> >> > UBOOT_MACHINE though. Any thoughts on that ?
>> >> >>
>> >> >> If using UBOOT_MACHINE = "foo_defconfig" will work just fine.
>> >> >
>> >> > This makes no sense at all, does it ? How can UBOOT_MACHINE contain
>> >> > _defconfig ? This sounds like a crude hack, not a systematic solution.
>> >>
>> >> I think it makes more sense than it adding _defconfig suffix behind
>> >> the scenes...
>> >
>> > The machine is just that, the name of the machine. For machine foo, the
>> > UBOOT_MACHINE should be foo , not foo_defconfig . The _defconfig should
>> > be added by the recipe, but certainly not by the user, since that would
>> > be a dirty hack and confusing as hell. The "foo_defconfig" string would
>> > only be sensible for UBOOT_CONFIG variable, but no way for UBOOT_MACHINE.
>>
>> UBOOT_CONFIG is different on this context; it is more like PACKAGECONFIG.
>>
>> You can see, for example:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/machine/im
>> x6qsabresd.conf#n14
>>
>> So I understand it is a little confusing but it is indeed how it has been
>> done.
>
> Just because some variable is misused in some metalayer doesn't make it right,
> does it ?

I am not OE-Core maintainer but I think we ought to push for simple
things and making behind the scenes suffix appending to generate a
value goes on the opposite direction, from my point of view.

Also this u-boot.inc change will make impossible for people to use OLD
versions of U-Boot without duplicating it and hacking it. A bad side
effect.

From me, this is Nack!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

