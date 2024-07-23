Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0B4C49EA1
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45961.1721746322886830508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3F681476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DACE73F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 36/37] python3-mako: add dependency on python3-misc for timeit
Date: Tue, 23 Jul 2024 15:51:36 +0100
Message-Id: <20240723145137.74198-36-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202403

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-mako_1.3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.5.bb b/meta/re=
cipes-devtools/python/python3-mako_1.3.5.bb
index d52f72f4584..d8a05efe5b2 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.5.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.5.bb
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] =3D "48dbc20568c1d276a2698b36d968fa7=
6161bf127194907ea6fc594fa81
=20
 RDEPENDS:${PN} =3D "python3-html \
                   python3-markupsafe \
+                  python3-misc \
                   python3-netclient \
                   python3-pygments \
                   python3-threading \
--=20
2.34.1


