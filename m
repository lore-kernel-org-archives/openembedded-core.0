Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D072F8A157
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 10:31:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10753.1776335471456881911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 03:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lljNZ6mJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D6E25E1
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:31:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BD423F7D8
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776335471; bh=QXIwYVIj6KjjP4CUxbTUZYIWbzqGMDpOTBDLhqckNMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lljNZ6mJoJWStvWGQPFFdfWyeRegKbJbeuVePKkcwJspgeYywujR7Sg+97Cejsr/a
	 lcwsRkRLnsk2gowSqyJG5w3FO/lWMJLvCdS49xDZ0+5RyYjjN8qbNg+MonLjXmqUme
	 WA15kerBXlHVI0rfCU5v98RipEr50Qdu4TEwk2Vk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/4] libsoup: mark CVEs which have been resolved upstream
Date: Thu, 16 Apr 2026 11:30:59 +0100
Message-ID: <20260416103100.3152304-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416103100.3152304-1-ross.burton@arm.com>
References: <20260416103100.3152304-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 10:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235395

These issues have all been fixed in the 3.6.6 release that we have, but
the CPEs are unversioned. I've contacted NIST to update the database but
until that happens we can mark them as fixed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libsoup/libsoup_3.6.6.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes=
-support/libsoup/libsoup_3.6.6.bb
index b51368adb64..9bc3f2f86fb 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -58,3 +58,8 @@ DEBIAN_NOAUTONAME:${PN} =3D "1"
 RRECOMMENDS:${PN} =3D "glib-networking"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_STATUS[CVE-2026-1467] =3D "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-1536] =3D "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-1801] =3D "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-2443] =3D "fixed-version: fixed in 3.6.6"
--=20
2.43.0


