Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6201DCCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:33:29 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.26196.1657528406540034823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=NoizP80y;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 6394AE786B;
	Mon, 11 Jul 2022 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657528403; bh=QSvv3DBjMdFREaC39Os0KFwAw8Ah7/+rH+Ookk2tD9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NoizP80yCKtabmnCUunCclWEMKpKlvyWonpG5qTh35vb0NcIOxv5LemZA6EBL7lX2
	 YsS2h1xoq9f5gxD1LtetXDIYNFSvGOOhVdTFnEKeXPApKxsZ+JNhMIfOTJRuQrtIJT
	 1PeINVeRYZ44HV9hNodzG28rnvNNDSBYwXUhEnEgXDOCk0JXvRn59LqkkNIYiF2kbS
	 gid9itTnDfOC57U44qOyMO6Y5zdhwpD2D0+JY0eu4PUSIDofGu95uqiFK7T3IUez4r
	 jkaEtXr6awAKXBvKQkxj5W8sMD7BabHGDBfrvmtdC09jhCp03D41TVJbAasf81/fMZ
	 4/ENBaLXbKDWw==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [OE-core] [PATCH 2/2] zlib: minizip: add recipe
Date: Mon, 11 Jul 2022 10:33:09 +0200
Message-Id: <20220711083309.1749253-2-sean@geanix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711083309.1749253-1-sean@geanix.com>
References: <20220711083309.1749253-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 08:33:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167862

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-core/zlib/minizip_1.2.12.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/zlib/minizip_1.2.12.bb

diff --git a/meta/recipes-core/zlib/minizip_1.2.12.bb b/meta/recipes-core=
/zlib/minizip_1.2.12.bb
new file mode 100644
index 0000000000..548bb8c62b
--- /dev/null
+++ b/meta/recipes-core/zlib/minizip_1.2.12.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Minimal zip library using deflate from zlib"
+HOMEPAGE =3D "http://zlib.net/"
+SECTION =3D "libs"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://MiniZip64_info.txt;beginline=3D53;endline=3D=
73;md5=3D02090b3a3511ed8a910b77dae6906cea"
+
+include zlib.inc
+
+inherit autotools
+
+DEPENDS =3D "zlib"
+
+S =3D "${WORKDIR}/zlib-${PV}/contrib/minizip"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.36.1


