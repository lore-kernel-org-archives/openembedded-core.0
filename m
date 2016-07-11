Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id AA400607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:05:42 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j37so1675226qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=so6xAZtye0eCZPcdAwMW/XPNE+miCVQyAWA/Tp2BwvY=;
	b=aqyXiydpDCfaTgM574bf6mInigkG7JCv2egwgFtpgJSyzYB/0tZ3sRavFLQTepzURm
	djGba6Ax3jKoW/LzAnetComkDbyv5J0mfV2n1DMizrGazxInjAgR3xQwbQrHrZbYxCtG
	LpEoTvpG/bSO3ofOaiTgXN3kfCG4stB2tuH1k8R+42NXw+Couc7XaF8QApck8eBJAp3L
	vN+inNRGdSJNuxXZ6jWjsOPMBO2ePiTCCvSCFwJfbrctFncCrPw0j7FqVIgm2l7OojRG
	jn3OZmmqZ+Ko8V3jmXkEHHJiVlfxp2xv6VfHYMtfBhGjfuFkON01LUvJb05t74OiAKSX
	k9VA==
X-Gm-Message-State: ALyK8tIjsxtwegmXzN9px4L9QtlyapanRBzcHQxd2tGDr7bNgzXInpQpwLlwlH5sTqXPWA==
X-Received: by 10.237.34.44 with SMTP id n41mr32409489qtc.25.1468260343062;
	Mon, 11 Jul 2016 11:05:43 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(c-68-34-224-206.hsd1.al.comcast.net. [68.34.224.206])
	by smtp.gmail.com with ESMTPSA id z64sm2782636qkb.3.2016.07.11.11.05.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 11:05:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 14:05:22 -0400
Message-Id: <1468260322-693-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH v2] python3: update manifest RDEPENDS for importlib and compression packages
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
X-List-Received-Date: Mon, 11 Jul 2016 18:05:46 -0000

zipfile.py has dependencies on importlib, threading, and shell
importlib has a dependency on lang
operator and contextlib added to the lang package instead of falling into misc

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 6 +++---
 scripts/contrib/python/generate-manifest-3.5.py      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index b14d567..8de6f03 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -30,7 +30,7 @@ RDEPENDS_${PN}-compile="${PN}-core"
 FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/compileall.* "
 
 SUMMARY_${PN}-compression="Python high-level compression support"
-RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
+RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell"
 FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
@@ -106,7 +106,7 @@ RDEPENDS_${PN}-image="${PN}-core"
 FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/lib-dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so "
 
 SUMMARY_${PN}-importlib="Python import implementation library"
-RDEPENDS_${PN}-importlib="${PN}-core"
+RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
 FILES_${PN}-importlib="${libdir}/python3.5/importlib "
 
 SUMMARY_${PN}-io="Python low-level I/O"
@@ -119,7 +119,7 @@ FILES_${PN}-json="${libdir}/python3.5/json ${libdir}/python3.5/lib-dynload/_json
 
 SUMMARY_${PN}-lang="Python low-level language support"
 RDEPENDS_${PN}-lang="${PN}-core"
-FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so ${libdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynload/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/python3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.so ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dynload/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.* ${libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.* ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/dis.* ${libdir}/python3.5/functools.* ${libdir}/python3.5/heapq.* ${libdir}/python3.5/inspect.* ${libdir}/python3.5/keyword.* ${libdir}/python3.5/opcode.* ${libdir}/python3.5/symbol.* ${libdir}/python3.5/repr.* ${libdir}/python3.5/token.* ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/weakref.* "
+FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so ${libdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynload/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/python3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.so ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dynload/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.* ${libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.* ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/contextlib.* ${libdir}/python3.5/dis.* ${libdir}/python3.5/functools.* ${libdir}/python3.5/heapq.* ${libdir}/python3.5/inspect.* ${libdir}/python3.5/keyword.* ${libdir}/python3.5/opcode.* ${libdir}/python3.5/operator.* ${libdir}/python3.5/symbol.* ${libdir}/python3.5/repr.* ${libdir}/python3.5/token.* ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/weakref.* "
 
 SUMMARY_${PN}-logging="Python logging support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index e04da1d..775f0c2 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -217,7 +217,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-compile", "Python bytecode compilation support", "${PN}-core",
     "py_compile.* compileall.*" )
 
-    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs",
+    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so" )
 
     m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
@@ -262,7 +262,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
-    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core",
+    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core ${PN}-lang",
     "importlib" )
 
     m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
@@ -281,7 +281,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
     "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
     "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/operator.*.so lib-dynload/parser.*.so " +
-    "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
+    "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.* contextlib.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* operator.* symbol.* repr.* token.* " +
     "tokenize.* traceback.* weakref.*" )
 
     m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
-- 
1.9.1


