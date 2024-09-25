Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9C5C7885C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9255.1727246985761968810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cU3ijdei;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246987; x=1758782987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f9sOqMY2JxZBobTYBf7voo3+RsCulX843owge4Bv+fw=;
  b=cU3ijdeiLKh09VtoYFZprDhmGKesQZ3Dyw2UukNmOKIthKKn2vyoBARP
   d8XUz5Q6JBGmiCww6fKiptyQsURFp+ykmOIL5rzBbhKmQnK7/ryYPxQc5
   26LurUoT1+5Ey2MTfPLTg6EsopbT27FMQ9W38LYsB58lA7VH8i2TyXjzc
   YgaPa7K6DZ9oQyFuIs0oxVEOspJVetYY3bSDsI2XH8nV4mvK46l4KYHOt
   TpPFZE6w75f2r26+zMxH5OCSuNVKDTu/ZIBzENBsfgr4TdJDCJ6WBOXL7
   h2JkmwBwv2q7H30l+LzOU/O6GC3iKMBPVAOsaC3o9KrdkbuT/zi8Bt7pC
   g==;
X-CSE-ConnectionGUID: V6+I0sRlQh+h2hPPcEG6OQ==
X-CSE-MsgGUID: o1EfORRiRTmZC5/Xpc2r4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174697185"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174697185"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE614C68E4
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4010515CF2
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB6786B5C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C3B11A01E9;
	Wed, 25 Sep 2024 14:49:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/47] python3-cffi: upgrade 1.17.0 -> 1.17.1
Date: Wed, 25 Sep 2024 14:48:58 +0800
Message-Id: <1727246960-20665-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--0.050600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhFtRKarSV80bo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIJAKyLc9Jf1JebFgwMU68fbLSQVQlDZBpEvi
	BZFziNlRk9dkrTJxvJWDFkoyInRQK/DZKAFphvvZz7qE7RDBjnxrPzIhmmYxz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204913

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix failing distutils.msvc9compiler imports under Windows
- ffibuilder.emit_python_code() and ffibuiler.emit_c_code() accept file-like objects
- ffiplatform calls are bypassed by ffibuilder.emit_python_code() and ffibuilder.emit_c_code()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cffi_1.17.0.bb => python3-cffi_1.17.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.17.0.bb => python3-cffi_1.17.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.17.0.bb b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cffi_1.17.0.bb
rename to meta/recipes-devtools/python/python3-cffi_1.17.1.bb
index 28200f9b43..99979a73e8 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.17.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "f3157624b7558b914cb039fd1af735e5e8049a87c817cc215109ad1c8779df76"
+SRC_URI[sha256sum] = "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1


