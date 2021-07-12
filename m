Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.8066.1626076630267724134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 00:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aJImmvvi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626076627; i=@fujitsu.com;
	bh=5ZdbWRLqqfY0vG6gXqsrhyhz/VRQ7tBpta1Hz66JnSg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aJImmvvigOYZULqjDZ5cqBQl0qrhTW/MVRGzv1KsYmRkwsY4zj9siDnztOCsXTcqR
	 gKPsudINkUHNNe67fnt5yNEkGmzwPUOMkUiRuPBWt/jDLqXP+XvuwJTARbNFJD8tFb
	 aPGkIY8WABo5MdqaPDC7Nw6Pwt35I3/1gdrFjiPnOiOCQbFlXta3L4Vys8xOZ59/oC
	 kXn62Tgy1nwq9B/0WpafwJ+YMVcoOCxC+dC+5Ik39PTd2ff1BBE8F1OwJPX119Bnvr
	 YMIOpOtgcEYsvLrCu+jp4JKSZ9eX66Pn4yW3GgCYs9O0HfYzWTIoD5UgJ+LYqp0ist
	 l955+QKmHBCsA==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id FF/3E-07224-3D5FBE06; Mon, 12 Jul 2021 07:57:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MRqnv56+s
  Eg+cVFnd+vmN3YPQ4t3EFYwBjFGtmXlJ+RQJrRkv7G/aCjXIVXccmsDUwnpXqYuTiEBLYyiTx
  /+VCxi5GTiDnJKPEvXMFIDabgJrE9Fs3WLsYOThEBPQkrv4TBQkzC6hIvPjdww5iCwt4S6z5f
  wjMZhFQlbi9YS3YGF4BJ4nWt70sILaEgILElIfvmSHighInZz5hgZgjIXHwxQtmiBpFidmXm1
  lAVkkIVErceJw6gZF3FpKOWUg6FjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXXNTI10kus0k3
  SSy3VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgSGVkoh+58djNdff9A7xCjJwaQkyqtz+XWC
  EF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleT2CwCgkWpaanVqRl5gDDHCYtwcGjJMJb/gUozVtck
  JhbnJkOkTrFqMvx7ufiRcxCLHn5ealS4rxTPwEVCYAUZZTmwY2AxdwlRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK8TiCreDLzSuA2vQI6ggnoiMIdL0GOKElESEk1MC059XuWraOBwsHJa+8
  8X1IVW7mfVauioz9tKYNtyjebc4pegQvEhQw0dt2a2zX3eu+kahGWMKcgvQnKC9+9+pz445F0
  n+m7/O8HrQqVpX2ztyQ0bTC+PO/ss67wq0WzTP+nHnt6d/p94yUBHdFPZ3VtOM//lqVM3fOUX
  WjL1PILK+6r35iaGsAjbxNW97T+dpn6jyn386VZeoMMX8yzzHu9skRjX7BUwIFSid3L+S8pPz
  hz7uS7OvUo81mrT0yyz/7q0/9u1fIdXwLm7RO7v39fwl2O0pdej/lnXVY/0bzMc0aj+L11zJ1
  3PBf33J5860rP79OnezdOitxeVvHBdePM8Oz3T9r/mV65ea+9rW+bEktxRqKhFnNRcSIApeGK
  xTQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-245.messagelabs.com!1626076626!228346!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24840 invoked from network); 12 Jul 2021 07:57:06 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Jul 2021 07:57:06 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16C7v0al028560
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:57:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 12 Jul 2021 08:56:59 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
Date: Mon, 12 Jul 2021 15:56:48 +0800
Message-ID: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

reproducibility.patch
deleted since it's been merged upstream.

v57.1.0
-------

Changes
^^^^^^^
* #2692: Globs are now sorted in 'license_files' restoring reproducibility by eliminating variance from disk order.
* #2714: Update to distutils at pypa/distutils@e2627b7.
* #2715: Removed reliance on deprecated ssl.match_hostname by removing the ssl support. Now any index operations rely on the native SSL implementation.

Documentation changes
^^^^^^^^^^^^^^^^^^^^^
* #2604: Revamped the backward/cross tool compatibility section to remove
  some confusion.
  Add some examples and the version since when ``entry_points`` are
  supported in declarative configuration.
  Tried to make the reading flow a bit leaner, gather some informations
  that were a bit dispersed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python3-setuptools/reproducibility.patch  | 40 -------------------
 ...57.0.0.bb => python3-setuptools_57.1.0.bb} |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
 rename meta/recipes-devtools/python/{python3-setuptools_57.0.0.bb => python3-setuptools_57.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
deleted file mode 100644
index 149d8ad5ce..0000000000
--- a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-The License-File lines in PKG-INFO change ordering depending on the order on disk, 
-for example for python-packaging, one build shows:
-
-License-File: LICENSE
-License-File: LICENSE.APACHE
-License-File: LICENSE.BSD
-
-and the other shows:
-
-License-File: LICENSE
-License-File: LICENSE.BSD
-License-File: LICENSE.APACHE
-
-This is because glob uses os.listdir() which is unsorted. Sort the result to avoid this.
-
-Upstream-Status: Submitted [https://github.com/pypa/setuptools/issues/2691]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: setuptools-57.0.0/setuptools/dist.py
-===================================================================
---- setuptools-57.0.0.orig/setuptools/dist.py
-+++ setuptools-57.0.0/setuptools/dist.py
-@@ -15,7 +15,7 @@ import distutils.command
- from distutils.util import strtobool
- from distutils.debug import DEBUG
- from distutils.fancy_getopt import translate_longopt
--from glob import iglob
-+from glob import glob
- import itertools
- import textwrap
- from typing import List, Optional, TYPE_CHECKING
-@@ -603,7 +603,7 @@ class Distribution(_Distribution):
-         return (
-             path
-             for pattern in patterns
--            for path in iglob(pattern)
-+            for path in sorted(glob(pattern))
-             if not path.endswith('~')
-             and os.path.isfile(path)
-         )
diff --git a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
index a15b51e31c..c066d8209f 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
@@ -8,10 +8,9 @@ inherit pypi setuptools3
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch \
-            file://reproducibility.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
+SRC_URI[sha256sum] = "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

