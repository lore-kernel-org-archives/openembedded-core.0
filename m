Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f19-0005r3-Jv
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:35 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8863245pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xyZkauF6OqBIEWWHRojsYr8vm0yPrX+kTp/VTI7C5sc=;
	b=ZinrJmeE6EHkPD8P/BgqV9o3emndgMcnIRwq/VVk8U0eGSIThLK9wk1+l1hb0LNhkj
	+KxeRYKheU0mZC3rl59V7BDxF1Vtrf4HajlUa/+U6TmBXi9gpbcsM+Ckt25Iyvon8m5c
	Qgs/01JxG3cSZJL4kgKp99yTafkfInzAW3mVZDkuR25zzP2hWyhgDeFMCaHIs2khO5/2
	9oqczk5Hyh+YAAF0K9n6KPjlHcxvvvNyRD/Y9XYc63yC7EGFOE5FhKHOEQehWU2BfibQ
	oPIdOHBkMOVNz/twyRREz7VQh47ybSTivoCbzPhwdwWolgBB7j4v7HVDOMaoXWMbhZzu
	AHWw==
Received: by 10.68.238.166 with SMTP id vl6mr39476113pbc.96.1345518514335;
	Mon, 20 Aug 2012 20:08:34 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:55 -0700
Message-Id: <53729743c71b220d796e86079696dfa2b4e8e6f1.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 5/9] uclibc.inc, uclibc-config.inc: Untabify python snippets
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
X-List-Received-Date: Tue, 21 Aug 2012 03:20:36 -0000

To appease bitbake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc |  128 +++++++++++++++-------------
 meta/recipes-core/uclibc/uclibc.inc        |   28 +++---
 2 files changed, 85 insertions(+), 71 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 265626c..fd36fa5 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -32,84 +32,98 @@ x86_64 \
 xtensa \
 "
 def map_uclibc_arch(a, d):
-	"""Return the uClibc architecture for the given TARGET_ARCH."""
-	import re
+    """Return the uClibc architecture for the given TARGET_ARCH."""
+    import re
 
-	valid_archs = d.getVar('valid_archs', True).split()
+    valid_archs = d.getVar('valid_archs', True).split()
 
-	if   re.match('^(arm|sa110).*', a):	return 'arm'
-	elif re.match('^(i.86|athlon)$', a):	return 'i386'
-	elif re.match('^mips.*', a):		return 'mips'
-	elif re.match('^parisc.*', a):		return 'hppa'
-	elif re.match('^ppc.*', a):		return 'powerpc'
-	elif re.match('^s390.*', a):		return 's390'
-	elif re.match('^sh.*', a):		return 'sh'
-	elif re.match('^(sun|sparc).*', a):	return 'sparc'
-	elif re.match('^xtensa.*', a):		return 'xtensa'
-        elif a in valid_archs:			return a
-	else:
-		bb.error("cannot map '%s' to a uClibc architecture" % a)
+    if re.match('^(arm|sa110).*', a):
+        return 'arm'
+    elif re.match('^(i.86|athlon)$', a):
+        return 'i386'
+    elif re.match('^mips.*', a):
+        return 'mips'
+    elif re.match('^parisc.*', a):
+        return 'hppa'
+    elif re.match('^ppc.*', a):
+        return 'powerpc'
+    elif re.match('^s390.*', a):
+        return 's390'
+    elif re.match('^sh.*', a):
+        return 'sh'
+    elif re.match('^(sun|sparc).*', a):
+        return 'sparc'
+    elif re.match('^xtensa.*', a):
+        return 'xtensa'
+    elif a in valid_archs:
+        return a
+    else:
+        bb.error("cannot map '%s' to a uClibc architecture" % a)
 
 export UCLIBC_ARCH = "${@map_uclibc_arch(d.getVar('TARGET_ARCH', True), d)}"
 
 def map_uclibc_abi(o, d):
-	"""Return the uClibc ABI for the given TARGET_OS."""
-	import re
+    """Return the uClibc ABI for the given TARGET_OS."""
+    import re
 
-	arch = d.getVar('TARGET_ARCH', True)
-	if   map_uclibc_arch(d.getVar('TARGET_ARCH', True), d) == "arm":
-		if re.match('.*eabi$', o): return 'ARM_EABI'
-		else:                    return 'ARM_OABI'
-	# FIXME: This is inaccurate! Handle o32, n32, n64
-	elif re.match('^mips.*64$', arch):  return 'MIPS_N64_ABI'
-	elif re.match('^mips.*', arch):    return 'MIPS_O32_ABI'
-	return ""
+    arch = d.getVar('TARGET_ARCH', True)
+    if map_uclibc_arch(d.getVar('TARGET_ARCH', True), d) == "arm":
+        if re.match('.*eabi$', o):
+            return 'ARM_EABI'
+        else:
+            return 'ARM_OABI'
+    # FIXME: This is inaccurate! Handle o32, n32, n64
+    elif re.match('^mips.*64$', arch):
+        return 'MIPS_N64_ABI'
+    elif re.match('^mips.*', arch):
+        return 'MIPS_O32_ABI'
+    return ""
 
 export UCLIBC_ABI = "${@map_uclibc_abi(d.getVar('TARGET_OS', True), d)}"
 
 def map_uclibc_endian(a, d):
-	"""Return the uClibc endianess for the given TARGET_ARCH."""
-	import re
+    """Return the uClibc endianess for the given TARGET_ARCH."""
+    import re
 
-	# Always BE
-	if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|powerpc.*|(sparc|sun).*)$', a):
-		return 'BIG'
-	# Possibly BE
-	elif re.match('^(((arm|sa110).*eb)|h8300.*eb|(parisc|hppa).*eb|mips|mips64|sh.*eb|xtensa.*eb)$', a):
-		return 'BIG'
-	return 'LITTLE'
+    # Always BE
+    if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|powerpc.*|(sparc|sun).*)$', a):
+        return 'BIG'
+    # Possibly BE
+    elif re.match('^(((arm|sa110).*eb)|h8300.*eb|(parisc|hppa).*eb|mips|mips64|sh.*eb|xtensa.*eb)$', a):
+        return 'BIG'
+    return 'LITTLE'
 
 export UCLIBC_ENDIAN = "${@map_uclibc_endian(d.getVar('TARGET_ARCH', True), d)}"
 
 # internal helper
 def uclibc_cfg(feature, features, tokens, cnf, rem):
-	if type(tokens) == type(""):
-		tokens = [tokens]
-	rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
-	if type(features) == type([]) and feature in features:
-		cnf.extend([token + '=y' for token in tokens])
-	else:
-		cnf.extend(['# ' + token + ' is not set' for token in tokens])
+    if type(tokens) == type(""):
+        tokens = [tokens]
+    rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
+    if type(features) == type([]) and feature in features:
+        cnf.extend([token + '=y' for token in tokens])
+    else:
+        cnf.extend(['# ' + token + ' is not set' for token in tokens])
 
 # Map distro features to config settings
 def features_to_uclibc_settings(d):
-	cnf, rem = ([], [])
-	distro_features = d.getVar('DISTRO_FEATURES', True).split()
-	uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
-	uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
-	uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
-	uclibc_cfg('nls',       distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
-	uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
-	uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
-	uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
-	uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
-	uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
-	return "\n".join(cnf), "\n".join(rem)
+    cnf, rem = ([], [])
+    distro_features = d.getVar('DISTRO_FEATURES', True).split()
+    uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
+    uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
+    uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
+    uclibc_cfg('nls',       distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
+    uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
+    uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
+    uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
+    uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
+    uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
+    return "\n".join(cnf), "\n".join(rem)
 # X, Y = ${@features_to_uclibc_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
 def features_to_uclibc_conf(d):
-	cnf, rem = features_to_uclibc_settings(d)
-	return cnf
+    cnf, rem = features_to_uclibc_settings(d)
+    return cnf
 def features_to_uclibc_del(d):
-	cnf, rem = features_to_uclibc_settings(d)
-	return rem
+    cnf, rem = features_to_uclibc_settings(d)
+    return rem
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 863bf3a..6c98090 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -83,13 +83,13 @@ configmangle = '/^KERNEL_HEADERS/d; \
 OE_FEATURES := "${@features_to_uclibc_conf(d)}"
 OE_DEL      := "${@features_to_uclibc_del(d)}"
 python () {
-  if "${OE_DEL}":
-    d.setVar('configmangle_append', "${OE_DEL}" + "\n")
-  if "${OE_FEATURES}":
-    d.setVar('configmangle_append',
+    if "${OE_DEL}":
+        d.setVar('configmangle_append', "${OE_DEL}" + "\n")
+    if "${OE_FEATURES}":
+        d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
                    ("\\n".join((d.expand("${OE_FEATURES}").split("\n")))))
-  d.setVar('configmangle_append',
+    d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
                   ("\\n".join(["CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
                         "UCLIBC_EXTRA_CFLAGS=\"${UCLIBC_EXTRA_CFLAGS}\"",
@@ -99,23 +99,23 @@ python () {
                          "SHARED_LIB_LOADER_PREFIX=\"/lib\"",
                         ])
                   ))
-  d.setVar('configmangle_append',
+    d.setVar('configmangle_append',
                  "/^### TGT$/a\\\nTARGET_ARCH=\"%s\"\\nTARGET_%s=y\n" %
                         ("${UCLIBC_ARCH}", "${UCLIBC_ARCH}"))
-  d.setVar('configmangle_append',
-    "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][d.getVar('TARGET_FPU', True) in [ 'soft' ]]))
-  if "${UCLIBC_ENDIAN}":
     d.setVar('configmangle_append',
+    "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][d.getVar('TARGET_FPU', True) in [ 'soft' ]]))
+    if "${UCLIBC_ENDIAN}":
+        d.setVar('configmangle_append',
                    "/^### ABI$/a\\\nARCH_WANTS_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"))
-  if "${UCLIBC_ABI}":
-    d.setVar('configmangle_append',
+    if "${UCLIBC_ABI}":
+        d.setVar('configmangle_append',
                    "/^### ABI$/a\\\nCONFIG_%s=y\n\n" % ("${UCLIBC_ABI}"))
 }
 
 python do_patch_append() {
-        import subprocess
-        subprocess.call("ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux", shell=True)
-        subprocess.call("ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm", shell=True)
+    import subprocess
+    subprocess.call("ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux", shell=True)
+    subprocess.call("ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm", shell=True)
 }
 
 do_configure() {
-- 
1.7.9.5



