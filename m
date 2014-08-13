Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 70C6470A51
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 8D5392E3C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id FISO0nn2S2Zd
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 538E82E3E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 3D0E61467
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 31A881464
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 2FE2E34005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHlsVc004781
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:47:54 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHlshE004780
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:47:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:47:52 +0200
Message-Id: <05cf729057136c7ee7f3751f5c1061be30053f72.1407952036.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407952036.git.pkj@axis.com>
References: <cover.1407952036.git.pkj@axis.com>
In-Reply-To: <cover.1407952036.git.pkj@axis.com>
References: <cover.1407952036.git.pkj@axis.com>
Subject: [PATCH 1/1] gstreamer1.0-rtsp-server: Upgrade to 1.4.0
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:57 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...r1.0-rtsp-server_1.2.3.bb => gstreamer1.0-rtsp-server_1.4.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.2.3.bb => gstreamer1.0-rtsp-server_1.4.0.bb} (43%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.0.bb
similarity index 43%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.0.bb
index 78d35f3..66aa886 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.0.bb
@@ -2,8 +2,5 @@ include gstreamer1.0-rtsp-server.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
-SRC_URI[md5sum] = "239f805e755deb388162e957fcffff1d"
-SRC_URI[sha256sum] = "c12befa5ec63818842c150725d3e9e38bf9948366317b67dc2536dfd00765da1"
-
-
-
+SRC_URI[md5sum] = "974af05dbf867cade89b8d3101e3f197"
+SRC_URI[sha256sum] = "800a93ee6de8ca3946fbb2fa3878e41af44e27dde76c9399e30b93ba3e0bffe8"
-- 
1.9.0


