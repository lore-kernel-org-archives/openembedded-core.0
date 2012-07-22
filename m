Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1St545-0003iv-Iv
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 00:55:53 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:45174 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1St4t2-0002Ng-E8 for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 18:44:28 -0400
Date: Sun, 22 Jul 2012 18:44:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207221827200.3110@oneiric>
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
Subject: how to see the *effect* of changing the configuration for a build?
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
X-List-Received-Date: Sun, 22 Jul 2012 22:55:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  ok, i'm just going to ask for piles of advice on what (bitbake)
commands and options i can use to see the effect of various changes to
a build's configuration as part of a tutorial.

  as a starting point, i've built a core-image-minimal target for a
qemuarm machine, just to keep things simple so this doesn't require
any hardware.

  i realize i can use variations of "bitbake -e" to see the
environment, but i'm curious if there are shorter ways.  for instance,
if i want to demonstrate how to add a single package to a build, i can
add the following to local.conf:

  IMAGE_INSTALL_append = " strace"

but what's the easiest way to verify that that package will be
incorporated into a new build without actually doing the build?  one
option is to simply do a dry run of fetchall, to see what would need
to be fetched:

$ bitbake -n -c fetchall core-image-minimal
... snip ...
NOTE: Running task 279 of 286 (ID: 21, /home/rpjday/oe/oe-core/meta/recipes-devtools/strace/strace_4.7.bb, do_fetch)
NOTE: Running task 286 of 286 (ID: 1, /home/rpjday/oe/oe-core/meta/recipes-core/images/core-image-minimal.bb, do_fetchall)
NOTE: Tasks Summary: Attempted 286 tasks of which 284 didn't need to be rerun and all succeeded.
$

but that's a bit messy (and if, for some reason, strace has already
been fetched, it wouldn't be listed).  i could also check the bitbake
environment, which i can see has numerous references to "strace".
but is there a cleaner way?  i'd then work my way up to adding more
packages, then IMAGE_FEATURES and so on, showing the effect at each
step, ideally without having to spend time doing a rebuild every time.

  with layers, it's easier as i can use bitbake-layers, so i'm good
with that.  anyway, suggestions as to how to display configuration
changes appreciated.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


