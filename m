Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpkWV-0000Go-Ej
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:51:11 +0100
Received: by mail-iy0-f175.google.com with SMTP id z21so7118204iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FVU7fe+Vt3xdMPo6EFNJrcBuoiDGpPa63Y7WRokOYrI=;
	b=A1Mx29bAtfWumNNo5FtgW1u/gINR6noixY/6HvOD2+5oR+yxY3Dh8ilB7a8ML5SgOC
	0I4YU5n+RMj//M04JGWqK+3mQXE9FUzxK87XFF1mmR7jiDddt1mV8KmadAxg1Oko5Zcd
	s+whCICXNzrx9EBjeDPJZUO/TN7IclbrCpp9U=
Received: by 10.50.207.72 with SMTP id lu8mr15509894igc.0.1327427006845;
	Tue, 24 Jan 2012 09:43:26 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn6sm9360062igb.3.2012.01.24.09.43.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:43:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 09:43:01 -0800
Message-Id: <36096dd5d3d5ed998495daa74164b0db22050fa5.1327426808.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
References: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] util-linux: Change SRC_URI to a fetchable location
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
X-List-Received-Date: Tue, 24 Jan 2012 17:51:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b6d44ab..f60f33b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native = " lzo-native"
 
-SRC_URI = "ftp://ftp.infradead.org/pub/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
            file://swapargs.h \
            file://defines.h \
-- 
1.7.8.3



