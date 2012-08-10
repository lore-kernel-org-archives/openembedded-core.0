Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SzlOg-0004qE-OK
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:20:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2012 02:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,744,1336374000"; d="scan'208";a="184127726"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.232.205])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2012 02:07:51 -0700
Received: from moolinex.rb.intel.com (qa.rb.intel.com [10.237.100.11])
	by linux.intel.com (Postfix) with ESMTP id 9C5B02C8001;
	Fri, 10 Aug 2012 02:07:51 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 12:07:38 +0300
Message-Id: <e08b8918abd264f1754cf4878ea7033ba57d00b2.1344589278.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344589278.git.mihaix.lindner@linux.intel.com>
References: <cover.1344589278.git.mihaix.lindner@linux.intel.com>
Subject: [PATCH 1/1] sysklogd: removed tabs from syslog.conf
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
X-List-Received-Date: Fri, 10 Aug 2012 09:20:47 -0000

Yocto #2926: syslog.conf should not have tabs within the selector field.
Removed tabs from the selector field of syslog rules. Tabs or spaces
should be used, in syslog.conf, only when separating selectors from
actions.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 meta/recipes-extended/sysklogd/files/syslog.conf |   23 +++++++++++----------
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb   |    2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/files/syslog.conf b/meta/recipes-extended/sysklogd/files/syslog.conf
index 7d1858c..0849de1 100644
--- a/meta/recipes-extended/sysklogd/files/syslog.conf
+++ b/meta/recipes-extended/sysklogd/files/syslog.conf
@@ -34,12 +34,13 @@ news.notice			-/var/log/news.notice
 # Some `catch-all' logfiles.
 #
 *.=debug;\
-	auth,authpriv.none;\
-	news.none;mail.none	-/var/log/debug
+auth,authpriv.none;\
+news.none;mail.none	-/var/log/debug
+
 *.=info;*.=notice;*.=warn;\
-	auth,authpriv.none;\
-	cron,daemon.none;\
-	mail,news.none		-/var/log/messages
+auth,authpriv.none;\
+cron,daemon.none;\
+mail,news.none		-/var/log/messages
 
 #
 # Emergencies are sent to everybody logged in.
@@ -51,9 +52,9 @@ news.notice			-/var/log/news.notice
 # console I usually leave idle.
 #
 #daemon,mail.*;\
-#	news.=crit;news.=err;news.=notice;\
-#	*.=debug;*.=info;\
-#	*.=notice;*.=warn	/dev/tty8
+#news.=crit;news.=err;news.=notice;\
+#*.=debug;*.=info;\
+#*.=notice;*.=warn	/dev/tty8
 
 # The named pipe /dev/xconsole is for the `xconsole' utility.  To use it,
 # you must invoke `xconsole' with the `-file' option:
@@ -64,7 +65,7 @@ news.notice			-/var/log/news.notice
 #      busy site..
 #
 daemon.*;mail.*;\
-	news.err;\
-	*.=debug;*.=info;\
-	*.=notice;*.=warn	|/dev/xconsole
+news.err;\
+*.=debug;*.=info;\
+*.=notice;*.=warn	|/dev/xconsole
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
index 471c8c8..5c95889 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
@@ -1,5 +1,5 @@
 require sysklogd.inc
-PR = "r6"
+PR = "r7"
 
 SRC_URI[md5sum] = "e053094e8103165f98ddafe828f6ae4b"
 SRC_URI[sha256sum] = "6169b8e91d29288e90404f01462b69e7f2afb1161aa419826fe4736c7f9eb773"
-- 
1.7.8.6



