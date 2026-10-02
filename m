Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D832CCA5FE6
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6196.1790926587602240145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Rsxfjl3T;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4221B1A10D0;
	Fri,  2 Oct 2026 07:36:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 133B1603DC;
	Fri,  2 Oct 2026 07:36:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF4AA1032813A;
	Fri,  2 Oct 2026 09:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qz2zelfKLIT7M4llPf9FE+ZisaDljupEWttjbXkepNE=;
	b=Rsxfjl3TgZqHfrDelOcd5we5VHrHykrBm60JFYRo2+fBFoOuYI0VtgHDrxNH5cJRa9wyYm
	iKiOjARfnDGsn/I4JxSLdxncPeyChY6q7Z0Wqj+Q+6jkNW0+R14hcvNm60LAPJFrWRC/Y9
	M9uWs0w/kRbtF+vtWy4Fo4k8agYHQN71dUfnGhd1TsCHbnwKQrzXSwOfVjjyH41sg0y0rx
	ve81IJsPTmEweVd/mwHUiIu8kEMJfWqGj29KUL1mpowcTSDHWYAkugowCqUSFbnTFXgt+n
	Umxm+2mUCyf5ufiHg7pEMrCOHYelsYZgw+g1g8NMJPAtdxi6r5RTMVfftbZupg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/9] 2026-10-01 upgrades
Date: Fri, 02 Oct 2026 09:36:03 +0200
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONev2oC/x3MSQqAMAxA0atI1gbSiuNVxEVto2bhQKsiiHe3u
 nx/8W8I7IUDNMkNnk8Jsi4RKk3ATmYZGcVFgyZdKCKNs9kn4QO/gIqQFB7b6I3jgC6vXdZbq6u
 +hHjYPA9y/fe2e54XtIy/Hm0AAAA=
X-Change-ID: 20261002-mathieu-2026-10-01-upgrades-d59d3bcc28b7
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Jiaying Song <jiaying.song.cn@windriver.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=1891;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=0yC0Zeqg56QDz+yOzapEnPDNcSV56r8c5n8tTSQEhjg=;
 b=QTkQJ9LyzyTM+jB4rqBIE1A3CJPSaQcMXUJc3DrE+8LdrC5i4SBsHg9aIfFjcKonWgPpi1r4Q
 Zj6bVMuRzQUCku43JeG1Bs4zfgGCq0kE0J6I73xs9jeF9HtJknyB3lv
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247074

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (9):
      python3-uv-build: upgrade 0.12.19 -> 0.12.21
      python3-git: upgrade 3.1.62 -> 3.2.0
      python3-cryptography,python3-cryptography-vectors: upgrade 50.0.1 -> 50.0.2
      python3-pdm-backend: upgrade 2.4.10 -> 2.5.0
      harfbuzz: upgrade 14.5.0 -> 14.5.1
      acpica: upgrade 20260408 -> 20260930
      libmd: upgrade 1.2.0 -> 1.3.0
      spirv-llvm-translator: upgrade 23.1.1 -> 23.1.2
      ltp: upgrade 20260529 -> 20260930

 .../python/python3-cryptography-common.inc         |   2 +-
 .../python/python3-cryptography-crates.inc         |  20 +-
 .../python/python3-cryptography-vectors.bb         |   2 +-
 .../python/python3-cryptography.bb                 |   2 +-
 ...ject.toml-remove-benchmark-disable-option.patch |   6 +-
 ...{python3-git_3.1.62.bb => python3-git_3.2.0.bb} |   2 +-
 ...kend_2.4.10.bb => python3-pdm-backend_2.5.0.bb} |   2 +-
 ...uild_0.12.20.bb => python3-uv-build_0.12.21.bb} |   2 +-
 meta/recipes-extended/acpica/acpica_20260408.bb    |  47 ---
 meta/recipes-extended/acpica/acpica_20260930.bb    | 345 +++++++++++++++++++++
 ...1-Add-__clear_cache-declaration-for-clang.patch |   4 +-
 .../0001-Remove-OOM-tests-from-runtest-mm.patch    |   6 +-
 ...mctl08-Skip-semctl08-when-__USE_TIME64_RE.patch |  10 +-
 .../ltp/{ltp_20260529.bb => ltp_20260930.bb}       |   2 +-
 .../{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb}     |   2 +-
 ...r_23.1.1.bb => spirv-llvm-translator_23.1.2.bb} |   2 +-
 .../libmd/{libmd_1.2.0.bb => libmd_1.3.0.bb}       |   2 +-
 17 files changed, 378 insertions(+), 80 deletions(-)
---
base-commit: 179682d3aa10897da209d29f8bd5fe105630c634
change-id: 20261002-mathieu-2026-10-01-upgrades-d59d3bcc28b7

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


