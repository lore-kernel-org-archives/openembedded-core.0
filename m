Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6987FC06
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:21 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id e11so4675083wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rAre8S7X6EzB95T2ecsJF1rQjAjjDc7/K2YFzAkC3Y0=;
	b=CduxKgBUA/n8pQ4W5QD+yUwW/9Xy9BPn7NTNjhIJDbpW0vMqmVnhSF08JvWNcqw7NN
	ryA2kLuyT23Ez1VLwRxpD0vJKYgKz+zj7GKT+4L/XwszX8Omt8ljraSrdOvH1ZZghLRJ
	AHHV6GCf08EZyxrvxoKA7zsybGBbzHrTSSsjbNW+ztZ9QzdcbyuzkVF+/yUa28EJ6av+
	YqM7ppsC3q3mYfyhZ4Mneb0vCMYzddAP3Z/QNr/5gTctHqENhg1BIJSXu/GpgGBjYkvH
	DmvRHDF4z0Ha31hSY/s4SeUoE0jcLbQ/zntTZrgukz1FcuNwlA5IgEdsdSv/tJITJxCQ
	ySsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rAre8S7X6EzB95T2ecsJF1rQjAjjDc7/K2YFzAkC3Y0=;
	b=Nbxp0tx2h49DT83XxW4Vosu1HdZMg3M2qXpVkTFAi4IgFx517CPlJujphrAUbDDEDq
	Mmt1fNC0fRMIAnTBhF7tfOoIf0nCwcnavVjyC8+MvvkrPIu2u/kKYj0k6fZTVOrp18ls
	4atvYldeN09EixVZ88BxUjVy5m+PlCWn8qtJbmFm3GQ+AuLiJCIHpz3vkw4flPqThJXP
	XgzZ9Nx1hPhEJIa8nK8AjvJo+OOdAC32NQd+WCiu16Qd0FbJT2g3bTLB/1f7wwWPFTBc
	UkJG+pIU1MwmrKp4Ou7ab7bH0w3401UbsZMonZjUhldayVuWQ8xWAcykUklXvo/a8OxB
	ti5Q==
X-Gm-Message-State: APjAAAUizHXagRZCAgNumhkjHWulzqxqzWPCIGR6gpa4X/3GKtcGMOaV
	YQfgf6oekH6nTHBXIYf4I+D3DICEtmw=
X-Google-Smtp-Source: APXvYqwdk9wAPg/Ey/2OwUYd8/NTpgaG6bli+rC4LsQaMIaQAgiIwaCvGxqQ5bkdjQJoSJqIwt19LA==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr6010817wrw.243.1572072621948; 
	Fri, 25 Oct 2019 23:50:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:53 -0700
Message-Id: <10d87a3085665a959a5fda64ae3895cb27ddf343.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 21/28] python: Fix CVE-2019-10160
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:21 -0000

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b4240b585d7fcac2fdbf33a8e72d48cb732eb696)
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
index aec8778..ebb4824 100644
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


