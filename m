Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C748C71136
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q2iXOTrn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026741; x=1780562741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wRkoieCO/dm6MfVv7OuYohffS+AtU7PAst93w/sl9t4=;
  b=Q2iXOTrni4nSGS+A5ET+u9lA3BVf9fddSDucKD73kPEMsRFN1SCTnYzF
   k9XY5+E1G72dxRHMcGU7hShgb0FOcpvItpOSyXQNbX2uUbzfzqwC726u+
   1ROi1mWPkRa7ml3D6uvZ1V8p/j8DvsSdDPFWQJhbJhlxojWj6U9J4fVoA
   J5oQgyH+oAsYUkTQd1acIOc0gAXQx0Hbg6Tg/MYWErGk6rKC+4RzYutob
   5d0yXm7BJg1yw9JGTEHHv4K2zpezVagGN6Z33etjVC1KOIuGEg7DBiBVW
   SYG0FdrhxJLyhypVdrG2FebsrhwQqvHgDvmcrs9fjwOZYSbyMFfNfUS90
   g==;
X-CSE-ConnectionGUID: C6ShVumIS5mzX5x7VcR7Jw==
X-CSE-MsgGUID: HnY1DGGkRUK3ZMKBL2E/SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182744"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182744"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 381507C0FD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6949BF3C1
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:36 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 64D151A0078;
	Wed,  4 Jun 2025 16:45:36 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/45] libslirp: upgrade 4.9.0 -> 4.9.1
Date: Wed,  4 Jun 2025 16:45:02 +0800
Message-ID: <20250604084524.864-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217870

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../slirp/{libslirp_4.9.0.bb => libslirp_4.9.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.0.bb => libslirp_4.9.1.bb} (91%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
similarity index 91%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.0.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
index a159ed7c67..568bac389f 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "c32a8a1ccaae8490142e67e078336a95c5ffc956"
+SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


