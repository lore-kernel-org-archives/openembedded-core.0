Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808C6E77182
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.116565.1733788632879817253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cA3uaY+Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788633; x=1765324633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xgiV6GvCsz0zzuhxb+f/WSGjQ0ceWL2x6Jr3DCbu/zQ=;
  b=cA3uaY+Z5RZvjGW7eXajJsrSo3NsgtGEtGfHFgE3r6GCgZ9y+LuFdevz
   w8kIrIX7o5jf0Oin2YVURQIJ44zrbPDB8RImWWqBNKpMM1wl+5rRHmvgX
   CwZzZ1jVz6SX+LrJf8yJqBa9+Hv89FboOZ6InPQIOMEOK1I0W+2hH6RHw
   Tso35S/o2vt4nj7XoAuoatMIZ5uHxG6PFhhWAXRywSqGkPS5zkLUgx3JY
   i1fdW8PJWdeksLEKRjEjfPhZadwbC/M5OoZSQpCCcOM39Hm4Cu+Dlcn0p
   NugXNK8gnKXNdC8lsg6IOPpqKYJUE9MVBLSE5JpVwclArwmMgz3Er8+Qw
   g==;
X-CSE-ConnectionGUID: 2X6ucSUiSwi8wY14CFEYKw==
X-CSE-MsgGUID: ks0d8pS6REi8pUeM2oDzgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="171133395"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="171133395"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CEE97D4C2B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8602BF498
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4917220076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB1631A006C;
	Tue, 10 Dec 2024 07:57:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 19/20] ttyrun: upgrade 2.35.0 -> 2.36.0
Date: Tue, 10 Dec 2024 07:56:51 +0800
Message-Id: <1733788612-20933-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-1.304400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0ZaDCzqDR7DPZr8DB8nU9Rc5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S8MA9Ygme8chISg1e+PiiyicjTVw/KQ/ggkVq0SpT5mNoaH
	opAoQAk8upFiPfGEZMhZJ2RHwtqxIu/RbZt30B3vk0GgUVYS0XS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208514

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.35.0.bb => ttyrun_2.36.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.35.0.bb => ttyrun_2.36.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.35.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.36.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.36.0.bb
index c505bd7160..3a58f19a9a 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.36.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "c2db7ce05fdc3ebd63cccbcb1edc2b606709e21f"
+SRCREV = "0cd063e40d12d7ca5bc59a09b2ee4803653678bd"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.34.1


