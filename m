Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F31108E1C0
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7871.1773915320116014892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pbl/nJtr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915320; x=1805451320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5imqU4n7iqUe5ki2vDkTHNoEgmqlOMug1fh4VEaoec=;
  b=Pbl/nJtrjpbpIh1BaRf+6RaSW8AZjLqjHiWCVviBjOnteN74/4UoarqA
   sf0zKoT7WrYEMkM2zQx8MY2agkPqOrz8VWvr2nOYtFpBGIaoUMaLLbvq8
   h+w9tNDAeiKZOw8flQdB+S0KKWoM4LM/vjwWZOJnAwRY8ZURutynr2qUe
   6Gm6WcHP6/6xeywTh+r1LaFIOkmYJvWFrDlRKWD43thijsiSo8N4iWdGJ
   j7BhC96aB0wWTQwtQ24BWvZjzZwkzUb6T7tGQxx6upjJ7ItZexp3vvLm1
   xyDTsqMqbyXehtoE9yTdkETRFtzzgB1aaB/Dbs5WR2Fogkkjajjer/nQQ
   A==;
X-CSE-ConnectionGUID: WenusicXTG6oT4AVn/y17Q==
X-CSE-MsgGUID: 8rgFvJ+MQ6qwXaN0qFtI2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233848565"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233848565"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:52 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2763E82070C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:53 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D0425849394
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id DE9C4101E529;
	Thu, 19 Mar 2026 10:14:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/40] lsof: upgrade 4.99.5 -> 4.99.6
Date: Thu, 19 Mar 2026 18:13:09 +0800
Message-ID: <20260319101332.2067-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233493

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lsof/{lsof_4.99.5.bb => lsof_4.99.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lsof/{lsof_4.99.5.bb => lsof_4.99.6.bb} (93%)

diff --git a/meta/recipes-extended/lsof/lsof_4.99.5.bb b/meta/recipes-extended/lsof/lsof_4.99.6.bb
similarity index 93%
rename from meta/recipes-extended/lsof/lsof_4.99.5.bb
rename to meta/recipes-extended/lsof/lsof_4.99.6.bb
index 292db224af..853924fd21 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.5.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=${PV} \
            file://remove-host-information.patch"
-SRCREV = "ed0fef9a134b64c9398075185534a76714c91179"
+SRCREV = "b173315c8f94bf61d52094857ea3fe7d0f5aaff9"
 
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


