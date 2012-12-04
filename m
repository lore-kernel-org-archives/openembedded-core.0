Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfhaD-0000lD-5D
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:46:01 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1371848eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=weJMyS8zZ5uTrdXNmUTJmiHxWle3pFirPXZgpj9ErIo=;
	b=CaepdqBf2RcSiNAWDPFwlu5t0BFs67KrbteZ4wA5w2MReesINSEkrWnj66lK92hgMX
	70xyuHeiR78pYFRglMltPnWT/LTqDtz0G0vjTCa6/ZtopZ66DFaPXrNnQe77cQl07CXX
	8a64DYvs46mmmxTPXpNwtGaNpAErqWaS8HnClrmOcwtt2nNxNzGC0sC4XzHELuLucK2T
	49lq5F1CA7MWW5OM3wRnNVb00x7y24pXxPq8jNvAGouge8nzx4FMd4m0jCSGEQcGS1Np
	i50E9CdHx90z2NFq/v/YM0nGJv1Ic3wVgL8e6CwvNDuZ9PowGVmS+r8+TrRc0DQNKSUW
	NxLA==
Received: by 10.14.173.65 with SMTP id u41mr42462570eel.13.1354584695940;
	Mon, 03 Dec 2012 17:31:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r1sm2297855eeo.2.2012.12.03.17.31.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:31:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:31:11 +0100
Message-Id: <0fec18f9c1e1a629b9e5e894bc18589b54eb7e64.1354584580.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] packagegroup-core-basic: use VIRTUAL-RUNTIME_initscripts and VIRTUAL-RUNTIME_init_manager
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 01:46:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index d3eeeed..31cac33 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r5"
+PR = "r6"
 LICENSE = "MIT"
 
 inherit packagegroup
@@ -90,9 +90,11 @@ RDEPENDS_packagegroup-core-dev-utils = "\
     patch \
     "
 
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 RDEPENDS_packagegroup-core-initscripts = "\
-    initscripts \
-    sysvinit \
+    ${VIRTUAL-RUNTIME_initscripts} \
+    ${VIRTUAL-RUNTIME_init_manager} \
     ethtool \
     mingetty \
     sysklogd \
-- 
1.8.0



