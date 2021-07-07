Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web11.22895.1625672694009725817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GubjA5s4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625672692; i=@fujitsu.com;
	bh=eHQ2ZrHSdHnIV70Pk4vQJzYiO7xEkj6+ItLKAkDxbVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GubjA5s4L/FM+jEKEmAT8Pfde5bdKTK0W8liu1OFElKY3KLH1dFGn0iH5ZbJJ5MT6
	 odaEI6+j9weOJ+9UwSlNsPI1grpeXc+7F2w01QuaqW6H1WZkN7iIyiC5Xtf6rs9ELO
	 BjMwMRLyGaazoEs+vRrmIZipz/kUt99NK5TLnBPohPEgoEtyrzG4T3g6ILUb+XVjaT
	 ewtxasqAEElrq+jVGEcTMBR5W0aw+fNTQMO4TZp3XMVbKDvq78LVOAbzI3TV8Rdz5s
	 U08jsJodS5Me1WHMXraPOJXrI3UiIjv3maAoL2ZKVccnVcQttK8phLhnzpg0kEo9LC
	 5Iq+/YOQVsjQA==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 8E/73-07651-3FBC5E06; Wed, 07 Jul 2021 15:44:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRqvv59NM
  Eg81L1C3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozji/ewF0yQr9h18yhLA+N/qS5GLg4hgZlM
  Ek8OdrBDOMcZJbYc/sLSxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg4SFBdwlO
  nfygIRZgMLb1vaygti8Ao4SbQ9+MYPYEgIKElMevmcGKecUcJKY+VILJCwEVDL70VyockGJkz
  OfsEBMl5A4+OIFVKuixOzLzSwQdoXE68OXmCcw8s9C0jILScsCRqZVjJZJRZnpGSW5iZk5uoY
  GBrqGhsa6xrqGliZ6iVW6iXqppbrJqXklRYlAWb3E8mK94src5JwUvbzUkk2MwGBMKWQ+tIPx
  yesPeocYJTmYlER5Z654miDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtftFFBOsCg1PbUiLTMHG
  BkwaQkOHiUR3tkgad7igsTc4sx0iNQpRl2Odz8XL2IWYsnLz0uVEucNBykSACnKKM2DGwGL0k
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlTQKbwZOaVwG16BXQEE9ARDIfBjihJREhJNTD
  tClre9UL8Ru9Hh80i1a8f1veu2BZzNNn74vVPwjWia7PO2D6L87p9/0Wnvemq556Va89EKn+2
  7lwqkvlOb2LeqtQdeoudPzg3NDt36Ho8TLjMkW6+dv9UQaerNTPLpDeGXJgm86bGr29hZlv1v
  p1LuYPVd+7a8EyA75Wa8n9bZ8PSm4vn6srZFh5c9vLKlEThzSubG1ff2vd0cRqvRNCrz8t2n9
  zDetPP6fYaxV3ueawLVt0L2TFnmdokV670+Yeacgtaa17dyD64+mb5kbpjlu9F9/guerxDybn
  69dlr/h7PufMdZHcxxE8K+Tuz2u+41OV9GsLTW84/bzlwpoNlQ26cZEqOwbLYFjP7TrEqJZbi
  jERDLeai4kQA8FX8Bk0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-232.messagelabs.com!1625672691!188373!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11913 invoked from network); 7 Jul 2021 15:44:51 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 15:44:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 167Fil7n003293
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 16:44:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 16:44:45 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 57.0.0 -> 57.1.0
Date: Wed, 7 Jul 2021 23:44:28 +0800
Message-ID: <1625672669-3918-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh reproducibility.patch

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
 .../python3-setuptools/reproducibility.patch  | 21 ++++++++++++-------
 ...57.0.0.bb => python3-setuptools_57.1.0.bb} |  2 +-
 2 files changed, 15 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_57.0.0.bb => python3-setuptools_57.1.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
index 149d8ad5ce..fda520658e 100644
--- a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
@@ -1,4 +1,4 @@
-The License-File lines in PKG-INFO change ordering depending on the order on disk, 
+The License-File lines in PKG-INFO change ordering depending on the order on disk,
 for example for python-packaging, one build shows:
 
 License-File: LICENSE
@@ -15,11 +15,15 @@ This is because glob uses os.listdir() which is unsorted. Sort the result to avo
 
 Upstream-Status: Submitted [https://github.com/pypa/setuptools/issues/2691]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ setuptools/dist.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: setuptools-57.0.0/setuptools/dist.py
-===================================================================
---- setuptools-57.0.0.orig/setuptools/dist.py
-+++ setuptools-57.0.0/setuptools/dist.py
+diff --git a/setuptools/dist.py b/setuptools/dist.py
+index df071c1..fe3c5da 100644
+--- a/setuptools/dist.py
++++ b/setuptools/dist.py
 @@ -15,7 +15,7 @@ import distutils.command
  from distutils.util import strtobool
  from distutils.debug import DEBUG
@@ -29,12 +33,15 @@ Index: setuptools-57.0.0/setuptools/dist.py
  import itertools
  import textwrap
  from typing import List, Optional, TYPE_CHECKING
-@@ -603,7 +603,7 @@ class Distribution(_Distribution):
+@@ -609,7 +609,7 @@ class Distribution(_Distribution):
          return (
              path
              for pattern in patterns
--            for path in iglob(pattern)
+-            for path in sorted(iglob(pattern))
 +            for path in sorted(glob(pattern))
              if not path.endswith('~')
              and os.path.isfile(path)
          )
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
index a15b51e31c..3c7aa4c4c5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://reproducibility.patch"
 
-SRC_URI[sha256sum] = "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
+SRC_URI[sha256sum] = "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

