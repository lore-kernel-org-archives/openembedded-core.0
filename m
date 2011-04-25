Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyr-0003kf-9r
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:58 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1379643pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8P5l/rvmNabKObVohRku+0/G3PldLTjQkhl4wWKXirM=;
	b=Bl2aUG9dyLaEDA5Zy4qArEBxVgpukhpsAwKqC/WMRHL7Gw2ZeMQvk/aprIhqG2P0Nj
	2n8JXegLyC7QXG37t4THQ0xLRUPr8biggTMck2KSiXrvGf04dVqi2RYzx44UGqitH3CM
	zsq8UGfGJK2I3D4WAThC6F9IYQgdZXOyOoDxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EuMJSR1TfRe7uauX63Rhau5UZXlS43Mr/bUW8GCt47Aii0iBoJlC2U9c4xDwOaZb7U
	E6iEYqefPxqroU2GZsImb4Tg5j5/mMdTY4sobAA8piMoZaNw/46Rt4rNX0kXe17uGSgr
	UnYRYV+x/ZhRhOBFGrsSDf3R5t0fAFIs86fwk=
Received: by 10.68.58.37 with SMTP id n5mr7461087pbq.33.1303757721944;
	Mon, 25 Apr 2011 11:55:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g3sm4056243pbl.92.2011.04.25.11.55.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:16 -0700
Message-Id: <2249f04c7e346c33e7d2777281d40a816f80cf94.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 11/17] util-linux.inc: remove virtual/libintl from DEPENDS
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:58 -0000

inherit gettext should do it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 913bb1b..447e5b7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -13,10 +13,10 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1530e36fe1304d4535513de90a290df9
                     file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
                     file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-DEPENDS = "zlib ncurses virtual/libintl"
-DEPENDS_virtclass-native = "zlib-native ncurses-native lzo-native gettext-native"
-
 inherit autotools gettext
+DEPENDS = "zlib ncurses"
+DEPENDS_virtclass-native_append = " lzo-native"
+
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-ng-${PV}.tar.bz2 \
            file://MCONFIG \
-- 
1.7.4.1



