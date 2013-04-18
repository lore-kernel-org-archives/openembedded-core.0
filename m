Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1USrtP-0003AH-5L
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 18:41:06 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:49963 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1USrcR-0003Rj-8t for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 12:23:31 -0400
Date: Thu, 18 Apr 2013 12:23:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1304181219550.8010@oneiric>
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
Subject: [PATCH] local.conf.sample: Have comments ready to go for quad-core (4 -> 8).
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 16:41:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Have default, commented values for parallelism reflect quad-core
hosts.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'll admit it, i'm just lazy as i do all my work on a quad-core
system and i'm constantly changing 4 to 8. and the proper values for a
quad-core system *should* be 4, not 8, anyway, isn't that right?

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 85205c5..85164a0 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -17,14 +17,14 @@
 # These two options control how much parallelism BitBake should use. The first
 # option determines how many tasks bitbake should run in parallel:
 #
-#BB_NUMBER_THREADS = "4"
+#BB_NUMBER_THREADS = "8"
 #
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-#PARALLEL_MAKE = "-j 4"
+#PARALLEL_MAKE = "-j 8"
 #
-# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
+# For a quad-core machine, BB_NUMBER_THREADS = "8", PARALLEL_MAKE = "-j 8" would
 # be appropriate for example.

 #

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


