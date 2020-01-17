Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B49177FBDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjt5XFVz3w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281282;
	bh=0Yqc5Smfw8Vn7dxEkhrqTrhmPPCyiORYHINmLUVYrfU=;
	h=From:To:Subject:Date:From;
	b=brtgqjkIQ2LNVCHGtBSNx7HS++rgdSfVJXSt7RqiacrVm+oOSyZ79VJzKxdWBNABw
	7rpQsh9MGYJAx9+0bu0Nh086lSiq0eLqFOYWy4St/drxErSGjR4YJJ4+HuAnv2hSdY
	Vfbz7CmRgnoDJaFIjEJU3QXvpSpRkM2oS8KnUK9PzxonzFtFOvwHXukwi3ek7uVU7y
	Jsi/3141Un5NmPaDKT5FV2hNlEiprVg9+r0U4vcSwB92Ioah4Zc6aXQtJMzM1FUE5s
	7TiuTg2yx74IPFZRVKvGP4rzmajfQKm0+0YOXKKinWOTHTk3x/NWfM4ggIH8yte9S5
	cJMg6z/jQLfR9g/gOrTAwMfjAWUBO+/2lP9Kot6N+9qXARUijBA9bWDCDwUBmHks4y
	ghml3MgFcM1mXl2jam9IIOlCXPxrvlVUT6MuVMgu1vbO/LPzVvOgVB3Pa1TpBXro7v
	DpKYBNkAlhYLFCWL+xJ2NfQf95YBxXF2Qd78ERYOgT8oOgwuvosGRyJxczPlKbBGYp
	zciLmR+9dLiee9qzpwjRIajlio+fQs6XC5KxdYrAbF4LapoPCOFpTsPuPr/TF6WlVs
	LFwAnv8cXkJgPWrkreGBA2TI8609mlYMd8MhG4syM1bcaYs7p8ZjnontTbt3fostmD
	IFVL56ny4CVbD53HPoq6WmWI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:35 +0200
Message-Id: <20200117171436.17131-15-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] lz4: Whitelist CVE-2014-4715
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:41 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/lz4/lz4_1.8.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/lz4/lz4_1.8.3.bb b/meta/recipes-support/lz4/lz4_1.8.3.bb
index 125836f7bf..605e148d81 100644
--- a/meta/recipes-support/lz4/lz4_1.8.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.8.3.bb
@@ -18,6 +18,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
+# Fixed in r118, which is larger than the current version.
+CVE_CHECK_WHITELIST += "CVE-2014-4715"
+
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
 do_install() {
-- 
2.17.1


