Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.3511.1630564425573273934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 23:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 3228E5FC95
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 08:33:43 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] mirrors.bbclass: remove redundant server-specific mirrors
Date: Thu,  2 Sep 2021 08:31:19 +0200
Message-Id: <20210902063116.176984-2-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902063116.176984-1-dwagenknecht@emlix.com>
References: <20210902063116.176984-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

With the previously added general git repo fallback rule the server
specific fallback mirrors for git.savannah.gnu.org and
git.yoctoproject.org are redundant. Remove them.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 meta/classes/mirrors.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ab75ca1bb6..ba325a658b 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -70,8 +70,6 @@ ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 MIRRORS +=3D "\
 git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=3Dhtt=
ps \n \
 git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=
=3Dhttps \n \
-git://git.savannah.gnu.org/.* git://git.savannah.gnu.org/git/PATH;protoc=
ol=3Dhttps \n \
-git://git.yoctoproject.org/.* git://git.yoctoproject.org/git/PATH;protoc=
ol=3Dhttps \n \
 git://.*/.*                   git://HOST/PATH;protocol=3Dhttps \n \
 git://.*/.*                   git://HOST/git/PATH;protocol=3Dhttps \n \
 "
--=20
2.25.1

