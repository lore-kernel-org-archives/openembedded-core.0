Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE5EC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 17:07:18 +0000 (UTC)
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net [83.102.40.153])
 by mx.groups.io with SMTP id smtpd.web11.1274.1720544828742644188
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 10:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.153, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 0F23B1154A;
	Tue,  9 Jul 2024 20:07:07 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id 11kRvhOfBZlw; Tue,  9 Jul 2024 20:07:06 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id D1AAB11543;
	Tue,  9 Jul 2024 20:07:06 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id A28173FF6;
	Tue,  9 Jul 2024 20:07:03 +0300 (EEST)
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 2/2] dnf: Fix missing leading whitespace with ':append'
Date: Tue,  9 Jul 2024 20:06:27 +0300
Message-Id: <20240709170627.81755-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709170627.81755-1-niko.mauno@vaisala.com>
References: <20240709170627.81755-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 17:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201669

From: Niko Mauno <niko.mauno@vaisala.com>

By adding a leading space character in the value field of appended
BitBake variable, we avoid the risk of inadvertent string
concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/dnf/dnf_4.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.20.0.bb b/meta/recipes-devto=
ols/dnf/dnf_4.20.0.bb
index 4757346cbf..98edab0614 100644
--- a/meta/recipes-devtools/dnf/dnf_4.20.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/d=
nf.git;branch=3Dmaster;protoc
            file://0001-lock.py-fix-Exception-handling.patch \
            "
=20
-SRC_URI:append:class-native =3D "file://0001-dnf-write-the-log-lock-to-r=
oot.patch"
+SRC_URI:append:class-native =3D " file://0001-dnf-write-the-log-lock-to-=
root.patch"
=20
 SRCREV =3D "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.39.2


