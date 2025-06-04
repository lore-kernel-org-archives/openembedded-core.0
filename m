Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CD3C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11713.1749026733689315424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jt6JFC11;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026739; x=1780562739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ExZ3mB+xT2EM1eGS4rZbIn9H9gpVX6QdBF+bpNfGbJM=;
  b=jt6JFC11JkSKkZSoTcV6lGk1EzZqI2QgewFjk0NRpN7J/pv4Akdx51aI
   V96uwzavRCo8SO09+kQq/dex+2EuydpWiN+pj9KcTR8gk05ER2RXwp2Qt
   z7RhBqfJnqgV6wD2PwEMJ+9jRMHrIjdkTYTeM0VXtTZC72XCja7cj2/eN
   4XG2HrR+NzIVHCfHuJpkSHNI0e2emDjn9H8iBdNUJzF20jVLJXr13Kvq3
   IxPD/1TzrSteWwvY0pf+0XkuhzZhxPWC+yPejN43+OMwXNUyezgDcHhay
   i8IMwNVMN7izvUQ8jKF7IHkrJtTkJv9gRL4oJYu98F6C5NEdrMr2qHKqP
   Q==;
X-CSE-ConnectionGUID: eG0v5P3wTae/2oCN6i1e8Q==
X-CSE-MsgGUID: y2fvpqVwTy2tLxogZUG5UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="202109483"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="202109483"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:38 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 499C1E0ABE
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04F27D746A
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:36 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A92E01A0078;
	Wed,  4 Jun 2025 16:45:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/45] libarchive: upgrade 3.7.9 -> 3.8.0
Date: Wed,  4 Jun 2025 16:45:00 +0800
Message-ID: <20250604084524.864-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217867

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
   file in public domain changed from
   libarchive/archive_getdate.c to libarchive/archive_parse_date.c

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libarchive/{libarchive_3.7.9.bb => libarchive_3.8.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.9.bb => libarchive_3.8.0.bb} (93%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.0.bb
similarity index 93%
rename from meta/recipes-extended/libarchive/libarchive_3.7.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.0.bb
index d70cdb3d83..0722f26f9f 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ce08437ff7f5e24d72e666313ae4084"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -31,7 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
+SRC_URI[sha256sum] = "191b5b24811499d5c2e5efa3248975fa6daa5e6a227700cc7b8e54d6d7c06eef"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.43.0


