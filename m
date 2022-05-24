Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C460EC4167B
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10818.1653405849918508527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9752223A;
	Tue, 24 May 2022 08:24:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 118A73F70D;
	Tue, 24 May 2022 08:24:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 7/9] oeqa/selftest/imagefeatures: don't exercise lzo
 compression
Date: Tue, 24 May 2022 16:23:59 +0100
Message-Id: <20220524152401.1663317-7-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166077

We're removing lzo from oe-core, so don't exercise lzo compressed images
in oe-selftest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeq=
a/selftest/cases/imagefeatures.py
index 6d010b3e3a7..c1abb0d8282 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -171,7 +171,7 @@ class ImageFeatures(OESelftestTestCase):
         Author:      Tom Rini <trini@konsulko.com>
         """
=20
-        conv =3D "ext4.bmap.gz.bz2.lzo.xz.u-boot"
+        conv =3D "ext4.bmap.gz.bz2.xz.u-boot"
         features =3D 'IMAGE_FSTYPES +=3D "%s %s.sha256sum"' % (conv, con=
v)
         self.write_config(features)
=20
--=20
2.25.1


