Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2B17960745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 10:25:43 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161118102543425_0685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:25:43 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=51148 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c7gMT-00084a-B7 for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2016 05:25:37 -0500
Date: Fri, 18 Nov 2016 05:24:31 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611180513530.24565@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: perl packaging, Makefile.PL versus Build.PL?
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
X-List-Received-Date: Fri, 18 Nov 2016 10:25:44 -0000
Content-Type: text/plain; charset=US-ASCII


  still going to have a few more questions on the standards for
packaging perl source into OE recipes, here's the first one.

  as i read it, there are two build standards for perl source in OE:

  cpan.bbclass:		Makefile.PL build-based
  cpan_build.bbclass:	(newer) Build.PL build-based

so if one peruses the source at CPAN, it should be obvious which build
system is relevant, no? so what about source that has *both* those
files?

  https://metacpan.org/pod/Parse::DMIDecode

which has both of those install scripts in the top-level directory,
although the INSTALL file clearly refers to the newer build system:

  perl Build.PL
  perl Build
  perl Build test
  perl Build install

does it make any logical sense for both of those files to be there?
backward compatibility? any other reason? or am i just wildly
misunderstanding something?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


