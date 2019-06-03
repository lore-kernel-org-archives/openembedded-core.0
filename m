Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id EB5AE7E32C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:12 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q17so10785540pfq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n0mEeTgza0V8pkTZMeMpuO8xkkjqeIiHNr7o1dRqhoY=;
	b=ha5dMG9xc2X0vha8fsVm6fa9Uwm/rUmBGwQBm+Lh9kiZdSkDwnmHBTeD37WdzRaV+m
	fg9wUBi9Wn6wdoU0VujwQ1lEW1tUyVKJQNeFifZlC2eNz9EXd/S9soP0ad9oQUqJzX3k
	ps1Ux2XCOVxY5HPZ0twZ9a/JF8/meDC78GCm+VvqnaYO6ZiG8MDvP58vQv8JwjG6ZrYx
	MParZ6BsGsdkLpvB5l93+npXDEaocEecUN63L1V2yAZvnJfb5vdftKaKWMlvqRbefKnt
	YhJg47n1sMFZ8Esg1gjJ6yRVwOttH6GcIM9EEvQmfBAS91FVM7H2Rj3bXtjXiSiLmtSQ
	N1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n0mEeTgza0V8pkTZMeMpuO8xkkjqeIiHNr7o1dRqhoY=;
	b=XTmGxek+pPfbBqKfn+B1M/Wsd5STBLXKEqnDzjzKlPh0+xBKc/f8WTE4yoU76WUsFt
	Le0Zi+2j9TuXaH4fuLfBk0uUFAMI4X5hoSRY9TFepBF1QSobqe6tFVk+cakLP7gfcIPG
	yHHGqfPVsl7K6NBk2wh1Qdaqiv1j6atS7/pPfui9MHs8z9T/e3PYq0Lqu5XCKMpQzQ/E
	/Z2ds1QfV4tqZ1RpccZ8Puf6zFmZ9DPBhU6PiBXALpM+Pol6SpZNoaJ6AIcIArNW63bJ
	6oVBuZle0OjzXe7DOEmZyx+a3PHN7E7PO1YBgX0no+P/s3rlb/cEBvlx9932SN2jlnPK
	/tkw==
X-Gm-Message-State: APjAAAW/g5Fmkx0J8ws2Gji9Gz581RcQNlvnKE8xC8Lw2NKrECuDkIw4
	hxE19FgL3dD1tBPJ82JdLHfqfS7l
X-Google-Smtp-Source: APXvYqxm9ZyCGjWnswKsviPyQ2gNtkYhGN3mL3lcFfXY+Ywrne+8c7dmOorIDgbWfVFKxA1ctsbVfA==
X-Received: by 2002:a63:9548:: with SMTP id t8mr28824948pgn.256.1559574433814; 
	Mon, 03 Jun 2019 08:07:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:48 -0700
Message-Id: <6c8994a6ae8860c4b27d8ec990344c6b099cc685.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 05/21] python: add a fix for CVE-2019-9948 and CVE-2019-9636
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:13 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/bpo-35907-cve-2019-9948-fix.patch       |  55 ++++++++++
 .../python/python/bpo-35907-cve-2019-9948.patch    |  55 ++++++++++
 .../python/bpo-36216-cve-2019-9636-fix.patch       |  28 ++++++
 .../python/python/bpo-36216-cve-2019-9636.patch    | 111 +++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb      |   6 +-
 5 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch

diff --git a/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch b/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
new file mode 100644
index 0000000..b267237
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
@@ -0,0 +1,55 @@
+From 179a5f75f1121dab271fe8f90eb35145f9dcbbda Mon Sep 17 00:00:00 2001
+From: Sihoon Lee <push0ebp@gmail.com>
+Date: Fri, 17 May 2019 02:41:06 +0900
+Subject: [PATCH] Update test_urllib.py and urllib.py\nchange assertEqual into
+ assertRasies in DummyURLopener test, and simplify mitigation
+
+Upstream-Status: Submitted https://github.com/python/cpython/pull/11842
+
+CVE: CVE-2019-9948
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Lib/test/test_urllib.py | 11 +++--------
+ Lib/urllib.py           |  4 ++--
+ 2 files changed, 5 insertions(+), 10 deletions(-)
+
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index e5f210e62a18..1e23dfb0bb16 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -1027,14 +1027,9 @@ def test_local_file_open(self):
+         class DummyURLopener(urllib.URLopener):
+             def open_local_file(self, url):
+                 return url
+-        self.assertEqual(DummyURLopener().open(
+-            'local-file://example'), '//example')
+-        self.assertEqual(DummyURLopener().open(
+-            'local_file://example'), '//example')
+-        self.assertRaises(IOError, urllib.urlopen,
+-            'local-file://example')
+-        self.assertRaises(IOError, urllib.urlopen,
+-            'local_file://example')
++        for url in ('local_file://example', 'local-file://example'):
++            self.assertRaises(IOError, DummyURLopener().open, url)
++            self.assertRaises(IOError, urllib.urlopen, url)
+ 
+ # Just commented them out.
+ # Can't really tell why keep failing in windows and sparc.
+diff --git a/Lib/urllib.py b/Lib/urllib.py
+index a24e9a5c68fb..39b834054e9e 100644
+--- a/Lib/urllib.py
++++ b/Lib/urllib.py
+@@ -203,10 +203,10 @@ def open(self, fullurl, data=None):
+         name = 'open_' + urltype
+         self.type = urltype
+         name = name.replace('-', '_')
+-        
++
+         # bpo-35907: # disallow the file reading with the type not allowed
+         if not hasattr(self, name) or \
+-            (self == _urlopener and name == 'open_local_file'):
++            getattr(self, name) == self.open_local_file:
+             if proxy:
+                 return self.open_unknown_proxy(proxy, fullurl, data)
+             else:
diff --git a/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch b/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
new file mode 100644
index 0000000..f4c225d
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
@@ -0,0 +1,55 @@
+From 8f99cc799e4393bf1112b9395b2342f81b3f45ef Mon Sep 17 00:00:00 2001
+From: push0ebp <push0ebp@shl-MacBook-Pro.local>
+Date: Thu, 14 Feb 2019 02:05:46 +0900
+Subject: [PATCH] bpo-35907: Avoid file reading as disallowing the unnecessary
+ URL scheme in urllib
+
+Upstream-Status: Submitted https://github.com/python/cpython/pull/11842
+
+CVE: CVE-2019-9948
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Lib/test/test_urllib.py | 12 ++++++++++++
+ Lib/urllib.py           |  5 ++++-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 1ce9201c0693..e5f210e62a18 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -1023,6 +1023,18 @@ def open_spam(self, url):
+             "spam://c:|windows%/:=&?~#+!$,;'@()*[]|/path/"),
+             "//c:|windows%/:=&?~#+!$,;'@()*[]|/path/")
+ 
++    def test_local_file_open(self):
++        class DummyURLopener(urllib.URLopener):
++            def open_local_file(self, url):
++                return url
++        self.assertEqual(DummyURLopener().open(
++            'local-file://example'), '//example')
++        self.assertEqual(DummyURLopener().open(
++            'local_file://example'), '//example')
++        self.assertRaises(IOError, urllib.urlopen,
++            'local-file://example')
++        self.assertRaises(IOError, urllib.urlopen,
++            'local_file://example')
+ 
+ # Just commented them out.
+ # Can't really tell why keep failing in windows and sparc.
+diff --git a/Lib/urllib.py b/Lib/urllib.py
+index d85504a5cb7e..a24e9a5c68fb 100644
+--- a/Lib/urllib.py
++++ b/Lib/urllib.py
+@@ -203,7 +203,10 @@ def open(self, fullurl, data=None):
+         name = 'open_' + urltype
+         self.type = urltype
+         name = name.replace('-', '_')
+-        if not hasattr(self, name):
++        
++        # bpo-35907: # disallow the file reading with the type not allowed
++        if not hasattr(self, name) or \
++            (self == _urlopener and name == 'open_local_file'):
+             if proxy:
+                 return self.open_unknown_proxy(proxy, fullurl, data)
+             else:
diff --git a/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch b/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
new file mode 100644
index 0000000..2ce4d2c
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
@@ -0,0 +1,28 @@
+From 06b5ee585d6e76bdbb4002f642d864d860cbbd2b Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@python.org>
+Date: Tue, 12 Mar 2019 08:23:33 -0700
+Subject: [PATCH] bpo-36216: Only print test messages when verbose
+
+CVE: CVE-2019-9636
+ 
+Upstream-Status: Backport https://github.com/python/cpython/pull/12291/commits/06b5ee585d6e76bdbb4002f642d864d860cbbd2b
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Lib/test/test_urlparse.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 73b0228ea8e3..1830d0b28688 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -644,7 +644,8 @@ def test_urlsplit_normalization(self):
+         for scheme in [u"http", u"https", u"ftp"]:
+             for c in denorm_chars:
+                 url = u"{}://netloc{}false.netloc/path".format(scheme, c)
+-                print "Checking %r" % url
++                if test_support.verbose:
++                    print "Checking %r" % url
+                 with self.assertRaises(ValueError):
+                     urlparse.urlsplit(url)
+ 
diff --git a/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch b/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
new file mode 100644
index 0000000..352b13b
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
@@ -0,0 +1,111 @@
+From 3e3669c9c41a27e1466e2c28b3906e3dd0ce3e7e Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@python.org>
+Date: Thu, 7 Mar 2019 08:25:22 -0800
+Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
+ to separators (GH-12201)
+
+CVE: CVE-2019-9636
+
+Upstream-Status: Backport https://github.com/python/cpython/pull/12216/commits/3e3669c9c41a27e1466e2c28b3906e3dd0ce3e7e
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Doc/library/urlparse.rst                      | 20 ++++++++++++++++
+ Lib/test/test_urlparse.py                     | 24 +++++++++++++++++++
+ Lib/urlparse.py                               | 17 +++++++++++++
+ .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
+ 4 files changed, 64 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 4e1ded73c266..73b0228ea8e3 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1,4 +1,6 @@
+ from test import test_support
++import sys
++import unicodedata
+ import unittest
+ import urlparse
+ 
+@@ -624,6 +626,28 @@ def test_portseparator(self):
+         self.assertEqual(urlparse.urlparse("http://www.python.org:80"),
+                 ('http','www.python.org:80','','','',''))
+ 
++    def test_urlsplit_normalization(self):
++        # Certain characters should never occur in the netloc,
++        # including under normalization.
++        # Ensure that ALL of them are detected and cause an error
++        illegal_chars = u'/:#?@'
++        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
++        denorm_chars = [
++            c for c in map(unichr, range(128, sys.maxunicode))
++            if (hex_chars & set(unicodedata.decomposition(c).split()))
++            and c not in illegal_chars
++        ]
++        # Sanity check that we found at least one such character
++        self.assertIn(u'\u2100', denorm_chars)
++        self.assertIn(u'\uFF03', denorm_chars)
++
++        for scheme in [u"http", u"https", u"ftp"]:
++            for c in denorm_chars:
++                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
++                print "Checking %r" % url
++                with self.assertRaises(ValueError):
++                    urlparse.urlsplit(url)
++
+ def test_main():
+     test_support.run_unittest(UrlParseTestCase)
+ 
+diff --git a/Lib/urlparse.py b/Lib/urlparse.py
+index f7c2b032b097..54eda08651ab 100644
+--- a/Lib/urlparse.py
++++ b/Lib/urlparse.py
+@@ -165,6 +165,21 @@ def _splitnetloc(url, start=0):
+             delim = min(delim, wdelim)     # use earliest delim position
+     return url[start:delim], url[delim:]   # return (domain, rest)
+ 
++def _checknetloc(netloc):
++    if not netloc or not isinstance(netloc, unicode):
++        return
++    # looking for characters like \u2100 that expand to 'a/c'
++    # IDNA uses NFKC equivalence, so normalize for this check
++    import unicodedata
++    netloc2 = unicodedata.normalize('NFKC', netloc)
++    if netloc == netloc2:
++        return
++    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
++    for c in '/?#@:':
++        if c in netloc2:
++            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
++                             "characters under NFKC normalization")
++
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+     <scheme>://<netloc>/<path>?<query>#<fragment>
+@@ -193,6 +208,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+                 url, fragment = url.split('#', 1)
+             if '?' in url:
+                 url, query = url.split('?', 1)
++            _checknetloc(netloc)
+             v = SplitResult(scheme, netloc, url, query, fragment)
+             _parse_cache[key] = v
+             return v
+@@ -216,6 +232,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         url, fragment = url.split('#', 1)
+     if '?' in url:
+         url, query = url.split('?', 1)
++    _checknetloc(netloc)
+     v = SplitResult(scheme, netloc, url, query, fragment)
+     _parse_cache[key] = v
+     return v
+diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+new file mode 100644
+index 000000000000..1e1ad92c6feb
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+@@ -0,0 +1,3 @@
++Changes urlsplit() to raise ValueError when the URL contains characters that
++decompose under IDNA encoding (NFKC-normalization) into characters that
++affect how the URL is parsed.
+\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index 0e7dd2b..d70342f 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -30,7 +30,11 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
-           "
+    file://bpo-35907-cve-2019-9948.patch \
+    file://bpo-35907-cve-2019-9948-fix.patch \
+    file://bpo-36216-cve-2019-9636.patch \
+    file://bpo-36216-cve-2019-9636-fix.patch \
+"
 
 S = "${WORKDIR}/Python-${PV}"
 
-- 
2.7.4


