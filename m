Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Tt0PZ-0001Is-Fe
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 19:30:11 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:43260 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tt0As-0005NV-Qy for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 13:14:50 -0500
Date: Wed, 9 Jan 2013 13:14:47 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301091312270.14396@oneiric>
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
Subject: [PATCH] local.conf.sample: Suggest parallelism of twice the number of cores.
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
X-List-Received-Date: Wed, 09 Jan 2013 18:30:13 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


To be consistent with the Yocto Quick Start Guide, recommend that
parallelism represent twice the number of cores on a multi-core
machine.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 859eb93..46187ce 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -24,9 +24,9 @@
 #
 #PARALLEL_MAKE = "-j 4"
 #
-# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
-# be appropriate for example.
-
+# If you have a multi-core machine, you would normally set both of these variables
+# to twice the number of cores.  So for a quad-core machine, it would be appropriate
+# to set BB_NUMBER_THREADS = "8" and PARALLEL_MAKE = "-j 8".
 #
 # Machine Selection
 #

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


