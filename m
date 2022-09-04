Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2550AC6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 18:54:48 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.16579.1662317686407435261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 11:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=Cqt+jFqz;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id B0C9C200007;
	Sun,  4 Sep 2022 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1662317684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwTrax00FnI1bYovk5JuTbMN7Klglb8TUMP8PyPY08E=;
	b=Cqt+jFqzeXgjT6JJqAjntGYVGLi0Zsw3jQSQIqKThl5sUTEuURjdgw5uZ/DEwC379zPBDa
	BIlLoYxQ3rjMBKh5zf3tWhMSnSec8zmEcNKG+2RU07s+cRZl1Y/2ZpAyWuFh0DadJfr81S
	K/24dvugKsUbvrZh4ZLG7dR6duWx6zew1XQIsDUUGG7M6nNg3ibmaDQ+j7IoUpMORGOxHG
	10cjIz8QGNW61ep0t+BsEecYP/JpvORNcmlxaMfH7Wk8+3PXPuPs66qvx4jOz6+F/JN/yy
	ppWaIZ8Z8ks0ut9fvx2cEwArgG9hdE9QWRJzHSMm4KvLr7IsT0ODo7F3yN7yOw==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 2/3] libxfont2: Update 2.0.5 to 2.0.6
Date: Sun,  4 Sep 2022 11:53:37 -0700
Message-Id: <20220904185338.394626-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220904185338.394626-1-robert.joslyn@redrectangle.org>
References: <20220904185338.394626-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 18:54:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170293

Tarball switched from bz2 to xz.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../xorg-lib/{libxfont2_2.0.5.bb => libxfont2_2.0.6.bb}        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.5.bb => libxfont2_2.0.6.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
index 10e44c39ba..59d63e7150 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
@@ -12,10 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
 
 XORG_PN = "libXfont2"
+XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "aa7c6f211cf7215c0ab4819ed893dc98034363d7b930b844bb43603c2e10b53e"
+SRC_URI[sha256sum] = "74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.35.1


