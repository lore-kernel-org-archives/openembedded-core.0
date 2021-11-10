Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD11C4332F
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 23:19:11 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3284.1636586350597814791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 15:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=GIRPKJAD;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636586350;
  x=1668122350;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=89ZWI8xWmyrHyHNJvU5HuOB4V5xWLR1DSv6PSahu7P0=;
  b=GIRPKJADDzt7P7fpgbo67egH3T8BDNBa7Ei+wtJvGueQillXLgDm/sHg
   lBR4Oa1dt+HSnDvWAXU8b4TRENNzULga8Bfp21cVcUTsOOCQxSDDJ+9gv
   TLiJxauTcM7crz4pr37EPtGU9ZgGDFeflkmX5xOBm6I8yVqqa8kvBZcrj
   9CkvkKHzrMbBLXQYCf9GZDi5mSgQXA2NmRz5jnF6ce5x8MY8yIUQSDFZF
   izSV8suZ2Gbk1Mp69fEy5825PMQAI3LYjkFyITpmt1rlXYvch/S89GvvQ
   bayc2jTvjtFYkiOI9RKPsvSraEgFn43n9SBrNbcGZvoQoubzChk4Gg4iz
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] slang: Clean up the additions to PREMIRRORS
Date: Thu, 11 Nov 2021 00:18:55 +0100
Message-ID: <20211110231856.5799-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211110231856.5799-1-pkj@axis.com>
References: <20211110231856.5799-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 23:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158119

Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
entries) there is no need to separate the entries in PREMIRRORS with
"\n".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/slang/slang_2.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/slang/slang_2.3.2.bb b/meta/recipes-extended/slang/slang_2.3.2.bb
index 81d152f000..443ca0b5e6 100644
--- a/meta/recipes-extended/slang/slang_2.3.2.bb
+++ b/meta/recipes-extended/slang/slang_2.3.2.bb
@@ -27,7 +27,7 @@ SRC_URI[md5sum] = "c2d5a7aa0246627da490be4e399c87cb"
 SRC_URI[sha256sum] = "fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a"
 
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
-PREMIRRORS:append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
+PREMIRRORS:append = " http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/"
 
 inherit autotools-brokensep ptest
 CLEANBROKEN = "1"

