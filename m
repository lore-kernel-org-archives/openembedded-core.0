Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0C8CE7A9D
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 20:41:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.20053.1725568878473206347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 13:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VOd20YOh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 485KfHXx023188
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Sep 2024 15:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725568877;
	bh=M359O821aIdPs3gY/fz/wqpsfI08Sn4XkinbsBB1sMk=;
	h=From:To:Subject:Date;
	b=VOd20YOhCnEa3mn0jwuT5DOJnrbmEIw7TF5xtaf+lN33mkGwolVFhFNrLQ3bSfwkn
	 F/R7UKxaG6To0fUPsxBA6tadDj7PAlXP8LIfuqNGTbYNMQuprCm/F0tGLJe2/I/jqW
	 hKnnAVRGnxHmM6ZVqW3Dn8hfwHKC8ZPXJueV1G4s=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 485KfHOR053705
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Sep 2024 15:41:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Sep 2024 15:41:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Sep 2024 15:41:16 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 485KfHV8113835
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Sep 2024 15:41:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1smJI4-0002zA-Sz
	for openembedded-core@lists.openembedded.org; Thu, 05 Sep 2024 15:41:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] oe-setup-build: Fix typo
Date: Thu, 5 Sep 2024 15:41:16 -0500
Message-ID: <20240905204116.11436-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 20:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204244

A variable was mistyped in an error message resulting in this error:

NameError: name 'tempalte_name' is not defined. Did you mean: 'template_name'?

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index c0476992a2..1cb06b3b79 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -77,7 +77,7 @@ def find_template(template_name, templates):
         for t in templates:
             if t["templatename"] == template_name:
                 return t
-        print("Configuration {} is not one of {}, please try again.".format(tempalte_name, [t["templatename"] for t in templates]))
+        print("Configuration {} is not one of {}, please try again.".format(template_name, [t["templatename"] for t in templates]))
         return None
 
 def setup_build_env(args):
-- 
2.17.1


