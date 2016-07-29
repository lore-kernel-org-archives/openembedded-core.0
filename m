Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id E28EE607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:43:26 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20160729114322291_0485
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:43:22 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=15359 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bT6E3-0005KE-Q4 for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2016 07:45:11 -0400
Date: Fri, 29 Jul 2016 07:43:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1607290725440.23675@localhost.localdomain>
Message-ID: <alpine.LFD.2.20.1607290735180.23808@localhost.localdomain>
References: <alpine.LFD.2.20.1607290725440.23675@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
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
X-List-Received-Date: Fri, 29 Jul 2016 11:43:27 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Jul 2016, Robert P. J. Day wrote:

... snip ...

> am i missing anything?  i'm assuming i'd use a .bbappend recipe to
> add the script names to SRC_URI, then define "do_install_append()"
> to manually copy them over, or is there a proper way to do that i'm
> not seeing?

  never mind, just found an example that confirmed just what i
suspected:

https://github.com/meta-debian/meta-debian/blob/daisy/recipes-debian/run-postinsts/run-postinsts_1.0.bbappend

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


