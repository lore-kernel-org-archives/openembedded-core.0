Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SCMCc-0003Sf-Hx
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 04:32:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2R2N5QY018185
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 19:23:05 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 19:23:06 -0700
Message-ID: <e9d2eb8bec97c9bd98bbd5ea2073924e284ba41b.1332814325.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 27 Mar 2012 10:03:24 +0800
Date: Tue, 27 Mar 2012 10:24:24 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] local.conf.sample.extended: The set for archiving packages
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
X-List-Received-Date: Tue, 27 Mar 2012 02:32:07 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

User can use these variables to get atchiving packages they want.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta-yocto/conf/local.conf.sample.extended |   32 ++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
index 9c5b974..731b7d6 100644
--- a/meta-yocto/conf/local.conf.sample.extended
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -182,3 +182,35 @@
 # when the disk space reduces 50M (or the amount of inode reduces 5k).
 #BB_DISKMON_WARNINTERVAL = "50M,5K"
 
+# Archiving packages configuration
+#
+# The following variables lists which files to archive and the package type to archive.
+# One bbclass of them (archive-original-source.bbclass,archive-patched-source.bbclass 
+# and archive-configured-source.bbclass) should be inherited in a global bbclass, for example,
+# intherit archive-original-source in packages_rpm.bbclass
+#
+# SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'}
+#SOURCE_ARCHIVE_PACKAGE_TYPE ?= 'tar'
+#
+# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = {'logs_with_scripts', 'logs'}
+# String 'logs_with_scripts' include temp directory and .bb and .inc files
+# String 'logs' only include temp 
+#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs_with_scripts'
+
+#
+# Archiving packages configuration
+#
+# The following variables lists which files to archive and the package type to archive.
+# One bbclass of them (archive-original-source.bbclass,archive-patched-source.bbclass 
+# and archive-configured-source.bbclass) should be inherited in a globale bbclass, for example,
+# intherit archive-original-source in packages_rpm.bbclass
+#
+# SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'}
+#SOURCE_ARCHIVE_PACKAGE_TYPE ?= 'tar'
+#
+# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = {'logs_with_scripts', 'logs'}
+# String 'logs_with_scripts' include temp directory and .bb and .inc files
+# String 'logs' only include temp 
+#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs_with_scripts'
+#
+
-- 
1.7.0.4



