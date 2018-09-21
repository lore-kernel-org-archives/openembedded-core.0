Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 1653B74C97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:48:09 +0000 (UTC)
Received: from heron.blarg.de (pD9EBF56F.dip0.t-ipconnect.de [217.235.245.111])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id CC5FF2201A1;
	Fri, 21 Sep 2018 10:48:09 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 10:48:06 +0200
Message-Id: <20180921084806.13896-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMKF1sqitMcnQHt73gDbsMyWpFatxOmKoH=suurNz7HmFt45CA@mail.gmail.com>
References: <CAMKF1sqitMcnQHt73gDbsMyWpFatxOmKoH=suurNz7HmFt45CA@mail.gmail.com>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v2] mpc: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 08:48:09 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/mpc_0.30.bb       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
new file mode 100644
index 000000000..6fac5b2e7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A minimalist command line interface to the Music Player Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+HOMEPAGE = "https://www.musicpd.org/clients/mpc/"
+
+inherit meson
+
+DEPENDS += " \
+    libmpdclient \
+"
+
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/mpc \
+"
+SRCREV = "6fc4e639152daeebb19e0fdfb277252acc734fc5"
+S = "${WORKDIR}/git"
-- 
2.18.0


