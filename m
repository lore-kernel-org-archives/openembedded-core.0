Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C00E46AC28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 00:08:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0V08PCF001160
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 16:08:26 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 30 Jan 2015 16:08:25 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jan 2015 19:08:25 -0500
Message-ID: <1422662905-3598-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Subject: [PATCH] devtools: add a bb for git-manpages
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
X-List-Received-Date: Sat, 31 Jan 2015 00:08:35 -0000
Content-Type: text/plain

These could be created from scratch from git itself, but it
requires asciidoc, xsltproc, python bits and too much other
baggage.  Since the git folks issue a tarball with the manpages
for each release, it is simpler to just go get that.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 .../git-manpages/git-manpages_2.2.1.bb             | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/git-manpages/git-manpages_2.2.1.bb

diff --git a/meta/recipes-devtools/git-manpages/git-manpages_2.2.1.bb b/meta/recipes-devtools/git-manpages/git-manpages_2.2.1.bb
new file mode 100644
index 000000000000..7d8e0e972738
--- /dev/null
+++ b/meta/recipes-devtools/git-manpages/git-manpages_2.2.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Distributed version control system manpages"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+DEPENDS = "git"
+
+RDEPENDS_${PN} = "git"
+SRC_URI = "https://www.kernel.org/pub/software/scm/git/git-manpages-${PV}.tar.gz"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI[md5sum] = "b5ddd262b608804ba4403f0f82d881d7"
+SRC_URI[sha256sum] = "69dcb3decdb33dd35491935e80f71c40c576b536df4223eb98d5f7ccd9643293"
+
+FILES_${PN}-doc = "${mandir}"
+
+do_configure () {
+}
+
+do_compile () {
+}
+
+do_install () {
+	mkdir -p ${D}/${mandir}
+	cp -a ${WORKDIR}/man[1-9] ${D}/${mandir}
+}
-- 
2.2.1


