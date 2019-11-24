Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id D71AA7FC13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 16:54:58 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id n13so6081912pff.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 08:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pEQmgJsHSicPS1hgT8S2/eDebCtxOLLz5xplp4HCrbE=;
	b=P0av1C4M7JYnQuZGyoeOJYTQ3nulU5IpQOf3/WCg3DVZbO2U+Mtn5wEp2ASbV4MXxZ
	ery7mwt3CKw3SkIX8IIRf6v8ctl/7Bd6qUSsa7MNquWET6cx8eshdWYh+3sBXdMYxUQu
	lie/Pafbdm2x8h6n96/wg/YDwRhQwL+wJzXzqnbpci05HPOXs2zvUJxbiRgReT9+FHeZ
	ATs7jAa7+CE1qbTEmqXIViJtE2o1BPZxJ8+futDcHa1O3y5SlBh+yFlRirnkXQ1y5Gtt
	V9LRqFTx6hIzIRXVggMLBtoMAtuQD4ioEwOejNjggUmDAas6QlW6LshPopiMiosUD0dq
	uqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pEQmgJsHSicPS1hgT8S2/eDebCtxOLLz5xplp4HCrbE=;
	b=k9T9endQxem7ReJa6mTGMYcKf8lGiNM412lYBuu+TpaxJ8mXPdUb8ONa10ZlhPZS4m
	5fHiDp6BP3rxjaHnOVURF/TTK+xHcIEv9Dc5xKgMb2FdknCemtdQIw4DhCp98i0ADnMZ
	JGeJ6Q7qKSGuvsE+4KgVPp9cOmwpee3sDi9hm76TE1IkSvpSHA4QhN40aFABo/+iFlUL
	50ecEIr1x8AR2pihUIjGbep8CvIZlD7PFE/2kLWaQ8OHG2Hw9dYD/JA/gp/4gfcJCpFD
	31+3jqLIEpvMR0ujUi7diqXWtWnceNdLSy0wTXnRbjLUfqSaiIIpVMmCIa9i+jwnXALS
	RztQ==
X-Gm-Message-State: APjAAAWeTH7s0Zm0EtLbEhe7Uw3BC20SGfOGJlCiAYI19VUmA29ExmwS
	HLa+Q6HOpKrXSGpH+LaW0BtW+JBM
X-Google-Smtp-Source: APXvYqwM3ttuhPZ1SGl1X/uLxPmicOyLWI5uhD4H7fpS3kx/7Y57VnPGNdGPuGaNTwq8yvL3J7C7uw==
X-Received: by 2002:a63:3105:: with SMTP id x5mr18403350pgx.15.1574614499590; 
	Sun, 24 Nov 2019 08:54:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id o14sm5331101pfp.5.2019.11.24.08.54.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 08:54:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 08:54:54 -0800
Message-Id: <1574614495-32677-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574614495-32677-1-git-send-email-akuster808@gmail.com>
References: <1574614495-32677-1-git-send-email-akuster808@gmail.com>
Subject: [warrior][PATCH 3/4] python: fix CVE-2018-20852
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
X-List-Received-Date: Sun, 24 Nov 2019 16:54:58 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python.inc            |   1 +
 .../python/python/CVE-2018-20852.patch             | 123 +++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2018-20852.patch

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 8d0e908..7048100 100644
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
index 0000000..23c784a
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
2.7.4


