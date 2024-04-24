Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30258C25B7B
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11725.1713948186958367179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DARq1zXS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948187; x=1745484187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zRo/Nheuwv9ngWDtvN6ngbKK0m6K53tcaoNNUWB3LfI=;
  b=DARq1zXS3kXe4cWjaKAaPQUqtXj7do3MTVDpK6bx/xWoCPO7GRRleg2/
   V0wKkEYVsH+BPXICmH4WeZO/HXC0BmxOXiJd24jeckBZ52gPJPg2w1Qkj
   7W5OnvJqEzW9WTTus7hHn5zmJrJYJpbkSHaPhFaxLC4PNvzYRWWfO1ULY
   d06jtBxRqJViHvO+f1Tiru1sVqQ1DAPF9vJRfrbDNv4v4XmtvMQpvXY9a
   se44kWew3fTKsjEK/1gA3axTs47jKNyp2DQB1waBIn2/P6+B4V0JD9mkz
   p9A99arnsKvbFZphUUQ2/u0B4vmn41X0yWQWPDmqI7UWRFKNn93y0PMlf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156834832"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156834832"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:04 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2587D4C32
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CE7A9D52E9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 58A73202CE12E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03DA41A000A;
	Wed, 24 Apr 2024 16:43:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/38] pango: upgrade 1.52.1 -> 1.52.2
Date: Wed, 24 Apr 2024 16:42:13 +0800
Message-Id: <1713948152-13501-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--4.247000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF0vRzuhHK3VTqGRAXj8KbWlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74CBs03RHrzjM0z5vzLEGq8DyDz
	BrIcF07uWqc7iWjI8pXPF44cFsZvM5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0Nst
	CXmf87HBaUB3r4ZMbJ/ByOJNBUffFn38VE/J1yD0QNoWIACOFWSulNAtA209aZqyl5dCfr1PkA6
	ttEgqZbGnmal/88DezoiAhe1brH6vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198665

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- coretext: Implement reload_font
- coretext: Use Menlo instead of Courier for monospace
- win32: Avoid a double free
- Update to Unicode 15.1
- Simplify hexbox drawing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.52.1.bb => pango_1.52.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.52.1.bb => pango_1.52.2.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.52.1.bb b/meta/recipes-graphics/pango/pango_1.52.2.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.52.1.bb
rename to meta/recipes-graphics/pango/pango_1.52.2.bb
index a67c3791a2..4f748e6554 100644
--- a/meta/recipes-graphics/pango/pango_1.52.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.52.2.bb
@@ -23,7 +23,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "58728a0a2d86f60761208df9493033d18ecb2497abac80ee1a274ad0c6e55f0f"
+SRC_URI[archive.sha256sum] = "d0076afe01082814b853deec99f9349ece5f2ce83908b8e58ff736b41f78a96b"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


