Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42363C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 18:57:44 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.9948.1636138661649691022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 11:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MsnLzHs0;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636138663;
  x=1667674663;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1SY9VZjiELhESy/Sc19y+l5J4UFYee9vJfHFnqnrT+E=;
  b=MsnLzHs0qehCOK54trxotWFyoWpYOjUTGsyTaWmFMc2IkVMZFKbb5k3P
   iNAiPSM0d9lwF2DhzccNb7gXmR8IakPXQJlmD9CK4S2MYxJA2qnqBPp/3
   NevbTXItkK8cO/YFKAcmi6EHsmWHZtrLTICvyY4CYbEnYidmw+NIC5uPG
   JI11BuKbCxK1LYA+bu3uxe1R74VZ+ppkcopPCMXi/NmOyj7aon492C9wt
   hhsx7IJsODG7Qf4ATXNS1B5+1YfI8DgdBg8twApfdFG9Dz+w66G+hUgOC
   vMJJxFqgae/vCFxvCHtR7bYv+QSkLVyHl6k5IIClq6GzAV/5sU3+/mWUS
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] libx11-compose-data: Update LICENSE to better reflect
 reality
Date: Fri, 5 Nov 2021 19:57:37 +0100
Message-ID: <20211105185737.8814-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211105185737.8814-1-pkj@axis.com>
References: <20211105185737.8814-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 18:57:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157926

There are no traces of neither the BSD-2-Clause license nor the
BSD-4-Clause license being used in the code. There is one occurrence
of the BSD-1-Clause license. On the other hand, HPND and
HPND-sell-variant are all over the place.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
index e53ccc6aea..796980b7ca 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
@@ -8,7 +8,7 @@ python () {
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+LICENSE = "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"

