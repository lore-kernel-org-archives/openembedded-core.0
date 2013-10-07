Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 94A9B61957
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 11:49:17 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w61so2138138wes.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 04:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8uSd1azp6CzenbpEKXFd3P9ukEeGaqdqyDHxt8AEhkI=;
	b=Vhx4IkDcO1C4QigIrBkcCdzLkcf/lTweBUUOoUlpFwce9/H/T2w6xHqsEfgI+SBAXT
	KKI9Aiz7nYlI8ZLMs1OJpBIn4RptN5STHjwKYuDmTYDtjQCooH8O+5yLqESMeRMRGqry
	M8C2hAhE0d0R2VsU5y2GMC0HsNRI1cwOEnT1fQZNx/4QGXvzJUgIi8n6C5Zzj/hCDGTr
	pW5Tz5Z9OKlFUr9iNrLOO5RIlG/0VCjeeIFhwC8wJzzbA+vgDQxWr+BDz9lIX8bAnuYA
	bhlcQqAKZXl/h50dgUe0ZqqYEn7KvoNN94QaqBtKcu/ITr7zuYQ2XY6ETrc/3W0EjfyG
	ytoQ==
X-Gm-Message-State: ALoCoQmbi2wjdRL9VYwU8hMlQIblSIODcrW5r0xz8n5Bhz146MYVd9JD+y5bMfMXbLjNLggfCZ8R
X-Received: by 10.180.98.228 with SMTP id el4mr19272784wib.4.1381146558991;
	Mon, 07 Oct 2013 04:49:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mb7sm38608731wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 04:49:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 12:49:07 +0100
Message-Id: <1381146549-16693-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381146549-16693-1-git-send-email-ross.burton@intel.com>
References: <1381146549-16693-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] libxmu: upgrade to 1.1.2
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
X-List-Received-Date: Mon, 07 Oct 2013 11:49:18 -0000

License checksum changed as some missing copyright notices and dates were added.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb |   34 ------------------------
 meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb |   33 +++++++++++++++++++++++
 2 files changed, 33 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb
deleted file mode 100644
index 18ced97..0000000
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Xmu and Xmuu: X Miscellaneous Utility libraries"
-
-DESCRIPTION = "The Xmu Library is a collection of miscellaneous (some \
-might say random) utility functions that have been useful in building \
-various applications and widgets. This library is required by the Athena \
-Widgets. A subset of the functions that do not rely on the Athena \
-Widgets (libXaw) or X Toolkit Instrinsics (libXt) are provided in a \
-second library, libXmuu."
-
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=15f1d981860c677503992da79140669c"
-
-DEPENDS += "libxt libxext"
-PROVIDES = "xmu"
-
-PR = "r0"
-PE = "1"
-
-XORG_PN = "libXmu"
-
-LEAD_SONAME = "libXmu"
-
-PACKAGES =+ "libxmuu libxmuu-dev"
-
-FILES_libxmuu = "${libdir}/libXmuu.so.*"
-FILES_libxmuu-dev = "${libdir}/libXmuu.so"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "a4efff8de85bd45dd3da124285d10c00"
-SRC_URI[sha256sum] = "709081c550cc3a866d7c760a3f97384a1fe16e27fc38fe8169b8db9f33aa7edd"
diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
new file mode 100644
index 0000000..3922b52
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Xmu and Xmuu: X Miscellaneous Utility libraries"
+
+DESCRIPTION = "The Xmu Library is a collection of miscellaneous (some \
+might say random) utility functions that have been useful in building \
+various applications and widgets. This library is required by the Athena \
+Widgets. A subset of the functions that do not rely on the Athena \
+Widgets (libXaw) or X Toolkit Instrinsics (libXt) are provided in a \
+second library, libXmuu."
+
+
+require xorg-lib-common.inc
+
+LICENSE = "MIT & MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING;md5=def3d8e4e9c42004f1941fa22f01dc18"
+
+DEPENDS += "libxt libxext"
+PROVIDES = "xmu"
+
+PE = "1"
+
+XORG_PN = "libXmu"
+
+LEAD_SONAME = "libXmu"
+
+PACKAGES =+ "libxmuu libxmuu-dev"
+
+FILES_libxmuu = "${libdir}/libXmuu.so.*"
+FILES_libxmuu-dev = "${libdir}/libXmuu.so"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "41d92ab627dfa06568076043f3e089e4"
+SRC_URI[sha256sum] = "756edc7c383254eef8b4e1b733c3bf1dc061b523c9f9833ac7058378b8349d0b"
-- 
1.7.10.4


