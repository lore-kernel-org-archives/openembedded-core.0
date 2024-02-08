Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8637BC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:44:15 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.13723.1707381854460088103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CRLn7xxr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B603A60003;
	Thu,  8 Feb 2024 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707381852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m/FBqLO64CZ6+YdMep0gTJ7AX7fZjhmh/Ajovs3iwnA=;
	b=CRLn7xxrqoDFGoo2z5rtCMGj/Dmv1cA5kENneyWa/M4k6VR5j15r/FqEiUd78EGOomt5X8
	MsrXAponEAkeIvl9ruuUJ7tLIlR/IjCm+g8/m+CsqLZFdb9wWvQuFNLb66cLqAYCOZ5zPy
	bDJoFnTh6hwZlSw59Gyy8JpTfTokTwjgnVq17ZIVgsaV6Z8TpgujF131eXbCcNE8TdTxzY
	9CDaYoHazOc8mTxKeZDa9xqJay/4FIHpFDnYaF5orKdV8PMUqI8+Wj8nUW8+KZQ7qdkZdV
	VQGzv3bSEiHLfcGyl1H6r+GU5m10QWdghkKlws+b7wlRFrtf4BusbqlID8q3pA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 0/4] alsa updates
Date: Thu,  8 Feb 2024 09:44:02 +0100
Message-Id: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195114

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Changes in V3

- Add missing Signed-off-by information for two commits
  (reported by patchtest)

Changes in V2

- Fix the commit title for the alsa-tools update
  We updated from version 1.2.5, not 1.2.10

Michael Opdenacker (4):
  alsa-lib: upgrade 1.2.10 -> 1.2.11
  alsa-tools: upgrade 1.2.5 -> 1.2.11
  alsa-ucm-conf: upgrade 1.2.10 -> 1.2.11
  alsa-utils: upgrade 1.2.10 -> 1.2.11

 ...STRING-macro-outside-PIC-ifdef-block.patch | 52 -------------------
 ...topology-correct-version-script-path.patch | 38 ++++++++++++++
 ...{alsa-lib_1.2.10.bb => alsa-lib_1.2.11.bb} |  4 +-
 ...sa-tools_1.2.5.bb => alsa-tools_1.2.11.bb} |  2 +-
 ...conf_1.2.10.bb => alsa-ucm-conf_1.2.11.bb} |  2 +-
 ...nhlt-dmic-info.c-include-sys-types.h.patch | 31 -----------
 .../0001-topology.c-include-locale.h.patch    | 31 -----------
 ...a-utils_1.2.10.bb => alsa-utils_1.2.11.bb} |  4 +-
 8 files changed, 43 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-global.h-move-__STRING-macro-outside-PIC-ifdef-block.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.10.bb => alsa-lib_1.2.11.bb} (89%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.5.bb => alsa-tools_1.2.11.bb} (97%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.10.bb => alsa-ucm-conf_1.2.11.bb} (89%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.10.bb => alsa-utils_1.2.11.bb} (96%)

-- 
2.34.1


