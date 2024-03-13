Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D84C54E73
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10642.1710313765163038666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c+kDmHnL;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313765; x=1741849765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JTXgfEgmmq45oAbmPlw4w0gO5DEZMGQbJKKAOlvmy34=;
  b=c+kDmHnL4wtMRai23upGZnf/w4n2JAqimZyBn6TiHnPafLRGm2ARAqO2
   7kKTMxj9iKJ9N288OZ6Xjn0VGL8tNoE60uWCQr54pbg08V2zVfPrYraPb
   O4wPvEWpqhbp6Emw+4Vh8ql0rG6C8eNQrTYxUGBpne2DPqBvOwmATf3m8
   oysA8TvIhyhg+hv4I5fhIctAPp7dJ31i386IhaWNzJ9vcFN87ADY7+bQP
   85ttNH/Fbh2N98G0Ady2Z8glAlLFelurhtcnPpEz/uengkSYsBcwElH1G
   3hj8HPVRCTr2YuN+os/xTbJ/X3qBmI3v3f3rMu584VMVDf5E5TElHgmRG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131429014"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131429014"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF0A1C21B1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EFC0BBDC83
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B72220097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A3111A006B;
	Wed, 13 Mar 2024 15:09:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/36] python3-cython: upgrade 3.0.8 -> 3.0.9
Date: Wed, 13 Mar 2024 15:08:17 +0800
Message-Id: <1710313714-12541-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.942200-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mraZATGA5/BXjy8nsai2bZgKk4
	lLAFOnmCF8CeJo8uwNBG422lOh3uyg/ijdWq03SW4bp7SkqrNmndKRNjzo2IOI5V1ACIyZtncKJ
	vdJYD8MFRO82F7ahci7NXhgNwZpXjj5nOH/bPvLGz8d6zvo5NkNiPDVCot+tGCXjDiV/HPZxzsP
	47n2/rq5eNHonI3q6WT5qvV+wg6GYznw+i+raCo6tK3oodxPaxN5dqZcIK7ViVZ33hK1AVctnfJ
	rUSEbFDJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVz64b06vmARflIOV
	A+gJRdKxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcillZ849LIMgVDbZjyY5sfrxHFM
	hfx7ZEFCoJBFt984CLo2kFU6rYjbA5DXyaCfwDx2GedeLObAHsZAtulOXcZHAYdQ80FwvPf6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197021

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Features added
--------------
* Assigning "const" values to non-const variables now issues a warning.
* Using "noexcept" on a function returning Python objects now issues a warning.
* Some C-API usage was updated for the upcoming CPython 3.13.
* The deprecated "Py_UNICODE" type is no longer used, unless required by user code.
* "std::string.replace()" declarations were added to libcpp.string.

Bugs fixed
----------
* Cython generates incorrect (but harmless) self-casts when directly calling
  final methods of subtypes.  Lacking a better solution, the errors that recent
  gcc versions produce have been silenced for the time being.
* Unused variable warnings about clineno were fixed when C lines in tracebacks are disabled.
* Subclass deallocation of extern classes could crash if the base class uses GC.
* Type checks for Python "memoryview" could use an invalid C function.
* Calling final fused functions could generate invalid C code.
* Declaring extern enums multiple times could generate invalid C code.
* "pyximport" used relative paths incorrectly.
* Running Cython with globbing characters ("[]*?") in the module search path could fail.
* Literal strings that include braces could change the C code indentation.

Other changes
-------------
* The "enum class not importable" warning is now only issued once per enum type.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../python/{python3-cython_3.0.8.bb => python3-cython_3.0.9.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.8.bb => python3-cython_3.0.9.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index e54926ae6d..2235aa9332 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6"
+SRC_URI[sha256sum] = "a2d354f059d1f055d34cfaa62c5b68bc78ac2ceab6407148d47fb508cf3ba4f3"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.8.bb b/meta/recipes-devtools/python/python3-cython_3.0.9.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_3.0.8.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.9.bb
-- 
2.34.1


