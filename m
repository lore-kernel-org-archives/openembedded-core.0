Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153C9C61CE8
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10729.1749137716216312960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 568911688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:34:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BFA13F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/16] blktrace: put version in recipe filename
Date: Thu,  5 Jun 2025 16:34:58 +0100
Message-ID: <20250605153508.961682-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218042

A recipe that fetches from git but is otherwise a released version
should not be using _git.bb recipe names.

Put the version in the filename, drop the explicit PV, and set the tag
name in the SRC_URI to verify the SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../blktrace/{blktrace_git.bb =3D> blktrace_1.3.0.bb}        | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/blktrace/{blktrace_git.bb =3D> blktrace_1.3.0=
.bb} (94%)

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-=
kernel/blktrace/blktrace_1.3.0.bb
similarity index 94%
rename from meta/recipes-kernel/blktrace/blktrace_git.bb
rename to meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
index 8fc30d74fd6..fd72a501b7a 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
@@ -10,14 +10,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445=
f6965873eca0259a17f833"
=20
 DEPENDS =3D "libaio"
=20
-SRCREV =3D "366d30b9cdb20345c5d064af850d686da79b89eb"
=20
-PV =3D "1.3.0+git"
-
-SRC_URI =3D "git://git.kernel.dk/blktrace.git;branch=3Dmaster;protocol=3D=
https \
+SRC_URI =3D "git://git.kernel.dk/blktrace.git;protocol=3Dhttps;branch=3D=
master;tag=3D${BP} \
            file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifica=
lly.patch \
           "
=20
+SRCREV =3D "366d30b9cdb20345c5d064af850d686da79b89eb"
+
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "\
--=20
2.43.0


