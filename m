Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A32DC54EE9
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 18:54:58 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.16542.1662317692095120172
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 11:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=hsBQsBb/;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 114E1200007;
	Sun,  4 Sep 2022 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1662317690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqtMfG66+JFI3mkNr4rIqZl6Ad3A8k6mdgRUYPgXy8I=;
	b=hsBQsBb/jtifZAzDZ6TCa0kdjc9wMvobujmvu2ErBebiXacbm16jzl+N5AQojiTpqBTAcT
	P1zk8E4K7q0c8ZeHYsExfz+U48eNeaiaEHuCra/yVSDmY6QpjNZdoEL5DXc02jIUdoJQx0
	nKLzCgYrF5L8+SCfsYLSJxxsBOI26m0MuAEknRNSA8N7zuZ6VVNyLYpDX8N6Si2llEQERz
	BeO8jy423tDCedx+uf1tqT/NxqnJGTj5fFWn7/9t9J8VcYMcCjv4e/pryT50dGLWbBXpZ+
	sn8Dt/XhCAg3RXmcEkDFVnU9gRIbBfJNUCaZkqrkjUrp2j8cB21xhEiJft3d2g==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 3/3] libxau: Update 1.0.9 to 1.0.10
Date: Sun,  4 Sep 2022 11:53:38 -0700
Message-Id: <20220904185338.394626-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220904185338.394626-1-robert.joslyn@redrectangle.org>
References: <20220904185338.394626-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 18:54:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170294

Tarball switched from bz2 to xz.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../xorg-lib/{libxau_1.0.9.bb => libxau_1.0.10.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.9.bb => libxau_1.0.10.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
rename to meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb
index 3fbc3a5b44..a62c9f088a 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb
@@ -17,8 +17,8 @@ PROVIDES = "xau"
 PE = "1"
 
 XORG_PN = "libXau"
+XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c5f16288f2da9f071b29111d68797480"
-SRC_URI[sha256sum] = "ccf8cbf0dbf676faa2ea0a6d64bcc3b6746064722b606c8c52917ed00dcb73ec"
+SRC_URI[sha256sum] = "8be6f292334d2f87e5b919c001e149a9fdc27005d6b3e053862ac6ebbf1a0c0a"
-- 
2.35.1


