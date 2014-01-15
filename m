Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCE16E36F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:14:55 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1W3MYo-0000Md-PV from Fahad_Arslan@mentor.com ;
	Wed, 15 Jan 2014 01:14:54 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 15 Jan 2014 01:14:52 -0800
From: Fahad Arslan <fahad_arslan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 14:14:30 +0500
Message-Id: <1389777270-58378-1-git-send-email-fahad_arslan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 15 Jan 2014 09:14:52.0535 (UTC)
	FILETIME=[3FA0F070:01CF11D2]
Cc: koen@dominion.thruhere.net
Subject: [PATCH] speex: enable floating point support
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
X-List-Received-Date: Wed, 15 Jan 2014 09:14:55 -0000

From: Fahad Arslan <Fahad_Arslan@mentor.com>

Speex configured in fixed point mode is not able to covert flaot
input in range of +/-1 passed by Pulseaudio. As a result streams
that need to be resampled are not playedback (no voice). Avoid
this situation by configuring Speex in floating point mode.

Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>
---
 meta/recipes-multimedia/speex/speex_1.2rc1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
index 5de0169..f1ea547 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
@@ -18,6 +18,6 @@ PARALLEL_MAKE = ""
 
 inherit autotools pkgconfig lib_package
 
-EXTRA_OECONF = " --enable-fixed-point --with-ogg-libraries=${STAGING_LIBDIR} \
-                 --disable-float-api --disable-vbr \
+EXTRA_OECONF = " --with-ogg-libraries=${STAGING_LIBDIR} \
+                 --enable-float-api --disable-vbr \
                  --with-ogg-includes=${STAGING_INCDIR} --disable-oggtest"
-- 
1.7.9.5


