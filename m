Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2H-0004v2-Ss
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:38 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Pdfvs8b6Am88cGi+S5abMDTwsBIBQVyQRnFVfQ64At4=;
	b=KxhOKpjzXJULxEfgTXdRUbSfeCtidK9BGmsf0+VbMCWZvk+i7mch9ePMFTJ3c8BS9x
	Qabz3ZmpNPoE1dHT8sPS2i9uQ5tcjomHOPXSsFn5AvU6JZ3sKv5BhHjLNfuGvSVlYUix
	ekbANdUxpkd1CFkC3CpJMeTVA+f5s+mkDsCvA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZdoyoFsSbqrbn6b6PQb9FripNmMUobp3qzDfiPwLkt6UvX+2kD45kjuadU7/Skhg0V
	HzRjwhjVp2LH5XM6gv2qFt/UtXaqMsJEIw6zb3PJwG4AieGapjoXnkVm+Wf8cnwqnQh8
	wQBtg8cxspAmgNQRJESitkNuSbAwf6/A2sTzU=
Received: by 10.42.146.197 with SMTP id k5mr4121179icv.140.1301632239189;
	Thu, 31 Mar 2011 21:30:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 13sm1179328ibo.59.2011.03.31.21.30.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:30 -0700
Message-Id: <9850f08cb5258480947d8682e877dd0c668cea85.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 42/46] gstreamer_0.10.31.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:34:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer/gstreamer_0.10.31.bb                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
index 96c45eb..dc1d07c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
@@ -8,7 +8,7 @@ PRIORITY = "optional"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
-DEPENDS = "glib-2.0 gettext libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
 PR = "r0"
 
@@ -19,7 +19,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz
 SRC_URI[md5sum] = "a21fb08bdb578d972c7c14e77da8fbb6"
 SRC_URI[sha256sum] = "7f737e6d047c1ebeb4e1e0725fc377c5d9f12ee89186de7960be3cbba709ab84"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 EXTRA_OECONF = "--disable-docs-build --disable-dependency-tracking --with-check=no --disable-examples --disable-tests --disable-valgrind --disable-debug"
 
-- 
1.7.4.1



