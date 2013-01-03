Received: from mail-la0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlQ-0000dQ-Re
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f44.google.com with SMTP id fr10so8641615lab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YvzvByjFRRakiG2l9E8gS0bilHB1ynge+WFY5rBv+9Q=;
	b=sCVeMliTmAjmyII+8X86LThLyK6sqxmqYTsbvQpb5CRPTfZzd28AhStkg3zWjTky4W
	UU7EOtAUhRR+aOgASdwCQPd4ief4fk1OfS0ip3IJ9mdqin6/plYIb1Pbutl0N/h58r3k
	VWLZX6vSC0/kdA9UXSSxfiXU0lHRPuMSbmStLQQYnCFAXRjBKBhAqvGuaIezHKxpil9f
	kjNy7reh7TTAyFJacLIdNEkjmxTFRezQvl+WuYHEQE8owSE6yyL2vUayAnhjzmyhyG7J
	TfIiAK/XAqi/htLEfCyhKYpB0+/MD/pXodVI165ZqIhLALgWTxcTsUlBeFmNVFI/Ijo6
	PC3g==
X-Received: by 10.152.125.237 with SMTP id mt13mr48017644lab.45.1357245400738; 
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id b3sm17341682lbl.0.2013.01.03.12.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWl-0002Fd-6u; Thu, 03 Jan 2013 22:36:35 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:27 +0200
Message-Id: <1357245391-11055-12-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-11-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-7-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-8-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-9-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-10-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-11-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 11/15] libid3tag: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libid3tag/libid3tag/obsolete_automake_macros.patch   |   14 ++++++++++++++
 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb   |    6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
new file mode 100644
index 0000000..2ecd478
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted (https://sourceforge.net/tracker/?func=detail&aid=3599280&group_id=12349&atid=112349)
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/configure.ac
+--- libid3tag-0.15.1b/configure.ac	2004-01-24 01:22:46.000000000 +0200
++++ libid3tag-0.15.1b/configure.ac	2013-01-03 06:41:02.734835014 +0200
+@@ -28,7 +28,7 @@
+
+ AM_INIT_AUTOMAKE
+
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+
+ dnl System type.
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index dbcf2da..d81f58b 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
 SECTION = "libs"
 DEPENDS = "zlib gperf-native"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
-           file://addpkgconfig.patch"
+           file://addpkgconfig.patch \
+           file://obsolete_automake_macros.patch \
+"
 
 SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
 SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
-- 
1.7.10.4



