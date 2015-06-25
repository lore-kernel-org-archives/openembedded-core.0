Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id C23B96AC15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 19:46:54 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so55300374pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t/QuOF6EoZvUpyIUIKxFSNJ/Mwk3vtCVwTmpaVw4k8Q=;
	b=pj8USwo36rM6SyEgVfM7e06jqOnx5zQYANKUP6hC+p407xv2ts5nEoDexK1rwwveYY
	xiK5xzolK46alqX7ByCmh21re9bOO/MIEn9d5ecDbQa9se0rCSKbe2d776fo9mCn0mmc
	dWK0LhqLSE6Hr1czwc41c/lUHLluXeYugd+VfaKNSxWGNNqz8/918DYVB40xE4OhZYV2
	tZPL2pG6LgomPISidBZbObLjz4xlUvBA9CZJ4uU4e3aE0MVUkQWKpRcr7RNbtRHF8jbv
	u9A45XDBZe/00IM1gYZSLjBsnLL9Yv3hAqfVjWCrlA5VIDqstAAkK1nfxmPV/CvbTxRI
	QvNg==
X-Received: by 10.66.65.195 with SMTP id z3mr57766796pas.6.1435261615376;
	Thu, 25 Jun 2015 12:46:55 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	i10sm30936327pdr.78.2015.06.25.12.46.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jun 2015 12:46:54 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 12:46:45 -0700
Message-Id: <1435261607-2512-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] pbzip2: add initial recipe, pbzip2 v1.1.12
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
X-List-Received-Date: Thu, 25 Jun 2015 19:46:57 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
new file mode 100644
index 0000000..fb70d0c
--- /dev/null
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
@@ -0,0 +1,27 @@
+SUMMARY = "PBZIP2 is a parallel implementation of bzip2"
+DESCRIPTION = "PBZIP2 is a parallel implementation of the bzip2 block-sorting \
+file compressor that uses pthreads and achieves near-linear speedup on SMP \
+machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
+newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
+HOMEPAGE = "http://compression.ca/pbzip2/"
+SECTION = "console/utils"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c4f2edec9679d5abef3514a816b54a4"
+
+DEPENDS = "bzip2"
+
+SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "91a4911b13305850423840eb0fa6f4f9"
+SRC_URI[sha256sum] = "573bb358a5a7d3bf5f42f881af324cedf960c786e8d66dd03d448ddd8a0166ee"
+
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = "CXX='${CXX} ${CXXFLAGS}' LDFLAGS='${LDFLAGS}'"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 pbzip2 ${D}${bindir}/
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


