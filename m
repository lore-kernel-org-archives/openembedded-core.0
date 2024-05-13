Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D54C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 15:21:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.63347.1715613692442579197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 08:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 473281007
	for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 08:21:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A29943F641
	for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 08:21:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cpio: mark CVE-2023-7216 as disputed
Date: Mon, 13 May 2024 15:21:30 +0000
Message-Id: <20240513152130.1704349-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 15:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199242

Upstream consider the behaviour described in this CVE as intentional,
and provide an option to stop it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-exten=
ded/cpio/cpio_2.15.bb
index 52070f59a25..95f82cdf3ab 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] =3D "efa50ef983137eefc0a02fdb51509d6=
24b5e3295c980aa127ceee41834
 inherit autotools gettext texinfo ptest
=20
 CVE_STATUS[CVE-2010-4226] =3D "not-applicable-platform: Issue applies to=
 use of cpio in SUSE/OBS"
+CVE_STATUS[CVE-2023-7216] =3D "disputed: intended behaviour, see https:/=
/lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html"
=20
 EXTRA_OECONF +=3D "DEFAULT_RMT_DIR=3D${sbindir}"
=20
--=20
2.34.1


