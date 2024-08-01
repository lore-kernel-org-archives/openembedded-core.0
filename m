Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3724FC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 10:17:36 +0000 (UTC)
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net [83.102.40.153])
 by mx.groups.io with SMTP id smtpd.web11.64907.1722507447867648441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 03:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.153, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 3E6DA11A96;
	Thu,  1 Aug 2024 13:17:25 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id kYvphXYnLBOI; Thu,  1 Aug 2024 13:17:24 +0300 (EEST)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net [83.102.40.55])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id D2DC1119CE;
	Thu,  1 Aug 2024 13:17:24 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 9782F2C70;
	Thu,  1 Aug 2024 13:17:22 +0300 (EEST)
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] libyaml: Amend CVE status as 'upstream-wontfix'
Date: Thu,  1 Aug 2024 13:17:19 +0300
Message-Id: <20240801101719.89910-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 10:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202729

From: Niko Mauno <niko.mauno@vaisala.com>

Use an existing defined CVE_CHECK_STATUSMAP key in
meta/lib/oe/cve_check.py in order to avoid following complaint from
BitBake:

  WARNING: libyaml-native-0.2.5-r0 do_create_spdx: Invalid detail "wontfi=
x" for CVE_STATUS[CVE-2024-35328] =3D "wontfix: Upstream thinks there is =
no working code that is exploitable - https://github.com/yaml/libyaml/iss=
ues/302", fallback to Unpatched

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes=
-support/libyaml/libyaml_0.2.5.bb
index 2154910d0c..1c6a5fcb45 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,6 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk =3D ""
 DISABLE_STATIC:class-native =3D ""
=20
-CVE_STATUS[CVE-2024-35328] =3D "wontfix: Upstream thinks there is no wor=
king code that is exploitable - https://github.com/yaml/libyaml/issues/30=
2"
+CVE_STATUS[CVE-2024-35328] =3D "upstream-wontfix: Upstream thinks there =
is no working code that is exploitable - https://github.com/yaml/libyaml/=
issues/302"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.2


