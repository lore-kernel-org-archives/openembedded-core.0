Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.231.1616596808398776951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dkUdr5iI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id x26so17457808pfn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gg/cJBWkygOU8aZzCJaW/GbAFL8kG9YYayDyyVDhPaY=;
        b=dkUdr5iILdQuHghMxgEhZ52mXqxXPr/GWQKpNKPJuO6C5LcC1rBE9iTNaBITxDSdUZ
         Lnmo5ZITmaJn9fpQgBpiZjFMTaw5AlFjMe7HnPzg1Q3NIL5sWugm8nfWtch5WWALs+PS
         WEILBwigzdKW42ZDJlYLLtlmxB2HGM+IaXr51cYDyeQ7sH2ZMFVEZkDsfheNLSVNcHiP
         H92so0Ste2hTwO6k8a2vordpISQ5zKraI+gyalKviVOytuPAufQcpYrazJSCIHKnwnAI
         UW5jQrGal+WL8AKwb0J5+aFUfzPHO4U3plqUQXJNSecOR30aS3eE66hZ7r97EjrLHZsA
         JMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gg/cJBWkygOU8aZzCJaW/GbAFL8kG9YYayDyyVDhPaY=;
        b=lKpSYTVr0b4Cz709QR+aZu0F0iuLxhn/sqMVcMVb1WpqKSdJKfvKGle6KPmaY4RMOV
         w90IJLXIW4+uieBRa3FdVC5ulqa5Cxw+OilT9NoopX0k+qmQt5QiGMs1rIbfMkaFBoGk
         LzIDRSkMXcIYbzovMI/j8JNxhwlE93H1bXYoBPAvallDIIfSItjFU3qQSVq3M1C0zcTT
         6O1bkXQxmq/4t62evdi6b1rZXxsLWdNfhT96DbhcGaUkThaIyGBxZhUGMAR4LlFFXqTk
         QSZPPZRfB0QcaeWEB6RnayS1VbgHxVJ+GzbT8pEWrinkLB97KgCED97CqRCwgANRdB+8
         AqbA==
X-Gm-Message-State: AOAM532lLutZ8qql52xz7xu8kVRrL2VZTW6KdjZ9rozCaqnEpTfuunup
	4K3dGNy0CLqX/z9LZMMgqWrQ561V3j3++iNF
X-Google-Smtp-Source: ABdhPJwTm2SHDcfH6oWON2pfLAtjgeNFYP8Ls6iuVV1xPYuXZCbqdyQONUhYLOTCJwMUvL1IHnAfRw==
X-Received: by 2002:a63:4415:: with SMTP id r21mr3358498pga.222.1616596807352;
        Wed, 24 Mar 2021 07:40:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/21] cve-check: CVE_VERSION_SUFFIX to work with patched release
Date: Wed, 24 Mar 2021 04:39:09 -1000
Message-Id: <d75f95a09e5e85eb759e748f9e0fee1c5fa1b318.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

CVE_VERSION_SUFFIX in "patch" to treat version string with suffix "pX"
or "patchX" as patched release.

also update testcases to cover this changes and set CVE_VERSION_SUFFIX
for sudo.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8076815fc2ffc8f632e73527ce2b7d158a29e9ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py                  | 7 ++++++-
 meta/lib/oeqa/selftest/cases/cve_check.py | 8 ++++++++
 meta/recipes-extended/sudo/sudo.inc       | 2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ce755f940a..a1d7c292af 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -11,8 +11,13 @@ _Version = collections.namedtuple(
 class Version():
 
     def __init__(self, version, suffix=None):
+
+        suffixes = ["alphabetical", "patch"]
+
         if str(suffix) == "alphabetical":
             version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(?P<patch_l>[a-z]))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+        elif str(suffix) == "patch":
+            version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(p|patch)(?P<patch_l>[0-9]+))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
         else:
             version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
         regex = re.compile(r"^\s*" + version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
@@ -23,7 +28,7 @@ class Version():
 
         self._version = _Version(
             release=tuple(int(i) for i in match.group("release").replace("-",".").split(".")),
-            patch_l=match.group("patch_l") if str(suffix) == "alphabetical" and match.group("patch_l") else "",
+            patch_l=match.group("patch_l") if str(suffix) in suffixes and match.group("patch_l") else "",
             pre_l=match.group("pre_l"),
             pre_v=match.group("pre_v")
         )
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 3f343a2841..d1947baffc 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -34,3 +34,11 @@ class CVECheck(OESelftestTestCase):
         self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' < '1.0r'")
         result = Version("1.0b","alphabetical") > Version("1.0","alphabetical")
         self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' > '1.0'")
+
+        # consider the trailing "p" and "patch" as patched released when comparing
+        result = Version("1.0","patch") < Version("1.0p1","patch")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0' < '1.0p1'")
+        result = Version("1.0p2","patch") > Version("1.0p1","patch")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0p2' > '1.0p1'")
+        result = Version("1.0_patch2","patch") < Version("1.0_patch3","patch")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index aeedfc1a23..153731c807 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -49,3 +49,5 @@ do_compile_prepend () {
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
+
+CVE_VERSION_SUFFIX = "patch"
-- 
2.25.1

