Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 80EE878D51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:09 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id s12-v6so5682407wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2cI+pPoMEGkrxGzj5e1mBQ7wNJA2iGMkvIKF+6EuBZ8=;
	b=m4WcjoYsccAN5GCfGfVz+2Z/jErqpDb+Q3lDYOM4qaJ3r5q7ylxEY5OQ0VnFY8aYb6
	0L7F+6vGMGFm9Fi+3CmTxxWPfkJ2GPCoz1Yr9gQdtohjC8uf9zFzaS3PlrL8dbhn/fzw
	JP8580O5iidJVZVtSaqv96+CjTOZh1mH+LbLpAVIv3ugvogAO+8K8W7W8oawgFnkObod
	OrjUDdRaYgSEZNg59ktWEv6sFXsRLLQkb51AAGCZmjFMGNz9LTRUK9J+o8Wcim6gS/b9
	4Qk617Rk4ol8yiePhLVaMKuH+f3gQ898gIhkFgF5QFY2iSj0An0vIB1Cq00JGyB4typN
	H04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2cI+pPoMEGkrxGzj5e1mBQ7wNJA2iGMkvIKF+6EuBZ8=;
	b=XdexeQDDvBX5K0GJlTOELEd3OiyzHJHMoX6mhQoJv+Lc/MQ1P4ODYpZrPxYxyBT1cb
	z/fSWolVkvhnwNosOq588sciPu77mtCJm3OENmEwABRzQnQX7XpiE2JTSTJ3Di9AaWFc
	3KZhaB8Hq26AKz/7T2CryRF2pn+L7D5eN+I32fhXcDec9LQJYF6u5Ih1kGKya/J9wPSi
	BYU/3OJNm6Ku3d3tRupGza/3GsVziTjzoNqaKm+bc3hmnjQ0sjOuNHX1++8UwqCJ3btm
	B68b6BCQ0ki2l4SUW6GAgg7HTtmG6evdImMrZpqNr4qqMI/yiA15kIzHtVFvdomrSGh7
	pU3Q==
X-Gm-Message-State: AOUpUlGj0r9jJJWUHqINP1pWnlQRjTx8wBtwNlU34nvmfBfIAYIHC9xY
	c8oVHnXLf8DWvTYCWFcaxC3MZw6v7/Q=
X-Google-Smtp-Source: AAOMgpd4IglJjme1z/vZyyO8yTnvbFx4QRCw+uNvBEhqAX8LmhIpLcrURC5WC1PL39/86K76rmC9bQ==
X-Received: by 2002:a1c:3e8f:: with SMTP id
	l137-v6mr4655673wma.132.1532705589919; 
	Fri, 27 Jul 2018 08:33:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:48 +0100
Message-Id: <20180727153248.22838-16-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 16/16] pax-utils: remove
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:09 -0000

This was packaged originally to perform QA tests on binaries (text relocations
and RPATHs), but we perform those tests at build-time now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb | 36 ----------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
deleted file mode 100644
index 9635a5e7082..00000000000
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Security-focused ELF files checking tool"
-DESCRIPTION = "This is a small set of various PaX aware and related \
-utilities for ELF binaries. It can check ELF binary files and running \
-processes for issues that might be relevant when using ELF binaries \
-along with PaX, such as non-PIC code or executable stack and heap."
-HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
-
-SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
-SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
-SRC_URI[sha256sum] = "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
-
-RDEPENDS_${PN} += "bash"
-
-export GNULIB_OVERRIDES_WINT_T = "0"
-
-do_configure_prepend() {
-    touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog ${S}/README
-}
-
-do_install() {
-    oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
-}
-
-BBCLASSEXTEND = "native"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= ""
-
-PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
-PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp, libseccomp"
-PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, pyelftools"
-
-EXTRA_OECONF += "--enable-largefile"
-- 
2.11.0


