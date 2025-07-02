Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF21C83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:56:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13684.1751421356718990502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 18:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YneMnz5I;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235d6de331fso50154795ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751421356; x=1752026156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLHX7QsjEYrCC/TW+FrCqJ6dzQaEn4LCTb+VjAFcM0k=;
        b=YneMnz5IHJjtMTE0PO+/yCvH+ll2lMr9pQRnkaB2BIOaNAsY9/a82WP2SESjtPia8B
         srhM5dOAJEtagGu0yxNyw4s+Buudx9UmGIkcTu7ak1fBcEyQmXrvZ+2swyrLjdwUjw0m
         PzMrVBEG6Tpupoi78VZus7pd48nSj/Ip8F01pDi04OQobBfbEJWPK3cnGpVTxPTrsD+M
         VLcUf0HZO3tWhw+WYQvvvmgg9m31LaEE27uwO88uaNa+atlRHsSOzFcdcEg8kluk9UfM
         tC5/cE07ZXWkGY2eeWEMMiNbO0z+JBCYICS0KAnu/8J7p00DW6Gd7I92CHyS9EErSYYf
         gGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751421356; x=1752026156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLHX7QsjEYrCC/TW+FrCqJ6dzQaEn4LCTb+VjAFcM0k=;
        b=qEW8A/jOi5/VxYHnTOBnlDihiqmvoX4rUQ3WVD/oRPEnNQy4KSBu0LUNfLhawe6jOI
         I7wZcrJpzvpJiiJcT6qS0EwR9Czk1VfdU/i6mJFEZxQ1kV5nTRKTimFclpbcDQyEN2qb
         G/oNZmY4E59diaVyZQfXPuJ/UtH7FMRGth1A48c6aADQc6vSoh/tsHfjc5jIvFRi45Ri
         csx87M4V4MwAeogAsz92BDjSES9fabSMX3HxwwpBMGrGLvAjlB/jVa+bC2Vg07yD7Z41
         dDNVH/3b/UIEmMltCV0sJCUctM7CAWbWRwMVpWExrwtvzjgeUV/a6qcZtNohku2zm5uV
         bBlw==
X-Gm-Message-State: AOJu0YyyGInSGUNtCqil+u39BKx1dWxn2gG8vAXlMZhAmFrNHOGSZ0lz
	kFk++p/5nbQrAflZq7n6nZkOf90hssSivIUXmr3gm0M7RajOxtFdE4J3PV2S8DXg
X-Gm-Gg: ASbGncsD3JiGdfHC3yqL1bsU/K5vDPg0xXyyPZG1RLTUH+65EICwQcVXNoNVg5eeHQD
	gYEw5Z2amP3QOQwVysveEOBcJ+MU4GLmR0Kmw5cbOA7RDruVV/W9y5WeDbQWXQI8qA6Z3l6kI/t
	Wl40NNjidl/XhlSLs1gKs77kcc8Kge6ttSH0lQkh/vFPbaz67eHkS+O3QnFqQKfD62mgH/GwVtS
	eqEQmiTf9P8olx3hQ8ZlKvB003+WNNIDUhOTqMDCc4W+xCrO3kBP8ASZEWKEuTvdEfOWIlWn8rO
	Iq/qwoQ7gNQtqkOS8aNmZEzqfowZf72UkU72FFzddOEl96/PR8g49A==
X-Google-Smtp-Source: AGHT+IEQzq58r+WFxb9jaTYKjRux2FmXnn7LqyucUtb6h9DRw5v8FBBOuD2TrekyCNCIq7TLO+dTpg==
X-Received: by 2002:a17:902:d54f:b0:234:8ec1:4aec with SMTP id d9443c01a7336-23c6e48d546mr13758075ad.6.1751421355493;
        Tue, 01 Jul 2025 18:55:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e25c6sm114404595ad.6.2025.07.01.18.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:55:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 3/4] Remove oe.utils.host_gcc_version utility
Date: Tue,  1 Jul 2025 18:55:50 -0700
Message-ID: <20250702015551.1453616-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702015551.1453616-1-raj.khem@gmail.com>
References: <20250702015551.1453616-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219749

This was used for the uninative gcc 4.8 and 4.9 incompatibility w.r.t
runtime ABI, none of supported distros we use today use that old gcc

Oldest we have is gcc 7.5.0 on opensuse 15.5 hosts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/uninative.bbclass         |   2 +-
 meta/classes-recipe/populate_sdk_base.bbclass |   1 -
 meta/classes-recipe/populate_sdk_ext.bbclass  |   3 +-
 meta/files/toolchain-shar-extract.sh          |   8 -
 meta/lib/oe/utils.py                          | 147 +++++++++++-------
 5 files changed, 90 insertions(+), 71 deletions(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 75e0c19704d..c246a1ecd6c 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -142,7 +142,7 @@ def enable_uninative(d):
     loader = d.getVar("UNINATIVE_LOADER")
     if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
-        d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
+        d.setVar("NATIVELSBSTRING", "universal")
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "| uninative_changeinterp")
         d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER} -pthread")
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 8ef4b2be777..e6685cde97b 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -373,7 +373,6 @@ EOF
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
-		-e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d, taskcontextonly=True)}#g' \
 		-e 's#@SDK_ARCHIVE_TYPE@#${SDK_ARCHIVE_TYPE}#g' \
 		${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2d7d661d259..eb4e16c57cb 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -491,8 +491,7 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
     sstate_out = baseoutpath + '/sstate-cache'
     bb.utils.remove(sstate_out, True)
 
-    # uninative.bbclass sets NATIVELSBSTRING to 'universal%s' % oe.utils.host_gcc_version(d)
-    fixedlsbstring = "universal%s" % oe.utils.host_gcc_version(d) if bb.data.inherits_class('uninative', d) else ""
+    fixedlsbstring = "universal" if bb.data.inherits_class('uninative', d) else ""
 
     sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1')
     sdk_ext_type = d.getVar('SDK_EXT_TYPE')
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 06934e5a9ab..e2c617958a9 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -31,9 +31,6 @@ tweakpath /sbin
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
-INST_GCC_VER=$(gcc --version 2>/dev/null | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')
-SDK_GCC_VER='@SDK_GCC_VER@'
-
 verlte () {
 	[  "$1" = "`printf "$1\n$2" | sort -V | head -n1`" ]
 }
@@ -145,11 +142,6 @@ fi
 # SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
 if [ "$SDK_EXTENSIBLE" = "1" ]; then
 	DEFAULT_INSTALL_DIR="@SDKEXTPATH@"
-	if [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '4.9' ] || [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '' ] || \
-		[ "$INST_GCC_VER" = '4.9' -a "$SDK_GCC_VER" = '' ]; then
-		echo "Error: Incompatible SDK installer! Your host gcc version is $INST_GCC_VER and this SDK was built by gcc higher version."
-		exit 1
-	fi
 fi
 
 if [ "$target_sdk_dir" = "" ]; then
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a11db5f3cd9..ac127659632 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -11,42 +11,49 @@ import errno
 
 import bb.parse
 
+
 def read_file(filename):
     try:
-        f = open( filename, "r" )
+        f = open(filename, "r")
     except IOError as reason:
-        return "" # WARNING: can't raise an error now because of the new RDEPENDS handling. This is a bit ugly. :M:
+        return ""  # WARNING: can't raise an error now because of the new RDEPENDS handling. This is a bit ugly. :M:
     else:
         data = f.read().strip()
         f.close()
         return data
     return None
 
-def ifelse(condition, iftrue = True, iffalse = False):
+
+def ifelse(condition, iftrue=True, iffalse=False):
     if condition:
         return iftrue
     else:
         return iffalse
 
+
 def conditional(variable, checkvalue, truevalue, falsevalue, d):
     if d.getVar(variable) == checkvalue:
         return truevalue
     else:
         return falsevalue
 
+
 def vartrue(var, iftrue, iffalse, d):
     import oe.types
+
     if oe.types.boolean(d.getVar(var)):
         return iftrue
     else:
         return iffalse
 
+
 def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     if float(d.getVar(variable)) <= float(checkvalue):
         return truevalue
     else:
         return falsevalue
 
+
 def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     result = bb.utils.vercmp_string(d.getVar(variable), checkvalue)
     if result <= 0:
@@ -54,6 +61,7 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     else:
         return falsevalue
 
+
 def both_contain(variable1, variable2, checkvalue, d):
     val1 = d.getVar(variable1)
     val2 = d.getVar(variable2)
@@ -68,6 +76,7 @@ def both_contain(variable1, variable2, checkvalue, d):
     else:
         return ""
 
+
 def set_intersect(variable1, variable2, d):
     """
     Expand both variables, interpret them as lists of strings, and return the
@@ -83,36 +92,44 @@ def set_intersect(variable1, variable2, d):
     val2 = set(d.getVar(variable2).split())
     return " ".join(val1 & val2)
 
+
 def prune_suffix(var, suffixes, d):
     # See if var ends with any of the suffixes listed and
     # remove it if found
     for suffix in suffixes:
         if suffix and var.endswith(suffix):
-            var = var[:-len(suffix)]
+            var = var[: -len(suffix)]
 
     prefix = d.getVar("MLPREFIX")
     if prefix and var.startswith(prefix):
-        var = var[len(prefix):]
+        var = var[len(prefix) :]
 
     return var
 
+
 def str_filter(f, str, d):
     from re import match
+
     return " ".join([x for x in str.split() if match(f, x, 0)])
 
+
 def str_filter_out(f, str, d):
     from re import match
+
     return " ".join([x for x in str.split() if not match(f, x, 0)])
 
+
 def build_depends_string(depends, task):
     """Append a taskname to a string of dependencies as used by the [depends] flag"""
     return " ".join(dep + ":" + task for dep in depends.split())
 
+
 def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
 
-def features_backfill(var,d):
+
+def features_backfill(var, d):
     # This construct allows the addition of new features to variable specified
     # as var
     # Example for var = "DISTRO_FEATURES"
@@ -122,8 +139,8 @@ def features_backfill(var,d):
     # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL should
     # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
     features = (d.getVar(var) or "").split()
-    backfill = (d.getVar(var+"_BACKFILL") or "").split()
-    considered = (d.getVar(var+"_BACKFILL_CONSIDERED") or "").split()
+    backfill = (d.getVar(var + "_BACKFILL") or "").split()
+    considered = (d.getVar(var + "_BACKFILL_CONSIDERED") or "").split()
 
     addfeatures = []
     for feature in backfill:
@@ -133,6 +150,7 @@ def features_backfill(var,d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+
 def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if *all* given features are set in DISTRO_FEATURES,
@@ -153,6 +171,7 @@ def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
+
 def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if at least *one* of the given features is set in DISTRO_FEATURES,
@@ -174,6 +193,7 @@ def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
+
 def parallel_make(d, makeinst=False):
     """
     Return the integer value for the number of parallel threads to use when
@@ -183,22 +203,23 @@ def parallel_make(d, makeinst=False):
     e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
     """
     if makeinst:
-        pm = (d.getVar('PARALLEL_MAKEINST') or '').split()
+        pm = (d.getVar("PARALLEL_MAKEINST") or "").split()
     else:
-        pm = (d.getVar('PARALLEL_MAKE') or '').split()
+        pm = (d.getVar("PARALLEL_MAKE") or "").split()
     # look for '-j' and throw other options (e.g. '-l') away
     while pm:
         opt = pm.pop(0)
-        if opt == '-j':
+        if opt == "-j":
             v = pm.pop(0)
-        elif opt.startswith('-j'):
+        elif opt.startswith("-j"):
             v = opt[2:].strip()
         else:
             continue
 
         return int(v)
 
-    return ''
+    return ""
+
 
 def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
@@ -218,23 +239,28 @@ def parallel_make_argument(d, fmt, limit=None, makeinst=False):
         if limit:
             v = min(limit, v)
         return fmt % v
-    return ''
+    return ""
+
 
 def packages_filter_out_system(d):
     """
     Return a list of packages from PACKAGES with the "system" packages such as
     PN-dbg PN-doc PN-locale-eb-gb removed.
     """
-    pn = d.getVar('PN')
-    pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src')]
+    pn = d.getVar("PN")
+    pkgfilter = [
+        pn + suffix
+        for suffix in ("", "-dbg", "-dev", "-doc", "-locale", "-staticdev", "-src")
+    ]
     localepkg = pn + "-locale-"
     pkgs = []
 
-    for pkg in d.getVar('PACKAGES').split():
+    for pkg in d.getVar("PACKAGES").split():
         if pkg not in pkgfilter and localepkg not in pkg:
             pkgs.append(pkg)
     return pkgs
 
+
 def getstatusoutput(cmd):
     return subprocess.getstatusoutput(cmd)
 
@@ -253,10 +279,12 @@ def trim_version(version, num_parts=2):
     trimmed = ".".join(parts[:num_parts])
     return trimmed
 
+
 def cpu_count(at_least=1, at_most=64):
     cpus = len(os.sched_getaffinity(0))
     return max(min(cpus, at_most), at_least)
 
+
 def execute_pre_post_process(d, cmds):
     if cmds is None:
         return
@@ -267,14 +295,17 @@ def execute_pre_post_process(d, cmds):
         bb.note("Executing %s ..." % cmd)
         bb.build.exec_func(cmd, d)
 
+
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def get_bb_number_threads(d):
     return int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
 
+
 def multiprocess_launch(target, items, d, extraargs=None):
     max_process = get_bb_number_threads(d)
     return multiprocess_launch_mp(target, items, max_process, extraargs)
 
+
 # For each item in items, call the function 'target' with item as the first
 # argument, extraargs as the other arguments and handle any exceptions in the
 # parent thread
@@ -344,7 +375,7 @@ def multiprocess_launch_mp(target, items, max_process, extraargs=None):
         p.join()
     if errors:
         msg = ""
-        for (e, tb) in errors:
+        for e, tb in errors:
             if isinstance(e, subprocess.CalledProcessError) and e.output:
                 msg = msg + str(e) + "\n"
                 msg = msg + "Subprocess output:"
@@ -354,24 +385,27 @@ def multiprocess_launch_mp(target, items, max_process, extraargs=None):
         bb.fatal("Fatal errors occurred in subprocesses:\n%s" % msg)
     return results
 
+
 def squashspaces(string):
     import re
+
     return re.sub(r"\s+", " ", string).strip()
 
+
 def rprovides_map(pkgdata_dir, pkg_dict):
     # Map file -> pkg provider
     rprov_map = {}
 
     for pkg in pkg_dict:
-        path_to_pkgfile = os.path.join(pkgdata_dir, 'runtime-reverse', pkg)
+        path_to_pkgfile = os.path.join(pkgdata_dir, "runtime-reverse", pkg)
         if not os.path.isfile(path_to_pkgfile):
             continue
         with open(path_to_pkgfile) as f:
             for line in f:
-                if line.startswith('RPROVIDES') or line.startswith('FILERPROVIDES'):
+                if line.startswith("RPROVIDES") or line.startswith("FILERPROVIDES"):
                     # List all components provided by pkg.
                     # Exclude version strings, i.e. those starting with (
-                    provides = [x for x in line.split()[1:] if not x.startswith('(')]
+                    provides = [x for x in line.split()[1:] if not x.startswith("(")]
                     for prov in provides:
                         if prov in rprov_map:
                             rprov_map[prov].append(pkg)
@@ -380,6 +414,7 @@ def rprovides_map(pkgdata_dir, pkg_dict):
 
     return rprov_map
 
+
 def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
     output = []
 
@@ -388,10 +423,14 @@ def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
             output.append("%s %s" % (pkg, pkg_dict[pkg]["arch"]))
     elif ret_format == "file":
         for pkg in sorted(pkg_dict):
-            output.append("%s %s %s" % (pkg, pkg_dict[pkg]["filename"], pkg_dict[pkg]["arch"]))
+            output.append(
+                "%s %s %s" % (pkg, pkg_dict[pkg]["filename"], pkg_dict[pkg]["arch"])
+            )
     elif ret_format == "ver":
         for pkg in sorted(pkg_dict):
-            output.append("%s %s %s" % (pkg, pkg_dict[pkg]["arch"], pkg_dict[pkg]["ver"]))
+            output.append(
+                "%s %s %s" % (pkg, pkg_dict[pkg]["arch"], pkg_dict[pkg]["ver"])
+            )
     elif ret_format == "deps":
         rprov_map = rprovides_map(pkgdata_dir, pkg_dict)
         for pkg in sorted(pkg_dict):
@@ -399,18 +438,20 @@ def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
                 if dep in rprov_map:
                     # There could be multiple providers within the image
                     for pkg_provider in rprov_map[dep]:
-                        output.append("%s|%s * %s [RPROVIDES]" % (pkg, pkg_provider, dep))
+                        output.append(
+                            "%s|%s * %s [RPROVIDES]" % (pkg, pkg_provider, dep)
+                        )
                 else:
                     output.append("%s|%s" % (pkg, dep))
     else:
         for pkg in sorted(pkg_dict):
             output.append(pkg)
 
-    output_str = '\n'.join(output)
+    output_str = "\n".join(output)
 
     if output_str:
         # make sure last line is newline terminated
-        output_str += '\n'
+        output_str += "\n"
 
     return output_str
 
@@ -420,24 +461,27 @@ def format_pkg_list(pkg_dict, ret_format=None, pkgdata_dir=None):
 def get_host_compiler_version(d, taskcontextonly=False):
     import re, subprocess
 
-    if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
+    if taskcontextonly and d.getVar("BB_WORKERCONTEXT") != "1":
         return
 
     compiler = d.getVar("BUILD_CC")
     # Get rid of ccache since it is not present when parsing.
-    if compiler.startswith('ccache '):
+    if compiler.startswith("ccache "):
         compiler = compiler[7:]
     try:
         env = os.environ.copy()
         # datastore PATH does not contain session PATH as set by environment-setup-...
         # this breaks the install-buildtools use-case
         # env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
-                    shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
+        output = subprocess.check_output(
+            "%s --version" % compiler, shell=True, env=env, stderr=subprocess.STDOUT
+        ).decode("utf-8")
     except subprocess.CalledProcessError as e:
-        bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
+        bb.fatal(
+            "Error running %s --version: %s" % (compiler, e.output.decode("utf-8"))
+        )
 
-    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
+    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split("\n")[0])
     if not match:
         bb.fatal("Can't get compiler version from %s --version output" % compiler)
 
@@ -445,36 +489,13 @@ def get_host_compiler_version(d, taskcontextonly=False):
     return compiler, version
 
 
-def host_gcc_version(d, taskcontextonly=False):
-    import re, subprocess
-
-    if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
-        return
-
-    compiler = d.getVar("BUILD_CC")
-    # Get rid of ccache since it is not present when parsing.
-    if compiler.startswith('ccache '):
-        compiler = compiler[7:]
-    try:
-        env = os.environ.copy()
-        env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
-                    shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
-    except subprocess.CalledProcessError as e:
-        bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
-
-    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
-    if not match:
-        bb.fatal("Can't get compiler version from %s --version output" % compiler)
-
-    version = match.group(1)
-    return "-%s" % version if version in ("4.8", "4.9") else ""
-
 @bb.parse.vardepsexclude("DEFAULTTUNE_MULTILIB_ORIGINAL", "OVERRIDES")
 def get_multilib_datastore(variant, d):
     localdata = bb.data.createCopy(d)
     if variant:
-        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
+        overrides = (
+            localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
+        )
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", variant + "-")
     else:
@@ -482,25 +503,32 @@ def get_multilib_datastore(variant, d):
         if origdefault:
             localdata.setVar("DEFAULTTUNE", origdefault)
         overrides = localdata.getVar("OVERRIDES", False).split(":")
-        overrides = ":".join([x for x in overrides if not x.startswith("virtclass-multilib-")])
+        overrides = ":".join(
+            [x for x in overrides if not x.startswith("virtclass-multilib-")]
+        )
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", "")
     return localdata
 
+
 def sh_quote(string):
     import shlex
+
     return shlex.quote(string)
 
+
 def directory_size(root, blocksize=4096):
     """
     Calculate the size of the directory, taking into account hard links,
     rounding up every size to multiples of the blocksize.
     """
+
     def roundup(size):
         """
         Round the size up to the nearest multiple of the block size.
         """
         import math
+
         return math.ceil(size / blocksize) * blocksize
 
     def getsize(filename):
@@ -522,6 +550,7 @@ def directory_size(root, blocksize=4096):
         total += roundup(getsize(root))
     return total
 
+
 # Update the mtime of a file, skip if permission/read-only issues
 def touch(filename):
     try:

