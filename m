Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAD6C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:20:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45384.1742836813384332835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2EE416F3
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AED73F58B
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] perl: add more module RDEPENDS that don't get detected
Date: Mon, 24 Mar 2025 17:20:05 +0000
Message-ID: <20250324172008.3110176-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213561

These dependencies are in the source but the dependency generator does
not see them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/perl/files/perl-rdepends.txt | 2 ++
 meta/recipes-devtools/perl/perl_5.40.0.bb          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/re=
cipes-devtools/perl/files/perl-rdepends.txt
index 48e5a9de2f1..462456bba08 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -1,6 +1,8 @@
=20
 # Some additional dependencies that the above doesn't manage to figure o=
ut
+RDEPENDS:perl-module-file-path +=3D "perl-module-file-spec"
 RDEPENDS:perl-module-file-spec +=3D "perl-module-file-spec-unix"
+RDEPENDS:perl-module-file-spec +=3D "perl-module-constant"
 RDEPENDS:perl-module-scalar-util +=3D "perl-module-list-util"
 RDEPENDS:perl-module-file-temp +=3D "perl-module-scalar-util"
 RDEPENDS:perl-module-file-temp +=3D "perl-module-file-spec"
diff --git a/meta/recipes-devtools/perl/perl_5.40.0.bb b/meta/recipes-dev=
tools/perl/perl_5.40.0.bb
index 30f2431f279..0d4338f29f7 100644
--- a/meta/recipes-devtools/perl/perl_5.40.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.0.bb
@@ -369,7 +369,9 @@ do_create_rdepends_inc() {
     cat <<'EOPREAMBLE' > ${WORKDIR}/perl-rdepends.inc
=20
 # Some additional dependencies that the above doesn't manage to figure o=
ut
+RDEPENDS:${PN}-module-file-path +=3D "${PN}-module-file-spec"
 RDEPENDS:${PN}-module-file-spec +=3D "${PN}-module-file-spec-unix"
+RDEPENDS:${PN}-module-file-spec +=3D "${PN}-module-constant"
 RDEPENDS:${PN}-module-scalar-util +=3D "${PN}-module-list-util"
 RDEPENDS:${PN}-module-file-temp +=3D "${PN}-module-scalar-util"
 RDEPENDS:${PN}-module-file-temp +=3D "${PN}-module-file-spec"
--=20
2.43.0


