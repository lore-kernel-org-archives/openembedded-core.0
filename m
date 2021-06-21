Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.50256.1624294983119435195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UoVxnREY;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id k6so14107520pfk.12
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SncGXdW0KZdbTcadyjxMLyyZuvPyv4zNo6R/z9EAf6s=;
        b=UoVxnREYub/lnKi6X/cWGz6HP0p3bZ7mnYPfOIj41U59tciDyCQMZLlYWr5V9xRlBe
         H7WvSDKBP915l02E7CV/cXi2Yp5fw8uSFeP9K8qw89q1bNEXBzx8T1LghWGLDi9Qt4K+
         r2NIGBGrSBJUf8uaR/kc4PQwaCxHdG1a7FevixoeN8lgjILGSMwIZbwfRoeAJfndQHnn
         5qwRmbZh0eCAiKuwZ2/XZw1Lz9nGaX/t61fmDMvJ9NWMffSy/plx4HnKetcS1o2Q7Z/b
         TCbidG149v4wWqaiLaTH5terl9h9RrILPhavp/u5vB9jMjnT4U7o6CFAMMYWVgysAz/V
         nstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SncGXdW0KZdbTcadyjxMLyyZuvPyv4zNo6R/z9EAf6s=;
        b=FcN61iLu/76SXEh8TBA2gDWtZe/o4JeDRPqe7ePoMrXXvnEv9fkvvQ2ipME4jeF0W5
         Oua12aERLKSnShsmzSXBBu2MxWXlsnpA4l0IWuyA/VN/vd0Ui8YWOsOxEnrmbgsJ0JAn
         VDacCA1WiNE418LwidZnTiAFf5wOFPz8iLQBdNweZRojBJBT1ljTtnpDSYMVSR+Mp27b
         +fFuvYpw7UzgRdImUz0MCjvtAscFSzlt8jWIOSTHc5gpozgseilrCgzYos3CsTB49umK
         Px6MqOjR6vI9N0iFyffcX7PX+4+8ETMKMWs/EU37KgcNdwkmhTOfZ7Hbvd61h9emzUcQ
         9cAA==
X-Gm-Message-State: AOAM530UzsRdQ2Cb3qs+cYag5g/HiVi07dsWl0VzG5leyQ/MZcVJVDhH
	0NiochPWvxLpLglUt6AUc8nDFtjkIxSYUQ==
X-Google-Smtp-Source: ABdhPJxHJDqp5Qwcu6rSLwXgc4xkziVMrTn/F/BfF3g8wvLmJ/a7ckmWrrhVxonx4V62xeV5pGRe1g==
X-Received: by 2002:a05:6a00:1515:b029:2f1:d29:2a44 with SMTP id q21-20020a056a001515b02902f10d292a44mr20665711pfu.51.1624294982245;
        Mon, 21 Jun 2021 10:03:02 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:01 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 02/10][dunfell] python3: upgrade 3.8.3 -> 3.8.4
Date: Mon, 21 Jun 2021 10:02:49 -0700
Message-Id: <b9db3d09376531383eaa56761e3e227af3fd08f4.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release Date: July 13, 2020

Note: The release you're looking at is Python 3.8.4, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

* Drop patch for CVE-2020-14422 fixed in 3.8.4
* Refresh CVE-2021-23336 patch

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-14422
https://www.python.org/downloads/release/python-384/
https://docs.python.org/release/3.8.4/whatsnew/changelog.html#changelog

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/python3/CVE-2020-14422.patch       | 77 -------------------
 .../{python3_3.8.3.bb => python3_3.8.4.bb}    |  5 +-
 2 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch
 rename meta/recipes-devtools/python/{python3_3.8.3.bb => python3_3.8.4.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-14422.patch b/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
deleted file mode 100644
index 6889e46da98..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From dc8ce8ead182de46584cc1ed8a8c51d48240cbd5 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 29 Jun 2020 11:12:50 -0700
-Subject: [PATCH] bpo-41004: Resolve hash collisions for IPv4Interface and
- IPv6Interface (GH-21033)
-
-The __hash__() methods of classes IPv4Interface and IPv6Interface had issue
-of generating constant hash values of 32 and 128 respectively causing hash collisions.
-The fix uses the hash() function to generate hash values for the objects
-instead of XOR operation
-(cherry picked from commit b30ee26e366bf509b7538d79bfec6c6d38d53f28)
-
-Co-authored-by: Ravi Teja P <rvteja92@gmail.com>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/dc8ce8ead182de46584cc1ed8a8c51d48240cbd5]
-CVE: CVE-2020-14422
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- Lib/ipaddress.py                                     |  4 ++--
- Lib/test/test_ipaddress.py                           | 12 ++++++++++++
- .../2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst         |  1 +
- 3 files changed, 15 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
-
-diff --git a/Lib/ipaddress.py b/Lib/ipaddress.py
-index 873c7644081af..a3a04f7f4b309 100644
---- a/Lib/ipaddress.py
-+++ b/Lib/ipaddress.py
-@@ -1370,7 +1370,7 @@ def __lt__(self, other):
-             return False
- 
-     def __hash__(self):
--        return self._ip ^ self._prefixlen ^ int(self.network.network_address)
-+        return hash((self._ip, self._prefixlen, int(self.network.network_address)))
- 
-     __reduce__ = _IPAddressBase.__reduce__
- 
-@@ -2017,7 +2017,7 @@ def __lt__(self, other):
-             return False
- 
-     def __hash__(self):
--        return self._ip ^ self._prefixlen ^ int(self.network.network_address)
-+        return hash((self._ip, self._prefixlen, int(self.network.network_address)))
- 
-     __reduce__ = _IPAddressBase.__reduce__
- 
-diff --git a/Lib/test/test_ipaddress.py b/Lib/test/test_ipaddress.py
-index de77111705b69..2eba740e5e7a4 100644
---- a/Lib/test/test_ipaddress.py
-+++ b/Lib/test/test_ipaddress.py
-@@ -2053,6 +2053,18 @@ def testsixtofour(self):
-                          sixtofouraddr.sixtofour)
-         self.assertFalse(bad_addr.sixtofour)
- 
-+    # issue41004 Hash collisions in IPv4Interface and IPv6Interface
-+    def testV4HashIsNotConstant(self):
-+        ipv4_address1 = ipaddress.IPv4Interface("1.2.3.4")
-+        ipv4_address2 = ipaddress.IPv4Interface("2.3.4.5")
-+        self.assertNotEqual(ipv4_address1.__hash__(), ipv4_address2.__hash__())
-+
-+    # issue41004 Hash collisions in IPv4Interface and IPv6Interface
-+    def testV6HashIsNotConstant(self):
-+        ipv6_address1 = ipaddress.IPv6Interface("2001:658:22a:cafe:200:0:0:1")
-+        ipv6_address2 = ipaddress.IPv6Interface("2001:658:22a:cafe:200:0:0:2")
-+        self.assertNotEqual(ipv6_address1.__hash__(), ipv6_address2.__hash__())
-+
- 
- if __name__ == '__main__':
-     unittest.main()
-diff --git a/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst b/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
-new file mode 100644
-index 0000000000000..1380b31fbe9f4
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2020-06-29-16-02-29.bpo-41004.ovF0KZ.rst
-@@ -0,0 +1 @@
-+The __hash__() methods of  ipaddress.IPv4Interface and ipaddress.IPv6Interface incorrectly generated constant hash values of 32 and 128 respectively. This resulted in always causing hash collisions. The fix uses hash() to generate hash values for the tuple of (address, mask length, network address).
diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.4.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.3.bb
rename to meta/recipes-devtools/python/python3_3.8.4.bb
index 3aa8980e13b..438b3e55042 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.4.bb
@@ -34,7 +34,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://CVE-2019-20907.patch \
-           file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
            file://CVE-2021-3177.patch \
@@ -46,8 +45,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "3000cf50aaa413052aef82fd2122ca78"
-SRC_URI[sha256sum] = "dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864"
+SRC_URI[md5sum] = "e16df33cd7b58702e57e137f8f5d13e7"
+SRC_URI[sha256sum] = "5f41968a95afe9bc12192d7e6861aab31e80a46c46fa59d3d837def6a4cd4d37"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2

