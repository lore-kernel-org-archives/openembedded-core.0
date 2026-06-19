Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78629CDB466
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:12:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43384.1781878348625755307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 07:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vwq6IK23;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30BE726BE
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:12:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F5123F62B
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781878347; bh=RCd02T6LytU5kJjR8x5IFvfstvUatOF7YP2S2dAphhs=;
	h=From:To:Subject:Date:From;
	b=vwq6IK234NwMqilVTJYL6nsy6gHjCxyKNbqq9iw9paHgRitGc9aYy7J79nbhW3H9H
	 JaNACvyq9S9YSYX+Ss6cny0tWA6TcZO3b/eYHX1kYxxg5pc30VsFO/522iecQxD6lw
	 YMOofqfJjwXnV6c9mrsSreBLsE2d/swQAmguQ+9M=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/2] classes/archive: change numbered list to bullets
Date: Fri, 19 Jun 2026 15:12:21 +0100
Message-ID: <20260619141222.4097163-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239177

Change this numbered list to bullets because there's no ordering
and any edits to the list will be more invasive than required.

No meaningful changes to the content beyond the list type.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/archiver.bbclass | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
index b6567065a92..e27aee4e90a 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -6,36 +6,36 @@
=20
 #
 # This bbclass is used for creating archive for:
-#  1) original (or unpacked) source: ARCHIVER_MODE[src] =3D "original"
-#  2) patched source: ARCHIVER_MODE[src] =3D "patched" (default)
-#  3) configured source: ARCHIVER_MODE[src] =3D "configured"
-#  4) source mirror: ARCHIVER_MODE[src] =3D "mirror"
-#  5) The patches between do_unpack and do_patch:
+#  - original (or unpacked) source: ARCHIVER_MODE[src] =3D "original"
+#  - patched source: ARCHIVER_MODE[src] =3D "patched" (default)
+#  - configured source: ARCHIVER_MODE[src] =3D "configured"
+#  - source mirror: ARCHIVER_MODE[src] =3D "mirror"
+#  - The patches between do_unpack and do_patch:
 #     ARCHIVER_MODE[diff] =3D "1"
-#     And you can set the one that you'd like to exclude from the diff:
+#    And you can set the one that you'd like to exclude from the diff:
 #     ARCHIVER_MODE[diff-exclude] ?=3D ".pc autom4te.cache patches"
-#  6) The environment data, similar to 'bitbake -e recipe':
+#  - The environment data, similar to 'bitbake -e recipe':
 #     ARCHIVER_MODE[dumpdata] =3D "1"
-#  7) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] =3D "1"
-#  8) Whether output the .src.rpm package:
+#  - The recipe (.bb and .inc): ARCHIVER_MODE[recipe] =3D "1"
+#  - Whether output the .src.rpm package:
 #     ARCHIVER_MODE[srpm] =3D "1"
-#  9) Filter the license, the recipe whose license in
-#     COPYLEFT_LICENSE_INCLUDE will be included, and in
-#     COPYLEFT_LICENSE_EXCLUDE will be excluded.
-#     COPYLEFT_LICENSE_INCLUDE =3D 'GPL* LGPL*'
-#     COPYLEFT_LICENSE_EXCLUDE =3D 'CLOSED Proprietary'
-# 10) The recipe type that will be archived:
-#     COPYLEFT_RECIPE_TYPES =3D 'target'
-# 11) The source mirror mode:
-#     ARCHIVER_MODE[mirror] =3D "split" (default): Sources are split int=
o
-#     per-recipe directories in a similar way to other archiver modes.
-#     Post-processing may be required to produce a single mirror directo=
ry.
-#     This does however allow inspection of duplicate sources and more
-#     intelligent handling.
-#     ARCHIVER_MODE[mirror] =3D "combined": All sources are placed into =
a single
-#     directory suitable for direct use as a mirror. Duplicate sources a=
re
-#     ignored.
-# 12) Source mirror exclusions:
+#  - Filter the license, the recipe whose license in
+#    COPYLEFT_LICENSE_INCLUDE will be included, and in
+#    COPYLEFT_LICENSE_EXCLUDE will be excluded.
+#    COPYLEFT_LICENSE_INCLUDE =3D 'GPL* LGPL*'
+#    COPYLEFT_LICENSE_EXCLUDE =3D 'CLOSED Proprietary'
+# - The recipe type that will be archived:
+#    COPYLEFT_RECIPE_TYPES =3D 'target'
+# - The source mirror mode:
+#    ARCHIVER_MODE[mirror] =3D "split" (default): Sources are split into
+#    per-recipe directories in a similar way to other archiver modes.
+#    Post-processing may be required to produce a single mirror director=
y.
+#    This does however allow inspection of duplicate sources and more
+#    intelligent handling.
+#    ARCHIVER_MODE[mirror] =3D "combined": All sources are placed into a=
 single
+#    directory suitable for direct use as a mirror. Duplicate sources ar=
e
+#    ignored.
+# - Source mirror exclusions:
 #     ARCHIVER_MIRROR_EXCLUDE is a list of prefixes to exclude from the =
mirror.
 #     This may be used for sources which you are already publishing your=
self
 #     (e.g. if the URI starts with 'https://mysite.com/' and your mirror=
 is
--=20
2.43.0


