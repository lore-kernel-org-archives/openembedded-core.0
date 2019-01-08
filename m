Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 655DF7BDB5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 15:36:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 96so4511732wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=p1AzwUJ3rcI3P1KXMfSWeK2gjYX1IZK7mfawEEOTbb0=;
	b=X57s3aMLLVbo2Iu/UMBW1Pi6TzzVNrlFl4S5ZOPGjpUWSas+2XrmPR3PRjeOcCrGQt
	5hwTD2F11bzAUg/wJoSVwCj0TswusqEyb+XRu86TmMPWAI77OtRikArUCje/pPeJkhWz
	GpvzMuoQTrajolEeqnQKRHtji8C+N/ZuJ/wUhXg0/VNtIO/Wl7com3dy4YDZ96l9D7E3
	K2L/cAx0+s666hvSPMXFPPcvnejWx3jAtQvbvi7rn98X9W3RNrl2T5sudkaWay50bGPM
	UfwORnKynWDlnQSPfShFY7pkpOk2ZRBNVvFxmdvKOeBGM3fPy22m8mvL6xaowyER8OJv
	UR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=p1AzwUJ3rcI3P1KXMfSWeK2gjYX1IZK7mfawEEOTbb0=;
	b=gb35dzMcxPy10+n+fevVWfO7ygTk8CO7MNDmHHdNwxMhrZYjqqw37S6mdjKWzKvjOS
	ues77p+h5f1a16lZquOW+MiaY+Tkxh9W+evoJCj2SAgt1CydPbgkxryHxGFwxfejMWJP
	DGz/CTlyzyOdbp2Ah5ZwVj45WaktSGu/i1xyaWEgw8wqkjYhpjZb90KSoHxAyMknxNlM
	SJrKPn4LLremIsBgOrSCouOFxSbsO4B4LT3RdA41qAw3Dt5jd8+ns0HxUhuBMnT5X+EC
	53mM2JnSKke8OxrKnIg0SR9ACt5q/RIpo9BeZ7CQ38UNgKgHhY+s/D6mClWE5PGAP4qF
	9jXg==
X-Gm-Message-State: AJcUukfZ4rNrKiL1Lo0jnIkV5W9NVgwv8X+kK1myURE6OUIVxOAAe+WR
	L6AW39dJgxleQarTL1NIADvkA5I7
X-Google-Smtp-Source: ALg8bN6hvp+sPLUXT55B0YXsR/xieTw7bQD00EydB7X7Iyo46tKppo9jhhr+JLaCmbwItzYD5ZHN0g==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr1769117wra.282.1546961791653; 
	Tue, 08 Jan 2019 07:36:31 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e16sm62825336wrn.72.2019.01.08.07.36.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 07:36:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 16:36:22 +0100
Message-Id: <8d31e14c22efae4f2ce2e0e0b5996abe1670dc41.1546961583.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1546961583.git.alex.kanavin@gmail.com>
References: <cover.1546961583.git.alex.kanavin@gmail.com>
Subject: [PATCH 3/3] meta/classes: adjust perl-related classes to the new recipes
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
X-List-Received-Date: Tue, 08 Jan 2019 15:36:31 -0000

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
index bafd96518a5..84b67b81806 100644
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


