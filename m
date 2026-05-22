Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C90FCD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 13:10:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16621.1779455448088079895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 06:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=uK629AcV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1AD326BC
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 06:10:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2457A3F7B4
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779455446; bh=SVz8/hZmg+7Nv4KU1RP+y9mFBlynDjbV3S+WlekX5+o=;
	h=From:To:Subject:Date:From;
	b=uK629AcVnLjPC5EOK7W5jzGhnB21C+33/iZHosqu6XxtMsSjx+gomo7gsuObI3n7N
	 el+KnF99OkMtxtmmtdtVYZqyJYY2NXuDa6iE7F8Q2oEbX3BuFBlBmubiMsjRXp2/EX
	 KDtTcSMoklVd6ahq8Dka7ldIDxLj5qRpi12VQaMY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: add comment about soon-redundant options
Date: Fri, 22 May 2026 14:10:44 +0100
Message-ID: <20260522131044.3981891-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 13:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237548

The problem that means we need to pass --install-umask has been fixed
upstream, add a comment to remind the maintainer to remove this when
upgrading.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_3.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.3.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.3.bb
index 0646bf702e..f5ca2b16ee 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.3.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.3.bb
@@ -27,6 +27,8 @@ SRC_URI[sha256sum] =3D "09702ddb078b637e85de9236cbedd3f=
b9d7af7c6e797026c538b45748a
=20
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
=20
+# install-umask can be removed when upgrading to 3.1.19 onwards
+# https://gitlab.isc.org/isc-projects/kea/-/commit/d9f332a6f36f8056a54b0=
698d4672a67aea812ba
 EXTRA_OEMESON +=3D "-Dcrypto=3Dopenssl -Drunstatedir=3D${runtimedir} -Dk=
rb5=3Ddisabled -Dnetconf=3Ddisabled --install-umask=3D0022"
=20
 INITSCRIPT_NAME =3D "kea-dhcp4-server"
--=20
2.43.0


