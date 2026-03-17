Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C6F33815
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:38:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71215.1773736692536503596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 01:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cxozBDWp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67C134E426D0
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 08:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E5A85FC9A;
	Tue, 17 Mar 2026 08:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5BB610450369;
	Tue, 17 Mar 2026 09:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773736688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=i/069HMOpqvXH+2Mrmox73DTM4CCmNmXRpjz/hFgwp0=;
	b=cxozBDWpiv4EJqA5Oxbz5HTBXU4BUF2vQjznRPAYuA5r8SPuNpuvqJvpqp1ZDQcQWydSxN
	pJf310la29vF3ILArCFo+tektgLOs9WCDWt2I1RrZ4zMY1sZEcDpvxpgW1ZtHDGOgBHpM2
	vSDg6mYYPyIvmiipbUZ7IEv5vaS4Oj90WfyAqCLjMACqO5aPs92MZnAqgPQfCIDAMwKxvS
	GUi0WjZZPtFhHuvK75vJHy9udHdDLTZiUHCUlnII+2TcsTkF//LBsgVlOA9gkLUy91kENW
	BqEsSEjwG1yO1AyFtj4wpvvqqXwTs0zsfXqvleCacpldE2M1Fr6w0GVwZN5IYg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 17 Mar 2026 09:38:06 +0100
Subject: [PATCH] python3-sbom-cve-check: Update to release 1.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-update-sbom-cve-check-recipe-v1-1-49b50bf80bf2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqDMBAG0KvIrDsQNf71KtKFjl91EDUkVgTx7
 oYu3+ZdFOAVgd7JRR6HBt3WiPSVkEzdOoJ1iKbMZKXJ04p/buh2cOi3heUAywSZ2UPUgW1TFra
 wNYwIxcJ5fPX89+3nvh9koRfkbgAAAA==
X-Change-ID: 20260317-update-sbom-cve-check-recipe-49654548e0cc
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 08:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233304

Update from release 1.1.0 to 1.2.0. The changelog:
https://github.com/bootlin/sbom-cve-check/blob/v1.2.0/CHANGELOG.md#v120

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
This release addresses a critical issue caused by a recent cvelistV5
CVE entry that does not conform to the expected JSON schema. As a
result, the current version of sbom-cve-check fails with an exception,
as documented in [1].

[1] https://github.com/bootlin/sbom-cve-check/issues/15
---
 ...{python3-sbom-cve-check_1.1.0.bb => python3-sbom-cve-check_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb b/meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
rename to meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb
index 3d1c581e9f86..070e8789713f 100644
--- a/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "953256ac99851ba59bc8649b8023303007ff2981edbc4ee395011bd91c118095"
+SRC_URI[sha256sum] = "0b01474c541fb4b9d29d36f86fae6d0f27ff2b991fcb59b2fbeb70c1eaa09664"
 
 inherit pypi python_hatchling
 

---
base-commit: 2dc4d2f8b5c7a6e87291385fb860436593767199
change-id: 20260317-update-sbom-cve-check-recipe-49654548e0cc

Best regards,
-- 
Benjamin Robin <benjamin.robin@bootlin.com>


