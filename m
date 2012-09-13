Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TC7di-0002SX-8j
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 13:31:23 +0200
Received: from localhost ([127.0.0.1]:40044 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TC7RY-0008JF-4I; Thu, 13 Sep 2012 11:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=wlv642RlkbASAUqpq1KkCumM
	lNM=; b=qeHQ5W8aQzZiJyB8KGTTpzZPM0seYc6UYyU4wWwfI+vbm49hOWRX6CzM
	50ByO103DEGfTCu8HTy72kL1L2vsGS6EKABpZjbAQicWErIB+6FR0WSpv7Wv/IQq
	XiDIfrPA1GnMHt+2mHZeGNqymJvqIjM8QDo4Uk69ClMVp6N5EIc=
Received: from [195.171.99.130] (port=8473 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TC7RX-0008JA-SF; Thu, 13 Sep 2012 11:18:47 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 12:20:04 +0100
Message-Id: <1347535204-25960-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] local.conf.sample: change valgrind support architecture comment
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
X-List-Received-Date: Thu, 13 Sep 2012 11:31:23 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

The comment for debug-tools states valgrind will only be installed for x86
targets. This is not true as valgrind now supports x86*, PPC* and ARMv7a;
alter the comment to reflect this.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 5679c03..cf35310 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -119,7 +119,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 #                     (useful if you want to develop against libs in the image)
 #  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
 #  "tools-debug"    - add debugging tools (gdb, strace)
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind(x86*, armv7a, ppc*))
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
 #  "debug-tweaks"   - make an image suitable for development
 #                     e.g. ssh root access has a blank password
-- 
1.7.12



