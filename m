Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id C8777601D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 14:58:22 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id cm18so3405378qab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 07:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HDl3e+zs5Dmdf30wIKv7Swod1zr1zStUNauQ4y4YnFM=;
	b=DSSdOd9fXKyYvVtOKyFEmL7Kg94zjPr3o3paS/FYC6N9wRmoKccR4/dnYddadrh7VP
	SJa15xJLH20BxxnU+Zw0xgTuoBlsrYBuWImEYeAWxYquYFuuNN3lGRf4cGXJjUdJwNf0
	ku9U7AyE7xqMCwwNPJQFcE4ZGDQTvYTZMZ2SYBOWPmpIhO4bzZrSG3rVGh1AhYm9UKA2
	6gUvE1d44ruVMqBSuzub/RhjaGBHNdraAnQzKq8bFPIJMQk5RMfqGR/jYfsFNjHT6Lo8
	EwWvwQFyzt8EOPCmJZ2n55d7YLxG5JFYyXridKA1io2pThSHdCD7rClR8z2wmU0PG+I+
	hI4g==
X-Gm-Message-State: ALoCoQnXzeW4T2Q/ijBoaL6Rc2/UXcVgJEBx4X7ulFYXAJmuW/ZPYdv34Xx6G+7x5voA/j3uAp3W
X-Received: by 10.224.28.68 with SMTP id l4mr35482945qac.22.1413817102733;
	Mon, 20 Oct 2014 07:58:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 07:58:02 -0700 (PDT)
In-Reply-To: <54452125.1080108@pabigot.com>
References: <54452125.1080108@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 15:58:02 +0100
Message-ID: <CAJTo0La7QZ-RrUcouRgwyrB=Jug3DcDuzJdk09BU9+QBpHshGw@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: viability of bluez5 in next OE development cycle?
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
X-List-Received-Date: Mon, 20 Oct 2014 14:58:24 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2014 15:50, Peter A. Bigot <pab@pabigot.com> wrote:
> There's this bugzilla entry:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5031
>
> I see a NAKd patch set from about 26 Mar 2014 which tried to add
> virtual/bluez.  The outcome was that a rework would be done and tested and
> resubmitted latter. In the related discussion there was some concern that
> dependent packages were still not ready to move even though the last bluez4
> release was in June 2012.
>
> With a little local hacking I can get bluez5 working well enough for my BTLE
> needs on beaglebone (mostly s/bluez4/bluez5/g and a PROVIDER for
> bluez-hcidump).  Does anybody have plans to work this during the early 1.8
> development cycle?  It looks pretty straightforward, but Idon't use BT in
> enough variants and packages to be able to test the full set of required
> patches.

At the time the blocker was that some use cases (bluetooth headset, I
think) was non-functional with BlueZ 5, because functionality needed
to be added to PulseAudio and oFono.  Yes, this needs to be revisited
in 1.8.

Ross

