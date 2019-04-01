Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 164807CFEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 01:43:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,294,1549900800"; d="scan'208";a="58163078"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 09:43:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8AC404CD6546
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 09:43:50 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 09:43:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 09:44:26 +0800
Message-ID: <20190401014426.7094-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 8AC404CD6546.A7A13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libatomic-ops:upgrade 7.6.8 -> 7.6.10
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
X-List-Received-Date: Mon, 01 Apr 2019 01:43:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libatomic-ops_7.6.8.bb to libatomic-ops_7.6.10.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libatomic-ops/libatomic-ops_7.6.10.bb     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
new file mode 100644
index 0000000000..7628eedb1b
--- /dev/null
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A library for atomic integer operations"
+HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
+SECTION = "optional"
+PROVIDES += "libatomics-ops"
+LICENSE = "GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
+                    "
+
+SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
+
+SRC_URI[md5sum] = "90a78a84d9c28ce11f331c25289bfbd0"
+SRC_URI[sha256sum] = "587edf60817f56daf1e1ab38a4b3c729b8e846ff67b4f62a6157183708f099af"
+
+S = "${WORKDIR}/libatomic_ops-${PV}"
+
+ALLOW_EMPTY_${PN} = "1"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1




