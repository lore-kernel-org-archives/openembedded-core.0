Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.5236.1618551529659501191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 22:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.197, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7CF3D1C0004;
	Fri, 16 Apr 2021 05:38:47 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 3/3] btrfs-tools: Try to follow style guide
Date: Thu, 15 Apr 2021 22:37:29 -0700
Message-Id: <20210416053729.1021506-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210416053729.1021506-1-robert.joslyn@redrectangle.org>
References: <20210416053729.1021506-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cosmetic changes to bettor follow the style guide.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
index b875ea1aa1..0b8e1d22a2 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
@@ -15,12 +15,12 @@ LIC_FILES_CHKSUM = " \
 SECTION = "base"
 DEPENDS = "lzo util-linux zlib"
 DEPENDS_append_class-target = " udev"
-RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "8d5051f279f7994fb80536ef8f846f06d121d898"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
+SRCREV = "8d5051f279f7994fb80536ef8f846f06d121d898"
+S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
@@ -64,7 +64,6 @@ do_configure_prepend() {
 	cp -f $(automake --print-libdir)/install-sh ${S}/config/
 }
 
-S = "${WORKDIR}/git"
 
 do_install_append() {
     if [ "${@bb.utils.filter('PACKAGECONFIG', 'python', d)}" ]; then
@@ -72,4 +71,6 @@ do_install_append() {
     fi
 }
 
+RDEPENDS_${PN} = "libgcc"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.26.3

