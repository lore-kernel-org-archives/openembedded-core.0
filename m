Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id AD89874601
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:47:08 +0000 (UTC)
Received: from heron.blarg.de (pD9EBF56F.dip0.t-ipconnect.de [217.235.245.111])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 212062201A1;
	Fri, 21 Sep 2018 10:47:09 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 10:46:58 +0200
Message-Id: <20180921084658.13631-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMKF1spB414U2iQh0k9DYTK0WV2ay___ahp932cfCU8Stzc20Q@mail.gmail.com>
References: <CAMKF1spB414U2iQh0k9DYTK0WV2ay___ahp932cfCU8Stzc20Q@mail.gmail.com>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v2] libmpdclient: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 08:47:09 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/libmpdclient_2.15.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
new file mode 100644
index 000000000..dbee66e8d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
@@ -0,0 +1,12 @@
+SUMMARY = "C client library for the Music Player Daemon"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=06b9dfd2f197dc514d8ef06549684b77"
+HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
+
+inherit meson
+
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/libmpdclient \
+"
+SRCREV = "7754ffdfb9371cd398371cb2670a54e9e1e623e2"
+S = "${WORKDIR}/git"
-- 
2.18.0


