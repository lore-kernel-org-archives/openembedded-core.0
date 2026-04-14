Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960FCF9D0DA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 15:57:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61.1776182216938003210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 08:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=X7KcVAyp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DCFE2D95
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9D6A3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776182216; bh=aPWTfXyUy3uCWh8CXuTTfEZOxkNbc5jjRw+yvIcQdQY=;
	h=From:To:Subject:Date:From;
	b=X7KcVAypqWS0rTwDHU4CXJCVUgtZmkNnyvTqNa1AYDNDlTCqxAj6OuXrlGH8i/szV
	 gDNtxSpNT6cH+yzONWRAcmfqV7sxq/H/mItP45beANP/KsG2qCAW/pHbsS+nXkajg6
	 20yWI6wiSH1le2n74EsU8ywkBgejLEZPAXba3gws=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] graphene: ignore CVE-2024-1984
Date: Tue, 14 Apr 2026 16:56:47 +0100
Message-ID: <20260414155652.1214302-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 15:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235161

This CVE is for a WordPress theme called Graphene.  It's likely that the
CPE for this graphene will be gnome:graphene but this hasn't been
formally documented, so exclude this one CVE for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index d14a6403ff4..7aa72b4a78f 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -26,3 +26,5 @@ EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
 FILES:${PN} +=3D "${libdir}/graphene-1.0"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_STATUS[CVE-2024-1984] =3D "cpe-incorrect: issue in a WordPress theme=
"
--=20
2.43.0


