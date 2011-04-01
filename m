Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1v-0005GC-JL
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:15 +0200
Received: by ywg8 with SMTP id 8so1292687ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=srPwk5hDtNdePaqLPDGeT3xDo4v9YaxXLe4sWHbokuQ=;
	b=YJa+/rS1l1ucGLLrBoIwM8pHP33Sl+bQ/KXKpr2y1IQwhiK6xEs+dN1R26J5oTUido
	/2ante9dzIEbg7spb1oNFnuBagoUiG3tNwLbBWVJk816ZsjPGec4UZbRAFuWRQyYQB49
	7u18yuC+bxh+ntJgRCdhh29hRj6PsybcoOuo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=I5RyfLE4CwZunSI/JPEg467qBGScOEEXn+HmiI4BSxRVn2ogx9cVaBxTuHoJ87aJy4
	7ZkGvqcub8M0qsEBceq6kfsrcLQdL8ofYAd+WhN8U3gALq17OadGCrgJa6tXptb/VkS3
	Wi3vZNBS+tRtDQeZHIM1FtV54Yw0vmG0oN/lc=
Received: by 10.236.190.194 with SMTP id e42mr5301773yhn.70.1301632214463;
	Thu, 31 Mar 2011 21:30:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z7sm950448yhc.17.2011.03.31.21.30.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:04 -0700
Message-Id: <b1dcf78668c97b29783d6c687bccd69ac2bc547f.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 35/46] gdk-pixbuf_2.22.1.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
index 78f108a..211234e 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 SECTION = "libs"
 PRIORITY = "optional"
 
-DEPENDS = "libpng gettext glib-2.0 jpeg"
+DEPENDS = "libpng glib-2.0 jpeg"
 PR = "r0"
 
 SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${PV}.tar.gz \
@@ -20,7 +20,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${
 SRC_URI[md5sum] = "fcfc854e9aec7dbb2bb3059484d44556"
 SRC_URI[sha256sum] = "bbb57364ffba70d64f5fcfe6eda1d67249b3d58844edb06dc0f94d1ad599b4ec"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 LIBV = "2.10.0"
 
-- 
1.7.4.1



