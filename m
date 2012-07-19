Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SrkfA-0004r9-44
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 08:56:40 +0200
Received: by weyr6 with SMTP id r6so1431924wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 23:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Y3ECZfxtHpSI3+bskkHqv7dEhZZKR8kQdbeq1r/YGHw=;
	b=Tk0kkHn57ZPwvPwdQ9RqoVrNsKJwGPiv3QUfN7EXFnZEyn00ucLEQ7LTkygKn8BZ/O
	MP/IP1NgfA1ti6iXuoYXFo43CX7qNeJejD5vp4QZp97LTDO8S1goM1Rc4Xw2jeMtu506
	jsqhLMkkV0ACXXIKzpPQeqTxfGtRhZUlju3/37Ry2g5ROSa1OQ4Vb32mEqdkoB5kFsDg
	JZGZHG1AWF9QOYAv399Q66XH6jZ2oWh3JLEBBUMM0rD6y3V9IXKwNo/TZHysHYOmHo+M
	t7Wg5wdryJYP316wA9JgpJC/N808zKgCrew9qg7EnqBQ0RKk2n9Z4hkXDk2/R7LxR/8d
	/vrQ==
Received: by 10.216.59.7 with SMTP id r7mr467116wec.19.1342680318584;
	Wed, 18 Jul 2012 23:45:18 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id g42sm2943789eem.14.2012.07.18.23.45.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 23:45:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 08:44:42 +0200
Message-Id: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlzOpxl2V2rrEDy39gwxGzV65SbNv6N8qpLfddZmT+CYP4O/rLyunC5/BMOIp60FpUxVYqC
Subject: [for-denzil][PATCH 1/5] xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Thu, 19 Jul 2012 06:56:40 -0000

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



