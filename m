Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27006C55196
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:26:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39441.1785749169841316596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UzkO6SQb;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D5ED1A13C9;
	Mon,  3 Aug 2026 09:26:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 634E06029B;
	Mon,  3 Aug 2026 09:26:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DCAD11C17CFF;
	Mon,  3 Aug 2026 11:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785749166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GOoepF8LEnZEdBt9f5zrdhPEmQ4Z2v8j33t5o+84q24=;
	b=UzkO6SQb9LtaE9/nnK3ITtuCV2JfhBXp+6+iFvrBQnlF5BIWT4dzeJP0l3AGu6ms9QjzEu
	/y0jbC2ZUUf2+aRuHCoMgzkWURlqbxG1N0o1cvnXE/GPZcH8fgStpoDMKVz/0YqZh6QHgE
	4CG0FIxj84UKKoWtkAH/bDwQfA66rKZAQbooPOKTAkVxzRbyv4dSkat1CmNWlCEm5J7DA7
	CwYdhAv+yRBkaoz8e5tyRBq09pUCgI/2Nnh+qotKmX/iTEp9OXyoA5gByOLIv75AqaidPq
	aNUIQMXsGntsnU26s2yBLogR5/RQAp01BLErzvV2l65ooAYYK+vzcj88wtHpxA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH 0/3] sbom-cve-check: Update to version 1.3.3 and update CVE
 databases
Date: Mon, 03 Aug 2026 11:25:56 +0200
Message-Id: <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs3aSQrVeXsW46OVHRiOQDhATw
 rtbNWf1bc5KiixQulQrZSyiMvQF9a6i2Pn+DpZUTI1pnDkZy/OY/ATWMLw4LuDYIT65ZltKZ7s
 /tuHgPByVw5jRyvt3v97+1jk8EKfvkrbtAxvBRAJ/AAAA
X-Change-ID: 20260803-update-sbom-cve-check-1-3-3-d9347fb56ae6
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
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 09:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242638

This series update sbom-cve-check to the latest release.
This release of sbom-cve-check addresses various fixes and improvements
as detailed in the changelog [1]

This series also updates the sbom-cve-check-update-* recipes to fetch
a more recent version of the CVE databases.

[1] https://github.com/bootlin/sbom-cve-check/blob/main/CHANGELOG.md#v133

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (3):
      python3-sbom-cve-check: update to version 1.3.3
      sbom-cve-check-update-cvelist-native: update to version 2026-08-03
      sbom-cve-check-update-nvd-native: update to version 2026.08.03-000011

 ...{python3-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} | 2 +-
 ...2026-07-23.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} | 2 +-
 ...-000007.bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 6a91494f29a1f9da28280bc93771714c4545da46
change-id: 20260803-update-sbom-cve-check-1-3-3-d9347fb56ae6

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


