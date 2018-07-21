Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C641078BC2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 67E3016B6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 11:24:08 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 11:24:00 +0200
Message-Id: <20180721092402.20271-4-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180721092402.20271-1-dv@pseudoterminal.org>
References: <20180721092402.20271-1-dv@pseudoterminal.org>
Subject: [PATCH v4 4/6] gstreamer1.0-vaapi: Remove unnecessary FILESPATH modification
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
X-List-Received-Date: Sat, 21 Jul 2018 09:24:08 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
index 906dc6e6c4..e647458fab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
@@ -4,7 +4,6 @@ based plugins for GStreamer and helper libraries: `vaapidecode', \
 `vaapiconvert', and `vaapisink'."
 
 REALPN = "gstreamer-vaapi"
-FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${REALPN}", "${FILE_DIRNAME}/${REALPN}"], d)}"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
-- 
2.17.1


