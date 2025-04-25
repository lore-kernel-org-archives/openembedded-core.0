Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AC3C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:30:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.5461.1745584256818849930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cjb0PfrV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F251F43990;
	Fri, 25 Apr 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745584255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cHstHU3PdBsqrVmsUJc4DEyNFJF9Dw5J4uDu5el8ktw=;
	b=cjb0PfrVroshDCsEZB3svrbv5FJiiKnwBrEy9hcQDF4zwxrfBzazW7D+X7cA6cRD4iIKUp
	vhWhzlSkN9M9NiU2DnX2g2injGNm5STg9bmLqLOUNeYRl1X8plgpZhh66nox7HlYAjc/nU
	9UWOjAwrSofh4Z5JEB9j23vrwHI+/rQPaaoPF/LUqXRC2bR8uUFcSQLtijg09DU4f+BQ43
	EGcgimcsZsUGjHCPI73UdM6Wks9YQcEItyqdZ0Xywe3GbVtDpX3Uma1l6lVqDMRjcOxslk
	ibdQQedZzB694/8g95+yB3Ud0ozgzx9C7kP+0Y1qK+TrIllvxGXS5XelFRudUw==
From: joaomarcos.costa@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH] multilib.conf: fix typo in comment
Date: Fri, 25 Apr 2025 14:30:50 +0200
Message-ID: <20250425123050.166235-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpehjohgrohhmrghrtghoshdrtghoshhtrgessghoohhtlhhinhdrtghomhenucggtffrrghtthgvrhhnpeektddviefgvefgleeivdegtdffvdeftdeuuefgheekvefgvdfhtdeffeduveduteenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeguvdhfvgemlegrfeelmeeglegsgeemhegsgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeguvdhfvgemlegrfeelmeeglegsgeemhegsgeekpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehjohgrohhmrghrtghoshdrtghoshhtrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjohgrohhmrghrtghoshdrtghoshhtrgessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 12:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215471

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 979ae50c72..0b32a62835 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -23,6 +23,6 @@ MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
 OPKG_ARGS:append = " --force-maintainer --force-overwrite"
 APT_ARGS:append = " -o Dpkg::Options::=--force-confnew -o Dpkg::Options::=--force-overwrite"
 
-# These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
+# These recipes don't need multilib variants, the ${BPN} PROVIDES/RPROVIDES
 # ${MLPREFIX}${BPN}
 NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
-- 
2.47.0


