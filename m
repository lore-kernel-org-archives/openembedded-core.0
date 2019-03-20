Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 47FA47C410
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 14:09:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44PWy21zXSz5c
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 15:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553090970;
	bh=xooJjCZegRPA51DyzoQ7v+8EKTDYE+Y8ElVSkf4WOgY=;
	h=From:To:Subject:Date:From;
	b=B1dSJTHWQGmx0YDhDetCfrCutVE7VgkwVi78wsDuEea1X5GDflx/OplrsFKnWbbyD
	YyXyBSU2daGmoL7OcYJJbTRsFegiFDp7fiyPBu3CGOELvcxVbziWAeZ2D7ZFrde9fV
	5av7wpaIftX14Mrnm9T2oriFjV4HuzkyFyTjWwKk4/cYhmXR7iHMWN5jVtKQU5s7J0
	ynlMvA8MYyxefQDxRYeS/7sYWoYkzFc6oozlkHLCDshVxlmyzXTcNetkkXgo1htRmn
	xLBwCe+kB0t3rEyW+qp5pIjLMuVRJGbpZGmZYEhS1A90dBKFESFvG0YF5FWCvBeZNb
	n46nkRJxyAqadGHP+QUxDHlTAKHi/ClvD7BqSIJ7n4MqLgB55/k+8VQM46AhlByCuZ
	93kFcdjkIQ75Iju0e5+n7UQquCWnFyDbMzTVEd2T1ydsrlvkN7WYii2pzcglzaHL9g
	GydTCqhrbFRm4reSm+PJnBWx4wkCB85mD3S5rklYvqkpPxCXPfp9GEB1oZYHkSK4FY
	xbIHwZeOkYsKhdJQA3qo715quEldzqkYbbOQN+bEuY7HUIvQUVNJ89gKcUOiHdbigc
	aSBcptdpzJx95TrrDL+ArIAsnnoBtshLV+wygebTSAmbXVARwDJ71nHzr9zAPVxvIn
	iUgFuI4/OrTiEE1juGE8IxWE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2019 16:09:29 +0200
Message-Id: <20190320140929.24410-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bind: Upgrade 9.11.5 -> 9.11.6
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
X-List-Received-Date: Wed, 20 Mar 2019 14:09:30 -0000

Copyright hash changed to to year change.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...0001-configure.in-remove-useless-L-use_openssl-lib.patch | 4 ++--
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 .../bind/{bind_9.11.5.bb => bind_9.11.6.bb}                 | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.6.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
index 871bb2a5f6..92a84a206c 100644
--- a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
@@ -16,8 +16,8 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 diff --git a/configure.in b/configure.in
 index 54efc55..76ac0eb 100644
---- a/configure.in
-+++ b/configure.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -1691,7 +1691,7 @@ If you don't want OpenSSL, use --without-openssl])
  				fi
  				;;
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 37e210e6da..f686862d3d 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -33,8 +33,8 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 
 Index: bind-9.11.3/configure.in
 ===================================================================
---- bind-9.11.3.orig/configure.in
-+++ bind-9.11.3/configure.in
+--- bind-9.11.3.orig/configure.ac
++++ bind-9.11.3/configure.ca
 @@ -2574,7 +2574,7 @@ case "$use_libjson" in
  		libjson_libs=""
  		;;
diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recipes-connectivity/bind/bind_9.11.6.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.5.bb
rename to meta/recipes-connectivity/bind/bind_9.11.6.bb
index 67672792b1..36c3425cfe 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -22,8 +22,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
 "
 
-SRC_URI[md5sum] = "17a0d02102117c9a221e857cf2cc8157"
-SRC_URI[sha256sum] = "a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322"
+SRC_URI[md5sum] = "4882bd3eeef779e05b515b32354cc081"
+SRC_URI[sha256sum] = "4499007f3a6b8bba84fc757053caeabf36466d6f7d278baccef9fd109beac6d4"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
-- 
2.17.1


