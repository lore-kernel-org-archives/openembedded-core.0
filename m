Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF1F738F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:32:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t269WcDo012804
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2015 01:32:39 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 01:32:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 01:32:33 -0800
Message-ID: <008e0da7a6c62109e58ea1418062b988cc68d8ef.1425634271.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] xinetd: fixe HOMEPAGE and SRC_URI
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
X-List-Received-Date: Fri, 06 Mar 2015 09:32:38 -0000
Content-Type: text/plain

The www.xinetd.org is not available, use github to instead of it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 288186e..98c4aeb 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Socket-based service activation daemon"
-HOMEPAGE = "http://www.xinetd.org"
+HOMEPAGE = "https://github.com/xinetd-org/xinetd"
 
 # xinetd is a BSD-like license
 # Apple and Gentoo say BSD here.
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 DEPENDS = ""
 PR = "r2"
 
-SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
+SRC_URI = "https://github.com/xinetd-org/xinetd/archive/xinetd-2-3-15.tar.gz \
       file://xinetd.init \
       file://xinetd.conf \
       file://xinetd.default \
@@ -20,8 +20,8 @@ SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.service \
       "
 
-SRC_URI[md5sum] = "77358478fd58efa6366accae99b8b04c"
-SRC_URI[sha256sum] = "bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3"
+SRC_URI[md5sum] = "dbd435d2bc822ea4566dd18632c09379"
+SRC_URI[sha256sum] = "620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c"
 
 inherit autotools update-rc.d systemd
 
@@ -35,6 +35,8 @@ EXTRA_OECONF="--disable-nls"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
 
+S = "${WORKDIR}/${BPN}-${BPN}-2-3-15"
+
 do_configure() {
 	# Looks like configure.in is broken, so we are skipping
 	# rebuilding configure and are just using the shipped one
-- 
1.7.9.5


