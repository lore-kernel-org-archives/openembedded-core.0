Return-Path: <bkylerussell@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD74A6612C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 16:32:51 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id q83so18525562iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ncZOjdXA/ox1TxkoKaRM3em9wy+1tumbuWMi5Afk8X8=;
	b=cKaKPkL6F/Jhra24Mgns3Z7d0W7I3Uxo4mV/+cYbuIUpaUybfcqrfvebcpqahQFdo7
	OkgdrxrZX93GjUc9tThDKc8U82YCQ/PG7STKPBX8yOZ4SiF/HzSjdJqJm1TlJHfGlBgX
	vcgEBPjeDiu8bhtVYnjOLra8edpNmmez391Wu9jv5ZqMWXDJOW821nqsGPVQRtvgS1sC
	37rE35VCpn3n6ks8irOPWgqTJp24wA4V9kUUwfmTRNYYiZs3xQoclOH30ttopaWJXlRJ
	fRqedx2/KL0c5bo7vIinVqgyibln5shce7ItR9HcRijGxlgV2sroJ1UfFS/HhygMjWgs
	mjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ncZOjdXA/ox1TxkoKaRM3em9wy+1tumbuWMi5Afk8X8=;
	b=EGuFuykh743qHwAGvdKYqi0KQ6O8Gsp36qXtT1zLvV9A54nZ/62pb3JENDe2tGRxDz
	feAvYU7wO2+UiEI4tmSBAwervwd04TaslmdlSR6uzMHSALC0hzzvrqZoSnEDcb5+PyRX
	M6RSFuBnnW69j+HY2uYSeTA6eFjhvfZkTFgKPEFPQ8goP5mrZ6a4+OWSxqYVn/yZKS+T
	ZQ0ziNUxyUsNLm5XDxMHwtY9GB9gVur38Dwi6tPH3RWp2dpzFS1gsNmqPzs4sHp8Q18Q
	yJipyR07aYvRUGS4gZQDnpDUZtoS+4DnEsQphSdO9BMS/1YaTfvVcNQB5KoriccfKDkq
	45sQ==
X-Gm-Message-State: AEkoouuvM33gKf62uZhcpOrPdnApG3n8YAG349LCUabaOH92SvMeldXBEGp6RfJjJ2rEWQ==
X-Received: by 10.107.186.2 with SMTP id k2mr79985374iof.119.1470241972102;
	Wed, 03 Aug 2016 09:32:52 -0700 (PDT)
Received: from brrussell-Latitude-E6530.dhcp.lexmark.com ([192.146.101.8])
	by smtp.gmail.com with ESMTPSA id
	c191sm2047256ith.15.2016.08.03.09.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Aug 2016 09:32:51 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 12:32:39 -0400
Message-Id: <1470241959-16988-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta][PATCH] python-3.5-manifest: Add some missing RDEPENDS
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
X-List-Received-Date: Wed, 03 Aug 2016 16:32:52 -0000

ctype's util.py needs subprocess
lang's inspect.py needs importlib.machinery
math's random.py needs crypt's hashlib
subprocess imports threading

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 8 ++++----
 scripts/contrib/python/generate-manifest-3.5.py      | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index d0cb98d..c3a24fe 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -42,7 +42,7 @@ RDEPENDS_${PN}-crypt="${PN}-core"
 FILES_${PN}-crypt="${libdir}/python3.5/hashlib.* ${libdir}/python3.5/md5.* ${libdir}/python3.5/sha.* ${libdir}/python3.5/lib-dynload/crypt.*.so ${libdir}/python3.5/lib-dynload/_hashlib.*.so ${libdir}/python3.5/lib-dynload/_sha256.*.so ${libdir}/python3.5/lib-dynload/_sha512.*.so "
 
 SUMMARY_${PN}-ctypes="Python C types support"
-RDEPENDS_${PN}-ctypes="${PN}-core"
+RDEPENDS_${PN}-ctypes="${PN}-core ${PN}-subprocess"
 FILES_${PN}-ctypes="${libdir}/python3.5/ctypes ${libdir}/python3.5/lib-dynload/_ctypes.*.so ${libdir}/python3.5/lib-dynload/_ctypes_test.*.so "
 
 SUMMARY_${PN}-curses="Python curses support"
@@ -118,7 +118,7 @@ RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
 FILES_${PN}-json="${libdir}/python3.5/json ${libdir}/python3.5/lib-dynload/_json.*.so "
 
 SUMMARY_${PN}-lang="Python low-level language support"
-RDEPENDS_${PN}-lang="${PN}-core"
+RDEPENDS_${PN}-lang="${PN}-core ${PN}-importlib"
 FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so ${libdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynload/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/python3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.so ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dynload/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.* ${libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.* ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/contextlib.* ${libdir}/python3.5/dis.* ${libdir}/python3.5/functools.* ${libdir}/python3.5/heapq.* ${libdir}/python3.5/inspect.* ${libdir}/python3.5/keyword.* ${libdir}/python3.5/opcode.* ${libdir}/python3.5/operator.* ${libdir}/python3.5/symbol.* ${libdir}/python3.5/repr.* ${libdir}/python3.5/token.* ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/weakref.* "
 
 SUMMARY_${PN}-logging="Python logging support"
@@ -130,7 +130,7 @@ RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
 FILES_${PN}-mailbox="${libdir}/python3.5/mailbox.* "
 
 SUMMARY_${PN}-math="Python math support"
-RDEPENDS_${PN}-math="${PN}-core"
+RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
 FILES_${PN}-math="${libdir}/python3.5/lib-dynload/cmath.*.so ${libdir}/python3.5/lib-dynload/math.*.so ${libdir}/python3.5/lib-dynload/_random.*.so ${libdir}/python3.5/random.* ${libdir}/python3.5/sets.* "
 
 SUMMARY_${PN}-mime="Python MIME handling APIs"
@@ -214,7 +214,7 @@ RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
 FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so ${libdir}/python3.5/string.* ${libdir}/python3.5/stringold.* "
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
-RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
+RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-threading"
 FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* "
 
 SUMMARY_${PN}-syslog="Python syslog interface"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 2feea2c..8e3a3d3 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -229,7 +229,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-curses", "Python curses support", "${PN}-core",
     "curses lib-dynload/_curses.*.so lib-dynload/_curses_panel.*.so" ) # directory + low level module
 
-    m.addPackage( "${PN}-ctypes", "Python C types support", "${PN}-core",
+    m.addPackage( "${PN}-ctypes", "Python C types support", "${PN}-core ${PN}-subprocess",
     "ctypes lib-dynload/_ctypes.*.so lib-dynload/_ctypes_test.*.so" ) # directory + low level module
 
     m.addPackage( "${PN}-datetime", "Python calendar and time support", "${PN}-core ${PN}-codecs",
@@ -278,7 +278,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re",
     "json lib-dynload/_json.*.so" ) # package
 
-    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
+    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core ${PN}-importlib",
     "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
     "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/operator.*.so lib-dynload/parser.*.so " +
     "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.* contextlib.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* operator.* symbol.* repr.* token.* " +
@@ -290,7 +290,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
-    m.addPackage( "${PN}-math", "Python math support", "${PN}-core",
+    m.addPackage( "${PN}-math", "Python math support", "${PN}-core ${PN}-crypt",
     "lib-dynload/cmath.*.so lib-dynload/math.*.so lib-dynload/_random.*.so random.* sets.*" )
 
     m.addPackage( "${PN}-mime", "Python MIME handling APIs", "${PN}-core ${PN}-io",
@@ -339,7 +339,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re ${PN}-compression",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
-    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
+    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-threading",
     "subprocess.*" )
 
     m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading",
-- 
1.9.1


