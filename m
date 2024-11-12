Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57630D32D69
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.82745.1731403556170454521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cvpXA5oq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403556; x=1762939556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AQLBzh5Efqa8P3HHL5X1pzH5Wc5RewN38N17eh88X0E=;
  b=cvpXA5oq1OncC/G1sGsjgrY2DDcsZpPlqjJ4TiNktHCC2ZtFdwkbzZIr
   ZFCqvnmcZLnGYVGO3fmMzpeU/X8lZ4IYej9B4rHolaOpygOvgb8UnrXbE
   GMWQqOl3+7/DcOGoKzrvcHrAzJBy0WlDv/EL3BqUt0JSv6I/LEwzZtXR7
   Wc+xXYwy9NDqqJqHW1W0I5yovgX6hOmB9dsXjFeIMw/iLhM6rQTwYr9rF
   IIJEpONijwyav8J2aMUbz6e/ZOxS4RC4KPZVgmU1BccfNoJ8VrisIpI8B
   LDKILYoe1hEvhfDM7L5b6szOgdbrKnO6ANuhsqZgkUY4GUzJp7FooV0HH
   w==;
X-CSE-ConnectionGUID: yciLWk/qR564bY1sDJA95Q==
X-CSE-MsgGUID: ldiZcy5AQgajSefqljImaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180063552"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180063552"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E02F5D4F5F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AB11D50E4
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 140C820071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5EEF1A000A;
	Tue, 12 Nov 2024 17:25:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/47] python3-rpds-py: upgrade 0.20.0 -> 0.21.0
Date: Tue, 12 Nov 2024 17:24:33 +0800
Message-Id: <1731403483-21399-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.783600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrjdL0b7DvTG7fUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BIxFsMLu9ebF42zm1Zi+MJ3vX
	AdBTWEzjdn7tE50f1fmqNaL7KsYW4r78SC5iivxwURSScn+QSXt0H8LFZNFG76sBnwpOylLPF+r
	BeL7tbPc4g8b9aCqJkexIUsuXcjQ8r1AfI/1/4kydpRfrRP2dNmpLmhbz9/o6aghYlZsX4tCEQV
	A11jis930+lOorUus2IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 bump pyO3 to 0.22.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-rpds-py-crates.inc         | 26 +++++++++----------
 ...py_0.20.0.bb => python3-rpds-py_0.21.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.20.0.bb => python3-rpds-py_0.21.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index e6c1ef8add..fc954d69b8 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,7 +2,7 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/archery/1.2.0 \
+    crate://crates.io/archery/1.2.1 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/cc/1.0.90 \
     crate://crates.io/cfg-if/1.0.0 \
@@ -13,15 +13,14 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.2 \
-    crate://crates.io/pyo3-build-config/0.22.2 \
-    crate://crates.io/pyo3-ffi/0.22.2 \
-    crate://crates.io/pyo3-macros/0.22.2 \
-    crate://crates.io/pyo3-macros-backend/0.22.2 \
+    crate://crates.io/pyo3/0.22.6 \
+    crate://crates.io/pyo3-build-config/0.22.6 \
+    crate://crates.io/pyo3-ffi/0.22.6 \
+    crate://crates.io/pyo3-macros/0.22.6 \
+    crate://crates.io/pyo3-macros-backend/0.22.6 \
     crate://crates.io/python3-dll-a/0.2.10 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
-    crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/syn/2.0.69 \
     crate://crates.io/target-lexicon/0.12.14 \
     crate://crates.io/triomphe/0.1.13 \
@@ -29,7 +28,7 @@ SRC_URI += " \
     crate://crates.io/unindent/0.2.3 \
 "
 
-SRC_URI[archery-1.2.0.sha256sum] = "8967cd1cc9e9e1954f644e14fbd6042fe9a37da96c52a67e44a2ac18261f8561"
+SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[cc-1.0.90.sha256sum] = "8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
@@ -40,15 +39,14 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
-SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
-SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
-SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
-SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
+SRC_URI[pyo3-0.22.6.sha256sum] = "f402062616ab18202ae8319da13fa4279883a2b8a9d9f83f20dbade813ce1884"
+SRC_URI[pyo3-build-config-0.22.6.sha256sum] = "b14b5775b5ff446dd1056212d778012cbe8a0fbffd368029fd9e25b514479c38"
+SRC_URI[pyo3-ffi-0.22.6.sha256sum] = "9ab5bcf04a2cdcbb50c7d6105de943f543f9ed92af55818fd17b660390fc8636"
+SRC_URI[pyo3-macros-0.22.6.sha256sum] = "0fd24d897903a9e6d80b968368a34e1525aeb719d568dba8b3d4bfa5dc67d453"
+SRC_URI[pyo3-macros-backend-0.22.6.sha256sum] = "36c011a03ba1e50152b4b394b479826cad97e7a21eb52df179cd91ac411cbfbe"
 SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
-SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
 SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
 SRC_URI[triomphe-0.1.13.sha256sum] = "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
index dd483ed88e..e97459a444 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "d72a210824facfdaf8768cf2d7ca25a042c30320b3020de2fa04640920d4e121"
+SRC_URI[sha256sum] = "ed6378c9d66d0de903763e7706383d60c33829581f0adff47b6535f1802fa6db"
 
 require ${BPN}-crates.inc
 
-- 
2.34.1


