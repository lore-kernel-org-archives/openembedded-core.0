Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB96C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 23:36:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1510.1685144184597839599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 16:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qjRqEauU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaJfE130369;
	Fri, 26 May 2023 18:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685144179;
	bh=mxlyqJcmOrnMr7PTThVlGy3AUFfTxsuJk4I7zogVA64=;
	h=From:To:CC:Subject:Date;
	b=qjRqEauUNiDhssFhAJNioOnLc/pbEsPyQodta5t5TaySEDosYPQ8iTwnvNiLsS+/y
	 Z59O7Jxb46xKSzzVu9FPZ6WSOfeNjddV9eZW44StVuuOLfSMQpJFx8orrSI8rEJ797
	 Ffr+X8UQJvt5xRkucyhLlD5L+xPPfor8M9JrnJAI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QNaJas002029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 18:36:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 18:36:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 18:36:19 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QNaJ4H013670;
	Fri, 26 May 2023 18:36:19 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][kirkstone][PATCH 0/4] kernel-devicetree: allow specification of dtb directory
Date: Fri, 26 May 2023 18:36:12 -0500
Message-ID: <20230526233616.3623368-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181781

From: Randolph Sapp <rs@ti.com>

Backporting all of the "kernel-devicetree: allow specification of dtb
directory" series and subsequent fixes to kirkstone. This still has the
same backwards compatibility originally advertised. It won't do anything
to the dtb structure unless you tell it to.

Let me know if you want these squashed or anything like that.

Martin Jansa (1):
  kernel-devicetree: make shell scripts posix compliant

Randolph Sapp (3):
  kernel-devicetree: allow specification of dtb directory
  package: enable recursion on file globs
  kernel-devicetree: recursively search for dtbs

 meta/classes/kernel-devicetree.bbclass | 22 +++++++++++++++++-----
 meta/classes/kernel.bbclass            |  2 ++
 meta/classes/package.bbclass           |  2 +-
 3 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.40.1


