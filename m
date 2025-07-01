Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636A7C83F04
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 23:24:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11130.1751412287230611951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 16:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qQROMvzi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751412287; x=1782948287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T8SfCAn7fajwzD5U/AJghB0MzStNhFtfj4vXAULlfQ4=;
  b=qQROMvziap/YPMTgXj0bqNG3oF5qQrvXaukLX00ZdhAYbTd9Uqj/5fBb
   NC2XwKQeOx0R2A8xaufq8iyIcGRDTct2krZ9NA4/8k11lAbSNwkGlmgcj
   K2U5sCWABKmob++S0GOft5FP1V2kaFWclzpw62VvInvulY3mAoANCgubY
   iVgH96ZwnjERg8Kb3z3z3ZF56CdhKu14HXzUfphUN1DjeiyKkChSroTU9
   nuM6cr3wLDuIKL5U6Rhm5A/777TEqBfU+3QeqfokOct7qvBKY7WVqfEiG
   of/0+o0aNSz8kl9GQzfcbQiwITtkUZ+gGY02PVomiSyEt1my2PomAhV16
   Q==;
X-CSE-ConnectionGUID: NpjYNwtuT2Wlg2xlnQzJRA==
X-CSE-MsgGUID: adRpW6UiQPaXKAwSOzV+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="205389147"
X-IronPort-AV: E=Sophos;i="6.16,280,1744038000"; 
   d="scan'208";a="205389147"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:45 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8145E144C
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:45 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id F32C518009E4
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 61473D4F40
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Jul 2025 08:24:43 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E30751A0073;
	Wed,  2 Jul 2025 07:24:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/7] libmodulemd: upgrade 2.15.1 -> 2.15.2
Date: Wed,  2 Jul 2025 07:24:34 +0800
Message-ID: <20250701232440.474-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250701232440.474-1-wangmy@fujitsu.com>
References: <20250701232440.474-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219738

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes:
-----------
module_index test now passes if RPM library is built without bzip2 or xz
compression support and libmodulemd is configured to support decompression
using the RPM library.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmodulemd_2.15.1.bb => libmodulemd_2.15.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.1.bb => libmodulemd_2.15.2.bb} (90%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
similarity index 90%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
index 6504414387..32d2a39c41 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
@@ -4,9 +4,9 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
-SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
+SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
+SRCREV = "b8b11b4dafaa2c4d73883152bfa7e5bd81cd7395"
 
 inherit meson gobject-introspection pkgconfig manpages
 
-- 
2.43.0


