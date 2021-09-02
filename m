Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1766.1630599887947777985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F68011B3
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B2403F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/14] quota: remove BSD license
Date: Thu,  2 Sep 2021 17:24:24 +0100
Message-Id: <20210902162435.1375245-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Only the 'quot' tool was BSD licensed, and this was removed upstream in
commit 5d30a29 (since 4.05).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/quota/quota_4.06.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.06.bb b/meta/recipes-ext=
ended/quota/quota_4.06.bb
index 5115cb389ae..e32bdd4c32b 100644
--- a/meta/recipes-extended/quota/quota_4.06.bb
+++ b/meta/recipes-extended/quota/quota_4.06.bb
@@ -3,7 +3,7 @@ SECTION =3D "base"
 HOMEPAGE =3D "http://sourceforge.net/projects/linuxquota/"
 DESCRIPTION =3D "Tools and patches for the Linux Diskquota system as par=
t of the Linux kernel"
 BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D18136&atid=3D=
118136"
-LICENSE =3D "BSD & GPLv2+ & LGPLv2.1+"
+LICENSE =3D "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://rquota_server.c;beginline=3D1;endline=3D20;=
md5=3Dfe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=3D1;endline=3D17;md5=3D=
24d5a8792da45910786eeac750be8ceb"
=20
--=20
2.25.1

