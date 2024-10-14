Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C61D16252
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:25:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53716.1728908697917492445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD301007
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:25:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E76303F71E
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:24:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] tcl: skip io-13.6 test case
Date: Mon, 14 Oct 2024 13:24:47 +0100
Message-Id: <20241014122448.2290641-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205762

---- Result was:
{abcdefghj
01234} 0
---- Result should have been (exact matching):
{abcdefghj
} 1 01234 0
=3D=3D=3D=3D io-13.6 FAILED

This test is documented as failing on slow machines, so just skip it.

[ YOCTO #15407 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index a403a74bb64..c485e535c71 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -15,6 +15,8 @@ SKIP=3D"$SKIP cmdMZ-6.6"
 SKIP=3D"$SKIP exit-1.\*"
 # 15407 15421
 SKIP=3D"$SKIP \*io-46.1"
+# io-13.6 explicitly says it can fail on slow/loaded machines
+SKIP=3D"$SKIP io-13.6"
 # 14825
 SKIP=3D"$SKIP socket-\* socket_inet-\*"
=20
--=20
2.34.1


