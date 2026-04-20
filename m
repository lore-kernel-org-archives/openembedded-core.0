Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990EBF5A8B8
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:08:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1308.1776712075389750993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 12:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fbzjsbPu;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BBB825DE
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64CEA3F915
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776712074; bh=1wma+27thg9gwMisryVjL7tv2427aNYMXFBJ/4rZc8o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fbzjsbPuKZ/yaxVINjTytOWswd16KzbNQHxGyZAkd18nj0ZxmPyXwl1wB1kco41KC
	 uK7T4yRUdaWl9TjKRtfA6ABEMWqzH7zHfacODYA5z1exHBbRqurhRFkcJqu2FeQdu3
	 MV/h4gHLfPxf826rBJhkPTlbkYSY9MGLYiIFJOx8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] systemd: mark several CVEs as fixed
Date: Mon, 20 Apr 2026 20:07:46 +0100
Message-ID: <20260420190749.1280090-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420190749.1280090-1-ross.burton@arm.com>
References: <20260420190749.1280090-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 19:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235583

CVE-2019-3815 is specific to RHEL, and CVE-2026-40223 to -40226 have all
been fixed in the stable branch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
index b636d6e8b4f..f107c4c5da5 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -20,3 +20,9 @@ SRCBRANCH =3D "v259-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branc=
h=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
+
+CVE_STATUS[CVE-2019-3815] =3D "not-applicable-platform: only applied to =
RHEL"
+CVE_STATUS[CVE-2026-40223] =3D "fixed-version: fixed in 259.2"
+CVE_STATUS[CVE-2026-40224] =3D "fixed-version: fixed in 259.3"
+CVE_STATUS[CVE-2026-40225] =3D "fixed-version: fixed in 259.5"
+CVE_STATUS[CVE-2026-40226] =3D "fixed-version: fixed in 259.4"
--=20
2.43.0


