Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id D069A7EC95
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 18:09:33 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z7so223863wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 10:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=17TvSkj0w4ILGhQNoGTvhR4P8pFbzDuMHRQsLuyDPSQ=;
	b=qOg/Wqy6+quRY/3DSsDoYJFtXx7xzOreenQEduE7R/eIf4eBWVtpGVtf0c6eE5//oJ
	DiQjRkV+rhIgicAmKLagYhGmNfGFSauWicJtfeNuXrrro5zVCnrbKue6IQSuZ2+7d1FF
	//VWiSNTUd2rYIObUvHS5jG3OJL/aWGUUMx4ji9WHnf/Ef4T1bGC910gVp9mv5dq+S8s
	i/h1eUDMMQZG267uLRzR9l1eP3mp1NHPY9ly5/cU640aNZS0GddOzk5xWnVtNHc0TK11
	ZRAVNoNuu1N7W/7mYFxqGkCpc6oy1oMeDq3DFgtjroID8eCs1Okv3C3Q893W4/1E4i7e
	hvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=17TvSkj0w4ILGhQNoGTvhR4P8pFbzDuMHRQsLuyDPSQ=;
	b=Z13lrih6vhMfeUvEPSNmrabojT37v0s1xxLFU/q5ThFWVw7WKXS9AyaQnqluJbVhRs
	VhVXQKJWBq1bhVCN4yLLvrq4c5sYk26yB2AaKCkmWi5jFoLegcrAe/3EsTpnsZIoQ1dQ
	aQJamgOTdhiL67W3r3LCd4LnpT6ZdQcPXJbRZqh6xgD9l5+gNH6fHz8o2QDlWOxaaUPw
	uLVfR6jIl72JCaJrRRro6SVUN7eeTsRMsbRFloGEZruRzooJqiU8DQOonwTRH22bLXZs
	AccJzUwujUlSd1ymT7HQrp/ukSQzFq9TD9VTVnPavminkOf6kD/Guo5+lW4M0BAmkT8O
	m2Dw==
X-Gm-Message-State: APjAAAUowiaExl+6uoPiVBrQEIF4MTbKU4h6LDVxizKBxFmdjPPEzPVr
	nGB7LQIUit5MUB6HxnJDVIItBjQcwkI=
X-Google-Smtp-Source: APXvYqwZenMNyB4QeckwHClXe4KTyWPDlWKdJVxsfh7p8LcbkQtLtA2hRoEHDKhoCcZGZi+ACH+JsQ==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr240113wrn.140.1575310174000; 
	Mon, 02 Dec 2019 10:09:34 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id b67sm181054wmc.38.2019.12.02.10.09.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 10:09:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:09:29 +0000
Message-Id: <20191202180929.3342-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python-numpy: upgrade to 1.17.4
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
X-List-Received-Date: Mon, 02 Dec 2019 18:09:34 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-npy_cpu-Add-riscv-support.patch      | 24 -------------------
 ...up.py-remove-the-detection-of-x86-ta.patch |  4 ++--
 .../python-numpy/python-numpy.inc             |  5 ++--
 ...umpy_1.17.0.bb => python3-numpy_1.17.4.bb} |  0
 4 files changed, 4 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.17.0.bb => python3-numpy_1.17.4.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch b/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
deleted file mode 100644
index 4decfe66ee1..00000000000
--- a/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 629891f67601275c9c4de0bb01afcf1a8c44fa3f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Mar 2018 19:55:21 -0700
-Subject: [PATCH] npy_cpu: Add riscv support
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/10761]
----
- numpy/core/include/numpy/npy_cpu.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 5edd8f4..e1e4796 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
-@@ -96,6 +96,8 @@
-     #define NPY_CPU_OR1K
- #elif defined(__mc68000__)
-     #define NPY_CPU_M68K
-+#elif defined(__riscv)
-+    #define NPY_CPU_RISCV
- #elif defined(__arc__) && defined(__LITTLE_ENDIAN__)
-     #define NPY_CPU_ARCEL
- #elif defined(__arc__) && defined(__BIG_ENDIAN__)
diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch b/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
index ebb2a6f9df1..9da6a2b3da1 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
@@ -22,8 +22,8 @@ index a1bf3b8..60fb534 100644
      elif not is_msvc:
          # Some bit generators require c99
          EXTRA_COMPILE_ARGS += ['-std=c99']
--        INTEL_LIKE = any([val in k.lower() for k in platform.uname()
--                          for val in ('x86', 'i686', 'i386', 'amd64')])
+-        INTEL_LIKE = any(arch in platform.machine() 
+-                         for arch in ('x86', 'i686', 'i386', 'amd64'))
 -        if INTEL_LIKE:
 -            # Assumes GCC or GCC-like compiler
 -            EXTRA_COMPILE_ARGS += ['-msse2']
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index f68b90e6b9f..8413434af9e 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -7,11 +7,10 @@ SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://0001-npy_cpu-Add-riscv-support.patch \
            file://0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch \
            "
-SRC_URI[md5sum] = "c48b2ad785f82cdfe28c907ce35e2a71"
-SRC_URI[sha256sum] = "47b7b6145e7ba5918ce26be25999b6d4b35cf9fbfdf46b7da50090ffdb020445"
+SRC_URI[md5sum] = "9147c3ee75e58d657b5b8b5a4f3564e0"
+SRC_URI[sha256sum] = "fb0415475e673cb9a6dd816df999e0ab9f86fa3af2b1770944e7288d2bea4ac9"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.17.4.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.17.4.bb
-- 
2.20.1


