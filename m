Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8778EC87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:26:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89080.1754058359862809714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 663321516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:25:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 07A9A3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:25:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] neard: recipe tweaks
Date: Fri,  1 Aug 2025 15:25:50 +0100
Message-ID: <20250801142554.3273064-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221350

The canonical git repository is on GitHub now, 01.org doesn't exist, and
one of the patches has been upstreamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../neard/neard/Makefile.am-fix-parallel-issue.patch          | 2 +-
 meta/recipes-connectivity/neard/neard_0.19.bb                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parall=
el-issue.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-pa=
rallel-issue.patch
index 6e864079a98..aeb33a5bdc5 100644
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issu=
e.patch
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issu=
e.patch
@@ -9,7 +9,7 @@ fix the race issue:
 src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
 /bin/sh: src/builtin.h: No such file or directory
=20
-Upstream-Status: Pending
+Upstream-Status: Backport [d39f8c0eee659743b4425d395c2f7ab1949e9c71]
=20
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes=
-connectivity/neard/neard_0.19.bb
index 41c7e55f443..c1149e76314 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Linux NFC daemon"
 DESCRIPTION =3D "A daemon for the Linux Near Field Communication stack"
-HOMEPAGE =3D "http://01.org/linux-nfc"
+HOMEPAGE =3D "https://github.com/linux-nfc/neard"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
                     file://src/near.h;beginline=3D1;endline=3D20;md5=3D3=
58e4deefef251a4761e1ffacc965d13 \
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
=20
 DEPENDS =3D "dbus glib-2.0 libnl autoconf-archive-native"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=
=3Dhttps;branch=3Dmaster \
+SRC_URI =3D "git://github.com/linux-nfc/neard;protocol=3Dhttps;branch=3D=
master \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
--=20
2.43.0


