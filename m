Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121C5CE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:15:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.33294.1695201303206103787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JOoVtqWF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E07E460009;
	Wed, 20 Sep 2023 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695201301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVxgs+N2YObDInz77YIMy9RtVrjHUHDUfaSSg6xNiiU=;
	b=JOoVtqWFkD/MCe1hpV4P05v2gs7mkbhypfneVdk/vd68X+F8Ol1h3f+hOjY8tcGP8PTRkj
	w5Szj40E3LCUcrDWmuWUQwjcS4Sigm14dbFfMYmQV70pQKQxajZHly2VvNGneH6W3NE4xz
	Srk8II30kETZaU9q716dslOW22MBs3jOW5Dk3pKPem53meGoh1clvuujc4lj6P/uAksHyh
	dhtouUdttwylUUHtiOJXhDwikE2rXpXqjcZHq/bXYLwXOrTvWTK3ceGqZ29K+l9iqcjcw0
	X/vrjlSKc6qzbRRvrAx/CFsZxr0PFmQbSbcuDPZs0WFSaQznruMokD5tn8MPcQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] alsa-utils: update patch Upstream-Status
Date: Wed, 20 Sep 2023 11:14:34 +0200
Message-Id: <20230920091434.1452002-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920091434.1452002-1-michael.opdenacker@bootlin.com>
References: <20230920091434.1452002-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187907

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch        | 2 +-
 .../alsa/alsa-utils/0001-topology.c-include-locale.h.patch      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
index 43497e3d76..0ebf98b41e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
@@ -8,7 +8,7 @@ nhlt-dmic-info.c: error: unknown type name 'u_int8_t'
 
 https://github.com/alsa-project/alsa-utils/issues/238
 
-Upstream-Status: Submitted [alsa-devel@alsa-project.org]
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3]
 Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
 ---
  nhlt/nhlt-dmic-info.c | 1 +
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
index a4b1decceb..e1c7470356 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
@@ -8,7 +8,7 @@ topology.c: error: 'LC_ALL' undeclared
 
 https://github.com/alsa-project/alsa-utils/issues/239
 
-Upstream-Status: Submitted [alsa-devel@alsa-project.org]
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/8c229270f6bae83b705a03714c46067a7aa57b02]
 Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
 ---
  topology/topology.c | 1 +
-- 
2.34.1


