Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F24C79FB0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3675.1788861517157322627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zskGbHDz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF9D11A1A52
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7EA56603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A75C811C7AF4C;
	Tue,  8 Sep 2026 11:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/J3ZyAU8fI3pR+tQM9iMX7rI25BOdL5SUuwfOh0uCKI=;
	b=zskGbHDzGCh9Zb/iLg9x7oBLXO+CYI5Pqbnwqf1EjxJh+gALA3TVju4PPsbuJ4ILKvfMrL
	3bGtZVurG95cDegl6hO5zOBreXT3LiFPT8Xc9TzumB3pY86K5GF6UJVrgiVkTQxHMxmNSY
	ByBiQAqbOGKhYgIo8foJUHzO8Dv+O0uBmmFmJcuxEMp2QzHZruUbdj0kyvd8TZRTMvxqSm
	uv9SXTWDHXU/0uPtPBE8seahIreXVBhcz24CS1f9QVcpBaTldeFWySbSb7/K6+xFLrbYGi
	Y5ga8weKU1LeloaSmdovu+lNeyiW74HRfAoTtwg0Lt8n2QZQQzdib3QOZzV2TQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 00/10] gstreamer1.0: upgrade 1.28.6 -> 1.28.7
Date: Tue, 08 Sep 2026 11:58:22 +0200
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD7cn2oC/x3MQQqDMBBG4avIrB1IgqjxKuLix446C22ZxFIQ7
 27o8lu8d1ESU0k0VBeZfDXp+yjwdUXzhmMV1lcxBRdaF13PO/KmcvKasgl2MfYceu4YzRyBxQM
 NqOQfk0V///U43fcDfKrc3GoAAAA=
X-Change-ID: 20260908-mathieu-gstreamer-1-28-7-a4c9aaf1aa4a
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=2577;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=lWfq95p6s9C9506LeoWHtBgUg5IHHkew8P98NMAo+p8=;
 b=aadLswPbg52gHhyAJe+NXbEE6Cl5GdhZrPTRIZY3M0oDozgm+VpHvpM0eWcJpEGutq48rh1TE
 R30atRNCp82CkMlYzk7GjC+AcmhNTYo6oFtzo/IQaP7CbRrCYyEQN/x
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245340

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (10):
      gstreamer1.0: upgrade 1.28.6 -> 1.28.7
      gst-devtools: upgrade 1.28.6 -> 1.28.7
      gstreamer1.0-python: upgrade 1.28.6 -> 1.28.7
      gst-examples: upgrade 1.28.6 -> 1.28.7
      gstreamer1.0-plugins-ugly: upgrade 1.28.6 -> 1.28.7
      gstreamer1.0-plugins-bad: upgrade 1.28.6 -> 1.28.7
      gstreamer1.0-plugins-base: upgrade 1.28.6 -> 1.28.7
      gstreamer1.0-plugins-good: upgrade 1.28.6 -> 1.28.7
      gstreamer1.0-libav: upgrade 1.28.6 -> 1.28.7
      gstreamer1.0-rtsp-server: upgrade 1.28.6 -> 1.28.7

 .../0001-connect-has-a-different-signature-on-musl.patch  |  2 +-
 .../{gst-devtools_1.28.6.bb => gst-devtools_1.28.7.bb}    |  2 +-
 .../0001-Make-player-examples-installable.patch           |  6 +++---
 ...xamples-gtk-show-player-warnings-in-a-dialog-box.patch | 15 ++++++---------
 .../{gst-examples_1.28.6.bb => gst-examples_1.28.7.bb}    |  2 +-
 ...er1.0-libav_1.28.6.bb => gstreamer1.0-libav_1.28.7.bb} |  2 +-
 ...maybe-uninitialized-warnings-when-compiling-with.patch |  4 ++--
 .../0002-avoid-including-sys-poll.h-directly.patch        |  4 ++--
 ...cv-resolve-missing-opencv-data-dir-in-yocto-buil.patch |  6 +++---
 ...and-handle-padded-buffers-in-wl_shm-buffer-creat.patch | 12 ++++++------
 ...s-bad_1.28.6.bb => gstreamer1.0-plugins-bad_1.28.7.bb} |  2 +-
 ...GR00312515-get-caps-from-src-pad-when-query-caps.patch |  4 ++--
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch    |  4 ++--
 .../0003-viv-fb-Make-sure-config.h-is-included.patch      |  4 ++--
 ...base_1.28.6.bb => gstreamer1.0-plugins-base_1.28.7.bb} |  2 +-
 ...good_1.28.6.bb => gstreamer1.0-plugins-good_1.28.7.bb} |  2 +-
 ...ugly_1.28.6.bb => gstreamer1.0-plugins-ugly_1.28.7.bb} |  2 +-
 ...1.0-python_1.28.6.bb => gstreamer1.0-python_1.28.7.bb} |  2 +-
 ...erver_1.28.6.bb => gstreamer1.0-rtsp-server_1.28.7.bb} |  2 +-
 ...001-tests-respect-the-idententaion-used-in-meson.patch |  2 +-
 .../0002-tests-add-support-for-install-the-tests.patch    |  6 +++---
 .../0003-tests-use-a-dictionaries-for-environment.patch   |  2 +-
 ...sts-add-helper-script-to-run-the-installed_tests.patch |  2 +-
 .../{gstreamer1.0_1.28.6.bb => gstreamer1.0_1.28.7.bb}    |  2 +-
 24 files changed, 45 insertions(+), 48 deletions(-)
---
base-commit: ccc338ac5b03c1035e0d2477d1a1d85f364b335e
change-id: 20260908-mathieu-gstreamer-1-28-7-a4c9aaf1aa4a

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


