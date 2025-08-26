Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C03CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 16:31:27 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.69555.1756225877760965015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 09:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BootVWlr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250826163115573098974a00020711-ft3apd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250826163115573098974a00020711
        for <openembedded-core@lists.openembedded.org>;
        Tue, 26 Aug 2025 18:31:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NGfqA/O4LxINf8K7OPf/6q0uOHqyJzTBXQ05dU4IXkc=;
 b=BootVWlril7WJ+P6D5iJek9pvCU/NJYfF18Aye3WambUkBDICBjscfkwsDcHdILeUMS4cl
 6Q+buRIntFm/JvqnFP1iZnVrXwmOpFAZViNyqDI/sItq6Z2kYypYDxzkehJeFQ4azTSYW/HP
 fZShPzW4DP8wFa5IKvuvk5toPvgmhmNh6NNgPe64p/AGUW7EFFhA6RAC6zb7okCsrztQqXno
 f61NWH2XPDwsBAbL2/eyrQ6DZCe9ro4iTCjLgPW2+PvAAP2Ck13SdRsH88GY+3LS2NgcVCIb
 jJZ1r3HD8sD1JBUdLDafktqk02NeDbs1JmbMHmlAJX6dM/BZFKPT33gw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] sudo: remove devtool FIXME comment
Date: Tue, 26 Aug 2025 18:30:29 +0200
Message-Id: <20250826163029.16303-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 16:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222474

From: Peter Marko <peter.marko@siemens.com>

This comment should not have been merged.
It shows that the license did not change.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/sudo/sudo_1.9.17p1.bb | 52 ---------------------
 1 file changed, 52 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index c5d57da9f0..5b9d73b33b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -1,55 +1,3 @@
-# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
-# The following is the difference between the old and the new license text.
-# Please update the LICENSE value if needed, and summarize the changes in
-# the commit message via 'License-Update:' tag.
-# (example: 'License-Update: copyright years updated.')
-#
-# The changes:
-#
-# --- LICENSE.md
-# +++ LICENSE.md
-# @@ -1,6 +1,6 @@
-#  Sudo is distributed under the following license:
-#
-# -    Copyright (c) 1994-1996, 1998-2023
-# +    Copyright (c) 1994-1996, 1998-2025
-#          Todd C. Miller <Todd.Miller@sudo.ws>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -247,9 +247,9 @@
-#
-#  The file arc4random.c bears the following license:
-#
-# -    Copyright (c) 1996, David Mazieres <dm@uun.org>
-# -    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
-# -    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
-# +    Copyright (c) 1996, David Mazieres <dm@uun.org>
-# +    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
-# +    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
-#      Copyright (c) 2014, Theo de Raadt <deraadt@openbsd.org>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -282,7 +282,7 @@
-#
-#  The file getentropy.c bears the following license:
-#
-# -    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
-# +    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
-#      Copyright (c) 2014 Bob Beck <beck@obtuse.com>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -299,7 +299,7 @@
-#
-#  The embedded copy of zlib bears the following license:
-#
-# -    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
-# +    Copyright (C) 1995-2024 Jean-loup Gailly and Mark Adler
-#
-#      This software is provided 'as-is', without any express or implied
-#      warranty.  In no event will the authors be held liable for any damages
-#
-#
-
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \

