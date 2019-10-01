Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id CD6A37DDCC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 23:10:55 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id h195so9209237pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 16:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=12m9rs5VNrzH34ajBoB7DxK41lq/ABsXa3IXc65WUoQ=;
	b=uVuVXhguEDDp2hkSnL6GT3dmS9fNaB6hN3o1ZcW/KvfHJmIh9RmlPi9AuuXfaN4ndE
	wg6IPPV6eGqiSsttKdzEjQk4RiI9uV+tUi2ett7JhmgDIXHO2Kw2LG3LVgaBljLDkEua
	fMpa+HBmf3+okRMP/U1ofNEofP420uJNHA/BL4njZ1dLbkzmRGlPzun2kH8Vm/3qn6xK
	u0AxCfEWYxWjFgB7+qC7ka0p7GARS1uLZDJwxaK0mdt2CeBQYerx5PV0MVYeBKij3MBK
	UREC7QAOH//t4xoL0CtyHyqamZ4CIcfBoSTKKIcoTclcTsnr6zR3wUBtsxi/eVqr79Nx
	vDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=12m9rs5VNrzH34ajBoB7DxK41lq/ABsXa3IXc65WUoQ=;
	b=q3PR958xJrlszRhu4moaonO8SfW9XreOE4eyUMb3pPXaPZ5iJbHMRAo/rNr3hjyRvE
	xcJrBf2NqRyC460j2f+JYpJw/PQd1FWK8RFo/XWmu0O2Mj2JIQrokjPvW6zT8/NlhTfa
	pHUpKpsA4vhxDy6bkunEJ2m0Yv5JXx3G/MoSAeceTH/pfCiCdUw4pnKpqg7qvVcxey46
	/6EkKK9SXUP2jvS4L474lMZjktdpovtqO0gvsyTfeAUqxhdsuaxt85Knq6aZJW0J1pWG
	hyN66Es66Vd4YTZUIrr2Co05fE5mDR4Zp4gHYfmsMG/zcW/fAjMcB87Bfc0okS9er3pJ
	LnMw==
X-Gm-Message-State: APjAAAVGqx0C3/g+ZSdrz31LYINHqpUzmztFs8qpI/o8BVhUeL2DNBdV
	zM1CqmwUmOEpMwvU+2Reh4Oia1xlEX0=
X-Google-Smtp-Source: APXvYqxtCrQ3C/U1fakW5Lum3PmtcDk96pRjwsw0A4UIq5avnLmrHFh6oPVx6jBykEtXSKYV8nFqFw==
X-Received: by 2002:a17:90a:fc8:: with SMTP id 66mr770172pjz.134.1569971456487;
	Tue, 01 Oct 2019 16:10:56 -0700 (PDT)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	a8sm19442912pfo.118.2019.10.01.16.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Oct 2019 16:10:55 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20191001195817.22650-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1274cea8-3bc4-77d2-b413-08f50c646616@gmail.com>
Date: Tue, 1 Oct 2019 16:10:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001195817.22650-1-bunk@stusta.de>
Subject: Re: [warrior][PATCH] python: update to 3.7.3
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
X-List-Received-Date: Tue, 01 Oct 2019 23:10:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/1/19 12:58 PM, Adrian Bunk wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> License-update: copyright years
is this a bugfix only? its not mentioned.

- armin
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> [ Backported patches removed. ]
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...fig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
>  ...tutils-prefix-is-inside-staging-area.patch |   2 +-
>  .../python/python3/CVE-2018-20852.patch       | 124 --------------
>  .../python/python3/CVE-2019-9636.patch        | 154 ------------------
>  .../{python3_3.7.2.bb => python3_3.7.3.bb}    |   8 +-
>  5 files changed, 5 insertions(+), 285 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch
>  rename meta/recipes-devtools/python/{python3_3.7.2.bb => python3_3.7.3.bb} (97%)
>
> diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> index 8083345a4e..1741f5753b 100644
> --- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> +++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> @@ -1,4 +1,4 @@
> -From 4865615a2bc2b78c739e4c33f536712c7f9af061 Mon Sep 17 00:00:00 2001
> +From 17796e353acf08acd604610f34840a4a9d2f4b54 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 31 Jan 2019 16:46:30 +0100
>  Subject: [PATCH] distutils/sysconfig: append
> diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> index dcc0932c7f..35213171bd 100644
> --- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> +++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> @@ -1,4 +1,4 @@
> -From 1397979ee445ff6826aa5469511e003539f77bb2 Mon Sep 17 00:00:00 2001
> +From 12900d498bb77bcc990868a80eaf0ab257b88fff Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 14 May 2013 15:00:26 -0700
>  Subject: [PATCH] python3: Add target and native recipes
> diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
> deleted file mode 100644
> index ff671d3fab..0000000000
> --- a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From e5123d81ffb3be35a1b2767d6ced1a097aaf77be Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Sat, 9 Mar 2019 18:58:25 -0800
> -Subject: [PATCH] bpo-35121: prefix dot in domain for proper subdomain
> - validation (GH-10258) (GH-12261)
> -
> -Don't send cookies of domain A without Domain attribute to domain B when domain A is a suffix match of domain B while using a cookiejar with `http.cookiejar.DefaultCookiePolicy` policy.  Patch by Karthikeyan Singaravelan.
> -(cherry picked from commit ca7fe5063593958e5efdf90f068582837f07bd14)
> -
> -Co-authored-by: Xtreak <tir.karthi@gmail.com>
> -Upstream-Status: Backport
> -CVE: CVE-2018-20852
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
> ----
> - Lib/http/cookiejar.py                         | 13 ++++++--
> - Lib/test/test_http_cookiejar.py               | 30 +++++++++++++++++++
> - .../2018-10-31-15-39-17.bpo-35121.EgHv9k.rst  |  4 +++
> - 3 files changed, 45 insertions(+), 2 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
> -
> -diff --git a/Lib/http/cookiejar.py b/Lib/http/cookiejar.py
> -index e0f1032b2816..00cb1250a07e 100644
> ---- a/Lib/http/cookiejar.py
> -+++ b/Lib/http/cookiejar.py
> -@@ -1145,6 +1145,11 @@ def return_ok_domain(self, cookie, request):
> -         req_host, erhn = eff_request_host(request)
> -         domain = cookie.domain
> - 
> -+        if domain and not domain.startswith("."):
> -+            dotdomain = "." + domain
> -+        else:
> -+            dotdomain = domain
> -+
> -         # strict check of non-domain cookies: Mozilla does this, MSIE5 doesn't
> -         if (cookie.version == 0 and
> -             (self.strict_ns_domain & self.DomainStrictNonDomain) and
> -@@ -1157,7 +1162,7 @@ def return_ok_domain(self, cookie, request):
> -             _debug("   effective request-host name %s does not domain-match "
> -                    "RFC 2965 cookie domain %s", erhn, domain)
> -             return False
> --        if cookie.version == 0 and not ("."+erhn).endswith(domain):
> -+        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
> -             _debug("   request-host %s does not match Netscape cookie domain "
> -                    "%s", req_host, domain)
> -             return False
> -@@ -1171,7 +1176,11 @@ def domain_return_ok(self, domain, request):
> -             req_host = "."+req_host
> -         if not erhn.startswith("."):
> -             erhn = "."+erhn
> --        if not (req_host.endswith(domain) or erhn.endswith(domain)):
> -+        if domain and not domain.startswith("."):
> -+            dotdomain = "." + domain
> -+        else:
> -+            dotdomain = domain
> -+        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdomain)):
> -             #_debug("   request domain %s does not match cookie domain %s",
> -             #       req_host, domain)
> -             return False
> -diff --git a/Lib/test/test_http_cookiejar.py b/Lib/test/test_http_cookiejar.py
> -index abc625d672a7..6e1b30881310 100644
> ---- a/Lib/test/test_http_cookiejar.py
> -+++ b/Lib/test/test_http_cookiejar.py
> -@@ -415,6 +415,7 @@ def test_domain_return_ok(self):
> -             ("http://foo.bar.com/", ".foo.bar.com", True),
> -             ("http://foo.bar.com/", "foo.bar.com", True),
> -             ("http://foo.bar.com/", ".bar.com", True),
> -+            ("http://foo.bar.com/", "bar.com", True),
> -             ("http://foo.bar.com/", "com", True),
> -             ("http://foo.com/", "rhubarb.foo.com", False),
> -             ("http://foo.com/", ".foo.com", True),
> -@@ -425,6 +426,8 @@ def test_domain_return_ok(self):
> -             ("http://foo/", "foo", True),
> -             ("http://foo/", "foo.local", True),
> -             ("http://foo/", ".local", True),
> -+            ("http://barfoo.com", ".foo.com", False),
> -+            ("http://barfoo.com", "foo.com", False),
> -             ]:
> -             request = urllib.request.Request(url)
> -             r = pol.domain_return_ok(domain, request)
> -@@ -959,6 +962,33 @@ def test_domain_block(self):
> -         c.add_cookie_header(req)
> -         self.assertFalse(req.has_header("Cookie"))
> - 
> -+        c.clear()
> -+
> -+        pol.set_blocked_domains([])
> -+        req = urllib.request.Request("http://acme.com/")
> -+        res = FakeResponse(headers, "http://acme.com/")
> -+        cookies = c.make_cookies(res, req)
> -+        c.extract_cookies(res, req)
> -+        self.assertEqual(len(c), 1)
> -+
> -+        req = urllib.request.Request("http://acme.com/")
> -+        c.add_cookie_header(req)
> -+        self.assertTrue(req.has_header("Cookie"))
> -+
> -+        req = urllib.request.Request("http://badacme.com/")
> -+        c.add_cookie_header(req)
> -+        self.assertFalse(pol.return_ok(cookies[0], req))
> -+        self.assertFalse(req.has_header("Cookie"))
> -+
> -+        p = pol.set_blocked_domains(["acme.com"])
> -+        req = urllib.request.Request("http://acme.com/")
> -+        c.add_cookie_header(req)
> -+        self.assertFalse(req.has_header("Cookie"))
> -+
> -+        req = urllib.request.Request("http://badacme.com/")
> -+        c.add_cookie_header(req)
> -+        self.assertFalse(req.has_header("Cookie"))
> -+
> -     def test_secure(self):
> -         for ns in True, False:
> -             for whitespace in " ", "":
> -diff --git a/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
> -new file mode 100644
> -index 000000000000..d2eb8f1f352c
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
> -@@ -0,0 +1,4 @@
> -+Don't send cookies of domain A without Domain attribute to domain B
> -+when domain A is a suffix match of domain B while using a cookiejar
> -+with :class:`http.cookiejar.DefaultCookiePolicy` policy. Patch by
> -+Karthikeyan Singaravelan.
> diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
> deleted file mode 100644
> index 72128f0b0d..0000000000
> --- a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
> +++ /dev/null
> @@ -1,154 +0,0 @@
> -From daad2c482c91de32d8305abbccc76a5de8b3a8be Mon Sep 17 00:00:00 2001
> -From: Steve Dower <steve.dower@microsoft.com>
> -Date: Thu, 7 Mar 2019 09:08:18 -0800
> -Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
> - to separators (GH-12201)
> -
> -Upstream-Status: Backport
> -CVE: CVE-2019-9636
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> -
> ----
> - Doc/library/urllib.parse.rst                  | 18 +++++++++++++++
> - Lib/test/test_urlparse.py                     | 23 +++++++++++++++++++
> - Lib/urllib/parse.py                           | 17 ++++++++++++++
> - .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
> - 4 files changed, 61 insertions(+)
> - create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
> -
> -diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst
> -index 0c8f0f607314..b565e1edd321 100644
> ---- a/Doc/library/urllib.parse.rst
> -+++ b/Doc/library/urllib.parse.rst
> -@@ -124,6 +124,11 @@ or on combining URL components into a URL string.
> -    Unmatched square brackets in the :attr:`netloc` attribute will raise a
> -    :exc:`ValueError`.
> - 
> -+   Characters in the :attr:`netloc` attribute that decompose under NFKC
> -+   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
> -+   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
> -+   decomposed before parsing, no error will be raised.
> -+
> -    .. versionchanged:: 3.2
> -       Added IPv6 URL parsing capabilities.
> - 
> -@@ -136,6 +141,10 @@ or on combining URL components into a URL string.
> -       Out-of-range port numbers now raise :exc:`ValueError`, instead of
> -       returning :const:`None`.
> - 
> -+   .. versionchanged:: 3.7.3
> -+      Characters that affect netloc parsing under NFKC normalization will
> -+      now raise :exc:`ValueError`.
> -+
> - 
> - .. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None)
> - 
> -@@ -257,10 +266,19 @@ or on combining URL components into a URL string.
> -    Unmatched square brackets in the :attr:`netloc` attribute will raise a
> -    :exc:`ValueError`.
> - 
> -+   Characters in the :attr:`netloc` attribute that decompose under NFKC
> -+   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
> -+   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
> -+   decomposed before parsing, no error will be raised.
> -+
> -    .. versionchanged:: 3.6
> -       Out-of-range port numbers now raise :exc:`ValueError`, instead of
> -       returning :const:`None`.
> - 
> -+   .. versionchanged:: 3.7.3
> -+      Characters that affect netloc parsing under NFKC normalization will
> -+      now raise :exc:`ValueError`.
> -+
> - 
> - .. function:: urlunsplit(parts)
> - 
> -diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
> -index be50b47603aa..e6638aee2244 100644
> ---- a/Lib/test/test_urlparse.py
> -+++ b/Lib/test/test_urlparse.py
> -@@ -1,3 +1,5 @@
> -+import sys
> -+import unicodedata
> - import unittest
> - import urllib.parse
> - 
> -@@ -984,6 +986,27 @@ def test_all(self):
> -                 expected.append(name)
> -         self.assertCountEqual(urllib.parse.__all__, expected)
> - 
> -+    def test_urlsplit_normalization(self):
> -+        # Certain characters should never occur in the netloc,
> -+        # including under normalization.
> -+        # Ensure that ALL of them are detected and cause an error
> -+        illegal_chars = '/:#?@'
> -+        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
> -+        denorm_chars = [
> -+            c for c in map(chr, range(128, sys.maxunicode))
> -+            if (hex_chars & set(unicodedata.decomposition(c).split()))
> -+            and c not in illegal_chars
> -+        ]
> -+        # Sanity check that we found at least one such character
> -+        self.assertIn('\u2100', denorm_chars)
> -+        self.assertIn('\uFF03', denorm_chars)
> -+
> -+        for scheme in ["http", "https", "ftp"]:
> -+            for c in denorm_chars:
> -+                url = "{}://netloc{}false.netloc/path".format(scheme, c)
> -+                with self.subTest(url=url, char='{:04X}'.format(ord(c))):
> -+                    with self.assertRaises(ValueError):
> -+                        urllib.parse.urlsplit(url)
> - 
> - class Utility_Tests(unittest.TestCase):
> -     """Testcase to test the various utility functions in the urllib."""
> -diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
> -index f691ab74f87f..39c5d6a80824 100644
> ---- a/Lib/urllib/parse.py
> -+++ b/Lib/urllib/parse.py
> -@@ -391,6 +391,21 @@ def _splitnetloc(url, start=0):
> -             delim = min(delim, wdelim)     # use earliest delim position
> -     return url[start:delim], url[delim:]   # return (domain, rest)
> - 
> -+def _checknetloc(netloc):
> -+    if not netloc or netloc.isascii():
> -+        return
> -+    # looking for characters like \u2100 that expand to 'a/c'
> -+    # IDNA uses NFKC equivalence, so normalize for this check
> -+    import unicodedata
> -+    netloc2 = unicodedata.normalize('NFKC', netloc)
> -+    if netloc == netloc2:
> -+        return
> -+    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
> -+    for c in '/?#@:':
> -+        if c in netloc2:
> -+            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
> -+                             "characters under NFKC normalization")
> -+
> - def urlsplit(url, scheme='', allow_fragments=True):
> -     """Parse a URL into 5 components:
> -     <scheme>://<netloc>/<path>?<query>#<fragment>
> -@@ -419,6 +434,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
> -                 url, fragment = url.split('#', 1)
> -             if '?' in url:
> -                 url, query = url.split('?', 1)
> -+            _checknetloc(netloc)
> -             v = SplitResult('http', netloc, url, query, fragment)
> -             _parse_cache[key] = v
> -             return _coerce_result(v)
> -@@ -442,6 +458,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
> -         url, fragment = url.split('#', 1)
> -     if '?' in url:
> -         url, query = url.split('?', 1)
> -+    _checknetloc(netloc)
> -     v = SplitResult(scheme, netloc, url, query, fragment)
> -     _parse_cache[key] = v
> -     return _coerce_result(v)
> -diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
> -new file mode 100644
> -index 000000000000..5546394157f9
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
> -@@ -0,0 +1,3 @@
> -+Changes urlsplit() to raise ValueError when the URL contains characters that
> -+decompose under IDNA encoding (NFKC-normalization) into characters that
> -+affect how the URL is parsed.
> diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
> similarity index 97%
> rename from meta/recipes-devtools/python/python3_3.7.2.bb
> rename to meta/recipes-devtools/python/python3_3.7.3.bb
> index 6da806bb93..1f1441f4ac 100644
> --- a/meta/recipes-devtools/python/python3_3.7.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
>  LICENSE = "PSFv2"
>  SECTION = "devel/python"
>  
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
>  
>  SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://run-ptest \
> @@ -22,8 +22,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
>             file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
>             file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
> -           file://CVE-2018-20852.patch \
> -           file://CVE-2019-9636.patch \
>             file://CVE-2019-9740.patch \
>             "
>  
> @@ -35,8 +33,8 @@ SRC_URI_append_class-nativesdk = " \
>             file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
>             "
>  
> -SRC_URI[md5sum] = "df6ec36011808205beda239c72f947cb"
> -SRC_URI[sha256sum] = "d83fe8ce51b1bb48bbcf0550fd265b9a75cdfdfa93f916f9e700aef8444bf1bb"
> +SRC_URI[md5sum] = "93df27aec0cd18d6d42173e601ffbbfd"
> +SRC_URI[sha256sum] = "da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318"
>  
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"


