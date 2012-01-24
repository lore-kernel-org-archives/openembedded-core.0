Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpkWM-0000Gp-9n
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:51:02 +0100
Received: by iabz21 with SMTP id z21so7118245iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PWESZuKyjL8ffmmcyeQDoyQntDByjXW3v5Mk+6Vg2dw=;
	b=PyiBjTR/W/uDjIssfT+5UNIpoqPs0fErL0P1fTmbvMlp/H7DEJEvymB0n6I6JdezMB
	A7j3aoi6Guyl5L2CROK2AgB2m+q74XUkE8Iha4XKqkWzhkH6ORafFnyjcAMMNQsQFkCo
	Zuxo9P8CPUFGJpzn/Qm4EyRpI9mh4zjuJsJq4=
Received: by 10.42.189.5 with SMTP id dc5mr11955673icb.51.1327426996346;
	Tue, 24 Jan 2012 09:43:16 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn6sm9360062igb.3.2012.01.24.09.43.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:43:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 09:42:56 -0800
Message-Id: <3fb1ade006bc2d93226724eab047b9ecd49e2525.1327426808.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
References: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] gdb-common: Drop elfutils from DEPENDS
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
X-List-Received-Date: Tue, 24 Jan 2012 17:51:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index d728139..930a71b 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "gdb - GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE="GPLv3+"
 SECTION = "devel"
-DEPENDS = "ncurses readline elfutils ${LTTNGUST}"
+DEPENDS = "ncurses readline ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
@@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
@@ -40,7 +40,7 @@ EXPAT = "--without-expat"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
-                ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT} \
+                ${GDBPROPREFIX} ${EXPAT} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                "
 
-- 
1.7.8.3



