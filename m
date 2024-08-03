Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B5C52D6D
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 10:36:12 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web11.6300.1722681361864423777
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Aug 2024 03:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 197F913D92;
	Sat,  3 Aug 2024 13:35:59 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id 3PRaxkt5rvIY; Sat,  3 Aug 2024 13:35:58 +0300 (EEST)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net [83.102.40.54])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id D1D1E12A0D;
	Sat,  3 Aug 2024 13:35:58 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 969CD226;
	Sat,  3 Aug 2024 13:35:56 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [scarthgap][PATCH] libyaml: Fix warning regarding unpatched CVE
Date: Sat,  3 Aug 2024 13:35:54 +0300
Message-Id: <20240803103554.100029-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 10:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202933

This commit incorporates changes in following master branch commits:

  f3479f74c9 libyaml: Amend CVE status as 'upstream-wontfix'
  3ebb2ca832 libyaml: Change CVE status to wontfix
  56b6b35626 libyaml: Update status of CVE-2024-35328

which mitigate the following warning with cve-check.bbclass:

   WARNING: libyaml-native-0.2.5-r0 do_cve_check: Found unpatched CVE (CV=
E-2024-35328), for more information check .../tmp/work/x86_64-linux/libya=
ml-native/0.2.5/temp/cve.log

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes=
-support/libyaml/libyaml_0.2.5.bb
index 4cb5717ece..1c6a5fcb45 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,4 +18,6 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk =3D ""
 DISABLE_STATIC:class-native =3D ""
=20
+CVE_STATUS[CVE-2024-35328] =3D "upstream-wontfix: Upstream thinks there =
is no working code that is exploitable - https://github.com/yaml/libyaml/=
issues/302"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.2


