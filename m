Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4oS-0002hg-Hf
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:09:36 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qh4kd-0000pM-GL from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:05:39 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:04:00 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:05:37 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:05:32 -0700
Message-Id: <da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310583292.git.tom_rini@mentor.com>
References: <cover.1310583292.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 13 Jul 2011 19:05:38.0442 (UTC)
	FILETIME=[DA3C5EA0:01CC418F]
Subject: [PATCH 1/4] libsamplerate0: Update checksums
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 19:09:36 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../libsamplerate/libsamplerate0_0.1.7.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
index d08640f..194f885 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
@@ -9,8 +9,8 @@ PR = "r0"
 SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
            file://libsamplerate-0.1.7-macro-quoting.patch"
 
-SRC_URI[md5sum] = "6731a81cb0c622c483b28c0d7f90867d"
-SRC_URI[sha256sum] = "78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
+SRC_URI[md5sum] = "ad093e60ec44f0a60de8e29983ddbc0f"
+SRC_URI[sha256sum] = "e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b19ae71d2890dbc9c"
 S = "${WORKDIR}/libsamplerate-${PV}"
 
 inherit autotools pkgconfig
-- 
1.7.0.4



