Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032B4C47DA2
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:07:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11045.1704892054463549564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2B262F4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:08:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFE2C3F64C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:07:33 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] gtk-doc: fix DEPENDS
Date: Wed, 10 Jan 2024 13:07:25 +0000
Message-Id: <20240110130730.3698802-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110130730.3698802-1-ross.burton@arm.com>
References: <20240110130730.3698802-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193503

From: Ross Burton <ross.burton@arm.com>

The use of xmlto and six was removed many years ago, instead depend
directly on docbook-xml and docbook-xsl.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-=
gnome/gtk-doc/gtk-doc_1.33.2.bb
index 2e8ab1c771a..f2f37610f9e 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATU=
RES", "api-documentation",
 # into its scripts. This means that target gtk-doc package is broken;
 # hopefully no one minds because its scripts are not used for anything d=
uring build
 # and shouldn't be used on targets.
-PACKAGECONFIG[working-scripts] =3D ",,libxslt-native xmlto-native python=
3-six python3-pygments"
+PACKAGECONFIG[working-scripts] =3D ",,libxslt-native docbook-xml-dtd4-na=
tive docbook-xsl-stylesheets python3-pygments"
 PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,glib-2.0"
=20
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_XSLTPROC=3Dxsltproc"
--=20
2.34.1


