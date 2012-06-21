Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShqSh-00016g-Pf
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 01:06:51 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so2657441pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 15:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=s7eNOmi6WzLKcOV+jAOaBWHAGLJhXQbTSQwYUHkC+3c=;
	b=D1QbdGvi6qFQZztkjTD7O7d1E2aH0AMTu0J8qFJAmFjuvKijq1Cp21bJOjzBkZYZzu
	Qvx4EF+Gxb9mEU+rAel9N9C6nr7766s/ChQerXwucB2KFMVkfRRsS2fQ7h5cG4s+WCIH
	qB0GsAGS7a7+RaASL0vSoSfPNQtH+xSTcDgjaAtNZs7r2IL/l4T9ip2HsWqPkuem+sRi
	tLk6kVDRTNgieE4IB+hTcrB3vk/K/ZNgwczk2HSkK9T5rrEgK7z7fEDaCE2yVov2ZFv3
	k8z4zJlTOG3g69+uHMK1ytPbzeEQ8z+HlwkGnnPG67nNP5rsBKVKG6DwB7ZeRlRbJ8Hv
	Qepg==
Received: by 10.68.200.104 with SMTP id jr8mr3822597pbc.9.1340319367275;
	Thu, 21 Jun 2012 15:56:07 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tk1sm36951511pbc.8.2012.06.21.15.56.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 15:56:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2012 15:54:46 -0700
Message-Id: <34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340319020.git.raj.khem@gmail.com>
References: <cover.1340319020.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] kconfig-frontends: New recipe
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
X-List-Received-Date: Thu, 21 Jun 2012 23:06:52 -0000

kconfig-frontends provides the kconfig infrastructure
thats used for linux kernel as a standalone package. Its
not intended to be used for kernel itself but can be
used by packages who are based on kconfig e.g. busybox
uclibc or new packages who wants to use kconfig infra
for the package build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
new file mode 100644
index 0000000..d95d3e8
--- /dev/null
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
@@ -0,0 +1,28 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "The kconfig-frontends project aims at centralising \
+the effort of keeping an up-to-date, out-of-tree, packaging of the \
+kconfig infrastructure, ready for use by third-party projects. \
+The kconfig-frontends package provides the kconfig parser, as well as all \
+the frontends"
+HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
+SECTION = "devel"
+DEPENDS += "ncurses flex bison gperf"
+PR = "r0"
+PV = "3.4.0"
+SPIN = "0"
+SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
+SRC_URI[md5sum] = "7eed0faf5a41d6dd0b2a886a440a972d"
+SRC_URI[sha256sum] = "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0bf0f0629708802f2"
+
+S = "${WORKDIR}/${BPN}-${PV}-${SPIN}"
+
+inherit autotools
+do_configure_prepend () {
+	mkdir -p scripts/.autostuff/m4
+}
+EXTRA_OECONF += "--disable-gconf --disable-qconf"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.4



