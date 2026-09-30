Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFABCCA5FC3
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:16:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8559.1790756208238035301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K+jBkUxU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D78FE1A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A306A60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B847E1032986C;
	Wed, 30 Sep 2026 10:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cht6AcQWgBRrVsn7yqBWnvPm2nwi92RvSPRT5/qijko=;
	b=K+jBkUxUstLJ5kL5MoU+Kh6XCZYAPgFmacSJ5tHYmWoXmNBb6dIb4aKoWgbuvIs03mG/xn
	v3Xko5uq4M/txY6LA3oLaMY5K3dcPhkK6+gXwTYcx4WfYViNJVWdrcFR7bDUnsKBxPhQVj
	VAGprIzXc4mncCI/Xizvf7dJjxHhYgYOUYhUjRrXEjPBOJKfzbyQxjZAmrtKfg1YsyyWTI
	EDJ/IYhS7GsmYnpHmb+3JSYXLXOhXoqC8aJ2aITTA6Wztf/DfPlc7fO2TgCGvp36bTct7v
	8h/G+454klGnXxfFvQo/suLgFDNsWo6MzCRGq8ZkKUjFLFBt47dHcC7TDJryqQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 00/24] 2026-09-29 upgrades
Date: Wed, 30 Sep 2026 10:16:25 +0200
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnFvGoC/x3MSQqAMAxA0atI1gZiFKeriItio2bhQGtFEO9ud
 fn48G/w4lQ8tMkNTk71uq0RWZrAMJt1ElQbDUxcUpMTLuaYVQKGfXLGisevIDFyg6WlqqrzeuS
 igHjYnYx6/feuf54XUM5Qy20AAAA=
X-Change-ID: 20260930-mathieu-upgrades-2026-02-29-6d077838f244
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=3700;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IbO5iTq+lEsIhBD1HcvFZQxvGKgi3L8/Bhv837oBEew=;
 b=ban9qzCARBFTrwvBDn7ftgmi9hbpkNuecTBMYUpLUU0QCqPaiMqhI2ccsu29RJHO/FMxtIGzF
 qNSvl9rSXpEDrYrVFKSi9riH465nCG0G0ttTntH1KBUU8I2wNyyoa6w
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246925

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (24):
      python3-pytz: upgrade 2026.3.post1 -> 2026.4
      python3-vcs-versioning: upgrade 2.4.0 -> 2.5.0
      python3-setuptools-scm: upgrade 10.2.3 -> 10.3.4
      python3-wcwidth: upgrade 0.8.3 -> 0.9.1
      gnupg: upgrade 2.5.22 -> 2.5.24
      repo: upgrade 2.67 -> 2.68.1
      python3-pbr: upgrade 7.1.0 -> 7.1.2
      ccache: upgrade 4.14 -> 4.14.1
      python3-hypothesis: upgrade 6.168.1 -> 6.168.2
      git: upgrade 2.55.0 -> 2.56.0
      spirv-headers: upgrade 1.4.357.0 -> 1.4.363.0
      vulkan-headers: upgrade 1.4.357.0 -> 1.4.363.0
      glslang: upgrade 1.4.357.0 -> 1.4.363.0
      spirv-tools: upgrade 1.4.357.0 -> 1.4.363.0
      vulkan-loader: 1.4.357.0 -> 1.4.363.0
      vulkan-tools: upgrade 1.4.357.0 -> 1.4.363.0
      vulkan-utility-libraries: upgrade 1.4.357.0 -> 1.4.363.0
      vulkan-validation-layers: upgrade 1.4.357.0 -> 1.4.363.0
      vulkan-volk: upgrade 1.4.357.0 -> 1.4.363.0
      python3-uv-build: upgrade 0.12.19 -> 0.12.20
      diffoscope: upgrade 331 -> 332
      libpcre2: upgrade 10.48 -> 10.49
      igt-gpu-tools: upgrade 2.5 -> 2.6
      appstream: upgrade 1.2.0 -> 1.2.1

 .../ccache/{ccache_4.14.bb => ccache_4.14.1.bb}    |  2 +-
 meta/recipes-devtools/git/git/fixsort.patch        |  4 +-
 .../git/{git_2.55.0.bb => git_2.56.0.bb}           |  2 +-
 ...is_6.168.1.bb => python3-hypothesis_6.168.3.bb} |  2 +-
 .../{python3-pbr_7.1.0.bb => python3-pbr_7.1.2.bb} |  2 +-
 ...pytz_2026.3.post1.bb => python3-pytz_2026.4.bb} |  2 +-
 ..._10.2.3.bb => python3-setuptools-scm_10.3.4.bb} |  2 +-
 .../python/python3-uv-build-crates.inc             | 20 +++++-----
 ...uild_0.12.19.bb => python3-uv-build_0.12.20.bb} |  2 +-
 ...ng_2.4.1.bb => python3-vcs-versioning_2.5.0.bb} |  2 +-
 ...3-wcwidth_0.8.4.bb => python3-wcwidth_0.9.1.bb} |  8 +++-
 .../repo/{repo_2.68.bb => repo_2.68.1.bb}          |  2 +-
 .../glslang/0001-generate-glslang-pkg-config.patch |  2 +-
 .../{glslang_1.4.357.0.bb => glslang_1.4.363.0.bb} |  2 +-
 ...uild-do-not-hardcode-the-build-directory-.patch | 46 ----------------------
 .../{igt-gpu-tools_2.5.bb => igt-gpu-tools_2.6.bb} |  3 +-
 ...ers_1.4.357.0.bb => spirv-headers_1.4.363.0.bb} |  2 +-
 ...tools_1.4.357.0.bb => spirv-tools_1.4.363.0.bb} |  5 +--
 ...rs_1.4.357.0.bb => vulkan-headers_1.4.363.0.bb} |  2 +-
 ...der_1.4.357.0.bb => vulkan-loader_1.4.363.0.bb} |  4 +-
 ...ools_1.4.357.0.bb => vulkan-tools_1.4.363.0.bb} |  2 +-
 ....0.bb => vulkan-utility-libraries_1.4.363.0.bb} |  2 +-
 ....0.bb => vulkan-validation-layers_1.4.363.0.bb} |  4 +-
 ...-volk_1.4.357.0.bb => vulkan-volk_1.4.363.0.bb} |  2 +-
 .../appstream/0001-remove-hardcoded-path.patch     | 32 ---------------
 .../appstream/0002-Do-not-build-qt-tests.patch     |  4 +-
 ..._PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch |  4 +-
 .../{appstream_1.2.0.bb => appstream_1.2.1.bb}     | 12 +++---
 .../{diffoscope_331.bb => diffoscope_332.bb}       |  2 +-
 ...1-Woverride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...c-use-a-custom-value-for-the-location-of-.patch |  4 +-
 ...0002-use-pkgconfig-instead-of-npth-config.patch |  2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch    |  2 +-
 .../gnupg/{gnupg_2.5.23.bb => gnupg_2.5.24.bb}     |  2 +-
 .../{libpcre2_10.48.bb => libpcre2_10.49.bb}       |  2 +-
 35 files changed, 58 insertions(+), 136 deletions(-)
---
base-commit: b2c42ac2a70fbbee2df1fbda2199643d5e5bb66d
change-id: 20260930-mathieu-upgrades-2026-02-29-6d077838f244

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


