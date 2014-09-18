Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7EB7023F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:11:44 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id ft15so997914pdb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 02:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1Tfb0zHhLmCCulCecqHyyZ/Bo93LSoYx8NwaOdWbHWA=;
	b=JiyaiqHqUE1NyVZqPv2N+US8cp0kBbsZv7V0f+2JfumfD43QhBS2a+LY68e3oRYKfl
	/mUbsNik096W55rWRX4lCEduIsn4mlZxoPoXZQb/Lq1w2XPyQ8JClzIu5P2DtiZZK7jl
	5n3k63MozMRZ1q1Uf2XToEAsTgmNkLlOM4xSK4d3+X4O4QUC4NruxFcEBrhmcu04DrDo
	LAL2uYnabZg8/TQPB25DIBC29FYM8YfeYqARFHZwmORAcdqy3DG1jCKpATGFY6O8mVeJ
	AitXqQUUNiK8ejh2d92V2faRuVF0qOSyhCPTlDVr6zrtITe9b9xapfePRI933kRC09aL
	rpPg==
X-Gm-Message-State: ALoCoQmz9C5asP6bMaQDPy6K3Wempv0rxmkGUTUqkhUxPr+iipkok0x24gYTimVodqNrL8je5ZCp
MIME-Version: 1.0
X-Received: by 10.70.102.200 with SMTP id fq8mr4032775pdb.152.1411031505669;
	Thu, 18 Sep 2014 02:11:45 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.65.69 with HTTP; Thu, 18 Sep 2014 02:11:45 -0700 (PDT)
In-Reply-To: <201408112026.32235.marex@denx.de>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201408081422.19749.marex@denx.de> <1407752794.22187.3.camel@ted>
	<201408112026.32235.marex@denx.de>
Date: Thu, 18 Sep 2014 10:11:45 +0100
X-Google-Sender-Auth: Ya-NNGuietJ2Kk-4mwUM-bdWazs
Message-ID: <CAOMwXhNBq9F45HSQj0QuXoxRe_50_9x_F42=yWe22H2_BcPV1Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Marek Vasut <marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 18 Sep 2014 09:11:49 -0000
Content-Type: text/plain; charset=UTF-8

Come on, Yocto maintainers, please...

Mark sent this change relatively long ago, and it is still in "new"
state, sadly. The current SDK shipped _breaks_ any third-party
software that uses standard python with regards to the libraries and
all that.

This is is slightly frustrating. We also face the same issue. :(

On Mon, Aug 11, 2014 at 7:26 PM, Marek Vasut <marex@denx.de> wrote:
> On Monday, August 11, 2014 at 12:26:34 PM, Richard Purdie wrote:
>> On Fri, 2014-08-08 at 14:22 +0200, Marek Vasut wrote:
>> > On Friday, August 08, 2014 at 07:22:04 AM, Koen Kooi wrote:
>> > > Since 'yocto' is a project like freedesktop.org your commit message
>> > > doesn't make sense, it should be something like:
>> > >
>> > > meta-toolchain-qt:  Install full set of python modules
>> >
>> > Got it, Saul also told me so. I will wait a bit for some more feedback
>> > and repost with corrections, OK ? Is this approach I took here even
>> > correct please ?
>>
>> I'd really like to see a packagegroup defined somewhere with this list
>> of python modules which the various recipes can then reference...
>
> I agree, that makes sense. Is this approach I took here the correct one please ?
>
> Best regards,
> Marek Vasut
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

