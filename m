Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbU1v-0000cO-LU
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 11:29:11 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 94375D224F;
	Thu, 22 Nov 2012 11:15:14 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2012 11:15:01 +0100
Message-Id: <1353579301-1209-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1424745.oM7gvEqakJ@helios>
References: <1424745.oM7gvEqakJ@helios>
Subject: [PATCH] archiver.bbclass: DISTRO is not required variable so deal with it
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
X-List-Received-Date: Thu, 22 Nov 2012 10:29:11 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/classes/archiver.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 160a3aa..a4a2158 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -8,7 +8,6 @@
 
 ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
 ARCHIVE_TYPE ?= "tar srpm"
-DISTRO ?= "poky"
 PATCHES_ARCHIVE_WITH_SERIES = 'yes'
 SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE', 'log_type') \
     if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
@@ -491,7 +490,7 @@ def create_diff_gz(d):
     f.close()
 
     s=d.getVar('S', True)
-    distro = d.getVar('DISTRO',True)
+    distro = d.getVar('DISTRO',True) or ""
     dest = s + '/' + distro + '/files'
     if not os.path.exists(dest):
         bb.mkdirhier(dest)
-- 
1.8.0



