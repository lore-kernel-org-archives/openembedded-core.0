Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16610.1793100657491101870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=s9/j5Fww;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9FEB15A1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D88F3F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100657; bh=ry76QFNhBktnWOnv4fsQ9Y10XfMaVL8/Iw53yo8H9mg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s9/j5FwweVLjQbg0/tcInisZ/Pfr7rJnji8183waopLDhZSfF7E4rvLC9ZNROLDuO
	 nLeyGkQ1W0Z/SNjTvxLhor0yM4obRNCVLv5TMdEeFaTn6TUHRCI1PpyHT/kezUc/nz
	 Al41+ShF+0tPFP0eKP8f7NPuJHcErJul9DjxN7CE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] libexif: use .tar.gz instead of .tar.bz2 in SRC_URI
Date: Tue, 27 Oct 2026 11:30:48 +0000
Message-ID: <20261027113048.1086884-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027113048.1086884-1-ross.burton@arm.com>
References: <20261027113048.1086884-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248734
Content-Type: text/plain; charset="utf-8"

.xz files are significantly smaller than .bz2, so download that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libexif/libexif_0.6.26.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libexif/libexif_0.6.26.bb b/meta/recipe=
s-support/libexif/libexif_0.6.26.bb
index 56b2e1e168b..d0d313e96ce 100644
--- a/meta/recipes-support/libexif/libexif_0.6.26.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.26.bb
@@ -7,12 +7,12 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.xz \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            "
=20
-SRC_URI[sha256sum] =3D "0830ed253fceeb60444fb309598bc8a9491d3007dc054aad=
3a50a347c5597c57"
+SRC_URI[sha256sum] =3D "4a055ed6575e61ca46c3172be3c753cc16c9becd0f99ec71=
d58dd0e471476c0c"
=20
 inherit autotools gettext github-releases ptest
=20
--=20
2.43.0

