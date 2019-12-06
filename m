Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id B5C887FA14
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 19:55:12 +0000 (UTC)
IronPort-SDR: VCSNgM/tavQ+Wy50m4i+hiTLcedxUOOL2nZDz54YOnLUpTYXAiHrCgD/NHSU1Vpklg2aruq/DG
	s2FHRTnSuMFhL1dDDDp53YDzJZDb8HFqTp9aI7vgzFHlO3mPoIP2CuEpox372wbCgWLi52Y+zm
	Vss4TC8+c8YSi1Ep89sS/MYxbJxoP+UhxdUtwpgXkPeh0Nh3nLWDPX9qFUihyVA9jeoQ3hHPm/
	zeTtz4Wf4DAzx21VOUbbqcYU6yjXsRo1v6DU6cxM1GTqN1cKbscUzXdoWDlqYcLpxrRjcaJGxM
	8Mg=
X-IronPort-AV: E=Sophos;i="5.69,285,1571695200"; 
   d="scan'208";a="3346883"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 20:55:02 +0100
Message-Id: <20191206195504.19361-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206195504.19361-1-pkj@axis.com>
References: <20191206195504.19361-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [zeus][PATCH 2/4] alsa-utils: Trim the text part used for the license file checksum
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
X-List-Received-Date: Fri, 06 Dec 2019 19:55:13 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids including irrelevant information when calculating the
license checksum.

License-Update: Trim the text part used for the license file checksum
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
index 03b5c8de30..c443d3594d 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://alsactl/utils.c;beginline=1;endline=20;md5=2ce7f7b6739487fb72c689d46521f958"
+                    file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
 
 PACKAGECONFIG ??= "udev"
-- 
2.21.0


