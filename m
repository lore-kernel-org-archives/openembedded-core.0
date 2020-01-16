Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 11A097F877
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:46 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 6so10051601pgk.0
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yy7/29OF3BfPMifkcBbA8zUfNQ/vDdcKkX5aUA2r3yQ=;
	b=Y4yHehoul4tyFGjOeukAJVmdkB12RxnzScgo4at7mJc917Iwjr2k+3nRsHJO1fFURi
	bGGbqJhw8XARNf3cTuL5sjvBMq3JmZG7VobFcHiJ3j6+q/vD0SkM9BbrhzM1XuKUgaI8
	bSJy5WrHeYl9o0lUG08XzEwTC0ta33henTmlz9rzGeGOp4gOij5UK31tDs1J4qfaaqoJ
	JQ7WMRkatyEEC8RYmyzNwQwwbClu5LcKXj2W96NftltuxXz+bta+eYvcPU/8mq8i6JZU
	2v8x80KmicAEfZhPJv+/9YuoBQCSLA6+iLBHFairfnGTHKuAWZ61zfDtVj3LPEMJgit4
	rrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yy7/29OF3BfPMifkcBbA8zUfNQ/vDdcKkX5aUA2r3yQ=;
	b=DUxGtEZOVSaNShYAFq7a4Svdch0onrBJbmgQEZAsbu0b+8m9USZ85LhFn3+H/AG26f
	ff1GfRua10hmMvU22WAgiAAPV4xROBzTZEZxUah+J7dmw+VB4gifVUA7O5ptfQfrqnOt
	y8xs4FILXcWY8RO8sLTxbZ39rTOGnFMbS6UZIAEriw5ctIKqhCoi4ERlTc419e8b4OlQ
	anjn/8/182m21yFo0p7yVvFxi3ConX+J9c0X36igs9TiVezvoNc0DzilQm7P2hGwkxPW
	Dd5iSSA3Vq7z6Xpt+T9e2wcsSl/kaKKT2tIlglSAtn22zU6jjiePp6qNlV9tENFxTFJC
	qdXQ==
X-Gm-Message-State: APjAAAV+KkVFMY/s6LOFilK7udLv4Hahuq7WeKojA1ur9cgr9mwYAQAC
	IRkB5t5W7suo+IP4xm5pkcFLSj+N
X-Google-Smtp-Source: APXvYqzgN5oyWelL7zvoWsSIwqO7SBVRByyD6OU5L0m6/ra6DRAp0DD2PWsEXMRk5AajbdHzk3L5Gw==
X-Received: by 2002:a63:d108:: with SMTP id k8mr39229519pgg.434.1579188047910; 
	Thu, 16 Jan 2020 07:20:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.46
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:12 -0800
Message-Id: <98cc3bfc6656b8648da591dcb64de8472e6c97e0.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 03/32] python: fix CVE-2018-20852
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:47 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python.inc       |   1 +
 .../python/python/CVE-2018-20852.patch        | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2018-20852.patch

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 8d0e90862c..70481002bb 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -13,6 +13,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://bpo-36216-cve-2019-9636.patch \
            file://bpo-36216-cve-2019-9636-fix.patch \
            file://CVE-2019-9740.patch \
+           file://CVE-2018-20852.patch \
            "
 
 SRC_URI[md5sum] = "30157d85a2c0479c09ea2cbe61f2aaf5"
diff --git a/meta/recipes-devtools/python/python/CVE-2018-20852.patch b/meta/recipes-devtools/python/python/CVE-2018-20852.patch
new file mode 100644
index 0000000000..23c784a210
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2018-20852.patch
@@ -0,0 +1,123 @@
+From 979daae300916adb399ab5b51410b6ebd0888f13 Mon Sep 17 00:00:00 2001
+From: Xtreak <tir.karthi@gmail.com>
+Date: Sat, 15 Jun 2019 20:59:43 +0530
+Subject: [PATCH] [2.7] bpo-35121: prefix dot in domain for proper subdomain
+ validation (GH-10258) (GH-13426)
+
+This is a manual backport of ca7fe5063593958e5efdf90f068582837f07bd14 since 2.7 has `http.cookiejar` in `cookielib`
+
+
+https://bugs.python.org/issue35121
+CVE: CVE-2018-20852
+Upstream-Status: Backport [https://github.com/python/cpython/pull/13426]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/cookielib.py                              | 13 ++++++--
+ Lib/test/test_cookielib.py                    | 30 +++++++++++++++++++
+ .../2019-05-20-00-35-12.bpo-35121.RRi-HU.rst  |  4 +++
+ 3 files changed, 45 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+
+diff --git a/Lib/cookielib.py b/Lib/cookielib.py
+index 2dd7c48728e0..0b471a42f296 100644
+--- a/Lib/cookielib.py
++++ b/Lib/cookielib.py
+@@ -1139,6 +1139,11 @@ def return_ok_domain(self, cookie, request):
+         req_host, erhn = eff_request_host(request)
+         domain = cookie.domain
+ 
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++
+         # strict check of non-domain cookies: Mozilla does this, MSIE5 doesn't
+         if (cookie.version == 0 and
+             (self.strict_ns_domain & self.DomainStrictNonDomain) and
+@@ -1151,7 +1156,7 @@ def return_ok_domain(self, cookie, request):
+             _debug("   effective request-host name %s does not domain-match "
+                    "RFC 2965 cookie domain %s", erhn, domain)
+             return False
+-        if cookie.version == 0 and not ("."+erhn).endswith(domain):
++        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
+             _debug("   request-host %s does not match Netscape cookie domain "
+                    "%s", req_host, domain)
+             return False
+@@ -1165,7 +1170,11 @@ def domain_return_ok(self, domain, request):
+             req_host = "."+req_host
+         if not erhn.startswith("."):
+             erhn = "."+erhn
+-        if not (req_host.endswith(domain) or erhn.endswith(domain)):
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdomain)):
+             #_debug("   request domain %s does not match cookie domain %s",
+             #       req_host, domain)
+             return False
+diff --git a/Lib/test/test_cookielib.py b/Lib/test/test_cookielib.py
+index f2dd9727d137..7f7ff614d61d 100644
+--- a/Lib/test/test_cookielib.py
++++ b/Lib/test/test_cookielib.py
+@@ -368,6 +368,7 @@ def test_domain_return_ok(self):
+             ("http://foo.bar.com/", ".foo.bar.com", True),
+             ("http://foo.bar.com/", "foo.bar.com", True),
+             ("http://foo.bar.com/", ".bar.com", True),
++            ("http://foo.bar.com/", "bar.com", True),
+             ("http://foo.bar.com/", "com", True),
+             ("http://foo.com/", "rhubarb.foo.com", False),
+             ("http://foo.com/", ".foo.com", True),
+@@ -378,6 +379,8 @@ def test_domain_return_ok(self):
+             ("http://foo/", "foo", True),
+             ("http://foo/", "foo.local", True),
+             ("http://foo/", ".local", True),
++            ("http://barfoo.com", ".foo.com", False),
++            ("http://barfoo.com", "foo.com", False),
+             ]:
+             request = urllib2.Request(url)
+             r = pol.domain_return_ok(domain, request)
+@@ -938,6 +941,33 @@ def test_domain_block(self):
+         c.add_cookie_header(req)
+         self.assertFalse(req.has_header("Cookie"))
+ 
++        c.clear()
++
++        pol.set_blocked_domains([])
++        req = Request("http://acme.com/")
++        res = FakeResponse(headers, "http://acme.com/")
++        cookies = c.make_cookies(res, req)
++        c.extract_cookies(res, req)
++        self.assertEqual(len(c), 1)
++
++        req = Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertTrue(req.has_header("Cookie"))
++
++        req = Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(pol.return_ok(cookies[0], req))
++        self.assertFalse(req.has_header("Cookie"))
++
++        p = pol.set_blocked_domains(["acme.com"])
++        req = Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
++        req = Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
+     def test_secure(self):
+         from cookielib import CookieJar, DefaultCookiePolicy
+ 
+diff --git a/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+new file mode 100644
+index 000000000000..77251806163b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+@@ -0,0 +1,4 @@
++Don't send cookies of domain A without Domain attribute to domain B when
++domain A is a suffix match of domain B while using a cookiejar with
++:class:`cookielib.DefaultCookiePolicy` policy. Patch by Karthikeyan
++Singaravelan.
-- 
2.17.1


