Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6194CC433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 18:57:43 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.9948.1636138661649691022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 11:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=apHkNlBK;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636138661;
  x=1667674661;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C8O1tD6FXiTsOBljG5h7xHdp8D7mcff2BgvYySUFgIg=;
  b=apHkNlBK18v8KRQ4LjZzhAjFGHTm9AfT3ZSkLVrfvYVDvWEW+dnEtaBr
   ph0aVWmecP7iKjhS5mUg93Zyf2GsBBa+R2MrBHqn5lb3oGs1TmgTlh1eC
   7EJyhAKgnjgrxeBYWNsF+foqxNrpy62Nkgf7UUuQYbWbZdNkwNt1Lvsm5
   s+rK9ZVrJWnUMRV2lGKxXmQewa0tCVb4UphdkqbnwXp05YLEpBbZiRgo/
   GmYq6vzfpFvn9eO8IqpDYkz0xvFI3SEGQo9O9a3l+WMkjm9xKxXhM/szV
   OvfBtZovlFfdtEIBthGvPv+PSzFvA8hRgDVjhWEM+CCkNMFeYZ9QRGirQ
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] libx11: Update LICENSE to better reflect reality
Date: Fri, 5 Nov 2021 19:57:36 +0100
Message-ID: <20211105185737.8814-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 18:57:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157925

There are no traces of neither the BSD-2-Clause license nor the
BSD-4-Clause license being used in the code. There is one occurrence
of the BSD-1-Clause license. On the other hand, HPND and
HPND-sell-variant are all over the place.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
index 7ee2a9c16a..f429daaf47 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c30
 PROVIDES = "virtual/libx11"
 
 XORG_PN = "libX11"
-LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+LICENSE = "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 DEPENDS += "xorgproto xtrans libxcb"

