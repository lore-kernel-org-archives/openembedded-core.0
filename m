Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD0770018
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:06:13 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160503200611222_0685;
	Tue, 03 May 2016 13:06:11 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [99.240.204.5] (port=57082 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axgbc-000334-Dl; Tue, 03 May 2016 16:07:40 -0400
Date: Tue, 3 May 2016 16:05:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Tom Rini <trini@konsulko.com>
In-Reply-To: <20160503184521.GA7884@bill-the-cat>
Message-ID: <alpine.LFD.2.20.1605031601040.2840@localhost.localdomain>
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
X-List-Received-Date: Tue, 03 May 2016 20:06:15 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1743029563-1462305952=:2840"

--8323328-1743029563-1462305952=:2840
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

  saying they're regular Kconfig fragments might be technically
correct, but still doesn't explain the *possibilities* as to what can
go into them, and the consequences (or necessity) of adding your own
"is not set" lines, and why you'd want to do that.

  i don't see a long-winded explanation -- no more than a few
paragraphs would suffice to make it clear what developers can do.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1743029563-1462305952=:2840--
