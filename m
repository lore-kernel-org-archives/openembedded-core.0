Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32EB5601F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 07:24:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T7OSje010714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 29 Aug 2017 00:24:28 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 Aug 2017 00:24:27 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>
Date: Tue, 29 Aug 2017 15:25:16 +0800
Message-ID: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 1/2] libmnl: add recpie
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
X-List-Received-Date: Tue, 29 Aug 2017 07:24:28 -0000
Content-Type: text/plain

libmnl is a minimalistic user-space library oriented to Netlink
developers. There are a lot of common tasks in parsing, validating,
constructing of both the Netlink header and TLVs that are repetitive
and easy to get wrong.

Move it from meta-networking to oe-core as it is a dependency for
iproute2 to support tipc.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libmnl/libmnl_1.0.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-support/libmnl/libmnl_1.0.4.bb

diff --git a/meta/recipes-support/libmnl/libmnl_1.0.4.bb b/meta/recipes-support/libmnl/libmnl_1.0.4.bb
new file mode 100644
index 0000000..b458799
--- /dev/null
+++ b/meta/recipes-support/libmnl/libmnl_1.0.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Minimalistic user-space Netlink utility library"
+DESCRIPTION = "Minimalistic user-space library oriented to Netlink developers, providing \
+    functions for common tasks in parsing, validating, and constructing both the Netlink header and TLVs."
+HOMEPAGE = "http://www.netfilter.org/projects/libmnl/index.html"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://www.netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "be9b4b5328c6da1bda565ac5dffadb2d"
+SRC_URI[tar.sha256sum] = "171f89699f286a5854b72b91d06e8f8e3683064c5901fb09d954a9ab6f551f81"
+
+inherit autotools pkgconfig
-- 
2.7.4


