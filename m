Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 093D760102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 11:11:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 03:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17464948"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Feb 2018 03:11:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 13:05:12 +0200
Message-Id: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH 01/10] cryptodev: switch SRC_URI to git
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
X-List-Received-Date: Mon, 12 Feb 2018 11:11:35 -0000

One of the tarball mirrors is down; the other is blocked by Intel's corporate proxy
for being deemed 'suspicious' (the same problem might pop up in other
companies as well). Let's just take the source from github.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 50366e72024..ab15bc1d971 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -3,11 +3,9 @@ HOMEPAGE = "http://cryptodev-linux.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://nwl.cc/pub/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
+SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux"
+SRCREV = "87d959d9a279c055b361de8e730fab6a7144edd7"
 
-SRC_URI[md5sum] = "cb4e0ed9e5937716c7c8a7be84895b6d"
-SRC_URI[sha256sum] = "9f4c0b49b30e267d776f79455d09c70cc9c12c86eee400a0d0a0cd1d8e467950"
-
-S = "${WORKDIR}/cryptodev-linux-${PV}"
+S = "${WORKDIR}/git"
 
 CLEANBROKEN = "1"
-- 
2.15.1


