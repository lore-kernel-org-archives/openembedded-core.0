Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QzNwb-0000uL-KG
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 09:13:41 +0200
Received: by wwe32 with SMTP id 32so2088371wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2011 00:08:43 -0700 (PDT)
Received: by 10.227.135.4 with SMTP id l4mr687835wbt.89.1314947322908;
	Fri, 02 Sep 2011 00:08:42 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m2sm666292wbp.5.2011.09.02.00.08.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Sep 2011 00:08:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 09:08:38 +0200
Message-Id: <1314947318-17889-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dropbear: add missing files
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
X-List-Received-Date: Fri, 02 Sep 2011 07:13:41 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dropbear/dropbear/dropbear       |    4 ++++
 .../dropbear/dropbear-configuration-file.patch     |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch

diff --git a/meta/recipes-core/dropbear/dropbear/dropbear b/meta/recipes-core/dropbear/dropbear/dropbear
new file mode 100644
index 0000000..47e787f
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear
@@ -0,0 +1,4 @@
+#%PAM-1.0
+
+auth     include  common-auth
+account  include  common-account
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch
new file mode 100644
index 0000000..5e94553
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch
@@ -0,0 +1,18 @@
+dropbear: Change the path ("/etc/pam.d/sshd" as default) to find a pam configuration file \
+to "/etc/pam.d/dropbear for dropbear when enabling pam supporting" 
+
+Upstream-Status: Inappropriate [configuration] 
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/svr-authpam.c	2008-11-11 22:09:03.000000000 +0800
++++ b/svr-authpam.c.new	2011-08-29 09:53:24.000000000 +0800
+@@ -199,7 +199,7 @@
+ 	userData.passwd = password;
+ 
+ 	/* Init pam */
+-	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
++	if ((rc = pam_start("dropbear", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
+ 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s\n", 
+ 				rc, pam_strerror(pamHandlep, rc));
+ 		goto cleanup;
-- 
1.6.6.1



