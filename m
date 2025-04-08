Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27175C369A6
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.64300.1744073532229948192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AKfM5bZ1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073532; x=1775609532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1liiBpvD02VijNUg5NilY5bb/oLcOXGUjUu1Xmr3OjQ=;
  b=AKfM5bZ1zQiAGuNinD3u1DvFnPEtIEXR51V9IcU94/74gerns+81rr5h
   niGaDNeN/e1x/dssc+4250g8DgPf9Y31WdvIpBZjVGIUJSJQMb0abVprf
   Zzn6MvrsQvOxc4SAWoRsHBE/jblHYBldF0/jj0PISv9Y1PP1QVsMmNWwD
   WluuIu1CxYlQLM8b73RSY7Uz8VVNomHzzuKddfCyVrVppFovstTqYLT/d
   HQ9gad4ak1h0JVemIs1BxyuVYIo4BWmJqmYrKgsWC4kQHuETr41d+jYQR
   w8QEDFh+qryPJ7xRdnS4Q7E1QeC86tZXlqfH0zZPjnQqNUKmSWDCjh+in
   Q==;
X-CSE-ConnectionGUID: hbkWhd/lTp2OT8k20c3W+g==
X-CSE-MsgGUID: ScdBuyd5TaGMGFDLoX+B1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="174600377"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="174600377"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:00 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 483EADBB80
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AAEAD73AB
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6690E1A009B;
	Tue,  8 Apr 2025 08:51:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/15] ell: upgrade 0.75 -> 0.76
Date: Tue,  8 Apr 2025 08:51:29 +0800
Message-Id: <1744073502-27695-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214492

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix issue with random scalar generation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.75.bb => ell_0.76.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.75.bb => ell_0.76.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.75.bb b/meta/recipes-core/ell/ell_0.76.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.75.bb
rename to meta/recipes-core/ell/ell_0.76.bb
index 80a108a4b5..fcc56e02f7 100644
--- a/meta/recipes-core/ell/ell_0.75.bb
+++ b/meta/recipes-core/ell/ell_0.76.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "10cee84ee075d9e0fc1c65fa1acdf7f6ffc2b3ed7e09622be9fc8f8979b02bd5"
+SRC_URI[sha256sum] = "a0bf2b5a78450c0c167e3f65c18452ffe4c0f179d48c2a3661e6afaca8017ef9"
-- 
2.43.0


