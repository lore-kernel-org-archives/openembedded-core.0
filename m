Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAF0C49EA1
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18556.1721395529016309297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 06:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15D6B1042
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48C533F762
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] ofono: upgrade 2.8 -> 2.9
Date: Fri, 19 Jul 2024 14:25:19 +0100
Message-Id: <20240719132523.976790-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719132523.976790-1-ross.burton@arm.com>
References: <20240719132523.976790-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 13:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202260

* Add support for QRTR based devices (MHI bus and SoC).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/ofono/{ofono_2.8.bb =3D> ofono_2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.8.bb =3D> ofono_2.9.bb} =
(95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.8.bb b/meta/recipes-=
connectivity/ofono/ofono_2.9.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.8.bb
rename to meta/recipes-connectivity/ofono/ofono_2.9.bb
index 809485d4217..26cb9bb7ffb 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.8.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.9.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] =3D "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c=
44ac7d0dc933bbb8"
+SRC_URI[sha256sum] =3D "9d2612925a23a7fb668f297a044b5ea136215cc399ecc3f1=
27135c8f2a9845f9"
=20
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-da=
ta
=20
--=20
2.34.1


