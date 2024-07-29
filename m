Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1579C52D7C
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.46594.1722215430009041958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jn2Q21L9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215431; x=1753751431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B85Z0jwYg9Hq6GB/6TFnopsBO7k2Y1ZoNjGJqwjMN/o=;
  b=jn2Q21L9aa1m4lHwaJnWQjrWhE/vZSAb9bM+10k+Sn7Fjvm6DXAsD/8V
   tcQkzbcEFAI8CjPqYe6UDju9mE8Lvsc9yl3VuEzWNhKNvsacp62Kwrx/j
   7e9gcIkavXGJY1u5PaizQKDMhaTgZlxDgzYKHIuU5mY+ThnLFObSDCfH8
   EalkxGZCtSVyg8YW06nWluwF8MfNq+k4o9tf2Tarx6cremappvmr7Xnj7
   gd3rBx0C6vwupGSxma2bVrwGavtx2rj+9HFtr/p8HGhfTXPydV7j7g32c
   zjXn0GTPJr9biuJ2ppYiFikjOrp0Qkbop/Qn8FejfnbxehW5AMy95thTH
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="156246515"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="156246515"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:28 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9E39E8528
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 134B6D5007
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A210320071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 573BF1A000C;
	Mon, 29 Jul 2024 09:10:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 16/33] python3-jsonschema: upgrade 4.22.0 -> 4.23.0
Date: Mon, 29 Jul 2024 09:09:51 +0800
Message-Id: <1722215408-27541-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--0.113600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrmjMatSILX7+OI+d3+xbbGb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9E4kYXbobxJbJtwx+p5fx655ljl3QzCRt6NIomC53a5Sd3CM
	W27Xasm9yxzqIjAqMT4BHs8xx3i2ix2QhAJGd1lBOszfsLfvSOByHoQ+hUKoQ1X1Awhbnt7+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202594

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Do not reorder dictionaries (schemas, instances) that are printed as part
  of validation errors.
- Declare support for Py3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-jsonschema_4.22.0.bb => python3-jsonschema_4.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.22.0.bb => python3-jsonschema_4.23.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
index 0332b3e9b5..126258255d 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "5b22d434a45935119af990552c862e5d6d564e8f6601206b305a61fdf661a2b7"
+SRC_URI[sha256sum] = "d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


