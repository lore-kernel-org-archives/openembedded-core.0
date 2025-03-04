Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B076C282D3
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.18200.1741079369828752806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C644ZveW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079371; x=1772615371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JDL5bZ/rfgieWeFB0XSMHuUYJ7Uj1FrR/hZYOueq1y0=;
  b=C644ZveWS55FT8Fc9xeZnMTxxCRl/sdLM+P3hIvDrl2aMPDKIHHjR29p
   9G5wdQVf3OVvIhYpau9ncsX/7I9N15/1vqWK7B11zIF4LMK7Nmvl/jGsI
   gJlOdwAm9Pf63R9vCWY4ttinkllTIUQjrrDCgKa3jMjJBLYj8UoIvl6V8
   Ij/9fSZFXzMu4b6EY/c1DNOG8H9JigpUa+urgw/dwTi7uJ/nhr+oMP8M5
   XxZ6EFTD0IENDmZglso8E8PwOT/MEkfHk/ZmyqJGgMYIW2B/O/jkBlkGM
   91ap2qLbFkCNUWxQYFeznZgKQNrYTHLZ1bg45LHvu7UzxBjK0i4Dr7vm7
   A==;
X-CSE-ConnectionGUID: ip1IWxlBTz2cKzIwd0ranA==
X-CSE-MsgGUID: r++nYMHGSDWtxRyG95aO2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="194539726"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="194539726"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05E39DBB8C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF62310958
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FAF61A009A;
	Tue,  4 Mar 2025 17:09:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/31] minicom: upgrade 2.9 -> 2.10
Date: Tue,  4 Mar 2025 17:08:58 +0800
Message-Id: <1741079356-13445-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212238

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../minicom/{minicom_2.9.bb => minicom_2.10.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/minicom/{minicom_2.9.bb => minicom_2.10.bb} (90%)

diff --git a/meta/recipes-extended/minicom/minicom_2.9.bb b/meta/recipes-extended/minicom/minicom_2.10.bb
similarity index 90%
rename from meta/recipes-extended/minicom/minicom_2.9.bb
rename to meta/recipes-extended/minicom/minicom_2.10.bb
index 907d5c79c9..20ce5662c2 100644
--- a/meta/recipes-extended/minicom/minicom_2.9.bb
+++ b/meta/recipes-extended/minicom/minicom_2.10.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
+SRC_URI[sha256sum] = "90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.43.0


