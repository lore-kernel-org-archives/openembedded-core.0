Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046BECA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8565.1790756215606304434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ySp9kMk4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F15B21A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BED0260749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F324E103298B0;
	Wed, 30 Sep 2026 10:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NIuDD8qr1xgk4GRg/WaWbizOjr8pnDhw9gk7RKp835E=;
	b=ySp9kMk4WwNqnikXrLTrH6Dn/wHilXkotCb3MHhnMJUKOSqoexjghn82/7G0mqWKBxmUAk
	lS9kro0XafiaCHCrVNl5LoRJ9b1or2be9SqFctYzxcMOmL6DOpsU9nd0gL9Fli9yXx8Pto
	VMLFKnE3w86HRlB2UExQm19K8RqMj9FkhXUetlx/g/cqnIubjavyup8eleMynowo+m57Jr
	u2BKgplgf2vo0RijKVtZ3TBfbRqOwNYGafp+TxGj+1GGQFt5YwE+ZbpSXfbuGYaKTS95mc
	+fM3wA/cLKGqJPu3UUqK5dR9V2HB3Fn2lwose8obxcS9og8butpsClXyEfcjTg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:35 +0200
Subject: [PATCH 10/24] git: upgrade 2.55.0 -> 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-10-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=2252;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=kjcx/vI7aNFbAT3TtUIN6i9NBwCTRB1DGjlxLd1r7y4=;
 b=ltelnFWwq3FhrwT8LbsYrCIZ2Wr5b12TsbS4HpRUv3p0ww6frE09awX5lj0DHc6QDfeCfK1VW
 QC5ilkbhYNlAYxuw9Nfu8EfY1cs4PMUaHBloJZa10x3xwm6mW1f96eK
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246934

Lots of UI and performance improvements, as well as bug fixes.

Full changelog can be found here:
https://gitlab.com/git-scm/git/-/blob/HEAD/Documentation/RelNotes/2.56.0.adoc

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/git/git/fixsort.patch                | 4 ++--
 meta/recipes-devtools/git/{git_2.55.0.bb => git_2.56.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 86b41fd8192e..6dda82dbdec3 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From e3bdf5adc50b12d8625e70415c81402e0e938b68 Mon Sep 17 00:00:00 2001
+From dbc552db68ca945a24d3cd15f39c6f9982cc317c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
@@ -23,7 +23,7 @@ Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd3
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/generate-configlist.sh b/tools/generate-configlist.sh
-index e28054f..96ddd51 100755
+index d1d2ba4..c259b77 100755
 --- a/tools/generate-configlist.sh
 +++ b/tools/generate-configlist.sh
 @@ -24,7 +24,7 @@ EOF
diff --git a/meta/recipes-devtools/git/git_2.55.0.bb b/meta/recipes-devtools/git/git_2.56.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.55.0.bb
rename to meta/recipes-devtools/git/git_2.56.0.bb
index 4535f949251e..6fc2d5d78e41 100644
--- a/meta/recipes-devtools/git/git_2.55.0.bb
+++ b/meta/recipes-devtools/git/git_2.56.0.bb
@@ -175,7 +175,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "0842dc384a23ac33ba3e570c4f3a8ded85963ee4713b1cd21153c3db41813d1e"
+SRC_URI[tarball.sha256sum] = "826817fd3671b8565586d6d49f688298de8354ab11db829c02720e5c74b9b39f"
 
 CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
 CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"

-- 
2.47.3


