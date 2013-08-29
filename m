Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4E76B3C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:54:25 +0000 (UTC)
Received: from [69.196.158.250] (port=43930 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VF0nx-0005ae-UA for openembedded-core@lists.openembedded.org;
	Thu, 29 Aug 2013 07:54:25 -0400
Date: Thu, 29 Aug 2013 07:54:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1308290743330.5588@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: looking for recommendation for cutting edge OE build for beagle black
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
X-List-Received-Date: Thu, 29 Aug 2013 11:54:26 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i asked about this on the beagle ML but i figured some folks here
would have massively useful advice, so here goes.

  for the purposes of classroom instruction, i'm looking for an
OE-based build for the beaglebone black (BBB) with the following
properties:

* works with some set of existing layers (oe-core, meta-openembedded,
meta-ti, meta-angstrom, whatever it takes)
* ideally works with current git repos, so totally cutting edge
* easy to configure and build
* generates minimal, command-line image; something like angstrom's
"hardware-bringup-image" would be perfect as it would be the basis for
further experimentation by the students

  furthermore, i'd prefer that the config and build uses current linux
kernel and u-boot trees, which means that, yes, there might be
breakage as the kernel works its way to 3.12-rc1 but i can live with
that for now. the generated content doesn't need to be *perfect*, it
just needs to build and boot, and i'd like to be able to "git pull" on
a regular basis to get new commits and test those.

  currently, i'm using meta-beagleboard for this; i wrote that up
here:

http://www.crashcourse.ca/wiki/index.php/BBB_meta-bb

however, that build, while convenient, is fixed at a 3.8.13 kernel, so
i'd prefer a setup that lets me select "experimental" or "testing" or
something similar. i'm aware of robert nelson's github stuff, which
supports that sort of thing.

  so ... recommendations? i just want something that is configurable
and buildable from current layers that builds and boots on a BBB, and
is as bleeding edge as i can get without things blowing up. much.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


