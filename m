Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1Sroy0-0002T7-P2
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 13:32:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=2983; q=dns/txt;
	s=iport; t=1342696865; x=1343906465;
	h=from:to:cc:subject:date:message-id;
	bh=vgsrzulKQcTTVuw+Mv3BnnDKrjoEOPGeVy8tjyunq9s=;
	b=EwiKJE21KoDxfm1cR1amiLRDqaEOgdgYDpQgAW1QRzPSQ0eW5auL1ci8
	D+RFsWj0t5QHtCn+XBTEBFK8vVb0QhduQVicHujmIWw+hsSf/3ls64nV9
	gu9HbGcqIT+xPgW3mnQ/rKKGan+xxheubuMS6cZ+gEjbyZ9zzykjFgzCX 0=;
X-IronPort-AV: E=Sophos;i="4.77,615,1336348800"; 
   d="scan'208";a="6748930"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-3.cisco.com with ESMTP; 19 Jul 2012 11:19:58 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q6JBJwra003560;
	Thu, 19 Jul 2012 11:19:58 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:15:17 +0200
Message-Id: <1342696517-28149-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Cc: Martin Ertsaas <mertsas@cisco.com>
Subject: [PATCH] Changed SRC_URI for eglibc repo.
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
X-List-Received-Date: Thu, 19 Jul 2012 11:32:24 -0000

The branches repo for eglibc is /branches, not /svn/branches.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
 .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
index 422e0bb..4301174 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
@@ -16,7 +16,7 @@ inherit autotools
 PR = "r0"
 SRCREV="15225"
 EGLIBC_BRANCH="eglibc-2_14"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
+SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
 
 do_unpack_append() {
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
index 47f0834..12f1d8b 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
@@ -16,7 +16,7 @@ inherit autotools
 PR = "r0"
 SRCREV="19383"
 EGLIBC_BRANCH="eglibc-2_16"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
+SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
 
 do_unpack_append() {
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 4d4d2cf..a72b076 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -7,7 +7,7 @@ PR = "r12"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
+SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 7e7d68b..d0cdd68 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -7,7 +7,7 @@ PR = "r1"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
+SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
-- 
1.7.8.6



