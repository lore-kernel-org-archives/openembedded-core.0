Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Syef7-0007iS-Bd
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 09:57:09 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1124315eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Y3ECZfxtHpSI3+bskkHqv7dEhZZKR8kQdbeq1r/YGHw=;
	b=E6Hjlswyl11rrGYtLLz2X67M6BdHKZTSRQ+Et7pKihLXSDRprmPwmiVwtEv+PgiVcw
	ltVYwsqCr9bgB+RHEQOwZG7DWUUKY3pfKmR5pkJA/Nx45rU/KiDgE43KzjeHXpAluYeC
	fRQpKdj8jBAHXs5We1kYMs5ZBOhPLfpOBdCbzHON1mLCuW7+EmN7D7z+mJQ7bDKcik98
	6Cxw57w7vRyC2e37nZxO3zSLhLxVZR5WMW1yTyXIHeHUEWAN4ciwvsCarQzjhDmU3La2
	bCJhFWweqWH3wNnZcdvCzIc8P6tqup027lrDFt32iv9FyXKokiGRFrS+WeAJ1UjJHXIy
	i1Vg==
Received: by 10.14.203.69 with SMTP id e45mr6855038eeo.23.1344325525466;
	Tue, 07 Aug 2012 00:45:25 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 9sm53684795eei.12.2012.08.07.00.45.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:45:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:44:44 +0200
Message-Id: <1344325488-20479-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmK3FXGte5HNP1gJjBZ2RHGQCOpPvwQ/kGPCGD8ZuMczq3Z/acOC5L7hR0yo1lyJof6Svb1
Subject: [PATCH][for-denzil 4/8] xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Tue, 07 Aug 2012 07:57:09 -0000

From: Valentin Popa <valentin.popa@intel.com>

The licenses are the same, only some white spaces added/removed.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/xz/xz_5.0.3.bb      |   28 ----------------------------
 meta/recipes-extended/xz/xz_5.1.1alpha.bb |   28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz_5.0.3.bb
 create mode 100644 meta/recipes-extended/xz/xz_5.1.1alpha.bb

diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.0.3.bb
deleted file mode 100644
index e8f96b6..0000000
--- a/meta/recipes-extended/xz/xz_5.0.3.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "utils for managing LZMA compressed files"
-HOMEPAGE = "http://tukaani.org/xz/"
-SECTION = "base"
-
-LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
-                    file://COPYING.GPLv2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=fbc093901857fcd118f065f900982c24 \
-                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
-
-SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
-SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
-
-PR = "r1"
-
-inherit autotools gettext
-
-PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
-
-FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
-FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
-FILES_liblzma-staticdev = "${libdir}/liblzma.a"
-FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
new file mode 100644
index 0000000..7fa7177
--- /dev/null
+++ b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "utils for managing LZMA compressed files"
+HOMEPAGE = "http://tukaani.org/xz/"
+SECTION = "base"
+
+LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
+                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
+
+SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
+SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
+
+PR = "r0"
+
+inherit autotools gettext
+
+PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
+
+FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
+FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
+FILES_liblzma-staticdev = "${libdir}/liblzma.a"
+FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10



