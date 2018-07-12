Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id EFC40749F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 17:41:56 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id v8-v6so57338013oie.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hirD6faOh2BwJi5hopQW+/kDb5r+Qqw6p7jwvxETqjM=;
	b=kdcWh7DwLVEb4EPgF8hNgk2VJuvu2WqcBUAGS7ADdD3ETGbkXvidhl9NCXUlNW8Kt/
	8etf7gi1wZ7lLxlJYUxH/Uiq8Hqj93abaj9xavQ4WxeG5oNTdGBFysfi9HkocKfhBOwp
	qji2xsVLl3X3Sdeayxw97eDgPVZBL+HupXl5Z/3F7HetQHSxbN12Vi3mNANNfBRq1ijR
	VYAPAvtaFMBU5TIGBz6ib1n4qsW9Zhsvrm48DATOglvXflBJi5P2sgCgC1VhjiTHN56O
	hpxRPtdEiV19piXowYFa5nkBjCY6Mw9bYEg7Pp1rcX7GUSZy1s+AzfWhWJNl536L3KRX
	CRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hirD6faOh2BwJi5hopQW+/kDb5r+Qqw6p7jwvxETqjM=;
	b=cE/ct3yuFmC26rcHd4LmjdYoA3j5ec2VroqSIrpmOdNafJyMvxoNNIfAmMWreNg9vW
	c/ax+e8nvMeJZC4Mdy5M1xyhHBXJJ2d6lRGWAhd7yt8B+w4W6pNAPBUSB1EJRZ/e5i6v
	VtreE54wjoiNP87id0jskpNjOkgNcNpdjJqRorkh47gCf1BXXY/s+HDSh5fJLJIcPCVX
	IqE1avWBMxB3jZF12ZkE1hWJVY0DUTcTtkIBvj9Q02GF97R1sKjZmlTSWxRM7Ebxjs9X
	SNGQv8t3YGNkGbz0rqghrsLOo75cX6KXdEejk9UMDiJJ7NwwqVoRFIgLvCCPDhNDIyyt
	4ekA==
X-Gm-Message-State: AOUpUlElhBWslAA7RTmkwykphiOxnhXbSyYzseAbGzRJdUARuEAb7xGH
	ILLsUBouh7HmcbUwy9YRp0C4Ka0OuMZLOaektQGmxg==
X-Google-Smtp-Source: AAOMgpeTM1WkyJPZPsFhADVDmiZ2zqJmr/6JWsLHS6udxRUGEWGEAe/5a7XU2qq6w8firzITVE5C9gD45Y6KTKZYHhY=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr3445942oib.320.1531417317881; 
	Thu, 12 Jul 2018 10:41:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 10:41:37
	-0700 (PDT)
In-Reply-To: <CAFeBWL7d02=O3SKdUYAPOmeJi1hgLyq56EVBO6hDTYmx0kjamw@mail.gmail.com>
References: <CAFeBWL6aUFRraua-xyf49HYvHq=BGMNcZrmo1k6GtpvCpYETSg@mail.gmail.com>
	<CAJTo0LYeM6ob7-d+FxNeFgLszvhry0=9Tcb90a-1vU+PXjFppQ@mail.gmail.com>
	<CAFeBWL7d02=O3SKdUYAPOmeJi1hgLyq56EVBO6hDTYmx0kjamw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2018 18:41:37 +0100
Message-ID: <CAJTo0LZfDvyMK91vy1D31nUAkHSJPrGqcqKUDd=HuJRoipUnVw@mail.gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using IMAGE_INSTALL_remove and PNBLACKLIST
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
X-List-Received-Date: Thu, 12 Jul 2018 17:41:57 -0000
Content-Type: text/plain; charset="UTF-8"

Blacklist will just make a recipe unavailable, if another package
depends on something it provides then you get a fatal error.

IMAGE_INSTALL is the "top level" list of packages to install, if one
of those is a packagegroup that depends on other packages then you
can't remove those other packages.

At this point you're either:
1) bbappending packagegroups to manipulate their dependencies, which
can get silly, or
2) just writing a new image

Ross

On 12 July 2018 at 18:16, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Right, but I am simply and quickly trying to replicate TI provided SDK
> image.
> So RDEPENDS does not get handled by IMAGE_INSTALL_remove / PNBLACKLIST
> combo, correct?
>
> Adam
>
> On Thu, Jul 12, 2018 at 12:20 PM Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Write your own custom image which doesn't include
>> packagegroup-arago-tisdk-addons?
>>
>> Ross
>>
>> On 12 July 2018 at 16:19, Adam Lee <adam.yh.lee@gmail.com> wrote:
>> > I am attempting to exclude a package from my system image with this in
>> > my
>> > local.conf:
>> >
>> > IMAGE_INSTALL_remove += "tiovx-app-host-examples"
>> > IMAGE_INSTALL_remove += "tiovx-lib-host"
>> > IMAGE_INSTALL_remove += "tiovx-app-host"
>> >
>> > PNBLACKLIST[tiovx-lib-host] = "Build break"
>> > PNBLACKLIST[tiovx-app-host] = "Build break"
>> > PNBLACKLIST[tiovx-app-host-examples] = "Build break"
>> >
>> > My build is still failing unfortunately:
>> >
>> > ERROR: Nothing RPROVIDES 'tiovx-app-host-examples' (but
>> >
>> > /home/ylee/tisdk-20180718/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> > RDEPENDS on or otherwise requires it)
>> > NOTE: Runtime target 'tiovx-app-host-examples' is unbuildable,
>> > removing...
>> > Missing or unbuildable dependency chain was: ['tiovx-app-host-examples']
>> > ERROR: Required build target 'packagegroup-arago-tisdk-addons' has no
>> > buildable providers.
>> > Missing or unbuildable dependency chain was:
>> > ['packagegroup-arago-tisdk-addons', 'tiovx-app-host-examples']
>> >
>> > Is there something else I have to do to eliminate a package that is
>> > runtime
>> > dependent? Thoughts?
>> >
>> > Adam
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >

