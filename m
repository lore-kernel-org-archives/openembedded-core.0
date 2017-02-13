Return-Path: <max.oss.09@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8745A731D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:52:20 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 36so12068867otx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GIT+O+O3TxwpTyjTrRhdHT3rJVJxFt2sHGmnH46PbQs=;
	b=NaPuBdSWVRWyj8ZBsC/DArmlvNQu2xtYy91KKd60iyVUEDm5Ow2h7g/vPBdP3Ik//w
	6+DRFfv1bHja9CDmkpnT8I6StQNA83Yiz3va/4gvUclA62fEaBTfABWOyeYbIPd2GSOv
	90CY9ShBh7mSnNH9r86/cAl/TB6r3eZo4g/PHOiIsTx2paMRbO/KwzipIv2ufe6On6fA
	/tTb4K4qDVOp1gRBZuQhDTDyjjBO3+1rSXXWKtzJ0Z74/dEjBdagj3DO69UO18Ip5lV8
	ZCpM9FPe0J+P9fTbgAGfUi/yooeYuYTkidhu4w7HA7KJ8No1L2vnx2ADTzv+wxeQr6ey
	2Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GIT+O+O3TxwpTyjTrRhdHT3rJVJxFt2sHGmnH46PbQs=;
	b=t7QRpG+m5QzTC+Y81lpt3RB4RDqB+iKnFCILxJBYpA8HiHA8w2Od/Hxhe21ynnXFtb
	W5eTKCVdgF4p5+Hhyu7gzCsMeFadMQUyN7M4KTzyfL8e5sAb5/jmPKjGqgbb72nIOdVz
	wZ7eULnsGqqcJtsJMMULDoIzA4RlGss3tw+cOuCD+nIEjew1a6y6AB9T2FjVNbSG+vl0
	UH7JG6laADQmU+ltruk+zVLcyrhccEID8MxRKuoARCaVcYv2TXJ6ZpiIEEzk46Iuz4fC
	PxxNRrusiMwhb5GJqmFbwMKbgJnVESQabwzObWWCfJoCAd9pNm9dJHYHU++35RYYwyq8
	wEsQ==
X-Gm-Message-State: AMke39lJQCMDY1UlpIvb/c0EEQhjb6U3D9SU71ECKduiwP8vzMRqcSV02fCZMSh2/901R/At0DMdicElWw4hHA==
X-Received: by 10.157.56.27 with SMTP id i27mr14128335otc.160.1487001140844;
	Mon, 13 Feb 2017 07:52:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.1.56 with HTTP; Mon, 13 Feb 2017 07:52:20 -0800 (PST)
In-Reply-To: <1487000220.13854.243.camel@intel.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com> <20170213153245.GC3280@jama>
	<1487000220.13854.243.camel@intel.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 13 Feb 2017 16:52:20 +0100
Message-ID: <CAEHkU3XE+seTsjyinxB3xQJNCerRhnAPm6_B4+MQpgVgdXnf=g@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 15:52:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I got the same issue, formulated in the following question:
http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132604.html

Here a recipe failed because a native package which were in DEPENDS
did not get the RDEPENDS of those native package installed.
Something I would have expected to happen.

Assuming such native package A gets updated and newly RDEPENDS on
something additional we will have to hunt all packages which DEPEND on
A and a the additional RDEPENDS...

Max

2017-02-13 16:37 GMT+01:00 Patrick Ohly <patrick.ohly@intel.com>:
> On Mon, 2017-02-13 at 16:32 +0100, Martin Jansa wrote:
>> On Mon, Feb 13, 2017 at 04:24:15PM +0100, Patrick Ohly wrote:
>> > On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
>> > > Hi Andreas,
>> > >
>> > >
>> > > I think it's feature which was already there, but almost never
>> > > triggered (even in test-dependencies.sh tests), but with RSS it fails
>> > > reliably.
>> > >
>> > >
>> > > See:
>> > > http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.html
>> >
>> > That's not quite the same, if I understand it correctly. In that email,
>> > Richard was talking about "dependencies of that target are not needed
>> > and not installed" and used "quilt-native" and "compiler/toolchain" as
>> > example. In other words, if recipe foo DEPENDS on bar for getting foo
>> > compiled, that dependency on bar gets ignored when installing "foo" into
>> > the recipe specific sysroot because it shouldn't be needed anymore.
>>
>> I'm not sure if it's the same or not, but back then I got very rarely
>> missing dependency on wayland-native or qtwayland-native, now with RSS I
>> got 20-30 recipes failing because of missing dependency on
>> wayland-native, qtwayland-native or qtbase-native to stage the scanner,
>> moc and other native tools in recipe-sysroot-native.
>>
>> And Andreas issues look similar to that.
>
> I'm sure Andreas can clarify, but "kdoctools which depends on
> gettext-native" sounds like a runtime-dependency to me (but I'm just
> guessing that kdoctools wraps gettext, I don't really know).
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

