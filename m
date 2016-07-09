Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id F3E6B601A4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 14:51:52 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f89so9290150qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 07:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9zoDU7acENknjD383NYnRmaURLlFrolC7knN7j43Eeg=;
	b=ALYKSAOaRA3AQlzL/87RS74uWsul4MWX8IQQo58bsGIOYWxlmAlFz7FgelzFOk76Zj
	VcxwkKklB7SHDWZOHSLZUnhl+QGnzMfYd/JXb/Mb89OcTkdty70LGpqsRIQZxBlNbEMr
	FcaC4+aupSQlqrhHmat5Up7iPKVBtesTChZ0FmZmL1RNEaktF5ka82MOEGCAj7gRnmFy
	8ZuBJasSCW4Pksfx/4VRQsnDYWd1MMOdxbU2mlCveF2TOGpAaNMruYy+fy3240SaHNoo
	f1gzVdGBLBsZVF1KNXswov0h/glz696ncma1RdFPSewFeT7TaPzp9XzN5Yykq2t8ctQg
	fdHw==
X-Gm-Message-State: ALyK8tJByOpwmN3iGHAXZ9OrnClO2Dt9kYwEa4cTBZFv1P9Q5TcZ65mf4Mf56P7H/NL+wg==
X-Received: by 10.237.39.167 with SMTP id a36mr16942529qtd.103.1468075912956; 
	Sat, 09 Jul 2016 07:51:52 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id o70sm356594qka.29.2016.07.09.07.51.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jul 2016 07:51:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2016 10:50:33 -0400
Message-Id: <1468075833-13999-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] python3: update manifest RDEPENDS for importlib and compression packages
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
X-List-Received-Date: Sat, 09 Jul 2016 14:51:53 -0000

    * zipfile has dependencies on threading and importlib
    * importlib has a dependency on operator via types import

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
 scripts/contrib/python/generate-manifest-3.5.py      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 335c3ff..846e2a9 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -30,7 +30,7 @@ RDEPENDS_${PN}-compile="${PN}-core"
 FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/compileall.* "
 
 SUMMARY_${PN}-compression="Python high-level compression support"
-RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
+RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading"
 FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
@@ -106,7 +106,7 @@ RDEPENDS_${PN}-image="${PN}-core"
 FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/lib-dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so "
 
 SUMMARY_${PN}-importlib="Python import implementation library"
-RDEPENDS_${PN}-importlib="${PN}-core"
+RDEPENDS_${PN}-importlib="${PN}-core ${PN}-misc"
 FILES_${PN}-importlib="${libdir}/python3.5/importlib "
 
 SUMMARY_${PN}-io="Python low-level I/O"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index e04da1d..d5f4c9d 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -217,7 +217,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-compile", "Python bytecode compilation support", "${PN}-core",
     "py_compile.* compileall.*" )
 
-    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs",
+    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so" )
 
     m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
@@ -262,7 +262,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
-    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core",
+    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core ${PN}-misc",
     "importlib" )
 
     m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
-- 
1.9.1


