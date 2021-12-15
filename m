Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFB9C433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 15:21:54 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.41722.1639581647889814166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 07:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=iu4EbqcY;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639581648;
  x=1671117648;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Yham4szoOlXerpuasbujc34fst9UTYA1KyaB4y4LZDM=;
  b=iu4EbqcYgftECrR+eJypGnJbmowh4nfLcuPNxSWjC9NWndcPcfdGRVo8
   qjV/z3npMwUyvx+pGVFiAP1AS7SRbhhPiZM3rZCqcQF/lfVsKrxyTVmkH
   NSnqdsrxSGYdGlsYsO5yC/xHv/PHl0PmL9fpMaDY6pKJwZOzkimAcT5tf
   YfwTIWLCgxs/cpvM+mZPYWf/gAnyRPMZjm2GDpql2vvdIHZJeImATUGV9
   hy+SNhQSyhP+6ETHaQ63+Wg8AaTzaRF70sMJqtGUlud2qjuqDUtSlHC3i
   no3yF8Qg1Oh9IxYobigIfCuXKFrxqSwUmLEHCsOAnZHktK1izscztsB2k
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] tzdata: Remove unnecessary RPROVIDES
Date: Wed, 15 Dec 2021 16:20:40 +0100
Message-ID: <20211215152041.21726-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211215152041.21726-1-pkj@axis.com>
References: <20211215152041.21726-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 15:21:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159729

The name of the package is provided automatically.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 09cb14a855..64135ef8aa 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -89,7 +89,6 @@ TZ_PACKAGES = " \
 PACKAGES = "${TZ_PACKAGES} ${PN}"
 
 FILES:tzdata-africa += "${datadir}/zoneinfo/Africa/*"
-RPROVIDES:tzdata-africa = "tzdata-africa"
 
 FILES:tzdata-americas += "${datadir}/zoneinfo/America/*  \
                 ${datadir}/zoneinfo/US/*                \
@@ -97,36 +96,26 @@ FILES:tzdata-americas += "${datadir}/zoneinfo/America/*  \
                 ${datadir}/zoneinfo/Canada/*            \
                 ${datadir}/zoneinfo/Mexico/*            \
                 ${datadir}/zoneinfo/Chile/*"
-RPROVIDES:tzdata-americas = "tzdata-americas"
 
 FILES:tzdata-antarctica += "${datadir}/zoneinfo/Antarctica/*"
-RPROVIDES:tzdata-antarctica = "tzdata-antarctica"
 
 FILES:tzdata-arctic += "${datadir}/zoneinfo/Arctic/*"
-RPROVIDES:tzdata-arctic = "tzdata-arctic"
 
 FILES:tzdata-asia += "${datadir}/zoneinfo/Asia/*        \
                 ${datadir}/zoneinfo/Indian/*            \
                 ${datadir}/zoneinfo/Mideast/*"
-RPROVIDES:tzdata-asia = "tzdata-asia"
 
 FILES:tzdata-atlantic += "${datadir}/zoneinfo/Atlantic/*"
-RPROVIDES:tzdata-atlantic = "tzdata-atlantic"
 
 FILES:tzdata-australia += "${datadir}/zoneinfo/Australia/*"
-RPROVIDES:tzdata-australia = "tzdata-australia"
 
 FILES:tzdata-europe += "${datadir}/zoneinfo/Europe/*"
-RPROVIDES:tzdata-europe = "tzdata-europe"
 
 FILES:tzdata-pacific += "${datadir}/zoneinfo/Pacific/*"
-RPROVIDES:tzdata-pacific = "tzdata-pacific"
 
 FILES:tzdata-posix += "${datadir}/zoneinfo/posix/*"
-RPROVIDES:tzdata-posix = "tzdata-posix"
 
 FILES:tzdata-right += "${datadir}/zoneinfo/right/*"
-RPROVIDES:tzdata-right = "tzdata-right"
 
 FILES:tzdata-misc += "${datadir}/zoneinfo/Cuba           \
                 ${datadir}/zoneinfo/Egypt                \
@@ -146,7 +135,6 @@ FILES:tzdata-misc += "${datadir}/zoneinfo/Cuba           \
                 ${datadir}/zoneinfo/Portugal             \
                 ${datadir}/zoneinfo/Singapore            \
                 ${datadir}/zoneinfo/Turkey"
-RPROVIDES:tzdata-misc = "tzdata-misc"
 
 FILES:tzdata-core += " \
                 ${sysconfdir}/localtime                  \

