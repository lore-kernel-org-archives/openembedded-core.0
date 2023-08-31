Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F239EC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:32:22 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8399.1693449133945410848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109546788"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109546788"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:32:10 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1F03DE577
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:06 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E100AD94AD
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id DAA01880D9;
	Thu, 31 Aug 2023 11:32:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core][PATCH] json-c: upgrade 0.16 -> 0.17
Date: Thu, 31 Aug 2023 10:31:56 +0800
Message-Id: <1693449116-27622-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--7.059200-10.000000
X-TMASE-MatchedRID: 82BO9bqjodKjz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyXkABvhO7aBvq4r
	mQIDoB6SA/oe4NwFf2qDGFF1DUnjpGysaLR9N/gqOWUWxTQJdI/GnIztpkKhQoAjsy+r+wvnv4i
	GaCPo3FZ5TxtDmGWgjLyy9nfu4wKEZApefOsfEeQFxov+3JYvYwwMqNovfwOoe/eKgB30qtK+X+
	RErusqvz8C7wuLXi3HyWErKXRlELjWP+4/DmD/9L9A3Bl1/DcVw4SuXsUCGYi+f7ap9DJaDWca7
	31DH1CiJm/oAxBNOvbj/CgUDtGB0GFqPXSLpNdAKwi7MItzaY1g0ehWOQsmmd9RlPzeVuQQli+B
	aqMwTNo1gIHPPGxSe8Yoh/qEF/tVATh1ufKMwlpO5y1KmK5bJTZlY6a4lRLZuBsk5njfgGzVqxR
	QKqn7x5vmOUY4bb4F9i18MvtV6V9Tskw2XtqHqc69emDs42ddpNh/2/1+WiVQnnYsWF8zq0pP7B
	zTNS9oxj6qv/FdGWW3P2Qi5OQGrriVxHiyyevsngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAqr
	jYtFiTfKHQNf/urN42EnwAkEf5iIFUI50V3fbhAZgkIWGloC37cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186933

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-with-clang-15.patch
removed since it's included in 0.17.

Changelog:
===========
New features
------------
* json_patch: add first implementation only with patch application
* Add --disable-static and --disable-dynamic options to the cmake-configure script.
* Add -DBUILD_APPS=NO option to disable app build
* Minimum cmake version is now 3.9

Significant changes and bug fixes
---------------------------------
* When serializing with JSON_C_TO_STRING_PRETTY set, keep the opening and
  closing curly or square braces on same line for empty objects or arrays.
* Disable locale handling when targeting a uClibc system due to problems
  with its duplocale() function.
* When parsing with JSON_TOKENER_STRICT set, integer overflow/underflow
  now result in a json_tokener_error_parse_number.  Without that flag
  values are capped at INT64_MIN/UINT64_MAX.
* Fix memory leak with emtpy strings in json_object_set_string
* json_object_from_fd_ex: fail if file is too large (>=INT_MAX bytes)
* Add back json_number_chars, but only because it's part of the public API.
* Entirely drop mode bits from open(O_RDONLY) to avoid warnings on certain
  platforms.
* Specify dependent libraries, including -lbsd, in a more consistent way so
  linking against a static json-c works better
* Fix a variety of build problems and add & improve tests
* Update RFC reference to https://www.rfc-editor.org/rfc/rfc8259

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../json-c/0001-Fix-build-with-clang-15.patch | 34 -------------------
 .../json-c/{json-c_0.16.bb => json-c_0.17.bb} | 10 +++---
 2 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
 rename meta/recipes-devtools/json-c/{json-c_0.16.bb => json-c_0.17.bb} (78%)

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
deleted file mode 100644
index 215f4d829a..0000000000
--- a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0145b575ac1fe6a77e00d639864f26fc91ceb12f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Aug 2022 20:37:03 -0700
-Subject: [PATCH] Fix build with clang-15+
-
-Fixes
-json_util.c:63:35: error: a function declaration without a prototype is deprecated in all versions of C [-We
-rror,-Wstrict-prototypes]
-const char *json_util_get_last_err()
-                                  ^
-                                   void
-
-Upstream-Status: Backport [https://github.com/json-c/json-c/pull/783]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- json_util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json_util.c b/json_util.c
-index 952770a..83d9c68 100644
---- a/json_util.c
-+++ b/json_util.c
-@@ -60,7 +60,7 @@ static int _json_object_to_fd(int fd, struct json_object *obj, int flags, const
- 
- static char _last_err[256] = "";
- 
--const char *json_util_get_last_err()
-+const char *json_util_get_last_err(void)
- {
- 	if (_last_err[0] == '\0')
- 		return NULL;
--- 
-2.37.2
-
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
similarity index 78%
rename from meta/recipes-devtools/json-c/json-c_0.16.bb
rename to meta/recipes-devtools/json-c/json-c_0.17.bb
index 3aba41dfcf..aff5ad5076 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -4,12 +4,10 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = " \
-    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-    file://0001-Fix-build-with-clang-15.patch \
-    file://run-ptest \
-"
-SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://run-ptest \
+           "
+SRC_URI[sha256sum] = "7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
-- 
2.34.1


