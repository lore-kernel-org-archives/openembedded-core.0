Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rqdiq-0006fp-78
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 05:47:36 +0100
Received: by dakf10 with SMTP id f10so910492dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PWESZuKyjL8ffmmcyeQDoyQntDByjXW3v5Mk+6Vg2dw=;
	b=eY9XertW7L5PgMGOAywvUQZGHfa+CVsw6LgcA2M4LLnwjvgIyCB3I3siP3/uryqnvT
	OO/+e7GyX8POhysPEedsci1bMAzLSM7K73hxQiavSErpCu+BC+f7NA22UELN59GrtZkP
	7oXPdYmXuQIi+vg0U5AQ9dABh7A+2f+mQ+EWY=
Received: by 10.68.75.170 with SMTP id d10mr11157231pbw.117.1327639186678;
	Thu, 26 Jan 2012 20:39:46 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x8sm16846627pbr.11.2012.01.26.20.39.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 20:39:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 20:39:28 -0800
Message-Id: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1327638861.git.raj.khem@gmail.com>
References: <cover.1327638861.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] gdb-common: Drop elfutils from DEPENDS
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
X-List-Received-Date: Fri, 27 Jan 2012 04:47:36 -0000

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



