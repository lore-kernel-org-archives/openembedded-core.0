Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E73C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 15:42:53 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.19839.1708270969575396061
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 07:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=nHjiV8c3;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 528AC240028
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 16:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708270967; bh=CQnO3YLsm/lJlwFC8EtVhDop34bm/iOQL0cdLvrMDXs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=nHjiV8c3YE1ytVQeKiE5Ig+8YJgtpSlC0Tbf9YD99TTqF8cFULsVzd7VfLJsWlsON
	 DtHa5w+h6lEVKgy/EOAf/04+DTk/0Q5GDhMRWVDw9NlX4BZKIlqdamIZtqfHXPxffZ
	 WDyY4/s9lhvx+/KeA0l1CrSD3bKiF0uhzJqDgILOdEigpIQwqAAiyGtQ+xgyU5cXCs
	 odwYEJmQRtv6tKllO7b94B+B62rqCDW1lcQQ5PD4EtgZGeX0eaClERbJGAQT9D9DNd
	 rmRNaqNO5CRGWTkC9up0JwqS15nV4GzKP84Z/spq3E8aWh9ypG3M+86aiNfxuAMS6Y
	 AMSIrnINP0WNw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Td90k551yz9rxB;
	Sun, 18 Feb 2024 16:42:46 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH 1/2] libgit2: update 1.7.1 -> 1.7.2
Date: Sun, 18 Feb 2024 15:42:40 +0000
Message-Id: <20240218154240.1650484-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 15:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195834

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Update libgit2 to pull in securtiy fixes.

Changelog summary:
- A bug in git_revparse_single is fixed that could cause a Denial of
  Service attack. This fixes CVE-2024-24575

 - A bug in git_index_add is fixed that could lead to arbitrary code exec=
ution.
   This fixes CVE-2024-24577

 - A bug in the smart transport negotiation could have caused an out-of-b=
ounds
   read.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../libgit2/{libgit2_1.7.1.bb =3D> libgit2_1.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.7.1.bb =3D> libgit2_1.7.2=
.bb} (92%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.7.1.bb b/meta/recipes=
-support/libgit2/libgit2_1.7.2.bb
similarity index 92%
rename from meta/recipes-support/libgit2/libgit2_1.7.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.7.2.bb
index 92af0b8454..d1629c0c0b 100644
--- a/meta/recipes-support/libgit2/libgit2_1.7.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5bdf47bbc9a39d=
c6ce076d59e322dc17"
 DEPENDS =3D "curl openssl zlib libssh2 libgcrypt libpcre2"
=20
 SRC_URI =3D "git://github.com/libgit2/libgit2.git;branch=3Dmaint/v1.7;pr=
otocol=3Dhttps"
-SRCREV =3D "a2bde63741977ca0f4ef7db2f609df320be67a08"
+SRCREV =3D "a418d9d4ab87bae16b87d8f37143a4687ae0e4b2"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.2


