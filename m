Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W12-0004v2-0z
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:20 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=LYTeMShmpQTR71b9vrHZ/8aFMbzWDfH1ROQ3UjZg5UA=;
	b=fJbBgmL4ZCHz4bqpxBcdTvEDDV8++61V+gGztnu39Rfsv6GYB6NKvFqd2B+mpic+Sy
	p6x6q5MXFd3/TFHqnH5bbf81S5spIpRiDKsZl+VKd8JSuaWXmXeod71AWR/gY1akGEhD
	nlTA5ohG8N3AAS0fAGW2TNsRovSi9GvbLqMtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oTOgcMjg/+pYKfAkqUhT5kEDT8SYNrJUYV1q27uZowGPAb9u52CnAJS9QCUCiT7z7e
	nYttDro0QycC+95tcxfQOCPv5OY92afKMKpGEWuO8hZQ7XKoQNf89Dl8MqSEEiDKR9VF
	y7UaGwA0X8fFsWdqFwDXcCAnL7U0Ux1w4a834=
Received: by 10.231.193.133 with SMTP id du5mr3553475ibb.100.1301632161098;
	Thu, 31 Mar 2011 21:29:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d10sm1179255ibb.51.2011.03.31.21.29.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:12 -0700
Message-Id: <edb45ced7ae04186018ee875568a334933a3829f.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 20/46] alsa-utils_1.0.23.bb: Remove xmlto requirement
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:20 -0000

Patch imported from OE

Use uclibceabi instead of uclibcgnueabi

inherit gettext class instead of adding gettext to DEPENDS directly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../alsa-utils-remove-xmlto.patch                  |   18 ++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb  |   12 +++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.23/alsa-utils-remove-xmlto.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.23/alsa-utils-remove-xmlto.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.23/alsa-utils-remove-xmlto.patch
new file mode 100644
index 0000000..53ff95a
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.23/alsa-utils-remove-xmlto.patch
@@ -0,0 +1,18 @@
+Index: alsa-utils-1.0.19/alsactl/Makefile.am
+===================================================================
+--- alsa-utils-1.0.19.orig/alsactl/Makefile.am	2009-06-24 01:08:16.000000000 -0400
++++ alsa-utils-1.0.19/alsactl/Makefile.am	2009-06-24 01:08:26.000000000 -0400
+@@ -2,13 +2,7 @@
+ 
+ sbin_PROGRAMS=alsactl
+ man_MANS=alsactl.1
+-if USE_XMLTO
+-man_MANS += alsactl_init.7
+-endif
+ EXTRA_DIST=alsactl.1 alsactl_init.xml
+ 
+ alsactl_SOURCES=alsactl.c state.c utils.c init_parse.c
+ noinst_HEADERS=alsactl.h list.h init_sysdeps.c init_utils_string.c init_utils_run.c init_sysfs.c
+-
+-%.7: %.xml
+-	xmlto man $?
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
index 46283cc..c03c61a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
@@ -5,11 +5,13 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
-DEPENDS = "alsa-lib ncurses gettext"
-PR = "r0"
+DEPENDS = "alsa-lib ncurses"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://ncursesfix.patch;patch=1 "
+           file://ncursesfix.patch \
+           file://alsa-utils-remove-xmlto.patch \
+          "
 
 SRC_URI[md5sum] = "cb0cf46029ac9549cf3a31bff6a4f4e1"
 SRC_URI[sha256sum] = "b7d05e915e25f8540ad151c6dd558cf0fc1e9bb0ee23052d531c983666a1f7b0"
@@ -20,9 +22,9 @@ SRC_URI[sha256sum] = "b7d05e915e25f8540ad151c6dd558cf0fc1e9bb0ee23052d531c983666
 #
 EXTRA_OECONF = "--disable-xmlto"
 EXTRA_OECONF_linux-uclibc = "--disable-nls"
-EXTRA_OECONF_linux-uclibcgnueabi = "--disable-nls"
+EXTRA_OECONF_linux-uclibceabi = "--disable-nls"
 
-inherit autotools
+inherit autotools gettext
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
 # ipk depend on them.
-- 
1.7.4.1



