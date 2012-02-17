Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Rzc98-0000TA-2d
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Feb 2012 23:55:50 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2012 23:56:11 +0100
Message-Id: <1329519371-12600-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329519371-12600-1-git-send-email-obi@opendreambox.org>
References: <1329519371-12600-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] mpeg2dec: depend on libx11 conditionally
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
X-List-Received-Date: Mon, 20 Feb 2012 22:55:50 -0000

* mpeg2dec currently doesn't build if x11 is unavailable,
  due to an unconditional dependency on libx11. However,
  libx11 is not required to build mpeg2dec.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index f2865f6..f38066a 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -6,7 +6,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://include/mpeg2.h;beginline=1;endline=22;md5=ead62602d4638329d3b5b86a55803154"
 
-DEPENDS = "virtual/libx11"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 
 PR = "r2"
 
-- 
1.7.5.4



