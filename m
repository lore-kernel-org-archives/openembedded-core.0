Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id A48BC65ED6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:28:31 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:28:21 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-245-133.mobileonline.telia.com [90.236.245.133])
	(Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id E71E03A226;
	Mon, 12 May 2014 15:55:45 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 15:55:31 +0200
Message-Id: <4d331f1a13bcbc414268bd6047f507695085ffcb.1399868537.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
References: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
In-Reply-To: <cover.1399868537.git.petter@technux.se>
References: <cover.1399868537.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv3 06/13] mesa: remove usage of FILESPATH
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
X-List-Received-Date: Mon, 12 May 2014 14:28:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
Also remove unused filespath addition.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
index 8c7d8e8..2acc21d 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
@@ -2,7 +2,7 @@ require mesa_${PV}.bb
 
 SUMMARY += " (OpenGL only, no EGL/GLES)"
 
-FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/mesa-${PV}", "${FILE_DIRNAME}/mesa"], d)}"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/mesa:"
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-- 
1.7.9.5


