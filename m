Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.17500.1590940422756295997
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a7wfgDr9;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id k19so5396576edv.9
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NiEZVDQcfMWwT8I5/pMmd0nKlKEOqaVyKmz3IdJqPOo=;
        b=a7wfgDr9Rm3iF0w1itigzXcYCsE8eGUUAUmY8053kZViBpxgbjqEF7fxzMvN4mBg6S
         fFg6+hcjW7hi9RuV6em3BdCvUJ5RvVtzf2SoM5IImAN+BhlFPurai/RaTYCuPmoQlo74
         im0+p30u08H2ABwipH7tfliIxNBrYr2kgDA5iZyNfLQQF8WEnd4BAjrDmKM8odWUJ0tp
         b+6N6WYEmROKT67aetn8LE1emUEzTgRm+RGIJh6Wws+DLi7s/qodosHvGNaiw46kDA/o
         sFG4ZJHaN4IrHb6HH/8HylrbnrOPymDNWVw8L0QNKbRxfjVuao4QULaUiuLRivrCjt/g
         I2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NiEZVDQcfMWwT8I5/pMmd0nKlKEOqaVyKmz3IdJqPOo=;
        b=EZhBtV6BB3GePnzbZ5OmGjlzHkejJdMuQpA0c35mmBAdvInh2k5zrJW75kCC57+Pq9
         vK8SAOa1PN41Lhf7g0Kw9xJUJVBCW5ftjB2UFmgiSaQjhlEv7T6V6PK2f0JfENYqIsxs
         rANGBDZEh1AfuR3KYcMMFhsTNXEP8MvyXGFthCYAKU3CIk4btmZ5VjqDIRDGpqeejQxs
         cLflr64WCjen2WxJXBDWMkMaGGAQpiIACrMWzpv9UJrNaCFE3BHbRQJeG0/M5CNN5Rf/
         +1jUWqskTErCdWBKP/u6p0/ct6JyiBHtRI0LTKP58Ob4rqqoTqth12GhkxwljY8vkUUH
         0PKw==
X-Gm-Message-State: AOAM533EUr02M54WWQsMC2SKJzX2BxJ0djg0RQZ5AUOPYnDdySPHb5ZT
	kQogcgPOxVAmCiXLjHeP4/Vor2/Z
X-Google-Smtp-Source: ABdhPJwf7l4t8HXxsXaVR44/j5YC3koP0P53J1QR35A+jy26wykXEItWZ2FW5ZsXPFynDTWONvUVaA==
X-Received: by 2002:a50:de03:: with SMTP id z3mr17100536edk.50.1590940420698;
        Sun, 31 May 2020 08:53:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/70] python3: upgrade 3.8.2 -> 3.8.3
Date: Sun, 31 May 2020 17:52:00 +0200
Message-Id: <20200531155254.10283-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...20-8492-Fix-AbstractBasicAuthHandler.patch | 248 ------------------
 ...-search-system-for-headers-libraries.patch |   8 +-
 ...fig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
 ...tutils-prefix-is-inside-staging-area.patch |   2 +-
 .../{python3_3.8.2.bb => python3_3.8.3.bb}    |   5 +-
 5 files changed, 7 insertions(+), 258 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
 rename meta/recipes-devtools/python/{python3_3.8.2.bb => python3_3.8.3.bb} (98%)

diff --git a/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch b/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
deleted file mode 100644
index e16b99bcb9..0000000000
--- a/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 0b297d4ff1c0e4480ad33acae793fbaf4bf015b4 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Thu, 2 Apr 2020 02:52:20 +0200
-Subject: [PATCH] bpo-39503: CVE-2020-8492: Fix AbstractBasicAuthHandler
- (GH-18284)
-
-Upstream-Status: Backport
-(https://github.com/python/cpython/commit/0b297d4ff1c0e4480ad33acae793fbaf4bf015b4)
-
-CVE: CVE-2020-8492
-
-The AbstractBasicAuthHandler class of the urllib.request module uses
-an inefficient regular expression which can be exploited by an
-attacker to cause a denial of service. Fix the regex to prevent the
-catastrophic backtracking. Vulnerability reported by Ben Caller
-and Matt Schwager.
-
-AbstractBasicAuthHandler of urllib.request now parses all
-WWW-Authenticate HTTP headers and accepts multiple challenges per
-header: use the realm of the first Basic challenge.
-
-Co-Authored-By: Serhiy Storchaka <storchaka@gmail.com>
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
----
- Lib/test/test_urllib2.py                      | 90 ++++++++++++-------
- Lib/urllib/request.py                         | 69 ++++++++++----
- .../2020-03-25-16-02-16.bpo-39503.YmMbYn.rst  |  3 +
- .../2020-01-30-16-15-29.bpo-39503.B299Yq.rst  |  5 ++
- 4 files changed, 115 insertions(+), 52 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst
- create mode 100644 Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst
-
-diff --git a/Lib/test/test_urllib2.py b/Lib/test/test_urllib2.py
-index 8abedaac98..e69ac3e213 100644
---- a/Lib/test/test_urllib2.py
-+++ b/Lib/test/test_urllib2.py
-@@ -1446,40 +1446,64 @@ class HandlerTests(unittest.TestCase):
-         bypass = {'exclude_simple': True, 'exceptions': []}
-         self.assertTrue(_proxy_bypass_macosx_sysconf('test', bypass))
- 
--    def test_basic_auth(self, quote_char='"'):
--        opener = OpenerDirector()
--        password_manager = MockPasswordManager()
--        auth_handler = urllib.request.HTTPBasicAuthHandler(password_manager)
--        realm = "ACME Widget Store"
--        http_handler = MockHTTPHandler(
--            401, 'WWW-Authenticate: Basic realm=%s%s%s\r\n\r\n' %
--            (quote_char, realm, quote_char))
--        opener.add_handler(auth_handler)
--        opener.add_handler(http_handler)
--        self._test_basic_auth(opener, auth_handler, "Authorization",
--                              realm, http_handler, password_manager,
--                              "http://acme.example.com/protected",
--                              "http://acme.example.com/protected",
--                              )
--
--    def test_basic_auth_with_single_quoted_realm(self):
--        self.test_basic_auth(quote_char="'")
--
--    def test_basic_auth_with_unquoted_realm(self):
--        opener = OpenerDirector()
--        password_manager = MockPasswordManager()
--        auth_handler = urllib.request.HTTPBasicAuthHandler(password_manager)
--        realm = "ACME Widget Store"
--        http_handler = MockHTTPHandler(
--            401, 'WWW-Authenticate: Basic realm=%s\r\n\r\n' % realm)
--        opener.add_handler(auth_handler)
--        opener.add_handler(http_handler)
--        with self.assertWarns(UserWarning):
-+    def check_basic_auth(self, headers, realm):
-+        with self.subTest(realm=realm, headers=headers):
-+            opener = OpenerDirector()
-+            password_manager = MockPasswordManager()
-+            auth_handler = urllib.request.HTTPBasicAuthHandler(password_manager)
-+            body = '\r\n'.join(headers) + '\r\n\r\n'
-+            http_handler = MockHTTPHandler(401, body)
-+            opener.add_handler(auth_handler)
-+            opener.add_handler(http_handler)
-             self._test_basic_auth(opener, auth_handler, "Authorization",
--                                realm, http_handler, password_manager,
--                                "http://acme.example.com/protected",
--                                "http://acme.example.com/protected",
--                                )
-+                                  realm, http_handler, password_manager,
-+                                  "http://acme.example.com/protected",
-+                                  "http://acme.example.com/protected")
-+
-+    def test_basic_auth(self):
-+        realm = "realm2@example.com"
-+        realm2 = "realm2@example.com"
-+        basic = f'Basic realm="{realm}"'
-+        basic2 = f'Basic realm="{realm2}"'
-+        other_no_realm = 'Otherscheme xxx'
-+        digest = (f'Digest realm="{realm2}", '
-+                  f'qop="auth, auth-int", '
-+                  f'nonce="dcd98b7102dd2f0e8b11d0f600bfb0c093", '
-+                  f'opaque="5ccc069c403ebaf9f0171e9517f40e41"')
-+        for realm_str in (
-+            # test "quote" and 'quote'
-+            f'Basic realm="{realm}"',
-+            f"Basic realm='{realm}'",
-+
-+            # charset is ignored
-+            f'Basic realm="{realm}", charset="UTF-8"',
-+
-+            # Multiple challenges per header
-+            f'{basic}, {basic2}',
-+            f'{basic}, {other_no_realm}',
-+            f'{other_no_realm}, {basic}',
-+            f'{basic}, {digest}',
-+            f'{digest}, {basic}',
-+        ):
-+            headers = [f'WWW-Authenticate: {realm_str}']
-+            self.check_basic_auth(headers, realm)
-+
-+        # no quote: expect a warning
-+        with support.check_warnings(("Basic Auth Realm was unquoted",
-+                                     UserWarning)):
-+            headers = [f'WWW-Authenticate: Basic realm={realm}']
-+            self.check_basic_auth(headers, realm)
-+
-+        # Multiple headers: one challenge per header.
-+        # Use the first Basic realm.
-+        for challenges in (
-+            [basic,  basic2],
-+            [basic,  digest],
-+            [digest, basic],
-+        ):
-+            headers = [f'WWW-Authenticate: {challenge}'
-+                       for challenge in challenges]
-+            self.check_basic_auth(headers, realm)
- 
-     def test_proxy_basic_auth(self):
-         opener = OpenerDirector()
-diff --git a/Lib/urllib/request.py b/Lib/urllib/request.py
-index 7fe50535da..2a3d71554f 100644
---- a/Lib/urllib/request.py
-+++ b/Lib/urllib/request.py
-@@ -937,8 +937,15 @@ class AbstractBasicAuthHandler:
- 
-     # allow for double- and single-quoted realm values
-     # (single quotes are a violation of the RFC, but appear in the wild)
--    rx = re.compile('(?:.*,)*[ \t]*([^ \t]+)[ \t]+'
--                    'realm=(["\']?)([^"\']*)\\2', re.I)
-+    rx = re.compile('(?:^|,)'   # start of the string or ','
-+                    '[ \t]*'    # optional whitespaces
-+                    '([^ \t]+)' # scheme like "Basic"
-+                    '[ \t]+'    # mandatory whitespaces
-+                    # realm=xxx
-+                    # realm='xxx'
-+                    # realm="xxx"
-+                    'realm=(["\']?)([^"\']*)\\2',
-+                    re.I)
- 
-     # XXX could pre-emptively send auth info already accepted (RFC 2617,
-     # end of section 2, and section 1.2 immediately after "credentials"
-@@ -950,27 +957,51 @@ class AbstractBasicAuthHandler:
-         self.passwd = password_mgr
-         self.add_password = self.passwd.add_password
- 
-+    def _parse_realm(self, header):
-+        # parse WWW-Authenticate header: accept multiple challenges per header
-+        found_challenge = False
-+        for mo in AbstractBasicAuthHandler.rx.finditer(header):
-+            scheme, quote, realm = mo.groups()
-+            if quote not in ['"', "'"]:
-+                warnings.warn("Basic Auth Realm was unquoted",
-+                              UserWarning, 3)
-+
-+            yield (scheme, realm)
-+
-+            found_challenge = True
-+
-+        if not found_challenge:
-+            if header:
-+                scheme = header.split()[0]
-+            else:
-+                scheme = ''
-+            yield (scheme, None)
-+
-     def http_error_auth_reqed(self, authreq, host, req, headers):
-         # host may be an authority (without userinfo) or a URL with an
-         # authority
--        # XXX could be multiple headers
--        authreq = headers.get(authreq, None)
-+        headers = headers.get_all(authreq)
-+        if not headers:
-+            # no header found
-+            return
- 
--        if authreq:
--            scheme = authreq.split()[0]
--            if scheme.lower() != 'basic':
--                raise ValueError("AbstractBasicAuthHandler does not"
--                                 " support the following scheme: '%s'" %
--                                 scheme)
--            else:
--                mo = AbstractBasicAuthHandler.rx.search(authreq)
--                if mo:
--                    scheme, quote, realm = mo.groups()
--                    if quote not in ['"',"'"]:
--                        warnings.warn("Basic Auth Realm was unquoted",
--                                      UserWarning, 2)
--                    if scheme.lower() == 'basic':
--                        return self.retry_http_basic_auth(host, req, realm)
-+        unsupported = None
-+        for header in headers:
-+            for scheme, realm in self._parse_realm(header):
-+                if scheme.lower() != 'basic':
-+                    unsupported = scheme
-+                    continue
-+
-+                if realm is not None:
-+                    # Use the first matching Basic challenge.
-+                    # Ignore following challenges even if they use the Basic
-+                    # scheme.
-+                    return self.retry_http_basic_auth(host, req, realm)
-+
-+        if unsupported is not None:
-+            raise ValueError("AbstractBasicAuthHandler does not "
-+                             "support the following scheme: %r"
-+                             % (scheme,))
- 
-     def retry_http_basic_auth(self, host, req, realm):
-         user, pw = self.passwd.find_user_password(realm, host)
-diff --git a/Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst b/Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst
-new file mode 100644
-index 0000000000..be80ce79d9
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2020-03-25-16-02-16.bpo-39503.YmMbYn.rst
-@@ -0,0 +1,3 @@
-+:class:`~urllib.request.AbstractBasicAuthHandler` of :mod:`urllib.request`
-+now parses all WWW-Authenticate HTTP headers and accepts multiple challenges
-+per header: use the realm of the first Basic challenge.
-diff --git a/Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst b/Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst
-new file mode 100644
-index 0000000000..9f2800581c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2020-01-30-16-15-29.bpo-39503.B299Yq.rst
-@@ -0,0 +1,5 @@
-+CVE-2020-8492: The :class:`~urllib.request.AbstractBasicAuthHandler` class of the
-+:mod:`urllib.request` module uses an inefficient regular expression which can
-+be exploited by an attacker to cause a denial of service. Fix the regex to
-+prevent the catastrophic backtracking. Vulnerability reported by Ben Caller
-+and Matt Schwager.
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index acf8e1e9b5..3e471b9a49 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,16 +1,17 @@
-From 85e8f86ad2b7dec0848cd55b8e810a5e2722b20a Mon Sep 17 00:00:00 2001
+From b880e78bf4a1852e260188e6df3ec6034403d2fc Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+
 ---
  setup.py | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 9da1b3a..59782c0 100644
+index 7208cd0..c0bd0ad 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
@@ -24,6 +25,3 @@ index 9da1b3a..59782c0 100644
          # lib_dirs and inc_dirs are used to search for files;
          # if a file is found in one of those directories, it can
          # be assumed that no additional -I,-L directives are needed.
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index e7af3c6f5c..2b68c0acc2 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 7ada9c749f6beb51c13a3debc850755e911548a6 Mon Sep 17 00:00:00 2001
+From bc59d49efff41051034d7fbf5d0c8505e4c3134b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 61ac3e71dc..820fb98ed8 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 251347fc970a397a9cd63ed3f87c5e6c52e15187 Mon Sep 17 00:00:00 2001
+From 064187668fcbefdd39a8cde372bf651124c3e578 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.2.bb
rename to meta/recipes-devtools/python/python3_3.8.3.bb
index 0474f07214..4367923b55 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -32,7 +32,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -41,8 +40,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "e9d6ebc92183a177b8e8a58cad5b8d67"
-SRC_URI[sha256sum] = "2646e7dc233362f59714c6193017bb2d6f7b38d6ab4a0cb5fbac5c36c4d845df"
+SRC_URI[md5sum] = "3000cf50aaa413052aef82fd2122ca78"
+SRC_URI[sha256sum] = "dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.26.2

