Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8EBC282D3
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.18209.1741079374947446222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ha6YXOVP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079376; x=1772615376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lSw3P+vsyyZhkwSNNVs1lPezdO9L4hguD9BbKTwRiOU=;
  b=ha6YXOVPMD2GrLw/OwHoVHTv8+dtkK4nOgEw2VuD0Z0ZbK2k6GptPojE
   nu6Yd7d+WEtYGYiNZoc0YDyA9FdQJAKj+xZesmtlltaHb9NnP417wvB9F
   ICgB8W68y1xouyDgAYNdElY/7StE8sUCmPtDauBoNoU2fXfTZO1+C7YUz
   go6PpEujRucunb8wx+GsTI7Wejpi7WdsWlTd+jg9oxERj+iw7KxqEZw49
   plsbwk1eet0PjMOiUYhp5gyw9Op7caw/0jIl7Ue/CoFPPiAiDY9LDaAse
   mlFYlRpPK7fwaiOIg0Ot1BcwGasPpjy3weVOy1xND9DEgRbn5nPED4B/B
   Q==;
X-CSE-ConnectionGUID: l2x0/PpaSxex+GqNJcZZ1Q==
X-CSE-MsgGUID: dy8jZh69TRKjUMMPdBmrYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="194539734"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="194539734"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FC4FE6142
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5981D72A6
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 95A3F1A0071;
	Tue,  4 Mar 2025 17:09:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/31] zstd: upgrade 1.5.6 -> 1.5.7
Date: Tue,  4 Mar 2025 17:09:16 +0800
Message-Id: <1741079356-13445-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212256

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/zstd/{zstd_1.5.6.bb => zstd_1.5.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.6.bb => zstd_1.5.7.bb} (96%)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.6.bb b/meta/recipes-extended/zstd/zstd_1.5.7.bb
similarity index 96%
rename from meta/recipes-extended/zstd/zstd_1.5.6.bb
rename to meta/recipes-extended/zstd/zstd_1.5.7.bb
index 0f3309d8af..d173558a0f 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.6.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
 
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
 
-SRCREV = "794ea1b0afca0f020f4e57b6732332231fb23c70"
+SRCREV = "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.43.0


