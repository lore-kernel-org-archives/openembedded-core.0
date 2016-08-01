Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 677 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Aug 2016 08:35:02 UTC
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id AF4876E660
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:35:02 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym02.jp.fujitsu.com with smtp
	id 50c8_6428_03264681_33cd_4ec1_9f99_2dc99fb73118;
	Mon, 01 Aug 2016 17:23:37 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 88DB5AC00E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 17:23:36 +0900 (JST)
Received: from g01jpexchkw36.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	D83423287D5 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 17:23:35 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw36.g01.fujitsu.local (10.0.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 1 Aug 2016 17:23:36 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2016 17:24:11 +0900
Message-ID: <1470039851-27561-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] qpdf: add new recipe
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
X-List-Received-Date: Mon, 01 Aug 2016 08:35:06 -0000
Content-Type: text/plain

QPDF is a command-line program that does structural,
content-preserving transformation on PDF files.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/qpdf/qpdf_6.0.0.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/qpdf/qpdf_6.0.0.bb

diff --git a/meta/recipes-extended/qpdf/qpdf_6.0.0.bb b/meta/recipes-extended/qpdf/qpdf_6.0.0.bb
new file mode 100644
index 0000000..edee741
--- /dev/null
+++ b/meta/recipes-extended/qpdf/qpdf_6.0.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "QPDF is a command-line program that does structural, content-preserving transformations on PDF files"
+DESCRIPTION = "QPDF is capable of creating linearized files and encrypted files. It is also capable of \
+converting PDF files with object streams to files with no compressed objects or to generate object streams \
+from files that don't have them. QPDF also supports a special mode designed to allow you to edit the content \
+of PDF files in a text editor."
+HOMEPAGE = "http://qpdf.sourceforge.net/"
+
+PR = "r0"
+
+RDEPENDS_${PN} = "libpcre zlib"
+
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/qpdf-${PV}/Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
+
+SRC_URI = "http://nchc.dl.sourceforge.net/project/qpdf/qpdf/6.0.0/qpdf-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e014bd3ecf1c4d1a520bbc14d84ac20e"
+SRC_URI[sha256sum] = "a9fdc7e94d38fcd3831f37b6e0fe36492bf79aa6d54f8f66062cf7f9c4155233"
+
+inherit autotools-brokensep pkgconfig
+
+EXTRA_OECONF += "--with-random=/dev/urandom"
+
+do_configure_prepend() {
+      sh autogen.sh
+}
-- 
2.7.4


