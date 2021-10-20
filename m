Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE33C4332F
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:30:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.537.1634751012343159648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2602ED1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E46E3F694
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] testimage: remove target_modules_path
Date: Wed, 20 Oct 2021 18:30:08 +0100
Message-Id: <20211020173008.443672-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020173008.443672-1-ross.burton@arm.com>
References: <20211020173008.443672-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 17:30:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157266

There is no need to pass target_modules_path anymore, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/testimage.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
index a76e773853..bfd689865d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -316,10 +316,6 @@ def testimage_main(d):
     if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
         target_kwargs['boot_patterns'] =3D get_testimage_boot_patterns(d=
)
=20
-    # TODO: Currently BBPATH is needed for custom loading of targets.
-    # It would be better to find these modules using instrospection.
-    target_kwargs['target_modules_path'] =3D d.getVar('BBPATH')
-
     # hardware controlled targets might need further access
     target_kwargs['powercontrol_cmd'] =3D d.getVar("TEST_POWERCONTROL_CM=
D") or None
     target_kwargs['powercontrol_extra_args'] =3D d.getVar("TEST_POWERCON=
TROL_EXTRA_ARGS") or ""
--=20
2.25.1


