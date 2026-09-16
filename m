Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8BFC982CD
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:03:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18617.1789574573984422457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 09:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XJ+lLGR/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C86031516
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:02:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E6E43F86F
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789574573; bh=g7Sgtw+3z/BgmOLvOtFHcDr65JoESqAYSP1COA/11h8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XJ+lLGR/4sRujg8fhj0h92B++xytb8MzI6I43zMe5Fhlf0ENlXszbJBkoozRjIt5b
	 Wosd9fLRb4P63IOzP/M5ADrZEtuKkobi3oKyiXcuWzq533uqwPhl9I7Pb8brhz94A4
	 AUSd6WdCiPVfwKtLnxVX3bP2le3OykcgRnvthHus=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] webkitgtk: remove libnotify dependency
Date: Wed, 16 Sep 2026 17:02:46 +0100
Message-ID: <20260916160246.276107-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916160246.276107-1-ross.burton@arm.com>
References: <20260916160246.276107-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 16:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245990

This was removed upstream in webkitgtk 2.39.1 onwards[1].

[1] https://github.com/WebKit/WebKit/commit/95858e6cc2e3f804cc95b4f55cd75=
32329db790a

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.52.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.52.6.bb
index cc7ccd55e8b..e7296d0ad46 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
@@ -39,7 +39,6 @@ DEPENDS +=3D " \
           gtk4 \
           libxslt \
           libtasn1 \
-          libnotify \
           gstreamer1.0 \
           gstreamer1.0-plugins-base \
           glib-2.0-native \
--=20
2.43.0


