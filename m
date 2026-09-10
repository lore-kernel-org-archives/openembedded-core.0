Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A608AC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11270.1789038250867925167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bCCrKLzL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 86E501A1A97;
	Thu, 10 Sep 2026 11:04:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54C64602B8;
	Thu, 10 Sep 2026 11:04:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC15011C78AEE;
	Thu, 10 Sep 2026 13:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789038243; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tjs9pUGjMacOYc3DH/+p9vCfe9V6GgdwGtb2KHHUV5Y=;
	b=bCCrKLzLwIKhQVNGJqigvUjy6rUOm3KYb0c/jd9kQtd/4kYbMiCbiAgaFJbdGe2HfFyh+D
	xu736i9rllXW0viS2zFedlPY6GllER0L2UeszWc1R1n3VUltxykshLXwIriKqnlKs0577/
	jieITgPlqSRcG8JG99TEW0ZXlxmkvVUjgVRMEt74FTqnSz3wrpcomMaEir8jSWPmVgaLXK
	JH6avOpYyE8HhS4olkMVxlCpxuDvIXROaK3L64QiSZCudgKD5atzQrZSR7n+M62NyyvZWX
	GNSjVeYT2VaoDQ9aEIzhdsChtbM+oqRioQCmfvJTj7bVVjmwexGlw64NUAbT1w==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/7] Upgrades of 2026-09-10
Date: Thu, 10 Sep 2026 13:03:53 +0200
Message-Id: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqOomoC/x3MSQqAMAxA0atI1gbiVKlXERfBRs3CgVZFEO9ud
 fl58G8I4lUCNMkNXk4Nui4xsjSBfuJlFFQXG3LKDdmMcOZ9Ujnw2BzvEvADJIuRuLJc28KUhhz
 EweZl0Ouft93zvGSZq19sAAAA
X-Change-ID: 20260910-mathieu-updates-2026-09-10-a59a7936460d
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789038241; l=2370;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=ZZXWEo3bwAFf7O4EWZulwlCsaaI3ekWmtYKKn35YMiE=;
 b=vP40OA6i4OkDNN6eaTU/NR6bt5kEGSAiaVuKkTzffOmnRcVTrM/ldocxtXOhwCoBH7aipqAMi
 oDh82DSxYR1BuysIegks3qx6sQPew+rq7FITv6p373yZe2vk90ZPuQQ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245550

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (7):
      python3-meson-python: upgrade 0.20.0 -> 0.21.0
      python3-kirk: upgrade 4.1.0 -> 4.2.0
      repo: upgrade 2.66.1 -> 2.67
      python3-hypothesis: upgrade 6.167.0 -> 6.168.0
      librsvg: upgrade 2.62.3 -> 2.63.0
      libcap-ng,libcap-ng-python: upgrade 0.9.5 -> 0.9.6
      dpkg: 1.23.7 -> 1.23.11

 .../dpkg/0001-Add-support-for-riscv32-CPU.patch    |   6 +-
 ...01-build.c-ignore-return-of-1-from-tar-cf.patch |   7 +-
 .../dpkg/0001-dpkg-Support-muslx32-build.patch     |   6 +-
 ...tions-dirs.c-set_rootfs-was-not-checking-.patch |   7 +-
 .../dpkg/0001-pkg-log.c-Add-missing-header.patch   |  29 +
 .../dpkg/0001-script.c-avoid-use-of-chroot.patch   |  14 +-
 ...nux-wrs-kernel-version-which-has-characte.patch |   7 +-
 ...-function-doesn-t-work-properly-for-all-s.patch |  18 +-
 ...0006-add-musleabi-to-known-target-tripets.patch |   6 +-
 ...uild.c-Remove-usage-of-clamp-mtime-in-tar.patch |   7 +-
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        |   4 +-
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch      |   7 +-
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |   4 +-
 .../dpkg/dpkg/remove-tar-no-timestamp.patch        |   9 +-
 meta/recipes-devtools/dpkg/dpkg/run-ptest          |   3 +
 .../dpkg/{dpkg_1.23.7.bb => dpkg_1.23.11.bb}       |   3 +-
 ...is_6.167.0.bb => python3-hypothesis_6.168.0.bb} |   2 +-
 ...on_0.20.0.bb => python3-meson-python_0.21.0.bb} |   2 +-
 .../repo/{repo_2.66.1.bb => repo_2.67.bb}          |   2 +-
 ...python3-kirk_4.1.0.bb => python3-kirk_4.2.0.bb} |   2 +-
 meta/recipes-gnome/librsvg/librsvg-crates.inc      | 816 ++++++++++-----------
 ...ustc-append-RUSTFLAGS-to-rustc-executable.patch |   2 +-
 ...t-Take-care-of-deprecated-assert_cmd-Comm.patch |   2 +-
 .../{librsvg_2.62.3.bb => librsvg_2.63.0.bb}       |   2 +-
 ...g-python_0.9.5.bb => libcap-ng-python_0.9.6.bb} |   0
 meta/recipes-support/libcap-ng/libcap-ng.inc       |   2 +-
 .../{libcap-ng_0.9.5.bb => libcap-ng_0.9.6.bb}     |   0
 27 files changed, 490 insertions(+), 479 deletions(-)
---
base-commit: 055994c026040515951d7fe04a445a9c30d257a7
change-id: 20260910-mathieu-updates-2026-09-10-a59a7936460d

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


