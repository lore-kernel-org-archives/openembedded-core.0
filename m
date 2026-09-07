Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9FBC79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 12:12:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33554.1788783120247681181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 05:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qu8s5u2u;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 027531A1A30;
	Mon,  7 Sep 2026 12:11:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C330660383;
	Mon,  7 Sep 2026 12:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD4E811C7A21B;
	Mon,  7 Sep 2026 14:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788783116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Fs9sOWI/nfdLBhXUmmkKLF/um4xbTNzN2n/LZEy+XrM=;
	b=Qu8s5u2uSJEtTbVPG5EVe3deYM0+EkQxSMoxElnUEkmtBhBAD+ufs74RRaNfb4q+6Bnf9N
	mxNIwKeizuO4NEsh/hhc+Fg3umRjlvdD7L59i4PTyrkOttnUtiX+X1mZsJAgH923Z7ALrZ
	DYt7Xo/YURd6QNuBXIx3sDDKIDeRVS7DuZdCuOytkbcFr9ONTmD9KqvMUOe/sJzrAMnQCI
	TCpp5CBB0R3mVlbSf6cp/03f5hzmUNC10zXOND/2OW9HICqFcLayLRJYogqzzmjxg6s8AG
	gj/rF6ZHYqgLtBTEJ0BMDkI5ec0/WMfC4uKdt18sJ8lMD6+teXH1Bpp9ZI4nAw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH 0/2] sbom-cve-check: Update to version 1.3.4 and enable
 offline mode
Date: Mon, 07 Sep 2026 14:11:53 +0200
Message-Id: <20260907-sbom-cve-check-update-1-3-4-v1-0-93034b6bd44c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBAG0KuQWTtJi794FeKiTD9kNALpADEh3
 N2qy7d5KxmSwuharJSwqOnQZ/hdQdKF/g7WmE2lK0+ucme2ZnixLGDpIE+exxgmsOc9HzgcJV4
 8UEkbKQ9jQqvv317f/ra5eUCmb0nb9gHkQbV1fwAAAA==
X-Change-ID: 20260907-sbom-cve-check-update-1-3-4-a5cd81ee9cfd
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com, 
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 12:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245250

This series update sbom-cve-check to the latest release.
This release of sbom-cve-check addresses various fixes and improvements
as detailed in the changelog [1]

This series also enable the new offline mode in the the sbom-cve-check
class.

[1] https://github.com/bootlin/sbom-cve-check/blob/main/CHANGELOG.md#v134

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (2):
      python3-sbom-cve-check: update to version 1.3.4
      sbom-cve-check: enable offline mode

 meta/classes/sbom-cve-check-common.bbclass                              | 1 +
 ...{python3-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 47021aa89adb81c822e8ec37f17266197914f6b8
change-id: 20260907-sbom-cve-check-update-1-3-4-a5cd81ee9cfd

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


