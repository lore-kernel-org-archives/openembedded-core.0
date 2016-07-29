Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 462E9607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:54:47 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160729115446419_0685;
	Fri, 29 Jul 2016 04:54:46 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=40811 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bT6P5-0006FS-Ad; Fri, 29 Jul 2016 07:56:35 -0400
Date: Fri, 29 Jul 2016 07:54:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1469792913.9142.56.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1607290750390.23975@localhost.localdomain>
References: <alpine.LFD.2.20.1607290725440.23675@localhost.localdomain>
	<alpine.LFD.2.20.1607290735180.23808@localhost.localdomain>
	<1469792913.9142.56.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: want to verify proper use of run-postinsts, if i may
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
X-List-Received-Date: Fri, 29 Jul 2016 11:54:49 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Jul 2016, Richard Purdie wrote:

> On Fri, 2016-07-29 at 07:43 -0400, Robert P. J. Day wrote:
> > On Fri, 29 Jul 2016, Robert P. J. Day wrote:
> >
> > ... snip ...
> >
> > > am i missing anything?  i'm assuming i'd use a .bbappend recipe to
> > > add the script names to SRC_URI, then define "do_install_append()"
> > > to manually copy them over, or is there a proper way to do that i'm
> > > not seeing?
> >
> >   never mind, just found an example that confirmed just what i
> > suspected:
> >
> > https://github.com/meta-debian/meta-debian/blob/daisy/recipes-debian/
> > run-postinsts/run-postinsts_1.0.bbappend
>
> Personally, I wouldn't take meta-debian as a good example of
> anything, that layer is doing some things which I'd find
> questionable. Obviously they are free to do so though.
>
> Most of the time the package manager sets up things to run under run
> -postinsts as needed. Yes, you can do this automatically, but why
> not just write a postinstall for your package and defer it to first
> boot if that is what you need?

  it's not just package post stuff here, i'm looking at run-postinsts
to do a *lot* of subsequent setup of the target system -- effectively
downloading and installing the entire proprietary application.

  yes, i realize i could just make that app part of the initial image,
but there are reasons for this. so i'm assuming just manually
installing and running some scripts via run-postinsts is the way to
go.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


