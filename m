Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id DB25F60746
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 09:38:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161119093719681_0486
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 09:37:19 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=44442 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c825B-0005n5-HK for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2016 04:37:13 -0500
Date: Sat, 19 Nov 2016 04:36:06 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611190432210.22441@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: more perl stuff: is "perl-module-rpm" still borked?
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
X-List-Received-Date: Sat, 19 Nov 2016 09:38:04 -0000
Content-Type: text/plain; charset=US-ASCII


  from recipes-devtools/rpm/rpm_5.4.16.bb:

SUMMARY_perl-module-rpm = "Perl bindings for apps which will manipulate RPM packages"
DESCRIPTION_perl-modules-rpm = "The perl-modules-rpm package contains a module that permits applications \
written in the Perl programming language to use the interface \
supplied by the RPM Package Manager libraries."

... snip ...

# Perl modules are not built, but they could be enabled fairly easily
# the perl module creation and installation would need to be patched.
# (currently has host perl contamination issues)
WITH_PERL = "--with-perl --without-perlembed --without-perl-urpm"
WITHOUT_PERL = "--without-perl --without-perl-urpm"
PACKAGECONFIG[perl] = "${WITH_PERL},${WITHOUT_PERL},perl,"

  so, still broken?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


