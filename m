Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D17366C5B4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:58:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a18so3398670wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0PonkSA6iAzSsEL5DRqYJt4oTjR8IE3DAi+u+esImiU=;
	b=UrzGS7bIFZ15ezdmUM8KuOyLs8acHySJ/72UXVIQHSTL24ecB2Ga/Ikb6icGSluGa6
	8jD7j1zQsRQb1D+Ur1ZPjZbhOhbQT3+r/g2VgRO8R3nzqZ5fsTeKIg9bTsLaKNXBrRZK
	BVC+LhFe/erGj9bF1laoLpnL6d7F08U5CU2187pf0VoLcv7WoZvF9/Mye1qQmLid+3NS
	mjSSHuy+K4L+zuGaUufp2JQaX5fBblZaDuPHDwCQDn6PMoayg6zhcK4q9UknonUaZSGW
	8BRiDUHuj1AXXUA5KkKfAHN2UEmEeht6vq7C6Y7nnVACQ7yO6VLc0PmyZYDKD8B3LZFP
	0smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0PonkSA6iAzSsEL5DRqYJt4oTjR8IE3DAi+u+esImiU=;
	b=CID/4fionch18tiVj1EyjV3z6f5S91gEQCwQvQ6QiLJ9COzv0M8fgSkmMSTgjdgzNo
	ODxR1bcidbeLdI6hvfCEi8+4+4Js+Vr9kRzaxjF8/lrExZ4V2I3qDZXpW2XlE9ecs5v6
	oFB1pq8ALKPmGvNrHNRSEaOqtMmeGT1bTXD22opKyNQcgveMNL5ECHYHe0IELzHJUA18
	1jVcOOsxEqUyLRBZ3CQM8csup8dwMeObAqhSgvTdXoqU2x3mcOR8JcB45KZ42eVS2Zv4
	ssR8752+VbkJgBF/6KmSLhEsJFbWOQpCnxMYbrTY+tQfTo6cLFeLMTocx32iNxkkhWCm
	EBXg==
X-Gm-Message-State: AA+aEWYwbQtFryXPxOdjFvtjOzcdjTVbEYjOq4xPEjeD0rWdz5eEil/z
	/iX+Wjz3dHdB6Ttuqtv1F8Z5KjQk
X-Google-Smtp-Source: AFSGD/UPrFjTbxtqPGQeVcw5+BUaYwZT0tJqQA6hI976spCbvRH28HcALXNcKIlW2UxYDRpWlynu6A==
X-Received: by 2002:a1c:588a:: with SMTP id
	m132-v6mr5411352wmb.85.1543769924120; 
	Sun, 02 Dec 2018 08:58:44 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	k135sm6872346wmd.42.2018.12.02.08.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 08:58:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2018 17:58:31 +0100
Message-Id: <bafdfa178954e8de4de232a101d3aa5e56f6f4a4.1543769657.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1543769657.git.alex.kanavin@gmail.com>
References: <cover.1543769657.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1543769657.git.alex.kanavin@gmail.com>
References: <cover.1543769657.git.alex.kanavin@gmail.com>
Subject: [PATCH 3/4] meta/classes: adjust perl-related classes to the new recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2018 16:58:44 -0000

This mostly means tweaking the paths to match upstream defaults.

get_perl_arch() functions are taken from the patch by Jens Rehsack:
http://lists.openembedded.org/pipermail/openembedded-core/2018-November/276546.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/cpan-base.bbclass    |  6 ++--
 meta/classes/cpan.bbclass         | 11 ++++----
 meta/classes/cpan_build.bbclass   |  7 +++--
 meta/classes/perl-version.bbclass | 46 +++++++++++++++++++++++++++++--
 4 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 577fcd63ce9..867edf87073 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -2,7 +2,7 @@
 # cpan-base providers various perl related information needed for building
 # cpan modules
 #
-FILES_${PN} += "${libdir}/perl ${datadir}/perl"
+FILES_${PN} += "${libdir}/perl5 ${datadir}/perl5"
 
 DEPENDS  += "${@["perl", "perl-native"][(bb.data.inherits_class('native', d))]}"
 RDEPENDS_${PN} += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
@@ -14,5 +14,5 @@ def is_target(d):
         return "yes"
     return "no"
 
-PERLLIBDIRS = "${libdir}/perl"
-PERLLIBDIRS_class-native = "${libdir}/perl-native"
+PERLLIBDIRS = "${libdir}/perl5"
+PERLLIBDIRS_class-native = "${libdir}/perl5"
diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 511fe3fb924..e9908ae4b81 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -10,10 +10,11 @@ EXTRA_PERLFLAGS ?= ""
 export PERLCONFIGTARGET = "${@is_target(d)}"
 
 # Env var which tells perl where the perl include files are
-export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
-export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
-export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
-export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
+export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}/CORE"
+export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}"
+export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/"
+export PERLHOSTARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
 
 cpan_do_configure () {
 	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 PERL=$(which perl) ${EXTRA_CPANFLAGS}
@@ -27,7 +28,7 @@ cpan_do_configure () {
 	[ -e Makefile ] || bbfatal "No Makefile was generated by Makefile.PL"
 
 	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
-		. ${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh
+		. ${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/config.sh
 		# Use find since there can be a Makefile generated for each Makefile.PL
 		for f in `find -name Makefile.PL`; do
 			f2=`echo $f | sed -e 's/.PL//'`
diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index 9a2ad895ef4..f3fb4666ef3 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -7,14 +7,15 @@ EXTRA_CPAN_BUILD_FLAGS ?= ""
 
 # Env var which tells perl if it should use host (no) or target (yes) settings
 export PERLCONFIGTARGET = "${@is_target(d)}"
-export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
-export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}"
+export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/"
+export PERLHOSTARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
 export LD = "${CCLD}"
 
 cpan_build_do_configure () {
 	if [ "${@is_target(d)}" = "yes" ]; then
 		# build for target
-		. ${STAGING_LIBDIR}/perl/config.sh
+		. ${STAGING_LIBDIR}/perl5/config.sh
 	fi
 
 	perl Build.PL --installdirs vendor --destdir ${D} \
diff --git a/meta/classes/perl-version.bbclass b/meta/classes/perl-version.bbclass
index fafe68a775f..662465a5f91 100644
--- a/meta/classes/perl-version.bbclass
+++ b/meta/classes/perl-version.bbclass
@@ -1,4 +1,4 @@
-PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
+PERL_OWN_DIR = ""
 
 # Determine the staged version of perl from the perl configuration file
 # Assign vardepvalue, because otherwise signature is changed before and after
@@ -6,7 +6,7 @@ PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
 get_perl_version[vardepvalue] = "${PERL_OWN_DIR}"
 def get_perl_version(d):
     import re
-    cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
+    cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/config.sh')
     try:
         f = open(cfg, 'r')
     except IOError:
@@ -22,3 +22,45 @@ def get_perl_version(d):
 
 PERLVERSION := "${@get_perl_version(d)}"
 PERLVERSION[vardepvalue] = ""
+
+
+# Determine the staged arch of perl from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+def get_perl_arch(d):
+    import re
+    cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/config.sh')
+    try:
+        f = open(cfg, 'r')
+    except IOError:
+        return None
+    l = f.readlines();
+    f.close();
+    r = re.compile("^archname='([^']*)'")
+    for s in l:
+        m = r.match(s)
+        if m:
+            return m.group(1)
+    return None
+
+PERLARCH := "${@get_perl_arch(d)}"
+PERLARCH[vardepvalue] = ""
+
+# Determine the staged arch of perl-native from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+def get_perl_hostarch(d):
+    import re
+    cfg = d.expand('${STAGING_LIBDIR_NATIVE}/perl5/config.sh')
+    try:
+        f = open(cfg, 'r')
+    except IOError:
+        return None
+    l = f.readlines();
+    f.close();
+    r = re.compile("^archname='([^']*)'")
+    for s in l:
+        m = r.match(s)
+        if m:
+            return m.group(1)
+    return None
-- 
2.17.1


