Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id EDCB07FBA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id a11so12849706wra.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YRKTzO8HxWmM8wbIGL64CyFsZGAAPY+YkIP8Z72mXjw=;
	b=BKOc2tMAgfHrJ9M3uftw6ZAP3TN07xsyYqT334nqLYtK+l8wCJGcVzg6Ze2tsY58rC
	2i9GW/dtjh1Upoc4B3iO4tyvX4LmylktuGdSfdSOIOjm8i3NItXE8sZRN860jxhe/GdH
	WkpXObkDN1kC+F+m05gXGDCC8QbkXRHcjfWbodCcHeot6v8tsaLLF5HZFJ2WWIj9F/73
	cTy6B0FqsqXVrkvOwIFGhTcEg/5QMadFHQMer8mb8ijTHmkiiunmWMdYXhFikv4GWg6o
	XFQMT2LsZLWnHJKAMlVQ9ZyiL6w3Qy+bA+FoDYUx/s78/53iqePantXcJu69zLPPTh3S
	47iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YRKTzO8HxWmM8wbIGL64CyFsZGAAPY+YkIP8Z72mXjw=;
	b=FbwcPxX74EbrbeROwW+GJ+c1PDLbxNr6IxJvP3f+gj5VXL2UvzYXjizuiVi6oaZ887
	PO8mXGBzg1kRvQdJoNtPkW1v8VLNfTOgm1QEgFRtj1fZSSIxbdDmGMAMAhq+OciyEkw0
	PcjYglUjfCtOXScYZBG9ZHmcjtqdxwC8/Na/TDVIy8KdYjD/iAye22wDtYuXZ71igdCo
	NcormcK5Wiv/oUAVyDj+zmiCrm9Jvd0pyZdQD5hwtce+RRyrKS3iykzobuHDiTyDrK+J
	XLGMh6kl7mhZFCtfZOfICNjKWpATrjxfsoa2ioqVVGPRFkWGaWhodcdQ8BYypO6nf19P
	1sTA==
X-Gm-Message-State: APjAAAVkqWEeiRQgJigWzEABthWSyI547kylBxcSH7SIr4lbyAcf6C0A
	k9Dt0sxzjapEZXxLN7j1gEuIBa2bs2M=
X-Google-Smtp-Source: APXvYqxLvOmNbqFfMv9k+7xrihFOs0vLgpGYv+5j7HMwui2HO2aQNURsHFDIx37cgjaBPlMLGW82tA==
X-Received: by 2002:adf:f306:: with SMTP id i6mr18286734wro.209.1572342474380; 
	Tue, 29 Oct 2019 02:47:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:27 +0100
Message-Id: <89d9d7ce1c971dbcf46378bd69c70b87cef80715.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 14/19] python: Fix CVE-2019-10160
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:54 -0000

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b4240b585d7fcac2fdbf33a8e72d48cb732eb696)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 10d87a3085665a959a5fda64ae3895cb27ddf343)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python/bpo-36742-cve-2019-10160.patch   | 81 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch

diff --git a/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch b/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
new file mode 100644
index 0000000..1b6cb8c
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
@@ -0,0 +1,81 @@
+From 5a1033fe5be764a135adcfff2fdc14edc3e5f327 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 10 Oct 2019 16:32:19 +0800
+Subject: [PATCH] bpo-36742: Fixes handling of pre-normalization characters in
+ urlsplit() bpo-36742: Corrects fix to handle decomposition in usernames
+
+Upstream-Status: Backport
+
+https://github.com/python/cpython/commit/98a4dcefbbc3bce5ab07e7c0830a183157250259
+https://github.com/python/cpython/commit/f61599b050c621386a3fc6bc480359e2d3bb93de#diff-b577545d73dd0cdb2c337a4c5f89e1d7
+
+CVE: CVE-2019-10160
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Lib/test/test_urlparse.py | 19 +++++++++++++------
+ Lib/urlparse.py           | 14 +++++++++-----
+ 2 files changed, 22 insertions(+), 11 deletions(-)
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 1830d0b..857ed96 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -641,13 +641,20 @@ class UrlParseTestCase(unittest.TestCase):
+         self.assertIn(u'\u2100', denorm_chars)
+         self.assertIn(u'\uFF03', denorm_chars)
+ 
++        # bpo-36742: Verify port separators are ignored when they
++        # existed prior to decomposition
++        urlparse.urlsplit(u'http://\u30d5\u309a:80')
++        with self.assertRaises(ValueError):
++            urlparse.urlsplit(u'http://\u30d5\u309a\ufe1380')
++
+         for scheme in [u"http", u"https", u"ftp"]:
+-            for c in denorm_chars:
+-                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
+-                if test_support.verbose:
+-                    print "Checking %r" % url
+-                with self.assertRaises(ValueError):
+-                    urlparse.urlsplit(url)
++            for netloc in [u"netloc{}false.netloc", u"n{}user@netloc"]:
++                for c in denorm_chars:
++                    url = u"{}://{}/path".format(scheme, netloc.format(c))
++                    if test_support.verbose:
++                        print "Checking %r" % url
++                    with self.assertRaises(ValueError):
++                        urlparse.urlsplit(url)
+ 
+ def test_main():
+     test_support.run_unittest(UrlParseTestCase)
+diff --git a/Lib/urlparse.py b/Lib/urlparse.py
+index 54eda08..e34b368 100644
+--- a/Lib/urlparse.py
++++ b/Lib/urlparse.py
+@@ -171,14 +171,18 @@ def _checknetloc(netloc):
+     # looking for characters like \u2100 that expand to 'a/c'
+     # IDNA uses NFKC equivalence, so normalize for this check
+     import unicodedata
+-    netloc2 = unicodedata.normalize('NFKC', netloc)
+-    if netloc == netloc2:
++    n = netloc.replace(u'@', u'') # ignore characters already included
++    n = n.replace(u':', u'')      # but not the surrounding text
++    n = n.replace(u'#', u'')
++    n = n.replace(u'?', u'')
++
++    netloc2 = unicodedata.normalize('NFKC', n)
++    if n == netloc2:
+         return
+-    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
+     for c in '/?#@:':
+         if c in netloc2:
+-            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
+-                             "characters under NFKC normalization")
++            raise ValueError(u"netloc '" + netloc + u"' contains invalid " +
++                             u"characters under NFKC normalization")
+ 
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index b263e72..1c7c581 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -31,6 +31,7 @@ SRC_URI += " \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
+           file://bpo-36742-cve-2019-10160.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


