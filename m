Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 09AA1740A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 01:17:03 +0000 (UTC)
Received: by obbkp3 with SMTP id kp3so42944809obb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 18:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=haR8YxJYaibUAqzFWZFRE6lHD/Etfh6cEp2itFhUjTU=;
	b=h31O4Cz1fy69aNIWx1cP002TncKD5xhK1TKA1pSQATeJ96fJyoIPhILR//TwFj+Fae
	MJggziQFB5++My093gL96SIZb14mAzBLPG4/8RTA/88mOqRVkbpwH5w1K1TRuTqwWWtH
	H2w649reFsH90stt+ZQ/aPL8rlvZGkUwlaQIlJ9ta4uvIDMdCBVm5SLPEuN8qwDTtG6j
	Bpv7/8kluBw7pcDeRdIxCZ7VTRWSJXBkHc/FGvK1VAxGIb3yFUb1JxKjm/sLQrvUi5m8
	OFKoEC4+ijzSeCKi2G+I//AasG+Ya/hQEGGDsFyvvHFZem/WCkBmgxgwRs1Qx4VzzAZC
	zv3w==
MIME-Version: 1.0
X-Received: by 10.202.202.69 with SMTP id a66mr1326471oig.118.1431566224241;
	Wed, 13 May 2015 18:17:04 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Wed, 13 May 2015 18:17:04 -0700 (PDT)
In-Reply-To: <20150512144749.GD2714@jama>
References: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>
	<CAJTo0LZUd4bcbfTL+TbtiXOU1wc9ZaFGP0mTM_Y0hVMb1eMqWg@mail.gmail.com>
	<20150512144749.GD2714@jama>
Date: Wed, 13 May 2015 18:17:04 -0700
Message-ID: <CAJ86T=X08DRhpZjH8Ge0vjXXuk1dfa2RbXiDarNX153-oE1Cmw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND][PATCH 1/3] meta: add new qemuarma9 machine definition
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
X-List-Received-Date: Thu, 14 May 2015 01:17:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 12, 2015 at 7:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, May 12, 2015 at 03:25:43PM +0100, Burton, Ross wrote:
>> On 11 May 2015 at 20:52, Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
>> wrote:
>>
>> > Currently qemuarm is limited to 256 Mb of RAM. Sometimes this is too
>> > little to run necessary applications. Add a new arm configuration based
>> > on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of RAM.
>> >
>>
>> Not sure I'm keen on oe-core having two almost-identical qemuarm machines.
>> Why not just change the qemuarm machine to use the A9?
>
> Then we should officially drop thumb1 support, because current qemuarm
> builds are quite broken when thumb is enabled and dropping current
> qemuarm or replacing it with A9 variant will prevent oe-core to be
> testable on autobuilder. See
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717

+1 for updating qemuarm to an ARMv7 CPU.

As for dropping thumb1 support that's probably fine too - although
technically (if someone really did want to keep thumb1 support alive)
I guess nothing prevents testing thumb1 binaries on an ARMv7 CPU?

> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

