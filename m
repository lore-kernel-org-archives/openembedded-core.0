Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.3508.1630564383559826238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 23:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 81F115FC95
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 08:33:00 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] mirrors.bbclass: provide additional rule for git repo fallbacks
Date: Thu,  2 Sep 2021 08:31:17 +0200
Message-Id: <20210902063116.176984-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Git hosting servers that require a slightly different URL when accessing
repositories via https protocol instead of the git native protocol
are not uncommon (servers using cgit as web UI). Provide a general rule
to try HOST/git/PATH via https as git repo fallback.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 87bba41472..ab75ca1bb6 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -73,4 +73,5 @@ git://git.gnome.org/.*        git://gitlab.gnome.org/GN=
OME/PATH;protocol=3Dhttps \
 git://git.savannah.gnu.org/.* git://git.savannah.gnu.org/git/PATH;protoc=
ol=3Dhttps \n \
 git://git.yoctoproject.org/.* git://git.yoctoproject.org/git/PATH;protoc=
ol=3Dhttps \n \
 git://.*/.*                   git://HOST/PATH;protocol=3Dhttps \n \
+git://.*/.*                   git://HOST/git/PATH;protocol=3Dhttps \n \
 "
--=20
2.25.1

