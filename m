Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4144ACA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 19:01:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.60310.1756753309382812925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 12:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 642D22B
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Sep 2025 12:01:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 506913F6A8
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Sep 2025 12:01:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcl: also skip chanio-13.6
Date: Mon,  1 Sep 2025 20:01:42 +0100
Message-ID: <20250901190142.3651209-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222678

The io-* tests and chanio-* tests are in sync, so we should skip both
io-13.6 and chanio-13.6.

[ YOCTO #15421 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index be067f13ea7..2135b170742 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -15,7 +15,7 @@ SKIP=3D"$SKIP exit-1.\*"
 # 15407 15421
 SKIP=3D"$SKIP \*io-46.1"
 # io-13.6 explicitly says it can fail on slow/loaded machines
-SKIP=3D"$SKIP io-13.6"
+SKIP=3D"$SKIP \*io-13.6"
 # 14825
 SKIP=3D"$SKIP socket-\* socket_inet-\*"
 # tries to access google.com
--=20
2.43.0


