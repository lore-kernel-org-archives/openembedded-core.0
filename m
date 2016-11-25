Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 0337960123
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 11:04:44 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161125110427197_0486
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 11:04:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=37883 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cAEIk-0003Ke-Tb for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2016 06:04:18 -0500
Date: Fri, 25 Nov 2016 06:03:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611250558560.1602@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: YAPQ: Perl RPM2 module versus rpm's PACKAGECONFIG[perl]?
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
X-List-Received-Date: Fri, 25 Nov 2016 11:04:45 -0000
Content-Type: text/plain; charset=US-ASCII


  ok, this should be the last perl issue i have for a bit ... the last
OE perl module i was after was RPM2 (Perl bindings for the RPM Package
Manager API):

  https://metacpan.org/pod/RPM2

but a side question -- i can see the OE rpm recipe file, including
this snippet:

 # Perl modules are not built, but they could be enabled fairly easily
 # the perl module creation and installation would need to be patched.
 # (currently has host perl contamination issues)
 WITH_PERL = "--with-perl --without-perlembed --without-perl-urpm"
 WITHOUT_PERL = "--without-perl --without-perl-urpm"
 PACKAGECONFIG[perl] = "${WITH_PERL},${WITHOUT_PERL},perl,"

so ...

  1) i know nothing about RPM2's API, is that the same as what i would
     get from rpm being PACKAGECONFIG'ed with perl?

  2) in any event, is rpm's PACKAGECONFIG[perl] still broken so that i
     can't use it, anyway?

that's about it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


