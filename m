Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA3DC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 14:52:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153.1790347935109585212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 07:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=t19nFsUX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F62D1688
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 07:52:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38BBA3F85F
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790347934; bh=ZC5swnRF0SP9A7drG8CaP4Wu5mSfzKAQQuDhVkolPA4=;
	h=From:To:Subject:Date:From;
	b=t19nFsUX8n2th8bezA/apQd6cM/yskpYag8G4hs7wQBGNsnoQRde+n9Ih+f6PvYBZ
	 Hiys9Fa67ZWmOER1StQiSvQs2cMGIwblMImMlhALwqGyVftalqe5C2jNu8k8nqNFCP
	 m/qEEBK8uDh2JKi0SHeq6vQ2nzQICx2Z4Z+3h+6U=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lame: add context to patches
Date: Fri, 25 Sep 2026 15:52:10 +0100
Message-ID: <20260925145210.2281661-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 14:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246622

All of our patches to lame 4.0 can be removed when lame 4.1 is released,
but none are backports so the patches will fail to apply.  Add comments
so that it is easy to verify the patches be be dropped.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/lame/lame/clang.patch   | 3 ++-
 meta/recipes-multimedia/lame/lame/id3tags.patch | 3 ++-
 meta/recipes-multimedia/lame/lame/no-gtk1.patch | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/lame/lame/clang.patch b/meta/recipes=
-multimedia/lame/lame/clang.patch
index 9e434fcbe7d..dbe15dad045 100644
--- a/meta/recipes-multimedia/lame/lame/clang.patch
+++ b/meta/recipes-multimedia/lame/lame/clang.patch
@@ -13,7 +13,8 @@ Move the HAVE_CLANG block up into the FULL_OPTIMIZATION=
 case, alongside
 HAVE_GCC.  This option is never enabled (as it's basically "use native")
 so resolves the build failure.
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [obsoleted by "Detect and enable optimiza=
tion
+                 and hardening flags across the builds" upstream in lame=
-4.1]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git i/configure.ac w/configure.ac
diff --git a/meta/recipes-multimedia/lame/lame/id3tags.patch b/meta/recip=
es-multimedia/lame/lame/id3tags.patch
index 1ce36b9e890..e71d943a227 100644
--- a/meta/recipes-multimedia/lame/lame/id3tags.patch
+++ b/meta/recipes-multimedia/lame/lame/id3tags.patch
@@ -7,7 +7,8 @@ https://sourceforge.net/p/lame/mailman/message/59358795/
 This has been also fixed in the dev tree and will be included in
 LAME release 4.1.
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [obsoleted by "frontend, libmp3lame: fix =
ID3v2
+                 UTF-8 tag path" upstream in lame-4.1]
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
=20
 diff --git a/frontend/parse.c b/frontend/parse.c
diff --git a/meta/recipes-multimedia/lame/lame/no-gtk1.patch b/meta/recip=
es-multimedia/lame/lame/no-gtk1.patch
index 1d7527e1800..fa6379b8a9a 100644
--- a/meta/recipes-multimedia/lame/lame/no-gtk1.patch
+++ b/meta/recipes-multimedia/lame/lame/no-gtk1.patch
@@ -1,4 +1,5 @@
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [obsoleted by "frontend: replace the mp3x=
 frame
+                 analyzer with a GTK4 implementation" upstream in lame-4=
.1]
=20
 # Acquired from OpenEmbedded
=20
--=20
2.43.0


