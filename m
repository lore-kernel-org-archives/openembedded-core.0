Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB477CD4F25
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 20:00:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6159.1778702415283351804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 13:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R+x3lIAT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DF91EC5DC5C;
	Wed, 13 May 2026 20:01:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E2625FE21;
	Wed, 13 May 2026 20:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F6BF11AF8001;
	Wed, 13 May 2026 22:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778702412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=U7LPgl8P6qpgfnzdkraQeunAgHJfyj551dBox62EyUs=;
	b=R+x3lIATqiMBdcYgg78tc4uNby/gNl1tarCPsFJYkYSuLEx98seTXtUpk3bv8erZ6hl74v
	alc6LVq/PWuVKNImviYyvf/xyf2SqcFdv1UfWc6L0zTW2o7aFqr1W3i9t/YSclyj6TsaDF
	UUbW/q9JNWJuaRqwSaPXk0OlOeOiV0zjxkCirO9wVuS2QJrKsgnkHpJyf/k+jB7o6x+7qz
	j3iw/kCbWRZwpKAr50Tj5twkjkO2k2r1o1/sI0oBBEl+ZDYe9/ET4sdj45tAyMmXX14571
	nCzJCGSWla7nNjQLuGw1cGCFUKuWuDvP5jto5KTDWtIkTMAq911XSspcpf8K0w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [wrynose][PATCH v2 0/3] sbom-cve-check: Update to version 1.3.1
 and update CVE databases
Date: Wed, 13 May 2026 22:00:04 +0200
Message-Id: <20260513-update-sbom-cve-check-wrynose-v2-0-94d0e353dc6c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw6CMBRFt0I69pl+FD8j90EYQHnKU2lJW6qEs
 HcLugCHJ7n33Dsxj47Qs3M2MYeRPFmTQG4yptvK3BCoScwklznfCwVD31QBwde2Ax0RdIv6AS8
 3GusRVFOp/Mi1UFyy5OgdXum9+ovyy36o76jDIi1+tXKJtuSDdeP6JIql8O9oFMABc0zLJyXlY
 XeprQ1PMlttO1bO8/wBdgO9b+cAAAA=
X-Change-ID: 20260513-update-sbom-cve-check-wrynose-3da3680c1302
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 20:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237006

This (backport) series updates:
 - sbom-cve-check to version 1.3.1, which mainly fix a dead lock that may
   occur when multiple instances of sbom-cve-check are run in parallel.
 - sbom-cve-check-update-* recipes to a recent revision

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Changes in v2:
- Note to myself: Never send a series this late, otherwise mistakes will be
  made, sorry about that.
- Fix commits refs in "cherry picked from commit" commit message.
- Link to v1: https://patch.msgid.link/20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com

---
Benjamin Robin (Schneider Electric) (3):
      python3-sbom-cve-check: Update to version 1.3.1
      sbom-cve-check-update-cvelist-native: Update source revision
      sbom-cve-check-update-nvd-native: Update source revision

 ...ython3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} | 4 ++--
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 4 ++--
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb                | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 080e184ad9a07b469da7e8b045a93cefd5bf2438
change-id: 20260513-update-sbom-cve-check-wrynose-3da3680c1302

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


