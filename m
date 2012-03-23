Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SB7dS-00087p-64
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:46:42 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 17:37:36 +0100
Message-Id: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/4] procps: use update-alternatives for pwdx, pgrep and watch
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
X-List-Received-Date: Fri, 23 Mar 2012 16:46:42 -0000

* pwdx, pgrep and watch may be provided by busybox.
* Use update-alternatives to avoid conflict.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-extended/procps/procps_3.2.8.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 27d2b5c..683badc 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,11 +1,12 @@
 require procps.inc
 
-PR = "r5"
+PR = "r6"
 
 inherit update-alternatives
 
 ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
-                     ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
+                     ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps \
+                     ${bindir}/pgrep ${bindir}/pwdx ${bindir}/watch"
 ALTERNATIVE_PRIORITY = "110"
 
 SRC_URI += "file://procmodule.patch \
-- 
1.7.5.4



