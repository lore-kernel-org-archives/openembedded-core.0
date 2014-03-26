Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB7A6FA4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:15:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2QAFv50022348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:15:58 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 26 Mar 2014 03:15:57 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 18:15:57 +0800
Message-ID: <a1ff6a91da21f19e5365114dca7ae942803efcd6.1395825881.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395825881.git.kai.kang@windriver.com>
References: <cover.1395825881.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/3] cryptodev-linux: add recipe
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
X-List-Received-Date: Wed, 26 Mar 2014 10:15:57 -0000
Content-Type: text/plain

Yocto kernel linux-yocto uses cryptodev-linux to use device /dev/crypto.
So add cryptodev-linux which is one alternative of ocf-linux and then
remove ocf-linux later.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openssl/cryptodev-linux_1.6.bb                 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb

diff --git a/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb b/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
new file mode 100644
index 0000000..320716d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A /dev/crypto device driver"
+HOMEPAGE = "http://cryptodev-linux.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://download.gna.org/cryptodev-linux/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
+SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
+
+do_compile() {
+	:
+}
+
+# Just install cryptodev.h which is the only header file needed to be exported
+do_install() {
+	install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev.h
+}
+
+ALLOW_EMPTY_${PN} = "1"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.2


