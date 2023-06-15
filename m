Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A4EEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 21:04:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.29883.1686863068353992605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 14:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sbyLlmvW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4Pjo123050;
	Thu, 15 Jun 2023 16:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686863065;
	bh=GoTxEjsQZs2stlUp6ahyqGXdn5OIaqq2WX4QfFJ6BLs=;
	h=From:To:CC:Subject:Date;
	b=sbyLlmvWPi3KVPaKrNlkQwK0JXD0ZaW9zwQ4c39TVyBbRU0SDEYQNaVbbm1K1sf9z
	 glfKj4INcYa/60PnRx833YwNGjS7BRjAHFMWHsOQuLe0Ql756ntyl39OLa3KecrxTK
	 YuiG/4eH6Pl0tz2f+k6eis0kBb49bS+grzH7Kzm8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FL4PoI016332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 16:04:25 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 16:04:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 16:04:25 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4PsU024205;
	Thu, 15 Jun 2023 16:04:25 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: <s-adivi@ti.com>, <c-shilwant@ti.com>, Randolph Sapp <rs@ti.com>
Subject: [OE-Core][kirkstone][PATCH 0/8] Backport all weston-init qol updates
Date: Thu, 15 Jun 2023 16:04:12 -0500
Message-ID: <20230615210420.725559-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 21:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182876

From: Randolph Sapp <rs@ti.com>

Backport all the weston-init QOL updates. Getting closer to the point
where we can actually drop our distro specific weston-init bbappend. May
submit a few more QOL patches sooner or later to completely drop it.

Ming Liu (1):
  weston-init: introduce xwayland PACKAGECONFIG

Randolph Sapp (6):
  weston-init: make sure the render group exists
  weston-init: add weston user to the render group
  weston-init: add the weston user to the wayland group
  weston-init: fix the mixed indentation
  weston-init: guard against systemd configs
  weston-init: add profile to point users to global socket

ssuesens (1):
  weston.init: enabled xwayland

 meta/recipes-graphics/wayland/weston-init.bb  | 53 ++++++++++++-------
 .../wayland/weston-init/weston-socket.sh      | 20 +++++++
 2 files changed, 53 insertions(+), 20 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh

-- 
2.41.0


