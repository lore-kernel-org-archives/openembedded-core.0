Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6372660767
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 17:10:21 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p65so36790438wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7QCTaVky101c/uXAWKF5uSBy6+jER71uXuwhqiZOVsU=;
	b=Le77J5OjnitKuRaN5HSn6psAYnEbK4l7m8kQXsyGnvrrW74BKgJBYBzyF3Tvy8b2cE
	2PqSBpIsvKwum48UWQmL/oxo1cpTxJnd25zMkg5906m9pQEfqNsjO5Mx7Amx8nVuW8wB
	scdeHorxT6/9PkeIFa8QjZYNlwmhBMqMRvXVooqRkHRFZ7nTHiVQ8T22x6drMHqbL+mU
	F/knd9wa+4dp/sgkNs1T1mIuVM+znIYhZSET6Y0bwOGJsOK85B6UuO5wAG9ZtyI3Qr7s
	HEKoMj9Ozj7tMGbH5Oi2vQRLXEPRHhe3D3QCG4MGXJQeujcT/raiXwAEZ3WHswiHaHHb
	wB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7QCTaVky101c/uXAWKF5uSBy6+jER71uXuwhqiZOVsU=;
	b=GnOz8UmJ/nM7hWGO/mOOw8ke5NpR/6drnRfoCMLGrxUQx3UNUJSReDLM82rDxqLSLN
	E5bRuosTPEO4mCPyDMPJEeG8pWznNv9bBLVhOH52hZxz48BUfk8D7XJNPzMfWyD4v5D7
	ReE5Mn6sLrK41/awzNqU8S8XcdZNXQGjlkiyekzZjW14YMyNCFYdCeiv0Y2MRTLPyqHT
	dNr/pRrM/XS5C8vLyIR/ijai8rTzKySfjWg1lI98pmaNIu/udmc7aXlrD/tOpb17y6tG
	bBXBcKy1qVwQHCmqcWigysanzKQHWoefHNSU/KgXf0Y8T3/wspjxN6jhNgf56OgSSjGf
	Nv6g==
X-Gm-Message-State: AD7BkJIWXPw12vS/56DU4wIXkncAPhH/xnUQ48SCq61p+c4igtkENcikpPD/SDIrGRdpIicX
X-Received: by 10.194.174.231 with SMTP id bv7mr24234427wjc.17.1457457021543; 
	Tue, 08 Mar 2016 09:10:21 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	vw2sm3872133wjc.43.2016.03.08.09.10.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Mar 2016 09:10:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 17:10:18 +0000
Message-Id: <1457457018-22513-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] python: move ast module into python-core
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
X-List-Received-Date: Tue, 08 Mar 2016 17:10:23 -0000

The compile() method returns objects that inherit from ast.AST so it's best that
python-core contains this class.

[YOCTO #8684]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index fe72799..189689d 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -47,7 +47,7 @@ FILES_${PN}-contextlib="${libdir}/python${PYTHON_MAJMIN}/contextlib.* "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
-FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 0c743a2..335c3ff 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -35,7 +35,7 @@ FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/ConfigParser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/ConfigParser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 14162c6..d93c943 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -164,7 +164,7 @@ if __name__ == "__main__":
     #
 
     m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re",
-    "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
+    "__future__.* _abcoll.* abc.* ast.* copy.* copy_reg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
     "warnings.* site.* stat.* " +
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 20ceabc..367b4b8 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -167,7 +167,7 @@ if __name__ == "__main__":
     #
 
     m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math",
-    "__future__.* _abcoll.* abc.* copy.* copyreg.* ConfigParser.* " +
+    "__future__.* _abcoll.* abc.* ast.* copy.* copyreg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
     "warnings.* site.* stat.* " +
-- 
2.7.0


