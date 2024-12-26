Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24074E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 09:57:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.19612.1735207025584578166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 01:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V26lkAjW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9975E0004;
	Thu, 26 Dec 2024 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735207024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TP65P8eqXfFUCHc2Degn6SVsnoyTY/8XHwstalbr9cM=;
	b=V26lkAjWTSjH9iJT3BTS9MU+hdiUFI83uJDTlZfwRZiXgcfR3YBfmQdmv8IqFFtFRG5joc
	BalUDMuAcetlwGM9LpqI86ipmLpvXFwFthqQWnqUopahTnkurhPTLYTqHeCy6c9+7tRnxw
	kfMGcIYD8IBixagXtyDVMjlKb1dULtW7v1IgoHFZSohIoB1r4EYfxaLqYpwnKBSuKcSqSN
	mjxLQ8JU4x3TEInQzUZqQiq0MXRblFJUyPSsDYNz2WHRVjIYbb/GPcbtjMdZLGUx3mZaOk
	JoDi1UU7qKPZpwx7IBGp4UbhAklprIV3vr7NFrXPDJurKNAhSSFDQlpzEnq1+A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH] buildtools-docs-tarball: Add rsvg so we can handle svg files in docs
Date: Thu, 26 Dec 2024 10:55:31 +0100
Message-ID: <20241226095534.233214-1-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Dec 2024 09:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209088

We need to convert svg into png in the docs build so add rsvg tools
to handle this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/recipes-core/meta/buildtools-docs-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
index 72648e3b1c..b9ef68eb6d 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -9,6 +9,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-python3-sphinx \
     nativesdk-python3-sphinx-rtd-theme \
     nativesdk-python3-pyyaml \
+    nativesdk-rsvg \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-docs-nativesdk-standalone-${DISTRO_VERSION}"

