Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4FBC63717
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de
 [176.9.13.188])
 by mx.groups.io with SMTP id smtpd.web08.31423.1650219093777440070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 11:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu
 header.s=mail header.b=ZWFGqgZE;
 spf=pass (domain: fancydomain.eu, ip: 176.9.13.188,
 mailfrom: jasper@fancydomain.eu)
From: Jasper Orschulko <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1650219090;
	bh=lr5+VjQilJNn9RvhuK5Z+kGR6qQrcdoPqUP7xbGVh8c=;
	h=From:To:Cc:Subject;
	b=ZWFGqgZENKNoLOITha1EPtW+Nj0pbobMygyCbKkH2Bxiwf67aKOPJynfVpZq9VVVI
	 MWdF93wEqrnnomjd0o2i5wxDtd0Z4veyzKQYyHQjIRIfjFAQig0E0cIflHMIaorbR5
	 2UvaZWumbZXxZPZ4jlvCwN8PJkEFMpxFkEUzOQLe5pSiS2TOHxGEb8Sp5RO4TuK9fY
	 on244zEa7zxcNLH2wO6YrGMRfE/RbtZ0ACCyqbfROyMjmxaT8gQ+5sginbV6pmV9hz
	 eYjgkKQ8kXQK8ymwVRRYvMaf9XA4TdTcRAR1jyy4HeTfci4/JlLRHhpfflFMqXJOjC
	 LnbxLKW4sHvlA==
To: openembedded-core@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [OE-core][PATCH] repo: upgrade 2.22 -> 2.23
Date: Sun, 17 Apr 2022 20:10:56 +0200
Message-Id: <20220417181056.45231-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164577

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 meta/recipes-devtools/repo/{repo_2.22.bb =3D> repo_2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.22.bb =3D> repo_2.23.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.22.bb b/meta/recipes-devto=
ols/repo/repo_2.23.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.22.bb
rename to meta/recipes-devtools/repo/repo_2.23.bb
index a99d5d7070..0b4e9743a6 100644
--- a/meta/recipes-devtools/repo/repo_2.22.bb
+++ b/meta/recipes-devtools/repo/repo_2.23.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57"
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps=
;branch=3Dmain \
            file://0001-python3-shebang.patch \
            "
-SRCREV =3D "cc879a97c3e2614d19b15b4661c3cab4d33139c9"
+SRCREV =3D "d56e2eb4216827284220fcc35af42e60b4faaea6"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.co=
m/GerritCodeReview/git-repo.git"
=20
--=20
2.35.3


