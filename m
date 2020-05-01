Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5128.1588369921393499350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 14:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=PBIMFL1X;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=4yvm=6p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49DQvM3kn5z4y
	for <openembedded-core@lists.openembedded.org>; Fri,  1 May 2020 23:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588369919;
	bh=CWY9yQG/HWAIkx1ZkdSEKLVgTcP9ZFQ1bZL6sko4Bt0=;
	h=From:To:Subject:Date:From;
	b=PBIMFL1X+hJrFeDRcsK2pBS77fdS1RESfXaJQTAncgEuAxzt/TDmUwTM/gkW1viqR
	 2qcRwfaGsukkemWWW2BKBvrBP1qsN3deLvxhzNxi5MeKqZudilFGxYyA8tvP+6feoQ
	 0NwDeW/f5XhwIomkeVsYQZUzzRk/ZpHJaWnZIFNdsi0Z8S07nLqJGvf8X0UlOnHT0X
	 y80NuMHCtT7llqIwwibaKcdUsdYQ/kzWRvIHv3QXdMtSgWWRvQBRICt+32SMPnSYLu
	 UPY/QUf0IA0/eTOMTs0gcoqkQvREAKa657kBbgxEJpdKrJFk/TIn/VgLU1VeVguR9p
	 l/867v2jxp+0JhjXiluqA/1Ryd6SeDy69IU9BbZwt6XLB2vzEh5PkC71QEJ6qf6j9i
	 SWfzHOv82fRtyAJhvRDt9cyLbe/0/hmENp6c3FIk+WafX1ugadF19YCIuQNySIu9qz
	 LrRLUXc9Ryv35I0s2WJWZJk0eTDLtMjxcJDTaGnN4WFUXGv3RqFqBJ2liw8PsYq4S/
	 aHtda8IzlmGUHj7dPWeNQXv8vJ3UETPfKy0wVxijUx4QOfwTT6mgT1LExJNYLnrgmH
	 vXf/VGc5Ab8ek9/yRqLf6f7jzCKYwnPXCeIYO4BBPamZscwxfqJxS6WZLHpzZibD2u
	 +UgsmPP74bMnPdzPgory8NmA=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] gnupg: upgrade 2.2.17 -> 2.2.19
Date: Sat,  2 May 2020 00:51:58 +0300
Message-Id: <20200501215158.9149-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 287de363f80a2f9919b942a1349f58575e8b91d8)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ includes the fix for CVE-2019-14855 ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnupg/{gnupg_2.2.17.bb => gnupg_2.2.19.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.17.bb => gnupg_2.2.19.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.17.bb b/meta/recipes-support/gnupg/gnupg_2.2.19.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.17.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.19.bb
index 689cf8a75e..a0577d61d3 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.19.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 
-SRC_URI[md5sum] = "1ba2d9b70c377f8e967742064c27a19c"
-SRC_URI[sha256sum] = "afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514"
+SRC_URI[md5sum] = "cb3b373d08ba078c325299945a7f2818"
+SRC_URI[sha256sum] = "242554c0e06f3a83c420b052f750b65ead711cc3fddddb5e7274fcdbb4e9dec0"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1

