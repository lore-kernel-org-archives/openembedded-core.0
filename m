Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA26ACD342F
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18360.1725352402317415239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kw+2Cnu2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352404; x=1756888404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JKDDmxRRrEqQuqolaJy+z11I1yLaXnndJcc+6YYVbos=;
  b=kw+2Cnu2XoDXK34hMPo+qHFUg/5G4BGmw5O4RqrGRGh/Ey3T6Efjcsn2
   Pyp94ez9MNHFWtvtP1NIMWUTaSyy4ccTSuOKtVj+x4oiMlj8HWvLCDJ4g
   8x5GWSTQ6JbOaAcdQFEcA/bueRfQpUk3o+rdCW/HVz70gPFVHkH4yo2hm
   EZL3FffstkT4k4XcOOKze6+P6ksvxtL7Ie5rWDiEfaAoD5s0hm5kIEoog
   kWCZr/ziuDQ1sviZZG0GycFdDhnTzUE1QPcjWLBv8/Jt3WFpH0LDkwKbM
   fRbhB2stWwBnbd44IA32oz85cDnqR6iKWWX+k2HHki6YVaPQtXHbTFTha
   Q==;
X-CSE-ConnectionGUID: qy+tJpEIRf6ER1ktxoNtkg==
X-CSE-MsgGUID: dqkqxfN2TKG0M33tCzIHhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172503077"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172503077"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 86FDBD922F
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B95FEE49D7
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 51A3220076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E7C5F1A000C;
	Tue,  3 Sep 2024 16:33:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/22] python3-zipp: upgrade 3.20.0 -> 3.20.1
Date: Tue,  3 Sep 2024 16:32:56 +0800
Message-Id: <1725352379-20334-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--0.878900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/ySrLqyE6Ur/jXUrfZMcSEJ6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLYYzyIe1+hnM32i1AR9yfHyQA5fuWEuRM44O
	MEsTcxLKweNEK4fEFqJLDoCr9rva4phEZf5iThndR5qWVrxxNis+pFDz1lNMD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204145

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
- Replaced SanitizedNames with a more surgical fix for infinite loops, restoring
  support for names with special characters in the archive.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.20.0.bb => python3-zipp_3.20.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.20.0.bb => python3-zipp_3.20.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.20.0.bb b/meta/recipes-devtools/python/python3-zipp_3.20.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-zipp_3.20.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.20.1.bb
index 101bafac1e..960a0d69f4 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.20.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "0145e43d89664cfe1a2e533adc75adafed82fe2da404b4bbb6b026c0157bdb31"
+SRC_URI[sha256sum] = "c22b14cc4763c5a5b04134207736c107db42e9d3ef2d9779d465f5f1bcba572b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


