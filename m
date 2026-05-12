Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AA5CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 16:31:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79756.1778603463526711841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 09:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FylrF8DM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 020551688
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:30:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB9213F836
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778603462; bh=gTwPvAw1O2tviur7js4XJH86nVpd6MvfzRpS5l0L7rQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FylrF8DMFmSlgvnY8CavyNxxjy/4vkUs9qsES9VIpnJHPOS3yob2YNzlon/lzYGYZ
	 MrDgWByksguyszwBCmqyVlLWqOPvF3jmUKDcnmth61KKd/dE4qr0dZW2RXuipRx/6G
	 wtVLfoPKmMhRipWBgLWrl9tmTXjXcRS5H0DEu9zU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] epiphany: remove obsolete build dependencies
Date: Tue, 12 May 2026 17:30:52 +0100
Message-ID: <20260512163055.3821810-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512163055.3821810-1-ross.burton@arm.com>
References: <20260512163055.3821810-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 16:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236893

Epiphany ported to GTK 4 in v44 onwards[1] and as part of this work the
dependencies on libdazzle and libhandy were removed.

[1] epiphany 6e5357947 ("Port to GTK4")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/epiphany/epiphany_50.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_50.4.bb b/meta/recipes-=
gnome/epiphany/epiphany_50.4.bb
index 611efe8ea3b..2abec0742d3 100644
--- a/meta/recipes-gnome/epiphany/epiphany_50.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
@@ -14,8 +14,6 @@ DEPENDS =3D " \
           json-glib \
           libadwaita \
           libarchive \
-          libdazzle \
-          libhandy \
           libportal \
           libsoup \
           glib-2.0-native \
--=20
2.43.0


