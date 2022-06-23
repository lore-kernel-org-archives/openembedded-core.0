Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCA9CCA47C
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 16:44:26 +0000 (UTC)
Received: from tulikuusama2.dnainternet.net (tulikuusama2.dnainternet.net
 [83.102.40.151])
 by mx.groups.io with SMTP id smtpd.web08.69.1656002659115599281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 09:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.protection.outlook.com}: parse error
 for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain:
 vaisala.com, ip: 83.102.40.151, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 85C9F42357;
	Thu, 23 Jun 2022 19:44:17 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
 port 10041)
	with ESMTP id A5v-ha-pQ84u; Thu, 23 Jun 2022 19:44:16 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net
 [83.102.40.52])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 98E0042307;
	Thu, 23 Jun 2022 19:44:16 +0300 (EEST)
Received: from gasmonkey.vaisala.com (82-181-110-188.bb.dnainternet.fi
 [82.181.110.188])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 5EDDE7E;
	Thu, 23 Jun 2022 19:44:12 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: luca.ceresoli@bootlin.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv2 2/3] strace: Drop redundant oe_runmake parameter
Date: Thu, 23 Jun 2022 19:43:55 +0300
Message-Id: <20220623164356.3239-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623164356.3239-1-niko.mauno@vaisala.com>
References: <20220623164356.3239-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 16:44:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167278

PARALLEL_MAKE is now honored in ptest.bbclass, so drop redundant
parameter from oe_runmake call.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/strace/strace_5.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipes-d=
evtools/strace/strace_5.18.bb
index 3164ebca51..08f0f1d27e 100644
--- a/meta/recipes-devtools/strace/strace_5.18.bb
+++ b/meta/recipes-devtools/strace/strace_5.18.bb
@@ -33,7 +33,7 @@ TESTDIR =3D "tests"
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


