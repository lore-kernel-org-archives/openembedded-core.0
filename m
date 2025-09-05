Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67FFCA101C
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:43:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20991.1757076190036464273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 05:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 441501595
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 05:43:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4390B3F63F
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 05:43:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] tcl: skip http11 tests
Date: Fri,  5 Sep 2025 13:43:04 +0100
Message-ID: <20250905124304.3377438-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905124304.3377438-1-ross.burton@arm.com>
References: <20250905124304.3377438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223001

These tests are either unstable under load, or just unstable.

A ticket has been filed upstream[1] but for now disable them.

[ YOCTO #15467 ]

[1] https://core.tcl-lang.org/tcl/tktview/3764f4e81f1483ab554c6d60f848388=
7bde28221

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest   | 3 +++
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 2135b170742..c8acb4846f2 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -18,6 +18,9 @@ SKIP=3D"$SKIP \*io-46.1"
 SKIP=3D"$SKIP \*io-13.6"
 # 14825
 SKIP=3D"$SKIP socket-\* socket_inet-\*"
+# These tests seem to be unreliable:
+# https://core.tcl-lang.org/tcl/tktview/3764f4e81f1483ab554c6d60f8483887=
bde28221
+SKIP=3D"$SKIP http11-\*"
 # tries to access google.com
 SKIP=3D"$SKIP httpProxy-\*"
=20
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-d=
evtools/tcltk8/tcl8/run-ptest
index dd46ebdeaa3..687e06fa4bb 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -19,6 +19,9 @@ SKIP=3D"$SKIP \*io-46.1"
 SKIP=3D"$SKIP \*io-13.6"
 # 14825
 SKIP=3D"$SKIP socket-\* socket_inet-\*"
+# These tests seem to be unreliable:
+# https://core.tcl-lang.org/tcl/tktview/3764f4e81f1483ab554c6d60f8483887=
bde28221
+SKIP=3D"$SKIP http11-\*"
=20
 for i in tests/*.test; do
     i=3D$(basename $i)
--=20
2.43.0


