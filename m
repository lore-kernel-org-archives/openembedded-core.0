Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4F2C07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 16:39:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.759.1713803932706544864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 09:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EB91150C;
	Mon, 22 Apr 2024 09:39:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D16D53F7BD;
	Mon, 22 Apr 2024 09:38:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/5] npth: remove obsolete binconfig-disabled inherit
Date: Mon, 22 Apr 2024 16:38:46 +0000
Message-Id: <20240422163846.1012183-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422163846.1012183-1-ross.burton@arm.com>
References: <20240422163846.1012183-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 16:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198601

npth no longer installs the npth-config script[1] that we disabled, so
there's no need to inherit the class.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dnpth.git;a=3Dcommit;h=3D=
2b6a8e5369ed37d64d1bafd3a546ec52e25acd26

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/npth/npth_1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/npth/npth_1.7.bb b/meta/recipes-support=
/npth/npth_1.7.bb
index 038caebd3d6..861f0b92c80 100644
--- a/meta/recipes-support/npth/npth_1.7.bb
+++ b/meta/recipes-support/npth/npth_1.7.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
=20
 SRC_URI[sha256sum] =3D "8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde=
6aaa74027914ad05"
=20
-inherit autotools binconfig-disabled multilib_header
+inherit autotools multilib_header
=20
 FILES:${PN} =3D "${libdir}/libnpth.so.*"
=20
--=20
2.34.1


