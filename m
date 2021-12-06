Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3EBC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 18:15:42 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de
 [116.202.209.171])
 by mx.groups.io with SMTP id smtpd.web12.55565.1638814540636174196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 10:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu
 header.s=mail header.b=Tg+Pnzgi;
 spf=pass (domain: fancydomain.eu, ip: 116.202.209.171,
 mailfrom: jasper@fancydomain.eu)
From: Jasper Orschulko <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1638814538;
	bh=n6SBtr8o+0H0NqIEAjEgme79kgnnzfbbg8k5uiSYyMY=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=Tg+Pnzgil4Doq/K1pERINWFflJjr8cmIefQhdiMHfGgNXsfYiAg2McO20s4jryN2H
	 aFPn6HC+Chqw7Av8Ve3eXLnIhzCnXFIXl125RhVSMluRdgk/vMdttzx6nclxex+Pvi
	 GX7sfVLOF6AHEjYMNdzTA4wn2dwxHFHRpxwYmnUZ0h2gpDqAU423nczUKbbdasp/61
	 vG+P3/AIEF79+K38R9K5PvSUzE0Lniejd+1BPkG4O223Kyb0Z6i9lYLEEc9FKBSRPq
	 v4G5tU0kOVFUE5ow/97MUWUzMKUQCDagilK5vYqUvwt0yCeRh85z0J0J25uLVBmIZY
	 Vfvl6/0IOXRyw==
To: openembedded-core@lists.openembedded.org
Cc: quaresma.jose@gmail.com,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Subject: [oe-core][PATCH 2/2] repo: upgrade 2.17.3 -> 2.18
Date: Mon,  6 Dec 2021 19:15:13 +0100
Message-Id: <20211206181513.6944-2-jasper@fancydomain.eu>
In-Reply-To: <20211206181513.6944-1-jasper@fancydomain.eu>
References: <20211206181513.6944-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 18:15:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159265

From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>

Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
---
 meta/recipes-devtools/repo/{repo_2.17.3.bb =3D> repo_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.17.3.bb =3D> repo_2.18.bb} (95=
%)

diff --git a/meta/recipes-devtools/repo/repo_2.17.3.bb b/meta/recipes-dev=
tools/repo/repo_2.18.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.17.3.bb
rename to meta/recipes-devtools/repo/repo_2.18.bb
index aeaec13dd7..bf5e8d0429 100644
--- a/meta/recipes-devtools/repo/repo_2.17.3.bb
+++ b/meta/recipes-devtools/repo/repo_2.18.bb
@@ -10,7 +10,7 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps=
;branch=3Dmain"
-SRCREV =3D "11b30b91df1f0e03b53da970ec2588e85817bacc"
+SRCREV =3D "4a478edb443864561089b2699c9e65c85fc5e036"
=20
 SRC_URI +=3D "file://0001-python3-shebang.patch"
=20
--=20
2.34.1


