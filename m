Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id ED170719DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 12:47:26 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161027124727204_0684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 12:47:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=35626 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bzk5Z-0001QV-Nu for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2016 08:47:21 -0400
Date: Thu, 27 Oct 2016 08:46:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1610270533590.12908@localhost.localdomain>
Message-ID: <alpine.LFD.2.20.1610270833260.15014@localhost.localdomain>
References: <alpine.LFD.2.20.1610270533590.12908@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: how to add new perl modules to stock OE build?
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
X-List-Received-Date: Thu, 27 Oct 2016 12:47:29 -0000
Content-Type: text/plain; charset=US-ASCII


  ack ... never mind, i see my fundamental misunderstanding. i thought
all of the recipes being processed via the "perl-modules" package were
being (if necessary) downloaded from CPAN, or something like that,
then turned into installable rpms. i didn't look closely enough into
the perl source to see that all the modules listed in
"perl-rdepends_5.22.1.inc" are already in the perl source tree.

  so i'm back to my original question -- what is the proper way to add
arbitrary perl modules to an image? if someone has a simple example of
how it's done, that'd be great. as proof-of-concept, i'd like to add
the Text::Template module to my "qemuppc" target.

  thoughts? sorry for all the earlier noise, i thought i had it
figured out but ... no.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


