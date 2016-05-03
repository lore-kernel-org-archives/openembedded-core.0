Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id A680C62137
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 15:13:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20160503151328179_0485;
	Tue, 03 May 2016 15:13:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=52656 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axc2L-000885-FA; Tue, 03 May 2016 11:14:57 -0400
Date: Tue, 3 May 2016 11:13:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4N+LvCos+qNDuANxEisezP3kZ9_DgtPTF4gNGhaKcoHXQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1605031052360.22513@localhost.localdomain>
References: <alpine.LFD.2.20.1605030649490.20066@localhost.localdomain>
	<CADkTA4OwEaX6pCpuuiXxuMqY_++NLS+W6pnH0siNvXD0SwhWOg@mail.gmail.com>
	<alpine.LFD.2.20.1605030912110.17898@localhost.localdomain>
	<CADkTA4N+LvCos+qNDuANxEisezP3kZ9_DgtPTF4gNGhaKcoHXQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i tell which default kernel config OE started with?
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
X-List-Received-Date: Tue, 03 May 2016 15:13:32 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 May 2016, Bruce Ashfield wrote:

> If you are not supplying a defconfig, and are inheriting the
> standard kernel options, then yes, you'd be getting those fragments
> as well.

  ah, this actually leads me into my next question -- what is magic
about a "defconfig" file that changes the normal processing?

  in the YP kernel dev manual, section 2.2.3, one reads:

"If you have a complete, working Linux kernel .config file you want to
use for the configuration, as before, copy that file to the
appropriate ${PN} directory in your layer's recipes-kernel/linux
directory, and rename the copied file to "defconfig". Then, add the
following lines to the linux-yocto .bbappend file in your layer:

     FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
     SRC_URI += "file://defconfig"

so the idea here is that a "defconfig" file is, in some sense, a
"complete, working" config file that requires no extra processing, is
that correct? does that mean that if you explicitly use a SRC_URI
"defconfig" reference, all that extra normal processing won't be done?

  also, that same section in the YP manual is slightly confusing -- if
your SRC_URI refers to a defconfig file *and* some .cfg fragment
files, is it necessarily true that the defconfig file is consulted
first (no matter where it shows up in SRC_URI), after which all .cfg
files are applied on top of that in order? it's not entirely clear
from the manual if that's what happens.

  predictably, a couple more kernel config questions coming ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


