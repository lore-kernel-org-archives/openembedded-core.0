Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397DBEE14C7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:14:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6413.1694024067489255071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B768E11FB;
	Wed,  6 Sep 2023 11:15:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 424FF3F67D;
	Wed,  6 Sep 2023 11:14:26 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/7] libgudev: explicitly disable tests and vapi
Date: Wed,  6 Sep 2023 19:14:15 +0100
Message-Id: <20230906181420.795510-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906181420.795510-1-ross.burton@arm.com>
References: <20230906181420.795510-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187343

From: Ross Burton <ross.burton@arm.com>

Explicitly disable the tests and vapi support instead of relying on
defaults and missing dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/libgudev/libgudev_237.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-g=
nome/libgudev/libgudev_237.bb
index 5aa94e58f5a..d3122de8a07 100644
--- a/meta/recipes-gnome/libgudev/libgudev_237.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
@@ -25,6 +25,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 UPSTREAM_CHECK_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libgudev/=
"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>(\d+))"
=20
+EXTRA_OEMESON +=3D "-Dtests=3Ddisabled -Dvapi=3Ddisabled"
+
 # This isn't a GNOME-style version do gnome_verdir fails. Just return th=
e
 # version as that is how the directory is structured.
 def gnome_verdir(v):
--=20
2.34.1


