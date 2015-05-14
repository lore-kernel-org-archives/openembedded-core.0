Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 605BC6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 13:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EDks7q001715; Thu, 14 May 2015 14:46:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xnUyMz3Gqmqs; Thu, 14 May 2015 14:46:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EDkcuZ001703
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 14 May 2015 14:46:50 +0100
Message-ID: <1431611197.30971.212.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Dmitry Eremin-Solenikov
	<dmitry_eremin@mentor.com>
Date: Thu, 14 May 2015 14:46:37 +0100
In-Reply-To: <CAJ86T=X08DRhpZjH8Ge0vjXXuk1dfa2RbXiDarNX153-oE1Cmw@mail.gmail.com>
References: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>
	<CAJTo0LZUd4bcbfTL+TbtiXOU1wc9ZaFGP0mTM_Y0hVMb1eMqWg@mail.gmail.com>
	<20150512144749.GD2714@jama>
	<CAJ86T=X08DRhpZjH8Ge0vjXXuk1dfa2RbXiDarNX153-oE1Cmw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 14 May 2015 13:46:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-13 at 18:17 -0700, Andre McCurdy wrote:
> On Tue, May 12, 2015 at 7:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Tue, May 12, 2015 at 03:25:43PM +0100, Burton, Ross wrote:
> >> On 11 May 2015 at 20:52, Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> >> wrote:
> >>
> >> > Currently qemuarm is limited to 256 Mb of RAM. Sometimes this is too
> >> > little to run necessary applications. Add a new arm configuration based
> >> > on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of RAM.
> >> >
> >>
> >> Not sure I'm keen on oe-core having two almost-identical qemuarm machines.
> >> Why not just change the qemuarm machine to use the A9?
> >
> > Then we should officially drop thumb1 support, because current qemuarm
> > builds are quite broken when thumb is enabled and dropping current
> > qemuarm or replacing it with A9 variant will prevent oe-core to be
> > testable on autobuilder. See
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
> 
> +1 for updating qemuarm to an ARMv7 CPU.

One thing I did notice about the new proposed arm machine was the lack
of graphics support. We really do need a machine with graphics. If we
could get a machine which had graphics and more memory that would be
much more attractive to switch to.

This also has implications on the kernel support (cc Bruce).

> As for dropping thumb1 support that's probably fine too - although
> technically (if someone really did want to keep thumb1 support alive)
> I guess nothing prevents testing thumb1 binaries on an ARMv7 CPU?

Just guessing but they might work in some cases an a v7 CPU but fail on
older ones due to alignment constraints?

Cheers,

Richard



