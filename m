Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SrO6p-0003L0-VP
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 08:51:44 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so1867165pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=raufTfh9/KbI4BPYyeR8UA8u1Pp1JW2818KHKWsnbsQ=;
	b=Ln/NS2bugBADX2NBFwkSQDfnSE2Q5zNhF/3My6WfEpIRfPPLVyNtlV6tSwLvOUMGft
	MWD1y5eN3I51W9My/fQ51TGl1yefMLZlyiaj79HSdY0FSitz1HEdh/JKFLXj7ZC24Ynu
	DhuKV/j15ROf6UEDuZStvJ3Ey9q3KS9JDrqmoEPj2L5nSi9E2HEpWSgDswvgyK/5VTWU
	XO+uYF+ZONVuiwAO7DN49On++n/CXdGLfRreaUt5e+mG0stEN0JKToQNAbaMXCWvkFUZ
	qc/TU2XWrTjdY4SlX6SIg+5bO+iQgKgX77D7gDu614MXQxjBD99hjjVdy0+2AimBmj5l
	sS0g==
Received: by 10.68.228.2 with SMTP id se2mr4800738pbc.109.1342593625549;
	Tue, 17 Jul 2012 23:40:25 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nu5sm12312410pbb.53.2012.07.17.23.40.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 23:40:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 23:39:41 -0700
Message-Id: <2c267bc1b21789757917a79db314843f92ffbc54.1342593440.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5b71a358dafc84c8ac1ed6dd48a48eefaf0328b1.1342593440.git.raj.khem@gmail.com>
References: <5b71a358dafc84c8ac1ed6dd48a48eefaf0328b1.1342593440.git.raj.khem@gmail.com>
In-Reply-To: <cover.1342593440.git.raj.khem@gmail.com>
References: <cover.1342593440.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] recipes: Change 'proto' to 'protocol' in SRC_URI
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
X-List-Received-Date: Wed, 18 Jul 2012 06:51:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
 .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
index 88c701e..0f870be 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
@@ -16,7 +16,7 @@ inherit autotools
 PR = "r0"
 SRCREV="19383"
 EGLIBC_BRANCH="eglibc-2_16"
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
1.7.9.5



