Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4DF7DE51
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:55:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y5so3395144wma.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7j8WeKy4yqCXFZCt1pG4e95e89eGP+QzqfvbB/8IWSc=;
	b=aC83p7Oode05AFfWHqhfAgFOSIvHcKx7coXV36fnMXg/QTx3cvzz75BTL0k10RnidG
	vGHrotRJPdHuXLgLEsz7ej67zbg1qKSEZTTShFl+EMpElHGehPvVhbg7ME0lu+iGn7L7
	F04YLVA069kHdmG+VtvMTnfFzlVB0kLmXmz4diY0oCbyeJ8FW8+PCsukdrfMoZ/0qjtJ
	dN+T7Kqffpb2PW1m37aRlVTi0m3ERiVHTdGcfxj34K7HPEyhUJ1QJ3trHZ2mUXSninVX
	ok88WR13lL/7aYAspsT2kDactff0OLdesum1rjDY/JTUIZXOWBOh70PINjh0hR+PIjzQ
	lExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7j8WeKy4yqCXFZCt1pG4e95e89eGP+QzqfvbB/8IWSc=;
	b=c0be+jGnpcF0PPUBwBQhSAUVQsxiV2L0rojygFSht27yu4D2cA3tBqxAC7l0Eb0+CF
	0W6wx7flsaEe94W75/tmZiEWOgz1RQ9qvflnflrxId3diE2kCAOlAxKOyMO64PqrvvVp
	+/iuwhwaBmHN+Sz6mMIAkA15JFYG0tJzAjEPtWPr9v4NtbrfsRRP6fg55ifb7eICa0yE
	35n+P6F4f6F68Dbx9o/JC6TzDgin133z6TQSWKY8PQo1CBQVfcZCj4DqA3JRgy8AccZ3
	wQ7+s7qDCDJJaTEjJ/wMMk9jf+75KS82kHiG64EO0gCMCN6mdP9fLcTONReKwkaue54I
	b2mw==
X-Gm-Message-State: APjAAAUCRCEk9evSQV/K/xC71aBWRevIHCIEXqFt4DOfMPjKZUVBy5S3
	ztU+7F9oJ6TZU2oypkLFBDIw+UZT
X-Google-Smtp-Source: APXvYqw824ZhyPvA+l16kkZnDbzbOW6JF2LFz+be7o65klWVMcb8xIBC2KkrhL7IDmvi55MSJ2eurQ==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr3082738wmd.48.1557323706298; 
	Wed, 08 May 2019 06:55:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j190sm4212478wmb.19.2019.05.08.06.55.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 06:55:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 15:54:57 +0200
Message-Id: <20190508135459.84886-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] meson: update to 0.50.1
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
X-List-Received-Date: Wed, 08 May 2019 13:55:06 -0000

None of the backported patches actually made it into this release.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc                |  4 ++--
 .../meson/0001-Make-CPU-family-warnings-fatal.patch  |  2 +-
 ...d-environment.py-do-not-determine-whether-a.patch | 12 +++++-------
 ...0002-Support-building-allarch-recipes-again.patch |  2 +-
 .../meson/{meson_0.50.0.bb => meson_0.50.1.bb}       |  0
 ...sdk-meson_0.50.0.bb => nativesdk-meson_0.50.1.bb} |  0
 6 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.50.0.bb => meson_0.50.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.50.0.bb => nativesdk-meson_0.50.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 21d34da6adf..6a723683cc0 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -18,8 +18,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            "
-SRC_URI[sha256sum] = "2a1bc42dda58206fb922cda5e1ca95cc03ad126321d26acc47d3493ec4e7021f"
-SRC_URI[md5sum] = "433483107fda4616eaf33de7e7083a84"
+SRC_URI[sha256sum] = "f68f56d60c80a77df8fc08fa1016bc5831605d4717b622c96212573271e14ecc"
+SRC_URI[md5sum] = "24a6527796115828d2ebc75880e18d62"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 9e90b72f313..adde1e271f1 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 1ec44c955f45f3787aaf92edd70dec5bcf03f665 Mon Sep 17 00:00:00 2001
+From 4b4b3d4932d928f05dbd74d730a3c8a5ac371e1d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
index e64e13b8360..83347145417 100644
--- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
+++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
@@ -1,4 +1,4 @@
-From c040f0dbace3259c80f3710bc019433b9c817940 Mon Sep 17 00:00:00 2001
+From d9da5e7a16a9397e22a8900fac4b60b40d7f00de Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 25 Mar 2019 18:18:33 +0100
 Subject: [PATCH] mesonbuild/environment.py: do not determine whether a build
@@ -8,23 +8,21 @@ This can, and does, go wrong when our host architecture is same as the target on
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  mesonbuild/environment.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 4c1c5ac..6e5d689 100644
+index d4f0630..c584fa4 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -478,7 +478,7 @@ class Environment:
+@@ -483,7 +483,7 @@ class Environment:
          self.first_invocation = True
  
      def is_cross_build(self):
--        return not self.machines.matches_build_machine(MachineChoice.HOST)
+-        return self.coredata.cross_file is not None
 +        return self.need_exe_wrapper()
  
      def dump_coredata(self):
          return coredata.save(self.coredata, self.get_build_dir())
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 323e21d8f6e..e47e555324f 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From a4bce582c1f13f48b329526aa81710405c4c691e Mon Sep 17 00:00:00 2001
+From 2164655328ec4e47335fc9033813274365491ad8 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_0.50.0.bb b/meta/recipes-devtools/meson/meson_0.50.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.50.0.bb
rename to meta/recipes-devtools/meson/meson_0.50.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.50.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.50.0.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
-- 
2.17.1


