Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.1502.1616613325665952056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 12:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=h5M+WeE6;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616613326;
  x=1648149326;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DFq+Z7+bM5B19mvEEByGIyRvKt5z/IOJq3cuaQ14m24=;
  b=h5M+WeE6QlzAvOxUnS7a70bI3KmAGNzOG2pYBF1CKHL8So5IxpPmZifW
   exDeqbWyNDHoBcJu/b+WK8tXEeC/TTzYNnwiQbZfR1LqK6doVlRol/6Dh
   K0GuXY2zsAm9rWG3doZ7TDTi/RwT1rMglTrjNauMqSs9K1JPWCmWrSZTC
   Ld9Yz2gPg/KqwrguBbWsWbHpJhvthWi0PNP+o8waNwWTPxP5+QIcRhSjZ
   dpFRtSrH7vPze4bVspjHG5fnJoxMpougmHkJz/9VPKTNvcK91EZrb1+Mz
   QM7edTM2mgzX7lJJbucFfASgHgJK7RJmIZTIVFxPztHg/fzJO5ntBm6GI
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] util-linux.inc: Set the correct license for util-linux-libuuid again
Date: Wed, 24 Mar 2021 20:15:08 +0100
Message-ID: <20210324191508.8400-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

LICENSE_${PN}-libuuid was not updated when libuuid was moved to the
util-linux-uuid recipe. Use LICENSE_${BPN}-libuuid instead as BPN is
set to "util-linux" for both util-linux and util-linux-uuid.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4031c586c9..bb93eb67d6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -7,11 +7,11 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
-LICENSE_${PN}-libblkid = "LGPLv2.1+"
-LICENSE_${PN}-libfdisk = "LGPLv2.1+"
-LICENSE_${PN}-libmount = "LGPLv2.1+"
-LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
-LICENSE_${PN}-libuuid = "BSD-3-Clause"
+LICENSE_${BPN}-libblkid = "LGPLv2.1+"
+LICENSE_${BPN}-libfdisk = "LGPLv2.1+"
+LICENSE_${BPN}-libmount = "LGPLv2.1+"
+LICENSE_${BPN}-libsmartcols = "LGPLv2.1+"
+LICENSE_${BPN}-libuuid = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
