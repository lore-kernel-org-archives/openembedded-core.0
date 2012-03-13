Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7RHr-0002Y3-Vr
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 13:57:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2DCmRjd028865
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 05:48:27 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 13 Mar 2012 05:48:27 -0700
Message-ID: <404febfffd308c4a39682210456761c6bdbc8edb.1331642569.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1331642569.git.xiaofeng.yan@windriver.com>
References: <cover.1331642569.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 13 Mar 2012 20:23:01 +0800
Date: Tue, 13 Mar 2012 20:52:30 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] local.conf.sample: Add set for archiving packages
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
X-List-Received-Date: Tue, 13 Mar 2012 12:57:12 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

User can use these variables to get atchiving packages they want.

[YOCTO #1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta-yocto/conf/local.conf.sample |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index 38507e3..6f16c9a 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -121,6 +121,31 @@ DISTRO ?= "poky"
 PACKAGE_CLASSES ?= "package_rpm"
 
 #
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
+# PATCHES_ARCHIVE_WITH_SERIES = {'true', 'false'}
+# Strings 'true' means that patches including series files(series + non-applying)
+# String 'false' means that no series and only archive applying patches
+#PATCHES_ARCHIVE_WITH_SERIES ?= 'true'
+#
+# Archive packages for copyleft(GPL*,LGPL*)
+#COPYLEFT_COMPLIANCE ?= 'true'
+#
+
+#
 # SDK/ADT target architecture
 #
 # This variable specified the architecture to build SDK/ADT items for and means
-- 
1.7.0.4



