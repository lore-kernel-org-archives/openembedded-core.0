Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id C46F46081A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 19:44:54 +0000 (UTC)
Received: by yhcb70 with SMTP id b70so13930673yhc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XvpvYUcP30mtUCjkkQMAD/6BXwGOtLSswFKDGXXQe3w=;
	b=QztGXYy9HPbwpjW9X5Nnq4r4VRMwIRPPAErLRpjQ5TcDuo/aoeucyr22RSSJLWmJgb
	bLZsaaHlxY/FNQw6jQfz858IOb/LyOHKSCgMZhX/kvh8wap+QN1LTxdloJX+CLVwnUoa
	C2BeR4SIMZKJ6NuTiJhYGe3wDiAxCv7nIhHzEoKVKkE6G0NOtmvOY06nThXa/ynZPZYf
	Mm47UMMDfgTCG3QLen4OtB2+H2QnnSVX9MFIxJtRHA+Ve/Hh6gGwqVqwQp15xnkCierx
	zDnpyVPvDks7C4jSSWnkcOuSY2a2sF0VVqA2ZqKnmtgP3IsON10zHehZayo2mwBD5X4p
	GxIQ==
MIME-Version: 1.0
X-Received: by 10.170.149.194 with SMTP id q185mr261707ykc.16.1431027895036;
	Thu, 07 May 2015 12:44:55 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Thu, 7 May 2015 12:44:54 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FF09@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
	<CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
	<CADkTA4Ob1CLekk=Y+u+AfBZq_E4_9xHJbFc548Po0Utsx-tdRA@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FD16@deeres07.ebgroup.elektrobit.com>
	<CADkTA4NuJG11-9O6EJoEE0QE85Ng4WCWiuqo4dxnnkonAVSphA@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FF09@deeres07.ebgroup.elektrobit.com>
Date: Thu, 7 May 2015 15:44:54 -0400
Message-ID: <CADkTA4NMXVCcTnJhozF2_AN5OwhLr9ZidMThm4HW7UFqb7F2iA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Steffen.Pankratz@elektrobit.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KBUILD_DEFCONFIG issue
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
X-List-Received-Date: Thu, 07 May 2015 19:44:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 7, 2015 at 3:27 AM,  <Steffen.Pankratz@elektrobit.com> wrote:
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Wednesday, May 06, 2015 4:00 PM
>> To: Pankratz, Steffen
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] KBUILD_DEFCONFIG issue
>
>> >> >> > I am in the process of creating a board support package (1) for
>> >> >> > NVIDIAs
>> >> >> Jetson TK1 board (2).
>
> [...]
>
>
>> >> >> > Another, probably unrelated problem I face right now is, that
>> >> >> > basically
>> >> >> most of the options of the tegra_defconfig get removed by
>> kconf_check.
>> >> >> > The kernel gets build, there are no warnings that things got
>> >> >> > removed but
>> >> >> in the files in .meta/cfg/standard/jetson-tk1  I see for example:
>> >> >> >
>> >> >> > Value requested for CONFIG_ARCH_TEGRA_124_SOC not in final
>> >> >> > .config
>> >> >> Requested value:  CONFIG_ARCH_TEGRA_124_SOC=y Actual value:
>> >> >> >
>> >> >> > Any ideas?
>> >> >>
>> >> >> The checking of the defconfig is inhibited on purpose. I only
>> >> >> added the functionality as an assist/crutch for folks that haven't
>> >> >> migrated to a base config + fragments.
>> >> >>
>> >> >> A defconfig does not specify whether or not options are important
>> >> >> for the board or not, whether or not it is a full defconfig or a
>> >> >> minimal config,
>> >> etc.
>> >> >> Without that
>> >> >> extra information generating screens full of warnings isn't
>> >> >> useful, so it isn't generated at all.
>> >> >
>> >> > I am not quite sure what the correct way would be to continue and
>> >> > get a
>> >> kernel with everything I need and want.
>> >> > The config specified in KBUILD_DEFCONFIG gets stripped of many
>> >> necessary options need for the board.
>> >> > So this is obviously not the right approach.
>> >>
>> >> It would be the kernel configuration subsystem that is stripping the
>> >> changes when it processes the .config (i.e. nothing in the Yocto
>> >> processing of those same fragments).
>> >>
>> >> If you manually copy the defconfig into place and do a make
>> >> oldconfig, are you seeing lots of delta and questions being asked ?
>> >
>> > I did not see any questions or deltas:
>> >
>> > bitbake virtual/kernel -c devshell
>> >
>> > Then:
>> >
>> > cp arch/arm/configs/tegra_defconfig .config make oldconfig
>>
>> odd. Is this something I can reproduce locally ? If you email me the details,
>> I'll poke at it and offer some suggestions.
>
> Thank you very much in advance Bruce.
>
> I think the easiest thing would be to get poky (dizzy branch), meta-openembedded (dizzy branch) and meta-jetson-tk1 (1).
> Apply the patch I send (to patch kernel-yocto.bbclass) and build an image for MACHINE jetson-tk1.
> I was building the core-image-weston, but I think the type of image used, doesn't matter in regards to my kernel issue.
>

I've sorted this out, using the kernel tree you are using, and a hacked up
qemuarm configuration (simpler .. less rebuilds).

Turns out that the in-tree defconfig doesn't like the default mode we have
for deconfig processing (allnoconfig), since it is of the minimal variety (not
a problem).

With the patch to copy the deconfig into place (I'll post that soon for
merging), and the following addition to the linux-yocto-custom recipe:

  KCONFIG_MODE="--alldefconfig"


I'm now seeing the TEGRA options make it into the config.

Give that a try, and let me know how it goes. I am running some other local
changes here, but they won't impact this part of the process.

Cheers,

Bruce


> (1) https://bitbucket.org/kratz00/meta-jetson-tk1
>
>
> --
> Regards
> -Steffen
>
>
> ----------------------------------------------------------------
> Please note: This e-mail may contain confidential information
> intended solely for the addressee. If you have received this
> e-mail in error, please do not disclose it to anyone, notify
> the sender promptly, and delete the message from your system.
> Thank you.
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

