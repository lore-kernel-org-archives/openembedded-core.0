Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tv30S-0004A6-P4
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 10:40:35 +0100
Received: by mail-ea0-f177.google.com with SMTP id n13so155365eaa.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 01:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=LMtXXt4Oo2pbHHIx5EOlsFRI2Ib+lDEAxYF2Aweudms=;
	b=al5207RIgQS4y0/oggcxazWfg7/CcXDO98QSmMVeTObpdSa3U48r1cHEKIjADQhf47
	Y36syA1ASHPi7eUX+7Opd6/ol2jF4x0jsi9Z+QLl7x3eYoxAARKqct7F9seJzeo8Fxza
	7rdoc6N68WJHLs8P3Hybz40zIaKkmPt+1z1vyEvxOnQM+sMLcfQ1JJPyAXv9HaK8RP+o
	mZGK+Sq/paHBQKA+HT3wKJRRYPHQ0Ov8Se5/Hcb4xl27OoF5pRL1BZSL6nf4PNuMzSKz
	QavPw2iSXtfEGXZyX5SbZJlSsKrf94sX0yk0iiYJEfofDSDtcHq+ZvNLbYPBq+JkvNMJ
	tVxA==
X-Received: by 10.14.174.198 with SMTP id x46mr239991320eel.23.1358241912872; 
	Tue, 15 Jan 2013 01:25:12 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id f49sm24802960eep.12.2013.01.15.01.25.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 01:25:12 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 10:24:39 +0100
Message-Id: <1358241880-3921-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
References: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQndC+ZumZ2ob2UUOhx9iB2n622APybIlk8yq/pSEjOcliBvPX9aBj6KV0gQm0rhbhQj/9jf
Cc: scott.a.garmin@intel.com
Subject: [for-denzil][Fedora 18 fixes][PATCH 3/4] libtasn1: fix build with automake 1.12
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
X-List-Received-Date: Tue, 15 Jan 2013 09:40:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  | 28 ++++++++++++++++++++++
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |  6 +++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch b/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..5540bef
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+This patch avoids following issues with automake 1.12:
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libtasn1.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+
+Index: libtasn1-2.11/configure.ac
+===================================================================
+--- libtasn1-2.11.orig/configure.ac
++++ libtasn1-2.11/configure.ac
+@@ -38,6 +38,11 @@ lgl_EARLY
+ AC_PROG_YACC
+ AC_PROG_LN_S
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
++
+ dnl Checks for programs.
+ AC_PROG_INSTALL
+ AM_MISSING_PROG(HELP2MAN, help2man, $missing_dir)
diff --git a/meta/recipes-support/gnutls/libtasn1_2.12.bb b/meta/recipes-support/gnutls/libtasn1_2.12.bb
index aae409e..d0b4191 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.12.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.12.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
+           file://libtasn1_fix_for_automake_1.12.patch \
+           "
 
 SRC_URI[md5sum] = "4eba39fb962d6cf5a370267eae8ff52b"
 SRC_URI[sha256sum] = "0e257a8a01c80e464f73262e13c226e04a15165c2ad087a340f53902281a1c5d"
-- 
1.8.1



