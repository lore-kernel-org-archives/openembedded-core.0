Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QkRZW-0008BQ-R9
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 04:04:07 +0200
Received: by pzk1 with SMTP id 1so4594672pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 18:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wHmQpIwcrTYxfcBri6kRJEwBu3qjQgU0gxKoxO3EUAw=;
	b=njfUtYATX0uOltOcHFcgqetUsWaJE5AoQkoEpL5qdQVSLp2jlbaLovTNbIzbqO2hXZ
	bavdSdHNQy+8lJN37IQARXDjzBjb50nEr/9XdZ/yPBTGAco+KKTTVjtFbX+gPgvi/KVP
	ICwRoktF+u8nBpQEZA24bwf98sF+ITYQal7lE=
Received: by 10.68.31.163 with SMTP id b3mr3450712pbi.220.1311386397005;
	Fri, 22 Jul 2011 18:59:57 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d3sm2255957pbh.37.2011.07.22.18.59.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 18:59:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 18:59:49 -0700
Message-Id: <1311386389-9819-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1311386389-9819-1-git-send-email-raj.khem@gmail.com>
References: <1311386389-9819-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] libxcb: Add missing DEPENDS on libxdmcp
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
X-List-Received-Date: Sat, 23 Jul 2011 02:04:07 -0000

Observed this to fail when populating new tmpdir
from shared state

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xcb/libxcb_1.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb_1.7.bb b/meta/recipes-graphics/xcb/libxcb_1.7.bb
index 0f30c88..daecf0f 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.7.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.7.bb
@@ -3,9 +3,9 @@ include libxcb.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-PR = "r1"
+PR = "r2"
 
-DEPENDS += "libpthread-stubs xcb-proto-native"
+DEPENDS += "libpthread-stubs xcb-proto-native libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
-- 
1.7.4.1



