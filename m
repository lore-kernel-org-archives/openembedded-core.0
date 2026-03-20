Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7E3108B91B
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11417.1774009659569025618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4DE81682
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F1953F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] pkgconf: inherit pkgconfig
Date: Fri, 20 Mar 2026 12:27:26 +0000
Message-ID: <20260320122732.1630715-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320122732.1630715-1-ross.burton@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233600

pkgconf needs to know the value of PKG_CONFIG_LIBDIR, so it needs to
inherit the pkgconfig class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_2.5.1.bb
index e335c843bda..a8455577f63 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "\
 "
 SRC_URI[sha256sum] =3D "cd05c9589b9f86ecf044c10a2269822bc9eb001eced2582c=
fffd658b0a50c243"
=20
-inherit autotools
+inherit autotools pkgconfig
=20
 do_install:append () {
     # Install a wrapper which deals, as much as possible with pkgconf vs
--=20
2.43.0


