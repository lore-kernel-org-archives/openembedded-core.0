Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC0F7F3B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 13:25:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zDgb2jT2z4s
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 15:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564579515;
	bh=pR0KxrTunDr2bHR8X90tC5Nwh2tAz/afmF/lCDCzoS0=;
	h=From:To:Subject:Date:From;
	b=VkRb8/l61CN2fLpGJpTNm4bDrGTfAkKf4X+t9cvSCOI8CUbf9H4frdOO3MoojAmQ8
	c34Tggdv+uhVXr9zXharFy3MDhH6gjoqpWRPaNUjI2yL5SQKf4faW3ayDmXJ0ROVNJ
	OMQO5OW+18dVgxmr07BP/7IzEEtT8b/qmy6CDW7cjCMVVakCn29vjPMtUVeUqQyL//
	tdY7uBf0JNhF7ZJ8X3N/VSMEFPyrP6kN22hkZc4+ZL/hgkhpGIpkzeG1LmaY2lqgRE
	aVO4nqMfMZxB3HKI3iAbIwGSxDxDtUY5bbC1zDYLxukdyM5ZGIT5c98nH6v7x4HS00
	b/TwVzVf4AYCKUb6LhVqbkmTb7LN1R+Ua4hzW9Ep5Bw3lZQa+mF0WDWyOw0CGoE2Ic
	elRtuQtXYX4a8Cll4fRK/WAxXrSBvlWI4EGgOP3qkrGDx6cu9yV3mw2i+Uwlr+62v7
	fVt9MbVgPs5qCFOjna+Xq3CIUdbz4bj/mIMyDOTOjGSrsZ1MXrtTexF157Biu3zeaY
	FFlZDdXQhC6op3M8KSHYDneAIVT7e7EDwrVLlECRO02zwAkC/R/b9OlztMTNl5vqeQ
	IKhlJ3xyYMAbKwuc0qIVUryWU54ibDwY2lZTuf4JN6OXk+kMo5yPlov1HnN0KOg7nm
	jTb+duacegS6HJ+T6WLOh+lc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 16:25:14 +0300
Message-Id: <20190731132514.32040-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Change ftp:// URIs to http(s)://
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
X-List-Received-Date: Wed, 31 Jul 2019 13:25:15 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/dhcp/dhcp.inc                | 2 +-
 meta/recipes-core/newlib/newlib.inc                    | 2 +-
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 +-
 meta/recipes-support/libffi/libffi_3.2.1.bb            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 3e65e5cf29..18bbaf8841 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -21,7 +21,7 @@ SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://dhcpd.service file://dhcrelay.service \
            file://dhcpd6.service \
            "
-UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
+UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
 inherit autotools-brokensep systemd useradd update-rc.d
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 418cf07939..2f0553bd63 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0 \
 		"
 
-SRC_URI = "ftp://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
+SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
 SRC_URI[md5sum] = "f84263b7d524df92a9c9fb30b79e0134"
 SRC_URI[sha256sum] = "fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a"
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 6d232a50e4..dd945c970f 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -18,7 +18,7 @@ FILES_libwrap-staticdev = "${libdir}/lib*.a"
 FILES_${PN} = "${sbindir}"
 FILES_${PN}-doc = "${mandir}/man8"
 
-SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
+SRC_URI = "http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://00_man_quoting.diff \
            file://01_man_portability.patch \
            file://05_wildcard_matching.patch \
diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1.bb
index 792a1143b2..f2c684a7a6 100644
--- a/meta/recipes-support/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
@@ -10,7 +10,7 @@ A layer must exist above `libffi' that handles type conversions for values passe
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 
-SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
+SRC_URI = "https://sourceware.org/pub/libffi/${BP}.tar.gz \
            file://not-win32.patch \
            file://0001-mips-Use-compiler-internal-define-for-linux.patch \
            file://0001-mips-fix-MIPS-softfloat-build-issue.patch \
-- 
2.17.1


