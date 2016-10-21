Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 519AA71D16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:24:42 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t0gHb4V24z3hjX8;
	Fri, 21 Oct 2016 11:24:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t0gHb4M2szvkkY;
	Fri, 21 Oct 2016 11:24:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id GYLDzWhkabwh; Fri, 21 Oct 2016 11:24:40 +0200 (CEST)
X-Auth-Info: zT9mCUJgCpoAAOrD7o26847dtywmHhWVBF39lhEvBiw0UTWiEbd1FNCHxGatmOE2
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 21 Oct 2016 11:24:40 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 09:24:28 +0000
Message-Id: <1477041868-7097-3-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1477041868-7097-1-git-send-email-o.mandel@menlosystems.com>
References: <1477041868-7097-1-git-send-email-o.mandel@menlosystems.com>
In-Reply-To: <1476871513-19739-2-git-send-email-o.mandel@menlosystems.com>
References: <1476871513-19739-2-git-send-email-o.mandel@menlosystems.com>
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH v2] Remove $COREBASE/LICENSE from LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 21 Oct 2016 09:24:42 -0000

Several recipes reference the LICENSE file in their LIC_FILES_CHKSUM
variable as ${COREBASE}/LICENSE. This forces distribution providers to
keep this file verbatim or to overload the affected recipes. The section
"Moving to the Yocto Project 1.6 Release" in the Yocto manual suggests
removing the LICENSE file where possible.

Remove LICENSE in cases where COPYING.MIT is also given and replace
LICENSE with COPYING.MIT if the former was the only entry. All modified
recipes specify LICENSE = "MIT" and none of the in-tree files specify a
different license either.

As the packages do not change (the license files are not contained in
them), do not increase PR.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 3 +--
 meta/recipes-bsp/formfactor/formfactor_0.0.bb             | 3 +--
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb    | 3 +--
 meta/recipes-core/systemd/systemd-compat-units.bb         | 2 +-
 meta/recipes-core/systemd/systemd-systemctl-native.bb     | 2 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb              | 3 +--
 meta/recipes-devtools/devel-config/distcc-config.bb       | 3 +--
 meta/recipes-devtools/devel-config/nfs-export-root.bb     | 3 +--
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb  | 3 +--
 meta/recipes-graphics/wayland/weston-init.bb              | 2 +-
 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb    | 3 +--
 11 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index d3c02d5..20a101a 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "This recipe serves as an example for using features from useradd.
 SECTION = "examples"
 PR = "r1"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://file1 \
            file://file2 \
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 5c30bd5..53cf1cf 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -1,8 +1,7 @@
 SUMMARY = "Device formfactor information"
 SECTION = "base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r45"
 
 SRC_URI = "file://config file://machconfig"
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 51a76b4..b5f6895 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -4,8 +4,7 @@ DEPENDS = "ppp"
 RDEPENDS_${PN} = "ppp"
 PR = "r8"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://host-peer \
            file://ppp-dialin"
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 421fc06..aa20014 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r29"
 
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index fbdc9c0..fadc843 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Wrapper for enabling systemd services"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r6"
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index ecd4a8a..ae12550 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -1,8 +1,7 @@
 SUMMARY = "Extra machine specific configuration files"
 DESCRIPTION = "Extra machine specific configuration files for udev, specifically blacklist information."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = " \
        file://automount.rules \
diff --git a/meta/recipes-devtools/devel-config/distcc-config.bb b/meta/recipes-devtools/devel-config/distcc-config.bb
index cb7830b..3cd661d 100644
--- a/meta/recipes-devtools/devel-config/distcc-config.bb
+++ b/meta/recipes-devtools/devel-config/distcc-config.bb
@@ -1,8 +1,7 @@
 SUMMARY = "Sets up distcc for compilation on the target device"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://distcc.sh"
 
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
index 169d005..56375a4 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -1,8 +1,7 @@
 SUMMARY = "Configuration script to export target rootfs filesystem"
 DESCRIPTION = "Enables NFS access from any host to the entire filesystem (for development purposes)."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r1"
 
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 11c94e5..31c98ec 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -2,8 +2,7 @@ SUMMARY = "Runs postinstall scripts on first boot of the target device"
 SECTION = "devel"
 PR = "r9"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://run-postinsts \
            file://run-postinsts.init \
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 291cd16..22ba5f3 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Startup script and systemd unit file for the Weston Wayland compositor"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://init \
            file://weston.service \
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index ebdd6d1..28d5096 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Provides an icon to shut down the system cleanly"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://shutdown.desktop"
 
-- 
2.1.4


