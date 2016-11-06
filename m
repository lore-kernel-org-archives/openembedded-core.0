Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3DC6074F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2016 19:19:58 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161106191958915_0484;
	Sun, 06 Nov 2016 19:19:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=57040 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c3Syu-0001sO-0n; Sun, 06 Nov 2016 14:19:52 -0500
Date: Sun, 6 Nov 2016 14:18:49 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Tim Orling <ticotimo@gmail.com>
In-Reply-To: <CANx9H-BWEGfzMn-dyhUf+hBg7Jn2dH-nTPY3w2_CVjMUaX-rNg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1611061417070.21092@localhost.localdomain>
References: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
	<CANx9H-DKBM9qaLr9+d0pa7YgoBs6qz6SqoJrG8L_hN0ua0xQDQ@mail.gmail.com>
	<alpine.LFD.2.20.1611061315380.20227@localhost.localdomain>
	<CANx9H-BWEGfzMn-dyhUf+hBg7Jn2dH-nTPY3w2_CVjMUaX-rNg@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "Can't install perl-soap-lite-1.20-r0@all: no package provides /bin/env" ??
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
X-List-Received-Date: Sun, 06 Nov 2016 19:19:59 -0000
Content-Type: text/plain; charset=US-ASCII

On Sun, 6 Nov 2016, Tim Orling wrote:

> I created a ticket https://rt.cpan.org/Ticket/Display.html?id=118654
> And sent a pull request
> https://github.com/redhotpenguin/soaplite/pull/28
>
> Should be merged/released shortly as maintainer is already in
> contact.

  that was quick, thanks. as a temporary fix, i just added a patch
that mindlessly changed every "/bin/env" to "/usr/bin/env", and that
did the trick. i suspect that's pretty much what your patch does.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


