Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01CBC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:11:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6065.1783509073670466285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AvbdndXc;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB2E41E5E
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C51F13F85F
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783509073; bh=QChwGemIFdXaYh2vngUZwHCyQ5kZEw/PU2fR1SHqmcw=;
	h=From:To:Subject:Date:From;
	b=AvbdndXcoP18QnTiuZnzQlBlsvlHIyoIRvh9cxh2+3HCrmGRSU3KxakOF9UkXiSW+
	 TYek3tDlNs18p640shulv4D5FErw9Cq/PcBMllhYs0kDDsujnvLUijin+tFkJvPRZt
	 3MdpgZJ4De1lY8BPvDcqG1HTE6O2P4BStWxh3Vo0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] xmlto: update SRC_URI
Date: Wed,  8 Jul 2026 12:11:04 +0100
Message-ID: <20260708111108.3577325-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240458

xmlto was previously hosted on Fedora's pagure.io server, but this is
being decomissioned. As xmlto isn't Fedora-specific the repository has
migrated to codeberg.org.

From discussion with Michal Schorm <mschorm@redhat.com>:

  I became the new maintainer of the project upstream and after a
  discussion with Kevin Fenzi, migrated it to a new home on the
  codeberg.org: https://codeberg.org/xmlto/xmlto

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb b/meta/recipes-d=
evtools/xmlto/xmlto_0.0.29.bb
index 613d7973ec..c26cd21dd0 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -7,7 +7,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
 SRCREV =3D "74862a684907ada3d4ed2ce0f8111adf626e1456"
-SRC_URI =3D "git://pagure.io/xmlto.git;protocol=3Dhttps;branch=3Dmaster"
+SRC_URI =3D "git://codeberg.org/xmlto/xmlto.git;protocol=3Dhttps;branch=3D=
master"
=20
 inherit autotools
=20
--=20
2.43.0


