Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6A36FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 20:54:37 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161024205437008_0484
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 20:54:37 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=39444 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bymGN-00061N-30 for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2016 16:54:31 -0400
Date: Mon, 24 Oct 2016 16:53:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Mon, 24 Oct 2016 20:54:42 -0000
Content-Type: text/plain; charset=US-ASCII


  i've just been handed a list of about 200 perl packages by their
centos rpm names, and i want to map most, if not all, of them to their
equivalent OE package names.

 my first instinct (based on not having used a lot of perl OE
packages) is to add both "perl" and "perl-modules" to IMAGE_INSTALL,
just to fetch and build every possible module available through the OE
perl recipe -- that will at least give me an idea of what's available.

  next, i can see the pattern in some OE package names -- i've
verified that the Time::HiRes package is available in OE as
perl-module-time-hires, which i assume is part of the dynamic naming
being done in perl_5.22.1.bb.

 am i approaching this the right way?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


