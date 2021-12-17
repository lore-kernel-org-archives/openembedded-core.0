Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A6BC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:16:43 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.1342.1639707387944769855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dD1CgUMV;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639707389;
  x=1671243389;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qrnJ3ZjCGgm9J2ajqN4YBqCUBgaLr2g7vLm/My37tdU=;
  b=dD1CgUMVia6CGbYUTbivZSM1m/dkroTMHNsIo9BPsOt2/xz4/cs6oHQS
   pSe8z5X9ATFeWwwnopRQETLaPvRlGY52Mdw3fChA5e4SWKBDhleRCXxlf
   J7h7gyqmOZlGEwTzCt3TIjzzXHtr9cIdjBqDzn7q4zHQrJMc1dJ/gBcAm
   db6H+d7z72V8jutqLGmZ38DkTfHkNm0aIdvMX23mN6srsjNVNMQtQhOvd
   19BV+nLt1kqln8JLhQgPxyumCi7mh137f8+qIWyoSDaSWXWn1CRbzbUpw
   VDJtdxpPFygB901IbXK48jFtANmtxRGoog9lJ7TaHE/awAZrCOUlwCkV4
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/3] tzdata: Remove unnecessary RPROVIDES
Date: Fri, 17 Dec 2021 03:16:17 +0100
Message-ID: <20211217021618.30887-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211217021618.30887-1-pkj@axis.com>
References: <20211217021618.30887-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 02:16:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159815

The name of the package is provided automatically.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 
PATCHv2: No changes.

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

