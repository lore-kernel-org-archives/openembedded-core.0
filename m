Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA1DE7107A
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:48:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17975.1695304119072718471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 06:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC36716F2;
	Thu, 21 Sep 2023 06:49:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4326E3F59C;
	Thu, 21 Sep 2023 06:48:36 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/8] oeqa/runtime/parselogs: remove obsolete LSB testing support
Date: Thu, 21 Sep 2023 14:48:28 +0100
Message-Id: <20230921134833.582827-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921134833.582827-1-ross.burton@arm.com>
References: <20230921134833.582827-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188002

From: Ross Burton <ross.burton@arm.com>

The LSB compliance tests were removed in 2019[1], so this is obsolete.

[1] oe-core fb064356

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/run=
time/cases/parselogs.py
index e62ab2c44ec..e670df3cedd 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -69,9 +69,6 @@ common_errors =3D [
     "Failed to read LoaderEntryOneShot variable, ignoring: Operation not=
 supported",
     ]
=20
-video_related =3D [
-]
-
 x86_common =3D [
     '[drm:psb_do_init] *ERROR* Debug is',
     'wrong ELF class',
@@ -225,11 +222,6 @@ class ParseLogsTest(OERuntimeTestCase):
         cls.ignore_errors =3D ignore_errors
         cls.log_locations =3D log_locations
         cls.msg =3D ''
-        is_lsb, _ =3D cls.tc.target.run("which LSB_Test.sh")
-        if is_lsb =3D=3D 0:
-            for machine in cls.ignore_errors:
-                cls.ignore_errors[machine] =3D cls.ignore_errors[machine=
] \
-                                             + video_related
=20
     def getMachine(self):
         return self.td.get('MACHINE', '')
--=20
2.34.1


