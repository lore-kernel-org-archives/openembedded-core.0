Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE8ECA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:43:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20990.1757076189631687646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 05:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 958B4153B
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 05:43:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9536C3F63F
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 05:43:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] tcl: also skip chanio-13.6
Date: Fri,  5 Sep 2025 13:43:03 +0100
Message-ID: <20250905124304.3377438-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223000

The io-* tests and chanio-* tests are in sync, so we should skip both
io-13.6 and chanio-13.6.

[ YOCTO #15421 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest   | 2 +-
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-d=
evtools/tcltk8/tcl8/run-ptest
index bea9d9ccfd0..dd46ebdeaa3 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -16,7 +16,7 @@ SKIP=3D"$SKIP exit-1.\*"
 # 15407 15421
 SKIP=3D"$SKIP \*io-46.1"
 # io-13.6 explicitly says it can fail on slow/loaded machines
-SKIP=3D"$SKIP io-13.6"
+SKIP=3D"$SKIP \*io-13.6"
 # 14825
 SKIP=3D"$SKIP socket-\* socket_inet-\*"
=20
--=20
2.43.0


