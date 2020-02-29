Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C1BCF619E6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 09:51:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48V1rB3kvyz4S
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582969866;
	bh=W/dB3MTWfjEm5Pg2/OdWeccpKh0Z68/ug1/GY8Bp240=;
	h=From:To:Subject:Date:From;
	b=oxmKKT0z/rVSZWcIWEO+HNKYyTUUBqggydWYsJHh3gQwWptslI01lbwMccYDEaKN6
	CypaNWglkWDQf0hAVKbirwAF8Y8UhAXa+SPAo0uWvvmBShPWDU9YixSXmJAknnf40d
	TLDX098Qi+16vlP6mf2A8PgcA8fIlbaurDCtwFGTTgYoyEyyRR79O47oJILeccz10g
	SVE50NS6lNFxgfLi/TWutmv5fQoZ1ewjoaU19PvZhRL7Ph/Uhx23XQgS7+5+vY67im
	lgwntONIAZo/gIBou80rVkLeDuyGDNOHuES+HVh2IeNbx3frgONa5pE0Q6BVpENPV1
	fzlcqfoD8o1x5Rvu/bGp+hAwAHso7+izfoMKwRlOuWjGPflIoOTYcD91rUCEo86xcb
	6pwZU+Ai100Ci/RDlFo5/AZXk/nkQDQAcJm9yZnp03+H/mBfRbShTsVb9wX4kjepTO
	L5Dd/w9e7/4Boxz6+JeEKgx5F080PGbAFnfkm3yIN1XEIY7ltdaNMmtpinWGBYs3zz
	owHjwYehCuCqVmM+xrYvfm6dHfLtfxeEEME1vVBkxdaEP0kUIgpIXZ0VAx7yuXjQ2Q
	R15mlgYWWvfSqdRPqb6bKyiLAD5h8IHI1bjJii2hQXnHHwvx0fOhrltOf7HXrZ8wjP
	f4jua3dXMc/jenBlLQKLHUHw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 11:51:04 +0200
Message-Id: <20200229095104.31724-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ncurses: Comment out version parsing that broke CVE checking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Feb 2020 09:51:07 -0000

This will be needed again when using patchlevel versions again.
Also make it more generic.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/ncurses/ncurses_6.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index b6d899c878..723e685a9b 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -10,4 +10,5 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
 
-CVE_VERSION = "6.1.${@d.getVar("PV").split('+')[1]}"
+# This is needed when using patchlevel versions like 6.1+20181013
+#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.17.1


