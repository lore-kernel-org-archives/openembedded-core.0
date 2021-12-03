Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4C1C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 13:50:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11844.1638539451760001111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 05:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CABF71396
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 05:50:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 755763F766
	for <openembedded-core@lists.openembedded.org>;
 Fri,  3 Dec 2021 05:50:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glew: update patch status
Date: Fri,  3 Dec 2021 13:50:39 +0000
Message-Id: <20211203135039.2649675-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 13:50:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159116

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glew/glew/0001-Fix-build-race-in-Makefile.patch             | 2 +-
 meta/recipes-graphics/glew/glew/no-strip.patch                  | 2 +-
 meta/recipes-graphics/glew/glew/notempdir.patch                 | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makef=
ile.patch b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefi=
le.patch
index 7edcfe8de8..2418646689 100644
--- a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.pat=
ch
+++ b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.pat=
ch
@@ -1,4 +1,4 @@
-Upstream-Status: Submitted [https://github.com/nigels-com/glew/pull/311]
+Upstream-Status: Backport [767e0316450911f1158bd4f7fd8dcd066bae5c55]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 From 0ce0a85597db48a2fca619bd95e34af091e54ae8 Mon Sep 17 00:00:00 2001
diff --git a/meta/recipes-graphics/glew/glew/no-strip.patch b/meta/recipe=
s-graphics/glew/glew/no-strip.patch
index e411f11cb5..5708d93082 100644
--- a/meta/recipes-graphics/glew/glew/no-strip.patch
+++ b/meta/recipes-graphics/glew/glew/no-strip.patch
@@ -1,7 +1,7 @@
 Don't forcibly strip the binaries.
=20
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Pending
+Upstream-Status: Backport [d7693eea09ac76c67f5f3aa538bb911ce2291e2c]
=20
 diff --git a/Makefile b/Makefile
 index 6a9803c..170c0ce 100644
diff --git a/meta/recipes-graphics/glew/glew/notempdir.patch b/meta/recip=
es-graphics/glew/glew/notempdir.patch
index 8d79ce0cdf..68b46b6641 100644
--- a/meta/recipes-graphics/glew/glew/notempdir.patch
+++ b/meta/recipes-graphics/glew/glew/notempdir.patch
@@ -2,6 +2,8 @@ We don't use the dist-* targets and hence DIST_DIR isn't =
used. The current code
 creates a new temp directory in /tmp/ for every invocation of make. Lets
 not do that.
=20
+https://github.com/nigels-com/glew/issues/334
+
 Upstream-Status: Pending [a revised version would be needed for upstream=
]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
--=20
2.25.1


