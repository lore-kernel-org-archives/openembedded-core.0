Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 625786D7D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 15:44:53 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so4356786lab.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 07:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NrhpEmYepQskJqxMgG2k8aKNU6FAGeNMKeo3aouH+6w=;
	b=na8OBvtmW6AHd028HNGCzrkZjv6EEsNhmbSLMqlFVICDedPKWhpCkTohldc7PWPBXa
	pQwn7x73GNkMG6bjjo2oI9n/J/9ETppmggRgQdjhofo2FYDqBHPnAKLwlXf264Zi7uC5
	uO6JRuCrum73IQYzG+LD7pA1/eRn7vqHYgsg2sjiEVpU3bBxuDZ3x2kSMa5XfHKO7Ckv
	7onD9EYpVDnG5WrgdRJ5JeWknJlFXNE8QP0Hp1xAJzWpCVv6ko3hIqdvZJ1ChlSrR3kj
	Xh2OSgIGx4fv3S9CImcCl5LIKFAPWTWE+iAvO5GwDs9+wU55Jnu/gCVFcRQBFP80XFTI
	Vupw==
X-Received: by 10.112.139.72 with SMTP id qw8mr4168494lbb.16.1385480691968;
	Tue, 26 Nov 2013 07:44:51 -0800 (PST)
Received: from ubuntu.datv.net ([194.44.222.98])
	by mx.google.com with ESMTPSA id e1sm3425350lbe.0.2013.11.26.07.44.50
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 07:44:51 -0800 (PST)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 17:44:37 +0200
Message-Id: <1385480677-16003-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH] c-ares: added recipe.
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
X-List-Received-Date: Tue, 26 Nov 2013 15:44:53 -0000

Recipe was borrowed from meta-webos-ports.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 meta/recipes-support/c-ares/c-ares_1.10.0.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-support/c-ares/c-ares_1.10.0.bb

diff --git a/meta/recipes-support/c-ares/c-ares_1.10.0.bb b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
new file mode 100644
index 0000000..27bedf4
--- /dev/null
+++ b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
+HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=17;endline=18;md5=b320556568bc067d215a1e34c5b34a14"
+
+inherit autotools
+inherit pkgconfig
+
+SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
+SRC_URI[md5sum] = "1196067641411a75d3cbebe074fd36d8"
+SRC_URI[sha256sum] = "3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db"
+
+EXTRA_OECONF = "--enable-shared"
+
+# install private headers to ares subdirectory
+do_install_append() {
+    install -d ${D}/${includedir}/ares
+    install -m 0644 ares*.h ${D}/${includedir}/ares/
+}
+
+FILES_${PN}-dev += "${includedir}/ares/*.h"
-- 
1.8.1.2


