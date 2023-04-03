Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C33C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:53:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.66936.1680519189027354842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08DBB143D;
	Mon,  3 Apr 2023 03:53:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14D043F6C4;
	Mon,  3 Apr 2023 03:53:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] bind: don't package non-existant .la files into -staticdev
Date: Mon,  3 Apr 2023 11:53:06 +0100
Message-Id: <20230403105306.3249922-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403105306.3249922-1-ross.burton@arm.com>
References: <20230403105306.3249922-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179612

If these files exist they should be packaged into PN-dev, and are with
the default FILES:${PN}-dev.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/bind/bind_9.18.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.12.bb b/meta/recipe=
s-connectivity/bind/bind_9.18.12.bb
index abce1c0f459..68dad77cdc8 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.12.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.12.bb
@@ -109,6 +109,5 @@ PACKAGE_BEFORE_PN +=3D "${PN}-libs"
 # https://github.com/isc-projects/bind9/commit/0e25af628cd776f98c04fc4cc=
59048f5448f6c88
 FILES_SOLIBSDEV =3D "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
 FILES:${PN}-libs =3D "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
-FILES:${PN}-staticdev +=3D "${libdir}/*.la"
=20
 DEV_PKG_DEPENDENCY =3D ""
--=20
2.34.1


