Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.35719.1585226164683621537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 05:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=RsHcTQJY;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 02D90602D7;
	Thu, 26 Mar 2020 13:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585226161;
	bh=IvlYQkEDvNCvZufjGibV1tQEZThDAkhSJe5Hv/ayLko=;
	h=From:To:Cc:Subject:Date:From;
	b=RsHcTQJYEJjUUxbw05Tr2EoGEJ/HIo9tNqzXTDORJrpAHWk3AUNU6G4zeIGW3j8ld
	 oe8ud80pC3/wkp71wTCqJljUvQy2fq6pITSL/hoj8zSJ7MTmM+3ChbrR/zXxX59b3L
	 /o/KaqH9zjLnIPXo1kfEioyWxEpRIaEcnOkaVcFg7ssvyTxl3BbMgSWDieLhifULQy
	 x3qaRvI7ZjrpQDGf0kqHOkHCmxUaxtvqrpevKwFjzWDogiQzRrtTMX5VjxJc79j5TW
	 S271ucK5KYWxTJ+lKe8FTACkrwzOwCbrDpxlnjNIBcI/RcqtyaGxwwWfzkximpyKi/
	 yqsKdhbPUC3fA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] ell: upgrade 0.28 -> 0.30
Date: Thu, 26 Mar 2020 13:35:12 +0100
Message-Id: <1585226112-13506-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Since commit 5a0d5de68957ed11407694cf1acee1ab1cb4be79 ("build: Require at least version 0.29 when building with external ELL") in iwd [1]
ell version 0.29 is required.

Also, this is a bug fix release, see after:

ver 0.30:
	Fix issue with missing export of RTNL helper functions.

ver 0.29:
 	Fix issue with time overflow on 32-bit systems.
 	Add support for RTNL helper functionality.

[1] - https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=5a0d5de68957ed11407694cf1acee1ab1cb4be79

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-core/ell/{ell_0.28.bb => ell_0.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.28.bb => ell_0.30.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.28.bb b/meta/recipes-core/ell/ell_0.30.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.28.bb
rename to meta/recipes-core/ell/ell_0.30.bb
index 464bf63..17045b3 100644
--- a/meta/recipes-core/ell/ell_0.28.bb
+++ b/meta/recipes-core/ell/ell_0.30.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "e38089e54d4b41e508bbb7f37a4a59d9"
-SRC_URI[sha256sum] = "6254fcb98d681cb2c3078dde462ba20bf90e6c10919204c6878a4381adcdb74b"
+SRC_URI[md5sum] = "79c757858688cc6c36087605234d87a8"
+SRC_URI[sha256sum] = "51cf8cc66a9d1038e41f7d619ea5660aa4476904496562b2d45ca79370ca4a5e"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.7.4

