Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE43F99C9C
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 15:31:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85415.1776871893671388454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 08:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Zrl4/4Zc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 25CDD4E42AB2;
	Wed, 22 Apr 2026 15:31:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D24815FA8F;
	Wed, 22 Apr 2026 15:31:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A42F910460BF0;
	Wed, 22 Apr 2026 17:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776871889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JdE++zNwHWIvD4DfIyUQVGAjIov7OZRzk5spSWi+hB4=;
	b=Zrl4/4ZcHHynYAB45Nb5W7z+ow94XY0OAAD1XIjjVw21dQCzAf36LJd+JWahztiybP3Yb/
	C1d5RoppS40il71VYxAtiFXUzE5SHTFf5Z2FVlCNVcKk80Ex5SddWD2eGy6cfgPlB64gn3
	/Jh0VceiWZ2oTO8sjj++1Yol0BF4Bmw390ZEqsenoe6yWiygd3hOwU4ELOlsCNtKL0ewS7
	nnh10sgizxKunaRkXAhshTzKNqb1tb26vXSLYbxU3EcjtQaFyrrd8/T2O/O/4D5F3+0Mbg
	0JPUyLtg3f3cyNNswUjctzS5vdj1zZmYooEsVlOIMsDGp51q6+T0QidZafAsrw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH 0/3] sbom-cve-check: Update to version 1.3.0
Date: Wed, 22 Apr 2026 17:31:25 +0200
Message-Id: <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAxG4auUrA3UIEW8iriYSX7tKE6HSVsKp
 Xe36vLbvLeSoyY4XZqVKubkacg7joeGtA/5AU62m6SVrj2J8FQsjGCPw5t1BmsPfXHIxoaCbM4
 xiqrFcwcI7Z1ScU/L73G9/e1TfELHb5i27QP+hW4PhQAAAA==
X-Change-ID: 20260422-update-sbom-cve-check-and-depends-bb2ccdb86ee2
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 15:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235732

This series update sbom-cve-check to the latest release, and updates its
dependencies:
 - python3-spdx-python-model
 - python3-shacl2code

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Benjamin Robin (3):
      python3-shacl2code: Update to version 1.0.1
      python3-spdx-python-model: Update to version 0.0.5
      python3-sbom-cve-check: Update to version 1.3.0

 ...2code_0.0.24.bb => python3-shacl2code_1.0.1.bb} |  2 +-
 ...enerate-bindings-allow-to-use-local-files.patch | 58 ----------------------
 ...0.0.4.bb => python3-spdx-python-model_0.0.5.bb} |  3 +-
 ...o-use-correct-type-for-the-version-attrib.patch | 31 ------------
 ...ck_1.2.0.bb => python3-sbom-cve-check_1.3.0.bb} |  4 +-
 5 files changed, 3 insertions(+), 95 deletions(-)
---
base-commit: 9a83f0878b6bacbc7b322cfec076b4e79ad7b8fb
change-id: 20260422-update-sbom-cve-check-and-depends-bb2ccdb86ee2

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


