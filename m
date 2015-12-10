Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2E66612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 09:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id B691826394D
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 09:01:43 +0000
Message-Id: <accfe2aa0774602538c6a37d3ceb442547576fa5.1449737824.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449737824.git.joshua.lock@collabora.co.uk>
References: <cover.1449737824.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1449737824.git.joshua.lock@collabora.co.uk>
References: <cover.1449737824.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 3/3] connman-conf: convert to an allarch package
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
X-List-Received-Date: Thu, 10 Dec 2015 09:01:48 -0000

This recipe just installs some data files and a script and isn't machine or
architecture specific. Even though it was designed to be used only for qemu
machines there's no reason it can't be used elsewhere.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/connman/connman-conf.bb              | 10 ++++------
 .../connman-conf/{qemuall => }/wired-connection.service        |  0
 .../connman/connman-conf/{qemuall => }/wired-setup             |  0
 .../connman/connman-conf/{qemuall => }/wired.config            |  0
 4 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired-connection.service (100%)
 rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired-setup (100%)
 rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired.config (100%)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index bef9237..a8fdb8c 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -4,18 +4,16 @@ network interface for a qemu machine."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit systemd
+inherit systemd allarch
 
-SRC_URI_append_qemuall = " file://wired.config \
-                           file://wired-setup \
-                           file://wired-connection.service \
+SRC_URI = "file://wired.config \
+           file://wired-setup \
+           file://wired-connection.service \
 "
 PR = "r2"
 
 S = "${WORKDIR}"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 FILES_${PN} = "${localstatedir}/* ${datadir}/*"
 
 do_install() {
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service b/meta/recipes-connectivity/connman/connman-conf/wired-connection.service
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
rename to meta/recipes-connectivity/connman/connman-conf/wired-connection.service
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/wired-setup
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
rename to meta/recipes-connectivity/connman/connman-conf/wired-setup
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config b/meta/recipes-connectivity/connman/connman-conf/wired.config
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
rename to meta/recipes-connectivity/connman/connman-conf/wired.config
-- 
2.5.0


