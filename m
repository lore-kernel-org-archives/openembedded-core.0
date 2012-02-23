Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuW-0001fg-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElr17002890 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:53 GMT
X-Quarantine-ID: <Oj3mllZ6uvP6>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Oj3mllZ6uvP6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:53 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElonZ002878
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:51 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0YsX-0003z1-Iq
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:38:37 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:12 +0000
Message-Id: <008428eeaf897d9d18e070097cfc82e706913539.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/16] libusb1: Address unpackaged files warning
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
X-List-Received-Date: Thu, 23 Feb 2012 14:44:44 -0000

WARNING: For recipe libusb1, the following files/directories were installed but not shipped in any package:
WARNING:   /lib/libusb-1.0.la

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libusb/libusb1_1.0.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
index e45a9d9..b8fa790 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
 
@@ -27,4 +27,4 @@ do_install_append() {
 
 FILES_${PN} += "${base_libdir}/*.so.*"
 
-FILES_${PN}-dev += "${base_libdir}/*.so"
+FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
-- 
1.7.5.4



