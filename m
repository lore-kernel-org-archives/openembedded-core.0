Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr4Ps-0004ds-1A
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 11:50:04 +0200
Received: by wgbdr1 with SMTP id dr1so187107wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 02:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=leT/60jCKPUlSfvumraD+8iTmXg+st/ABYUwYsXkc90=;
	b=x6U5ozlGjYTtkJTo2F3hhZ/dbp6dfSX9VeaK1ct13HJHP1lrQAQlWAbz5yS6PZL6ob
	E8Iv6uYdL3afZnSBsXW/ABFVg+9cGuNzjk4cJPBwseaEILEQ12+nED2P8EIaXV+S19Pf
	gwpl8XnengDACFQ6UTmdoi6pzY9FknBa2aQDrdjtN4ObH46dinXFSPYBsfFu1T0dHhMg
	m9N/hhZo+j7nPd0K2tWLmemfcFt0TWTkeEBhxZWjCHw+DIMZKrUd4Al+Mtmaa5tmH56L
	+fiL4GWf9Lg7m+16/pC297FuXXgyN6SPjfU3GFdUkXVgM7I2gut+Ij+9xr45SevOzP2b
	kOkg==
Received: by 10.180.82.39 with SMTP id f7mr2701244wiy.2.1342517925046;
	Tue, 17 Jul 2012 02:38:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm38729148wiy.4.2012.07.17.02.38.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 02:38:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 11:38:52 +0200
Message-Id: <1342517932-27013-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] recipes: svn SRC_URI s/proto=/protocol=/g
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
X-List-Received-Date: Tue, 17 Jul 2012 09:50:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
index 6f311fc..493eb61 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
@@ -16,7 +16,7 @@ inherit autotools
 PR = "r0"
 SRCREV="15225"
 EGLIBC_BRANCH="eglibc-2_14"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
 
 do_unpack_append() {
diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/recipes-multimedia/tremor/tremor_20120314.bb
index 19d03d6..cf51983 100644
--- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20120314.bb
@@ -8,7 +8,7 @@ DEPENDS = "libogg"
 SRCDATE = "${PV}"
 PR = "r0"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;proto=http"
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http"
 
 S = "${WORKDIR}/Tremor"
 
-- 
1.7.8.6



