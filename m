Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 93BFB71976
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 20:20:04 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id l50so14966207wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9xKxPVRQQKX31Ogh4DwJOqxF9tXU0Uuzlbj9zlMwE2s=;
	b=c7simOotFU0ovuhmFW6RTleMbqvm+JRQyhp4Vw/INojkXrUtQCU1oiSe8xDclF8Idz
	N/K/TwzePdTR5pi5lNx96L57Tk9bWAySKUA/mRb2pEypdQf/eaVnSoter0mcmCVN/Bha
	ugIyd8/uRJLiN3RoB6y7uVzX9cN4kICF2i+2S0iGBYrasMHPOf7IdGPldbHpQMt4b48c
	4hu4R9tsuJiiG4zsWrH2BvgQWu3xRubEP5YbJFMsfGlxi9jO8uZEKBlgOiFbktlLjQnl
	maqDj/FSHbH8pUxQ/GRZlFBJrwsw8q8KtwCr3aRnifqdluSYVZVEbySJ+JswFyZnISvx
	4FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9xKxPVRQQKX31Ogh4DwJOqxF9tXU0Uuzlbj9zlMwE2s=;
	b=Ahg3B+TxWNFca7aIdGwvan4OvuSKLAgFUW/par9PnehRa8RTmTpIO0ANmqC7ntpDCc
	H1nj0MyhzNemArBlT3ypbWQx5zahp6Bl6kUHlZ1LPxnYMT6fF1mn95huORmt/co3QUHh
	LvJb2zY56lW7Z99jxf6+vcOfMutW2MRyy2HRFbUrECrtUwniHXcIuaA1zLxX6PHjDnu6
	P/yKDGnZgpWWCCNGpNJwE4BFOYdSu2HUGOgV4iKd9KEHvbcgEjnfAXyhKJJ9yzMt53XF
	MA+I3+PS20tNvq2rXCFj4wBpYrl6xnblT2dg81q56wDp/D+5TbQ9e7IsLhQg+AWG4iEB
	4bYg==
X-Gm-Message-State: AODbwcDHlA1tM/0G99EXYPzIwDUt3eZnrUJjUgW122oUPV38x9Q/FmET
	y5UVGBsMdtpD3CyUR5zg66TppF3tmg==
X-Received: by 10.80.178.228 with SMTP id p91mr1450903edd.131.1494361205276;
	Tue, 09 May 2017 13:20:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 9 May 2017 13:19:34 -0700 (PDT)
In-Reply-To: <CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2017 13:19:34 -0700
Message-ID: <CAMKF1sqNov69Q+AQVRqTaseODJ4_jHKNPB1LDNL0bX2qb+DyqA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 20:20:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 9, 2017 at 2:24 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 May 2017 at 23:15, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>
>> FWIW I think this is a little short-sighted. Why are we ruling out Qt
>> exactly?
>
>
> My only strong opinion on what goes into oe-core is that it should be small
> (both in size and build time) and basic.  It's not going to fit everyones
> needs and is basically there to be a UI until the users replace it with
> something more suitable.  Sato does this without being too huge and there's
> not currently a strong impetus to replace it.
>
> The development of Wayland does make the long-term prospect of Sato
> interesting: do we port Sato to Wayland too, or keep the Wayland images
> using the standard Weston demo shell?

I think we should always intend to align the reference stack with
whats commonly used in
userbases we target to address with project, we will not be serving
the project goals and its username if we
trim down to packages which are just used for reference, if majority of the
community we intend to address uses QT or any other stack for that matter
then we should align our requirements accordingly which will be mutually
beneficial IMO

