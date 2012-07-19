Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SrkfD-0004rG-76
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 08:56:43 +0200
Received: by wibhm11 with SMTP id hm11so1897111wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 23:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=nFo7wdQGiZlvhoFnfLJRXZaX+5R5jiM9VWWdf4l+GBc=;
	b=RGLX9fI3hJPXL1vRVCIrwOfIZEXiUUZOK0UbGl5kQdWv+mFPV/ZbxiAt09C61K2YUK
	4VCBomsNrctOIRtXVCsxwYSsZ/sa/jT/Y7yzeotwXxSIjmiwkyyTsEBvQaNrpd9uo8D0
	WXoAQinB/rpa5spzVd3MvbX7DNLV4gxTJVvUml5vfCMVA3rq3qQV0ERtgRtWHTCcPls8
	ZuwzPcDd/ZY6Rwvkao+50uUH9pRPXcmVSGKIzcVPakvO0O3WEO5bDzO0bZGuk8yCGwVu
	KDOGBlE9ShxC94HhnuBz1HixM45hRq/MVvAX+rBqsjKy7Z+YekvgrvyiZG5MM5c+z/GZ
	Rpwg==
Received: by 10.216.41.195 with SMTP id h45mr311132web.192.1342680321820;
	Wed, 18 Jul 2012 23:45:21 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id c1sm2990443eeo.5.2012.07.18.23.45.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 23:45:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 08:44:43 +0200
Message-Id: <1342680286-12886-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
References: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQndF2dh6oQ/Ebhpf6khj3BUYDKzUK5rD3H9Z4+5VgzhF946GcPJQm6BiQNIrs+lZUfR/oGX
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [for-denzil][PATCH 2/5] xz: update to 5.1.2alpha
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
X-List-Received-Date: Thu, 19 Jul 2012 06:56:43 -0000

This contains bugfixes from the 5.0.3 and 5.0.4 releases

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/xz/xz_5.1.1alpha.bb |   28 ----------------------------
 meta/recipes-extended/xz/xz_5.1.2alpha.bb |   25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz_5.1.1alpha.bb
 create mode 100644 meta/recipes-extended/xz/xz_5.1.2alpha.bb

diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
deleted file mode 100644
index 7fa7177..0000000
--- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "utils for managing LZMA compressed files"
-HOMEPAGE = "http://tukaani.org/xz/"
-SECTION = "base"
-
-LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
-                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
-
-SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
-SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
-
-PR = "r0"
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
diff --git a/meta/recipes-extended/xz/xz_5.1.2alpha.bb b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
new file mode 100644
index 0000000..9d68720
--- /dev/null
+++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
@@ -0,0 +1,25 @@
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
+SRC_URI[md5sum] = "9bad1e249537ce69b206815cf28ca87b"
+SRC_URI[sha256sum] = "70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
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



