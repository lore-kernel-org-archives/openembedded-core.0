Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 3F63A600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 10:18:31 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160504101828831_0486;
	Wed, 04 May 2016 10:18:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=26167 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axtuP-0005T4-OG; Wed, 04 May 2016 06:19:57 -0400
Date: Wed, 4 May 2016 06:18:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Tom Rini <trini@konsulko.com>
In-Reply-To: <20160503184521.GA7884@bill-the-cat>
Message-ID: <alpine.LFD.2.20.1605040607420.11477@localhost.localdomain>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
	<CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
	<alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
	<20160503184521.GA7884@bill-the-cat>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Wed, 04 May 2016 10:18:35 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-494978038-1462357087=:11477"

--8323328-494978038-1462357087=:11477
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Tue, 3 May 2016, Tom Rini wrote:

> On Tue, May 03, 2016 at 02:27:38PM -0400, Robert P. J. Day wrote:
> > On Tue, 3 May 2016, Bruce Ashfield wrote:
> >
> > > On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >         oddly, in the current YP kernel dev manual, i don't see the
> > >       phrase "is not set" explained anywhere in the entire doc,
> > >       which is weird since it seems like it would be important.
> > >
> > > The manuals don't cover the mechanics of how the mainline kernel
> > > is configured. Just the same way the don't cover the
> > > configuration language for any number of packages in the system.
> >
> >   assuming i'm understanding your position, that's where i'm going
> > to *strongly* disagree. people who work with the mainline kernel
> > in a non-OE environment don't use kernel config fragment files.
> > period. AFAIK (and correct me if i'm wrong), .cfg kernel config
> > fragment files are exclusively an OE/YP thing, so there is no
> > reason for normal kernel developers to understand how they work.
>
> Or maybe to be more clear, does the manual spell out that these .cfg
> files are Kconfig fragments and follow the normal syntax rules
> Kconfig uses?  If not, it really should.  If so, maybe it should
> also contain a reference to the external authority on this syntax?

  "1.1 Overview" of the current kernel dev manual states:

"In particular, the kernel tools allow you to generate configuration
fragments that specify only what you must, and nothing more.
Configuration fragments only need to contain the highest level visible
CONFIG options as presented by the Linux kernel menuconfig system."

  so that opening bit really doesn't provide all the detail one needs,
*especially* if one is a newcomer. (and, yes, i'm sure experienced
kernel hackers are aware of kernel config fragment processing but,
seriously, is anyone trying to make the case you need to be an
experienced kernel hacker to use YP? please tell me that's not the
position you're taking.)

  further on, one reads:

"Note:

"The build system applies the configurations from the defconfig file
before applying any subsequent configuration fragments. The final
kernel configuration is a combination of the configurations in the
defconfig file and any configuration fragments you provide. You need
to realize that if you have any configuration fragments, the build
system applies these on top of and after applying the existing
defconfig file configurations."

  so ... lots of mention of "applying" fragments with no explanation
of what "applying" means. i'm not suggesting a comprehensive tutorial
on the application of kernel config fragments in the manual, but the
idea that one can talk about fragments and have *no* mention of the
value of an "# ... is not set" fragment line and when to use it
strikes me as absurd.

  i think a *lot* of potential confusion could be averted with at most
3 or 4 paragraphs briefly describing what goes into a fragment, and
why it's there. or you could stand on principle and leave confused
readers to fend for themselves. tough decision there.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-494978038-1462357087=:11477--
