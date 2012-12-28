Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TohvS-0007PI-N3
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 22:57:11 +0100
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 91D062FEF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 16:42:10 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:41:39 -0800
Message-Id: <c806466c8d4a9d0d4a66d34d3565d5879c2f2b0f.1356730817.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 91D062FEF1.3678B
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 06/15] sysklogd: removed tabs from syslog.conf
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
X-List-Received-Date: Fri, 28 Dec 2012 21:57:12 -0000

From: Mihai Lindner <mihaix.lindner@linux.intel.com>

Yocto #2926: syslog.conf should not have tabs within the selector field.
Removed tabs from the selector field of syslog rules. Tabs or spaces
should be used, in syslog.conf, only when separating selectors from
actions.

(From OE-Core rev: 1316be4e597332a629842b3f5a7dde8e45dd057d)

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Resolved merge conflicts with denzil branch.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-extended/sysklogd/files/syslog.conf |   23 +++++++++++-----------
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
index b58094e..471c8c8 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
@@ -1,5 +1,5 @@
 require sysklogd.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "e053094e8103165f98ddafe828f6ae4b"
 SRC_URI[sha256sum] = "6169b8e91d29288e90404f01462b69e7f2afb1161aa419826fe4736c7f9eb773"
-- 
1.7.9.5



