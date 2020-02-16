Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 321D360B21
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 09:37:40 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:58776 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>) id 1j3GMu-001fjd-4r
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Feb 2020 04:37:41 -0500
Date: Sun, 16 Feb 2020 04:37:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2002160429430.2239483@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: task i was asked about: "Fix java build to not use host java"
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
X-List-Received-Date: Sun, 16 Feb 2020 09:37:40 -0000
Content-Type: text/plain; charset=US-ASCII


  (NOTE: while this was asked in the context of the latest wind river
linux, i'm guessing it applies to stock OE/YP.)

  regarding a WRL project that i haven't actually seen yet, one of the
items on a TO DO list reads, "Fix java build to not use host java",
and i'm trying to clarify what that might mean without yet seeing the
project.

  as i read that brief item, i'm assuming that this is a java-based
project wherein some java recipes must be compiled and added to the
image and, currently, it's the host java compiler that is being used,
whereas they want a java compiler to be compiled, added to the native
sysroot, and used for all java compilation.

  i'm aware of bitbake.conf's ASSUME_PROVIDED variable which says
nothing about java, and i've never worked on a java-flavoured OE
project before, so i'm curious as to whether the host java would be
used by default, and how to override that.

  does this make sense? a pointer to some reasonable example of a
java-infused YP project would probably suffice, and i'm aware of the
meta-java layer, which i assume will be dragged in. i have no details
beyond this at the moment, just trying to figure out what that task
might mean.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

