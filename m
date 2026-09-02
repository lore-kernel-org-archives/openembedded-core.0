Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182DBC624DB
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.333.1788364008688583398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OYYEjiEE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B6441A195C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FEB76053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB0EA11C79905;
	Wed,  2 Sep 2026 17:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dfW4naw/LNDvoC7rofcOwZytHJjyKwYew8ZQMnvDI2U=;
	b=OYYEjiEEfP5F9D8XP0sTPS2Ag23AJ+voPj2s+sTZHErQeKUAgIHrHHFM8pQiqdpsjF+R5O
	0tzjIPtK1Y+Fuy/d2FvTyGuMuBvWAflHYpwPVTOgogUUWJ4zkSbbHHf/A1+HdRZhyW8IUA
	9lNacmBYaDPw5+HkAj0rfEWOOjfJgFL6Qh1zhtM0Z3hLUTBAWO2d4mFablfSqOGj1F7ONo
	h0Vu1CqEZXVmeo/WJTzd+OW706vEXF9TyV5aB9ubzpnGLHKLTdlAOLTHitEEhyWGIyjSG1
	NK3tPmmS0IjUkA0abGtZQEpqHuOO3I6beVXmMJuwmJP3Iau7aG4P7TblE/vb5g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/8] Upgrades of 2026-09-02
Date: Wed, 02 Sep 2026 17:46:42 +0200
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJEmGoC/x3MSQqAMAxA0atI1gZicaBeRVxUG20WDrQqgvTuV
 pefB/+BwF44QJs94PmSINuaosgzGJ1ZZ0axqUGRqkmTwsUcTvjEc7fm4IAfIGlMNKhm0GNZkdU
 lpMHueZL7n3d9jC+IOWNabAAAAA==
X-Change-ID: 20260902-mathieu-updates-2026-09-02-b27b9c450d94
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=2562;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=N3hZrOa009HeKqoMAQFkX/i+aB+5d1UwXZRPdEbisPE=;
 b=mXDVDX/33bbbEHj5vA9tLlNBq6y46HA+s/V2PBPOdvXEs7LImGOf/kui3cKDj5TNNvCV15daF
 gNdVgzw6bORAu4NMqShpRmnYtfxB/8jRLGoFfAvnhmdIuLyqVfo94Vm
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244975

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (8):
      spirv-llvm-translator: upgrade 23.1.0 -> 23.1.1
      python3-uv-build: upgrade 0.12.8 -> 0.12.9
      python3-vcs-versioning: upgrade 2.3.1 -> 2.3.2
      mesa-demos: upgrade to latest revision
      python3-setuptools-scm: upgrade 10.2.1 -> 10.2.2
      go: upgrade 1.27.0 -> 1.27.1
      libgcrypt: upgrade 1.12.2 -> 1.12.3
      go-binary-native: upgrade 1.27.0 -> 1.27.1

 .../go/{go-1.27.0.inc => go-1.27.1.inc}            |  2 +-
 ...native_1.27.0.bb => go-binary-native_1.27.1.bb} |  6 ++--
 ...adian_1.27.0.bb => go-cross-canadian_1.27.1.bb} |  0
 .../go/{go-cross_1.27.0.bb => go-cross_1.27.1.bb}  |  0
 ...go-crosssdk_1.27.0.bb => go-crosssdk_1.27.1.bb} |  0
 .../{go-runtime_1.27.0.bb => go-runtime_1.27.1.bb} |  0
 ...-content-based-hash-generation-less-pedan.patch | 34 ++++++++++------------
 ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 14 ++++-----
 .../0003-ld-add-soname-to-shareable-objects.patch  | 15 ++++------
 ...verride-CC-when-building-dist-and-go_boot.patch | 10 ++-----
 ...-cmd-dist-separate-host-and-target-builds.patch | 31 +++++++++-----------
 ...06-cmd-go-make-GOROOT-precious-by-default.patch | 23 +++++++--------
 ...ter-out-build-specific-paths-from-linker-.patch | 14 ++++-----
 ...t-buildgo.go-do-not-hardcode-host-compile.patch | 11 +++----
 ...ter-build-paths-on-staticly-linked-arches.patch | 15 ++++------
 ...r-GOROOT-for-func-ldShared-when-trimpath-.patch | 12 +++-----
 .../go/{go_1.27.0.bb => go_1.27.1.bb}              |  0
 ..._10.2.1.bb => python3-setuptools-scm_10.2.2.bb} |  2 +-
 ...-build_0.12.8.bb => python3-uv-build_0.12.9.bb} |  2 +-
 ...ng_2.3.1.bb => python3-vcs-versioning_2.3.2.bb} |  2 +-
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb     |  2 +-
 ...r_23.1.0.bb => spirv-llvm-translator_23.1.1.bb} |  2 +-
 .../0001-libgcrypt-fix-m4-file-for-oe-core.patch   |  2 +-
 ...-tests-Fix-link-errors-for-t-thread-local.patch | 13 ++++-----
 ...ile.am-fix-undefined-reference-to-pthread.patch | 11 +++----
 .../libgcrypt/files/no-bench-slope.patch           |  2 +-
 .../libgcrypt/files/no-native-gpg-error.patch      |  4 +--
 .../{libgcrypt_1.12.2.bb => libgcrypt_1.12.3.bb}   |  4 +--
 28 files changed, 96 insertions(+), 137 deletions(-)
---
base-commit: 76d6de7d485e0a5d5082e1c94049d0ef2b88a003
change-id: 20260902-mathieu-updates-2026-09-02-b27b9c450d94

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


