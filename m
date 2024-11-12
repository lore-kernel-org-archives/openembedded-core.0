Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C04D32D60
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.82732.1731403532211576234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EFSsOYbT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403532; x=1762939532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KiGU23nt2n2KhAJLXgZzx/gb4ihImaFLYPm1BM+bwW4=;
  b=EFSsOYbTk3RtiPQrV5AkHU/HAtdJMnJKGfFoMAcGYVf9ydXq/syP2nT4
   cvytNlOs9+Q7lwKC1WxbK2u/w3ZtCVXipwE91Dn+yGLNTVINJfu4Kx3Vz
   m8sICDElKF9Gv1FvAo+0scYuh1kBplmN1MDDivtlN6zBdFhawTFYQHV3D
   0INigdFkZIdEDKRbjC9R+j0gcuUqKI6DIN6gqtL+uMyJavFDgsig/LfND
   9zYWW2WbggWDpe41iEVmFZBfOshpDerT4eVwVheszypJi19k5KgAZjKRI
   3Ydo1SFAnvslb/9m6JM5XHEv0OX5WHZmLc3f7ock1cmgDbVxwjWhvPEia
   g==;
X-CSE-ConnectionGUID: GtK/bjI3RNyRajnKLiOUaw==
X-CSE-MsgGUID: ihrdUw8GSxmK4DRhQa3goQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="167418233"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="167418233"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E2EA5D29F1
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 81272E6B7D
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1290720071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B69C71A000A;
	Tue, 12 Nov 2024 17:25:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/47] log4cplus: upgrade 2.1.1 -> 2.1.2
Date: Tue, 12 Nov 2024 17:24:18 +0800
Message-Id: <1731403483-21399-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-2.112700-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrXxvRQPGJz0MDLr9vPVWwiJhD
	mI9zl/n3oObDNOzV344CZJWXHKtC9juZPz8QQL7+uLt50vtxBA6ysgEcy57Z3JTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprfOd2ImQcUyEL5Ryh+WbiceV7V
	ueZm2O7GUVI5FRUTheMMTKx8t4Se4fE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDoxf2
	AUz51FjpC5TuYJENyZcFij7VAflOk5IQ8MicaZC19K9Pwx9VAfv0uTN9TkMe/PR/BAqrMVNgR8q
	71rfOt+GnzSVqqyymIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207009

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Implement 'LOG4CPLUS_ASSERT_FMT()' - formats assertion message using C-style
  format string.
- Implement 'LOG4CPLUS_ASSERT_FORMAT()' - formats assertion message using
  C++20 '<format>' header facilities.
- New configuration property: 'log4cplus.threadPoolBlockOnFull'. When this
  property is 'true' (default), threads will block when internal thread pool
  queue is full.
- Warn about full internal thread pool queue when dropping events due to
  'log4cplus.threadPoolBlockOnFull' being 'false'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../log4cplus/{log4cplus_2.1.1.bb => log4cplus_2.1.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.1.1.bb => log4cplus_2.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
index be3c787ab2..9a3c31e887 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "42dc435928917fd2f847046c4a0c6086b2af23664d198c7fc1b982c0bfe600c1"
+SRC_URI[sha256sum] = "e2673815ea34886f29b2213fff19cc1a6707a7e65099927a19ea49b4eb018822"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.34.1


