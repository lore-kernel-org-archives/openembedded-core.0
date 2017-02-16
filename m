Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 66CB37722B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:34:54 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id E9C46AD00BEE; Thu, 16 Feb 2017 11:34:50 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 11:34:49 +0100
Message-Id: <1487241290-6188-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487241290-6188-1-git-send-email-obi@opendreambox.org>
References: <1487241290-6188-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/3] ffmpeg: Fix the license description
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
X-List-Received-Date: Thu, 16 Feb 2017 10:34:55 -0000

FFmpeg has complicated licensing options, so it should also
have complicated license statements in its recipe.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
index 52c266b..dc33bb4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
@@ -5,7 +5,17 @@ DESCRIPTION = "FFmpeg is the leading multimedia framework, able to decode, encod
 HOMEPAGE = "https://www.ffmpeg.org/"
 SECTION = "libs"
 
-LICENSE = "GPLv2+"
+LICENSE = "BSD & GPLv2+ & LGPLv2.1+ & MIT"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE_libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE_libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE_libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE_libavresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE_libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE_libpostproc = "GPLv2+"
+LICENSE_libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE_libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
 LICENSE_FLAGS = "commercial"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.7.4


