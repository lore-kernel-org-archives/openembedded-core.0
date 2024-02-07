Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08730C4829A
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 21:59:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3022.1707343142029355732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 13:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gIfPA/9s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BBCFC0003;
	Wed,  7 Feb 2024 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707343140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zpxm4rK4cYN0mY24mnU4jo97e6bZLivEQBW1BCD+e4s=;
	b=gIfPA/9sMAje+8SuDEMwyQoSyUlageIk2IlRIY47RnZp0xBKkdzbvuOD/c/BIO3rQxMaLr
	IkL4D981h56A1hjR6s/ILwIEB8rOa9A/qI/9edJfHAPyVxVxZWRApuZcaow/nK39Pmnx+X
	n7RhTsvNtU5+IU+/Cmm6+F693yVEzam/aDxmNmaT+QDq3X66YkhcPWFGh8SpRbptouB7vp
	tEtEfixasOXDATyT+JQq6n/CoXNhQJIYx394ee80Cp+TLwFSF6uwxDG7XAAqS0e/KSE9fl
	bjW2u/SajVteib6CoXtbP/QaFuWbZHEh6E0crhFBawYPYr1lbxkDUNCeq2AGVA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 0/4] alsa updates
Date: Wed,  7 Feb 2024 22:58:49 +0100
Message-Id: <20240207215853.3605620-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 21:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195084

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- This fixes the commit title for the alsa-tools update
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


