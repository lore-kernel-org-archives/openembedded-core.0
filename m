Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SnXLs-00069h-8X
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 17:55:20 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:60322 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnXB8-000073-9G for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 11:44:14 -0400
Date: Sat, 7 Jul 2012 11:43:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207071126550.20571@oneiric>
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
Subject: what's the easiest way to see the difference some local configuration makes?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2012 15:55:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i recall that there's a current request to be able to list the
packages and versions that relate *just* to the current target and
machine, so i'm looking for any other way to do this so students can
see the difference for themselves.

  for example, i'm starting with a configuration of "qemuarm", and i
can do a fetchall:

$ bitbake -c fetchall core-image-minimal

and let that run.  so far, so good -- i've now fetched everything
required for this target.  if i repeat that command, obviously,
nothing should change, and it doesn't.  (i don't even have to build
the target, i'm just doing fetching for now.)

  now let's say i add to my local.conf:

IMAGE_INSTALL_append = " strace"

i suspect there's an easier way to see this, but if i want to *prove*
that the strace recipe would be part of the build, i can do:

$ bitbake -c fetchall -n core-image-minimal     [dry run]

to get:

... snip ...
NOTE: Running task 302 of 309 (ID: 21, /home/rpjday/oe/oe-core/meta/recipes-devtools/strace/strace_4.7.bb, do_fetch)
NOTE: Running task 309 of 309 (ID: 1, /home/rpjday/oe/oe-core/meta/recipes-core/images/core-image-minimal.bb, do_fetchall)
NOTE: Tasks Summary: Attempted 309 tasks of which 307 didn't need to be rerun and all succeeded.
$

  so that's "proof" that i've officially added strace to my
core-image-minimal.

  i'm sure that's massive overkill -- is there a simpler way to
demonstrate this?  i want to start simple by adding a single package,
then move on to adding multiple packages, and features and so on, and
let the student see the effect of each change.

  what's the easiest way to do that?  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


