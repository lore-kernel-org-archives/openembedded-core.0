Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A14C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 14:30:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10261.1634826613408843089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FF08D6E
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:30:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B59B03F73D
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:30:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] strace: show test suite log on failure
Date: Thu, 21 Oct 2021 15:30:10 +0100
Message-Id: <20211021143010.803736-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 14:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157284

If the tests fail, dump the log so we can see the failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes=
-devtools/strace/strace/run-ptest
index 3a51fb0be9..42ececdc4f 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -3,4 +3,4 @@ export TIMEOUT_DURATION=3D240
 chown nobody tests
 chown nobody tests/*
 chown nobody ../ptest
-su nobody -c "make -B -C tests -k test-suite.log"
+su nobody -c "make -B -C tests -k test-suite.log" || cat tests/test-suit=
e.log
--=20
2.25.1


