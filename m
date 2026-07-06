Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012D5C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:45:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147378.1783334714183162621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=A0tmV3rw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DCF391A0E82;
	Mon,  6 Jul 2026 10:45:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB8D0601A2;
	Mon,  6 Jul 2026 10:45:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A220E11BBA0A3;
	Mon,  6 Jul 2026 12:45:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783334711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RFMmUKishWFWqSeVa5j7/6/vkjeQCmFyK6lla5fyuBg=;
	b=A0tmV3rwUT9UiwiED8zQLI2knoQAhm/cle1q5fYev8/BUfN23ghoJq586H/+XkQyRwCTXr
	Q271iM4jOx9XGQxPo9S2SB1r2VUbijoEQDV1bRsvYpw0ZvYC4uxIgoNVdtvkEuh+PDN2Ml
	zZchAaWvzQOLU7Ol1SS6vS6Lvlzc2FRPlfaKH8q5ORw9DrpKU9Oatzc8pZmJ9QvPDa8fe2
	feSo1N0tM8NZk7BAjthz0fB1lEufupxrKzm9jx3B/Km/kz1596Si5teFhD94YK95WU8LGL
	ZcsOvbOt7xwov9Dlg//b3+VTtUk3SemKHuEjF5AAO0Am7Wetuk260KfgGp82yw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH 0/2] python3: fix CVE-2026-11940 and CVE-2026-11972
Date: Mon, 06 Jul 2026 12:45:05 +0200
Message-Id: <20260706-fix-cves-python-master-v1-0-9a2a86be5bfd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDsQrah4FekiHcc6hUbJxKCId
 zfa5Qfv/Tsoe2GFNtvBcxSVySXkjwxotO7DKH0yFKaoTG0qHGRFiqw4b2GcHP6sBvbYlPXwpL6
 kvLGQzrPntLzD3etvXd5fpnDV4DhOdxyZDHoAAAA=
X-Change-ID: 20260706-fix-cves-python-master-847f3cd4c18a
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240242

This series fixes the following CVEs:
 - CVE-2026-11940
 - CVE-2026-11972

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (2):
      python3: fix CVE-2026-11940
      python3: fix CVE-2026-11972

 .../python/python3/CVE-2026-11940.patch            | 67 ++++++++++++++++++++++
 .../python/python3/CVE-2026-11972.patch            | 59 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.14.6.bb     |  2 +
 3 files changed, 128 insertions(+)
---
base-commit: 832bfebbc5651dcdb36508d584be2eac076e3dde
change-id: 20260706-fix-cves-python-master-847f3cd4c18a

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


