Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0E9C61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11723.1749026741228461368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l71q74bJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026741; x=1780562741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=srvuJXAPCSmA82HU63gRGqHoN3gchPlEKrnTK0awiI0=;
  b=l71q74bJF9xFQQH19Q73jtnnY+VSuNKqjqxhLLqrmBKbXzXyfIY9+xh8
   Ip1FuSXmCLFQnHJ4wDWMtvazQl2IlZT4xcMJB9kG1ufqfu628ZKeaYp1A
   nzsx1+UOC+ktmAiaCNr5jmqa8Nyhb17DAgAaAil6yrqYArDjTPx9HtKel
   lblPPHvBxbNPesgE6DdQqykV0+QOmg2uLnzQMTMB9COYD6ire4i74uPvq
   dheU4I/BAAat81l5wPqKQhDk0vjhmHGVXxRo+S8Puw+JXuME16NFMV2jK
   32Q+qaM4eX9qvRy4iTtcGM0H5cI0SYxZe+dtatsajLIw8poI6H+Q/gtjf
   w==;
X-CSE-ConnectionGUID: kIYnT4XFQ/Kw9mnGTIkAUQ==
X-CSE-MsgGUID: 9rfept1UTYGW+hNoJf7OFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="180576703"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="180576703"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:39 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D26A8D5051
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D2DCCFA46
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:36 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 09D5D1A009A;
	Wed,  4 Jun 2025 16:45:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/45] libmodulemd: upgrade 2.15.0 -> 2.15.1
Date: Wed,  4 Jun 2025 16:45:01 +0800
Message-ID: <20250604084524.864-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217871

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index d3bef83306..0c73032923 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
 
-PV = "2.15.0"
-SRCREV = "bfde7f2d04fbb22e26c9eb843e4ccc478762dd8d"
+PV = "2.15.1"
+SRCREV = "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


