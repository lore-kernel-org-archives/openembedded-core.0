Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D7EC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:40:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19380.1789465257284658240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=IujQYs7+;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6078169E
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:40:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2155D3F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789465256; bh=41wcw/N4+MGF+JzYr+ZVQjnTpb4KXlBfea8HnGGEyyY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IujQYs7+cdyGoTIm0SmsuOwJaNadZ+DSr6djoYre02pQB7URkKpR3aotNoMsE2Mqx
	 9mhdnCa6voD//JmXTcv/as4y8dsFFdsD4f5LcYHlL9ggfZFIa05Ae6DyA6IzCWnQtq
	 EnPbBopQIj9XXLJmfi6Ui+gjwXWxsiE8vkN18ZXQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] python3-testtools: remove obsolete dependencies
Date: Tue, 15 Sep 2026 10:40:50 +0100
Message-ID: <20260915094051.2553033-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915094051.2553033-1-ross.burton@arm.com>
References: <20260915094051.2553033-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245829

The use of the extras module was removed in 2.6.0[1], and the use of six
was removed in 2.5.0[2].

[1] testtools 5d3b595 ("Drop extras of extras; fixtures no longer uses it=
")
[2] testtools 8e8bf52 ("Remove six")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-testtools_2.9.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.9.1.bb b/me=
ta/recipes-devtools/python/python3-testtools_2.9.1.bb
index 0c7f6221781..31809fe1edd 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
@@ -13,9 +13,7 @@ SRC_URI[sha256sum] =3D "39ad9eb9e1b935d6838f4b3aee4d6e7=
2db65df5602f6feda998dbb4fe8
 RDEPENDS:${PN} +=3D "\
     python3-compression \
     python3-doctest \
-    python3-extras \
     python3-json \
-    python3-six \
     "
=20
 BBCLASSEXTEND =3D "nativesdk"
--=20
2.43.0


