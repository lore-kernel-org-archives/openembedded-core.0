Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83D4ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 00:18:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.19519.1662337090063369304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 17:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=AV1qo6j9;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.196, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 44E74E0008;
	Mon,  5 Sep 2022 00:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1662337088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PGeD6TUzVn3qLH+q5PBGEyEek3WJfRT90wRcveGvtcE=;
	b=AV1qo6j9Vg3G7/dN1UG8EesHc4uyyNco4AWv0Nl3bliVfv+HaOcSsma159KpWhGfE7+qfc
	CXf9XS3W6CrX/ceN0PK0fyrszsfVp0brZphhdgmnuOqq8e84EAVwpSqWGybZ4ebsUa6HAy
	aiAhBiqmIK+RMOTnyGyzFLmAMdFIrOD1qw74Gv8qVVwi1OXQMgVwb+MwzLShYHoaqTuNoD
	7DTsyfbjQ0Y8gVmHMb4wFzcExZP0ieXWywCqZYex9UBzGTCHpRccbkV7GKa7ho/8WCydoA
	UxBY9Cwa2qPFvM3nDouwDLUsbC/+sUiUOvOaWN9mHA2sunD/rz7m/g0yqtr+UQ==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] libfontenc: Update 1.1.4 to 1.1.6
Date: Sun,  4 Sep 2022 17:17:43 -0700
Message-Id: <20220905001743.405733-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 00:18:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170298

Tarball switched from bz2 to xz.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../xorg-lib/{libfontenc_1.1.4.bb => libfontenc_1.1.6.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.4.bb => libfontenc_1.1.6.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb
index 1fc74b1995..8f9602d3ae 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 DEPENDS += "zlib xorgproto font-util"
 PE = "1"
 
-SRC_URI[md5sum] = "6447db6a689fb530c218f0f8328c3abc"
-SRC_URI[sha256sum] = "2cfcce810ddd48f2e5dc658d28c1808e86dcf303eaff16728b9aa3dbc0092079"
+XORG_EXT = "tar.xz"
+
+SRC_URI[sha256sum] = "ea8606ed5255dda8f570b7d1a74d59ee8d198675b2f114d07807431e6ba1d111"
 
 BBCLASSEXTEND = "native"
-- 
2.35.1


