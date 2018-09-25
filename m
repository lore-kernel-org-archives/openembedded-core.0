Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 23C696FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:43:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id o16so10120945wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UTdOlImzrbvrgdcYqDPkjaSREHA6eSBgVWPND00yW5k=;
	b=2IBqv5uBQj5kdqYO1bCUjhAsWnJXrRZ+TQE/Cj3G3+CVLwei5IEfiUu2MJ5kz4LNy3
	GQcN9zI8Skhml2t/K+br/0m58RA7kRteG5dHba9cOdjwp92mjhf2DeMEx2We3Ae4mA3X
	QOdp8qrsbGKP/yWL0Jd986LRAVY9KfmWcf0Yoc9d67EIIf5NtGPFp5PeFus+MTYtWvLH
	kdyAGDmle8tFXEJR3YdGbHfdXVUh0q8Kbt4I4uGefSpxQzLq9IbszMCNMSF+tC/IMz8k
	z2ZEL80ElralisVYH+Hdq6TM9RmpET+lyV+ozPBJ2szFJa0EXXOABA9Y8WkuQ/VBjW4H
	BWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UTdOlImzrbvrgdcYqDPkjaSREHA6eSBgVWPND00yW5k=;
	b=c8WLTIu035onB6aKYACGCjdRjL36GpTMHYFF5Zj1HntA3qF6zxKQEICSy60FyGyLuT
	o9evYhgDtngAkgttorCttMwX8jyszwzo5IerewPdpef0AICN1+aUglfONGGdFhcmPaJ5
	jof4c8iEtoiGGRj0d3uTNLtYzUw6NEX7U5Kzn1vMsXG+LqJgiQ8pAfSZkBKwYxXiCXxX
	upi7FFgxaTSL3NTzKFtr4umvqpMhzYnIR9jQ/1q9lkKRcEUEuOwfBdoCv5MqudnUuDRy
	ZmXj5i8hZ0I2vlZJ6GvumENoMtGy1q49EFI5T/gOjBqn9shbuBUdGONh4gFBKNfM0mw0
	lC1g==
X-Gm-Message-State: ABuFfoiTnGY80uLySnRe+bdlA7fakQ49G8E3QH/WJ5SiI6DoI8l/Uit9
	UAnc7dIlvXN47p5+XBOkWmlGElTbqEA=
X-Google-Smtp-Source: ACcGV634kM152XysooBhOn4kruyuIQd82f80X2LChSDSX8X2WynXlLrUClYZanAyepBm/RYUDov4Yg==
X-Received: by 2002:adf:9304:: with SMTP id 4-v6mr1131052wro.129.1537883034359;
	Tue, 25 Sep 2018 06:43:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b21-v6sm1852340wmj.28.2018.09.25.06.43.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 06:43:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:43:44 +0100
Message-Id: <20180925134348.5562-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180925134348.5562-1-ross.burton@intel.com>
References: <20180925134348.5562-1-ross.burton@intel.com>
Subject: [PATCH 2/6] meson: squash the architecture warning patches together
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
X-List-Received-Date: Tue, 25 Sep 2018 13:43:54 -0000

Instead of one patch to change a warning into an exception and another to change
the message, squash the patches together as neither of the are acceptable
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc              |  1 -
 .../0002-Make-CPU-family-warnings-fatal.patch      |  4 +--
 ...r-to-our-wiki-instead-of-Meson-bug-system.patch | 38 ----------------------
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index e7f999a205d..cfb831b106f 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -10,7 +10,6 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
            file://0002-Make-CPU-family-warnings-fatal.patch \
-           file://0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch \
            file://0001-Support-building-allarch-recipes-again.patch \
            "
 SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
diff --git a/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
index a6c1b25c46b..ca56a6a8bff 100644
--- a/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
@@ -21,7 +21,7 @@ index d29a77f..267acf9 100644
 -        mlog.warning('Unknown CPU family {!r}, please report this at '
 -                     'https://github.com/mesonbuild/meson/issues/new with the'
 -                     'output of `uname -a` and `cat /proc/cpuinfo`'.format(trial))
-+        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
  
      return trial
  
@@ -30,7 +30,7 @@ index d29a77f..267acf9 100644
  
                  if entry == 'cpu_family' and res not in known_cpu_families:
 -                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
-+                    raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++                    raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % value)
  
                  if self.ok_type(res):
                      self.config[s][entry] = res
diff --git a/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch b/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch
deleted file mode 100644
index 5295335730e..00000000000
--- a/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 31df0a854aa40c4ce8fbf1ca02ccc9b6bff0abfd Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 6 Jul 2018 15:51:15 +0100
-Subject: [PATCH] Send user to our wiki instead of Meson bug system
-
-If a CPU family isn't recognised the first step should be to verify the
-mapping. Send the user to a wiki page explaining what to do, instead of
-directly to the Meson bug tracker.
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- mesonbuild/environment.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 267acf9..19a3c1e 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -239,7 +239,7 @@ def detect_cpu_family(compilers):
-         return 'x86_64'
- 
-     if trial not in known_cpu_families:
--        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
-+        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
- 
-     return trial
- 
-@@ -1012,7 +1012,7 @@ class CrossBuildInfo:
-                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
- 
-                 if entry == 'cpu_family' and res not in known_cpu_families:
--                    raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
-+                    raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % value)
- 
-                 if self.ok_type(res):
-                     self.config[s][entry] = res
-- 
2.11.0


