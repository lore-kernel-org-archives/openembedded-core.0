Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B5AC43217
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10817.1653405848348891781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E012723A;
	Tue, 24 May 2022 08:24:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74CE33F70D;
	Tue, 24 May 2022 08:24:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/9] libarchive: disable LZO by default
Date: Tue, 24 May 2022 16:23:57 +0100
Message-Id: <20220524152401.1663317-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524152401.1663317-1-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166075

LZO is a fairly obsolete compression format these days, so disable it by
default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/=
recipes-extended/libarchive/libarchive_3.6.1.bb
index c795b416289..761cfca6473 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd499814247adae=
e08d88080841cb5665"
=20
 DEPENDS =3D "e2fsprogs-native"
=20
-PACKAGECONFIG ?=3D "zlib bz2 xz lzo zstd"
+PACKAGECONFIG ?=3D "zlib bz2 xz zstd"
=20
 PACKAGECONFIG:append:class-target =3D "\
 	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
--=20
2.25.1


