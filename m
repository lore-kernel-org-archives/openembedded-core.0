Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464EEC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 19:16:54 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net
 [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web11.11813.1655925408606677994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.protection.outlook.com}: parse error
 for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain:
 vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id D070516404;
	Wed, 22 Jun 2022 22:16:46 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
 port 10041)
	with ESMTP id 9IurVT_oeAa5; Wed, 22 Jun 2022 22:16:46 +0300 (EEST)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
 [83.102.40.54])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 9648F163C1;
	Wed, 22 Jun 2022 22:16:46 +0300 (EEST)
Received: from gasmonkey.vaisala.com (82-181-110-188.bb.dnainternet.fi
 [82.181.110.188])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 6C55D1BE;
	Wed, 22 Jun 2022 22:16:43 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/3] strace: Drop redundant oe_runmake parameter
Date: Wed, 22 Jun 2022 22:16:14 +0300
Message-Id: <20220622191615.10168-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220622191615.10168-1-niko.mauno@vaisala.com>
References: <20220622191615.10168-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:16:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167250

PARALLEL_MAKE is now honored in ptest.bbclass, so drop redundant
parameter from oe_runmake call.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/strace/strace_5.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_5.17.bb b/meta/recipes-d=
evtools/strace/strace_5.17.bb
index c7fd9edf40..0542780c00 100644
--- a/meta/recipes-devtools/strace/strace_5.17.bb
+++ b/meta/recipes-devtools/strace/strace_5.17.bb
@@ -34,7 +34,7 @@ TESTDIR =3D "tests"
 PTEST_BUILD_HOST_PATTERN =3D "^(DEB_CHANGELOGTIME|RPM_CHANGELOGTIME|WARN=
_CFLAGS_FOR_BUILD|LDFLAGS_FOR_BUILD)"
=20
 do_compile_ptest() {
-	oe_runmake ${PARALLEL_MAKE} -C ${TESTDIR} buildtest-TESTS
+	oe_runmake -C ${TESTDIR} buildtest-TESTS
 }
=20
 do_install_ptest() {
--=20
2.35.1


