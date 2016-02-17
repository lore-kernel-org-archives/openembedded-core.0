Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E5058731B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1HA9aW8007056 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:09:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jprFSL27_RTR
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:09:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1HA9UqU007052
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:09:32 GMT
Message-ID: <1455703770.28376.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 10:09:30 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] debianutils: Fix SRC_URI to use debian snapshot
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
X-List-Received-Date: Wed, 17 Feb 2016 10:09:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This allows checkuri to pass since the old version is no longer in the 
debian pool.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/debianutils/debianutils_4.5.1.bb b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
index 77ab6da..884d4bd 100644
--- a/meta/recipes-support/debianutils/debianutils_4.5.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
@@ -3,7 +3,10 @@ SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20151006T155028Z//pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
 SRC_URI[md5sum] = "487524518cd5833a6a4f7007b5d1bd5b"
 SRC_URI[sha256sum] = "a531c23e0105fe01cfa928457a8343a1e947e2621b3cd4d05f4e9656020c63b7"



