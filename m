Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D211C43217
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 10:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9185.1664880669992136479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC4711FB;
	Tue,  4 Oct 2022 03:51:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 896ED3F67D;
	Tue,  4 Oct 2022 03:51:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/5] acpid: upgrade 2.0.33 -> 2.0.34
Date: Tue,  4 Oct 2022 11:51:02 +0100
Message-Id: <20221004105106.1556357-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 10:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171381

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.33.bb =3D> acpid_2.0.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.33.bb =3D> acpid_2.0.34.bb} (66=
%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.33.bb b/meta/recipes-bsp/ac=
pid/acpid_2.0.34.bb
similarity index 66%
rename from meta/recipes-bsp/acpid/acpid_2.0.33.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.34.bb
index 7094ba26622..1e0a6d5f243 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.33.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.34.bb
@@ -3,4 +3,4 @@ require acpid.inc
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b \
                     file://acpid.h;endline=3D24;md5=3D324a9cf225ae69ddaa=
d1bf9d942115b5"
=20
-SRC_URI[sha256sum] =3D "0856f71b3eb34a1b663d0a8e6363dfcbc519e63d84733049=
8898658e2972dbe8"
+SRC_URI[sha256sum] =3D "2d095c8cfcbc847caec746d62cdc8d0bff1ec1bc72ef7c67=
4c721e04da6ab333"
--=20
2.34.1


