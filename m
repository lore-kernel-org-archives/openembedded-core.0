Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB7577457
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 11:57:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2016 04:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="990335431"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 03 Jun 2016 04:39:35 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BC2E76A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 05:27:02 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 14:39:50 +0300
Message-Id: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] rpm: update patch to support db-6.2.23
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jun 2016 11:58:00 -0000

Refresh the rpm-db60.patch to support db-6.2.23

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-db60.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
index b4df8b7..403f3cb 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
@@ -13,11 +13,11 @@ Index: rpm/configure.ac
  [RPM_CHECK_LIB(
      [Berkeley-DB], [db],
 -    [db-6.1], [db_create], [db.h],
-+    [db-6.0], [db_create], [db.h],
++    [db-6.2], [db_create], [db.h],
      [yes,external], [db6],
      [ DBLIBSRCS="$DBLIBSRCS db3.c"
 -      DBXY=db61
-+      DBXY=db60
++      DBXY=db62
        AM_CONDITIONAL(WITH_DB, [ true ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
        if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
@@ -26,7 +26,7 @@ Index: rpm/configure.ac
  ])
  
 -if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
-+if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
++if test ".$ac_cv_lib_db_6_2_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
      CPPFLAGS="${CPPFLAGS_save}"
  fi
  
@@ -36,12 +36,12 @@ Index: rpm/configure.ac
  
 -dnl # Sqlite 3.8.3.1 from db-6.1.19
 -if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
-+dnl # Sqlite 3.8.3.1 from db-6.0.30
-+if test ".$ac_cv_lib_db_6_0_db_create" = .yes; then
++dnl # Sqlite 3.8.3.1 from db-6.2.23
++if test ".$ac_cv_lib_db_6_2_db_create" = .yes; then
  RPM_CHECK_LIB(
      [Berkeley-DB (+SQLite3)], [dbsql],
 -    [db_sql-6.1], [sqlite3_open], [dbsql.h],
-+    [db_sql-6.0], [sqlite3_open], [dbsql.h],
++    [db_sql-6.2], [sqlite3_open], [dbsql.h],
      [yes,external], [db6/sql],
      [
        AM_CONDITIONAL(WITH_DBSQL, [ true ])
-- 
2.4.0


