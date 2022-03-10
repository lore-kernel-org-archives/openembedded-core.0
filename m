Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2319CC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:52:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9403.1646920325031021124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820391691
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:52:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 304C23F7D8
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:52:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] seatd: upgrade to 0.6.4 (fixes CVE-2022-25643)
Date: Thu, 10 Mar 2022 13:51:59 +0000
Message-Id: <20220310135159.2322955-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 13:52:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163022

We need to set nobranch=3D1 as the 0.6.4 tag isn't on any branches at
present.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/seatd/{seatd_0.6.3.bb =3D> seatd_0.6.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/seatd/{seatd_0.6.3.bb =3D> seatd_0.6.4.bb} (89%=
)

diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb b/meta/recipes-core/s=
eatd/seatd_0.6.4.bb
similarity index 89%
rename from meta/recipes-core/seatd/seatd_0.6.3.bb
rename to meta/recipes-core/seatd/seatd_0.6.4.bb
index abc8583087..a38f8c2152 100644
--- a/meta/recipes-core/seatd/seatd_0.6.3.bb
+++ b/meta/recipes-core/seatd/seatd_0.6.4.bb
@@ -6,9 +6,9 @@ LICENSE =3D "MIT"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D715a99d2dd552e6188e74d4ed2914=
d5a"
=20
-SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branc=
h=3Dmaster \
+SRC_URI =3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;nobra=
nch=3D1 \
            file://init"
-SRCREV =3D "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
+SRCREV =3D "df13d03f9cfd0dc0c2b3298cd0e5eb4e4a10835e"
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig update-rc.d
--=20
2.25.1


