Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.50183.1624294981226640404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p4GXt5dy;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id b3so1270146plg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5oTTUX++WN+h94wG/bjv3r3AtcUfMKfK5FZLR9lAJGk=;
        b=p4GXt5dyB5kaCmWtb5zkW6LT4IItJBBeuxoxKNSAV85l9r8JmlXPZU7AWj0CGBpWOi
         KnxrJ/Oe2pBbyBuU7jjNpAf3keMtc2sxoP1L0DKF6I26eG6qBV3uw+meyzMBj0SAi3If
         vE74Wsbf7dvYDb1BiKLs3ztYQnbsMn4qcOv22uBvJ2qjdihddBpV89aYh6+OKSjPMPuK
         /KuMtuq/U9WK7T50yutBX4+1UieR7Nph3N8FRSkobmNlb5gSYp5hU71arObp7j46E9uG
         JjOhlH/PqlLb0ZPr3nHh2QFVw0jZJGS3Gbq97zUT8cxlsR/+XOP9HmbXZNS2h/vmsOzP
         ifsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5oTTUX++WN+h94wG/bjv3r3AtcUfMKfK5FZLR9lAJGk=;
        b=SkQha6WsZkq444SyutHAsOUjZ1LSmL+IaZTp9RNIFKaDumtJhAxSrcwVJIXMlW5mR+
         jS5obyGqBUrKTVnAubnGV1K4ZK5hahjxrCpVt8G1TsKttUegEoXxFu7+LLFMY6IK3ali
         bozrAI4pO9WrMfHh1+ndcwY8MLCYOT3nQrVkLS0YBR9H6g6Q+L1l79lXne3/cIhxNzBA
         AznGCQjplnH+kh6GKVQY/g4IlcXP7niaWnN1G+p+83xFWoGrfVeBxfxOdzjG85mJEDQL
         y+oLoFR5s1IUoc/CTEV96w3iIHB01Jkw5v8B5Rl38/HBI5vOcc5tws2bC0IMIBwft9zz
         eOrg==
X-Gm-Message-State: AOAM533QBT7ehu2dV/kJLQmdFtdiBIQlIv3QC2lpGWHxMR+ddc3lcmhp
	1IEV4T6Oh3jERsKbcqi5n1FikL5w076B1Q==
X-Google-Smtp-Source: ABdhPJwuv26w57Z30FbOBSOdyRJxp3N2MwEznfRrzcLPob6J20uHhYYikkiYrJpcPikjDsF3+NxB0Q==
X-Received: by 2002:a17:90a:14e5:: with SMTP id k92mr27155960pja.149.1624294980339;
        Mon, 21 Jun 2021 10:03:00 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:02:59 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 01/10][dunfell] python3: upgrade 3.8.2 -> 3.8.3
Date: Mon, 21 Jun 2021 10:02:48 -0700
Message-Id: <18074d8ab930de9770bceb69f89ddd24a1bf9916.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release Date: May 13, 2020

Note: The release you're looking at is Python 3.8.3, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

Notable changes in Python 3.8.3:

The constant values of future flags in the __future__ module are updated in
order to prevent collision with compiler flags. Previously
PyCF_ALLOW_TOP_LEVEL_AWAIT was clashing with CO_FUTURE_DIVISION.
(Contributed by Batuhan Taskaya in bpo-39562)

* Drop patch for CVE-2020-3492 fixed since 3.8.1

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-8492
https://www.python.org/downloads/release/python-383/
https://docs.python.org/release/3.8.3/whatsnew/changelog.html#changelog

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...20-8492-Fix-AbstractBasicAuthHandler.patch | 248 ------------------
 .../{python3_3.8.2.bb => python3_3.8.3.bb}    |   5 +-
 2 files changed, 2 insertions(+), 251 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
 rename meta/recipes-devtools/python/{python3_3.8.2.bb => python3_3.8.3.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch b/meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
deleted file mode 100644
index e16b99bcb96..00000000000
--- a/meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
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
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.2.bb
rename to meta/recipes-devtools/python/python3_3.8.3.bb
index 072ce974725..3aa8980e13b 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -33,7 +33,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            file://CVE-2019-20907.patch \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
@@ -47,8 +46,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "e9d6ebc92183a177b8e8a58cad5b8d67"
-SRC_URI[sha256sum] = "2646e7dc233362f59714c6193017bb2d6f7b38d6ab4a0cb5fbac5c36c4d845df"
+SRC_URI[md5sum] = "3000cf50aaa413052aef82fd2122ca78"
+SRC_URI[sha256sum] = "dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2

