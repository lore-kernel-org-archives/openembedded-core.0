Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 48C1771F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 08:25:33 +0000 (UTC)
Received: from [99.240.204.5] (port=36736 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YQXHe-0007oq-EL for openembedded-core@lists.openembedded.org;
	Wed, 25 Feb 2015 03:25:30 -0500
Date: Wed, 25 Feb 2015 03:25:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1502250320080.23957@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: on current linux distros, what are potential candidates for ASSUME_PROVIDED?
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
X-List-Received-Date: Wed, 25 Feb 2015 08:25:35 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  for the sake of reducing build time in the classroom, what are some
of the potential (and relatively safe) candidates to add to
ASSUME_PROVIDED for a build from scratch?

  i do recall that, once one starts adding more native packages to
that variable, QA becomes an issue but, given a modern distro such as
fedora 21, surely there are quite a number of packages that are safe
to add.

  the first thing i always add is "subversion-native" (since i don't
think subversion is even *used* in a core-image-minimal build, but i
could be wrong). i'm looking through all the -native builds and can
see other possible candidates i'm going to try -- open to suggestions
as to what should be safe, and i'll test it out.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

