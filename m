Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05751CD11DB
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 20:16:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7626.1711052162720822058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 13:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99D3F1063
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 13:16:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E0633F762
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 13:16:01 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] tcl: skip I/O channel 46.1
Date: Thu, 21 Mar 2024 20:15:57 +0000
Message-Id: <20240321201557.2309256-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321201557.2309256-1-ross.burton@arm.com>
References: <20240321201557.2309256-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 20:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197428

From: Ross Burton <ross.burton@arm.com>

This test, which is in both the io and chanio test suites, has short
timeouts which can trigger on loaded systems.

[ YOCTO #15407 #15421 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index affce9ab815..a403a74bb64 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -13,6 +13,8 @@ SKIP=3D"$SKIP async-\* event-\*"
 SKIP=3D"$SKIP cmdMZ-6.6"
 # 15081
 SKIP=3D"$SKIP exit-1.\*"
+# 15407 15421
+SKIP=3D"$SKIP \*io-46.1"
 # 14825
 SKIP=3D"$SKIP socket-\* socket_inet-\*"
=20
--=20
2.34.1


