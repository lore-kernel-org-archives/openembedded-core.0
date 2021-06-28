Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.12435.1624892785672765159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RaR8fppA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so19132431otl.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9E0FSwxGHY6wqpwsieq+LDRDNcunZmzz3HL/4dZD+aA=;
        b=RaR8fppAhln9MsnUJlhW+KPVddMjRHlUS9uUvL5aYs6wxSjev+V9FWC+NFF9wiBGVH
         6e81/8GCvpMIkCkYEptm+Tv1VhiGsosf4tSJVWWvbdqt8rYfw0w/PiMP+vJmm7XgY9v1
         qJUuMEfuElTPpDCUf3RdVit8eG2+//C4A34Bv2/cqBiXt2FUSxorTzgAFHKTrOozVa3c
         DO31dEsk9sKA2Lz5vNpg37pN+vx2s/jEYYicFgqn0bf+v3y2FpBGp7BZN+nEBfTzmDgw
         P5ULti4pPbgLUOJgFRUwCyjANM+TCJczlxCY8h1CqJl1Osw4+pxcixVAkM6PvI+uQcbF
         xM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9E0FSwxGHY6wqpwsieq+LDRDNcunZmzz3HL/4dZD+aA=;
        b=feahERJlpNi3mInGLqTx8KLZd3lFbV65PGYnQkUxscCiJ205AHN0bQacqmf73iL4dc
         8EVOPcvF1OXvKmrqscm1a1Bj7S3a2NysFAgDmt6ApudflS99EKd1qqoPM6cQj8441FQ1
         sHieF0ZCdw1OT7e7Qfil1v8DtqGgvAryn7SCJ7xle4obEc9YkgThJ3ialVA0swaXmbsH
         f6YmYAViAcfyuKBYFlV3Dbcd0JKf64/FG8pSdI1xgbsfZyTzsv8Yt7MLyt40Gd7ZRHJa
         lAZdgQro8KQl//HZV42sP6K3uNJS2WmGr+uy0+LcKo8XDjCbNenloiDjjJRZ2NVPbjsi
         UWxQ==
X-Gm-Message-State: AOAM533/QTQAbAzqCbS2Ul0mNoYo2ovNTeeXPp+ARtUZjOzna1vMs9WQ
	R3oWq6/Txg04gLgDDj4RmnebNqq1JVT+95Wug+4=
X-Google-Smtp-Source: ABdhPJy2MJ8i3Vi3wLFJRs+qnHijxeJPvYWGkFBhcfMLvX6tpGcaKD6jNZn+p0WuSRd2H2OWfooWVQ==
X-Received: by 2002:a05:6830:445:: with SMTP id d5mr59182otc.114.1624892784566;
        Mon, 28 Jun 2021 08:06:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] python3: upgrade 3.8.3 -> 3.8.4
Date: Mon, 28 Jun 2021 05:05:23 -1000
Message-Id: <c2c6df391a2634e83930219d1b574dbf64066d8a.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2020-14422.patch       | 77 -------------------
 .../{python3_3.8.3.bb => python3_3.8.4.bb}    |  5 +-
 2 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch
 rename meta/recipes-devtools/python/{python3_3.8.3.bb => python3_3.8.4.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-14422.patch b/meta/recipes-devtools/python/python3/CVE-2020-14422.patch
deleted file mode 100644
index 6889e46da9..0000000000
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
index 3aa8980e13..438b3e5504 100644
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
2.25.1

