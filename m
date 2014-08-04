Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 84F4F609AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 20:41:58 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XEP4x-0006bd-Ek from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Aug 2014 13:41:59 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 4 Aug 2014 13:41:59 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Mon, 4 Aug 2014 13:41:59 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Aug 2014 16:41:56 -0400
Message-ID: <1407184916-17679-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Aug 2014 20:41:59.0330 (UTC)
	FILETIME=[89BE6020:01CFB024]
Subject: [PATCH] gstreamer1.0-omx: Remove unnecessary dependency on plugins-bad.
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
X-List-Received-Date: Mon, 04 Aug 2014 20:42:02 -0000
Content-Type: text/plain

This also corrects an erroneous overwriting of the dependencies
from the inc file.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
index 11c77ae..a390205 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -2,8 +2,6 @@ DEFAULT_PREFERENCE = "-1"
 
 include gstreamer1.0-omx.inc
 
-DEPENDS = "gstreamer1.0-plugins-bad"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
-- 
1.9.1


