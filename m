Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T3VUs-0000kP-2U for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 19:10:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7KGwZ3x003791
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 17:58:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02684-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 17:58:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7KGwPpN003785
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 17:58:26 +0100
Message-ID: <1345481905.3907.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 17:58:25 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: meta/classes: Various python whitespace fixes
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
X-List-Received-Date: Mon, 20 Aug 2012 17:10:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It was pointed out we have a number of weird indentations in the python functions. This patch
cleans up 3, 7 and other weird indentations for the core bbclass files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 84dcb47..6021ce0 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -205,8 +205,8 @@ def preferred_ml_updates(d):
             continue
         virt = ""
         if pkg.startswith("virtual/"):
-             pkg = pkg.replace("virtual/", "")
-             virt = "virtual/"
+            pkg = pkg.replace("virtual/", "")
+            virt = "virtual/"
         for p in prefixes:
             newname = "PREFERRED_PROVIDER_" + virt + p + "-" + pkg
             if pkg != "kernel":
@@ -353,13 +353,13 @@ python () {
             appends = bb.utils.explode_deps(d.expand(" ".join(appends)))
             newappends = []
             for a in appends:
-               if a.endswith("-native") or a.endswith("-cross"):
-                   newappends.append(a)
-               elif a.startswith("virtual/"):
-                   subs = a.split("/", 1)[1]
-                   newappends.append("virtual/" + prefix + subs + extension)
-               else:
-                   newappends.append(prefix + a + extension)
+                if a.endswith("-native") or a.endswith("-cross"):
+                    newappends.append(a)
+                elif a.startswith("virtual/"):
+                    subs = a.split("/", 1)[1]
+                    newappends.append("virtual/" + prefix + subs + extension)
+                else:
+                    newappends.append(prefix + a + extension)
             return newappends
 
         def appendVar(varname, appends):
diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
index 6806dcd..006763d 100644
--- a/meta/classes/bugzilla.bbclass
+++ b/meta/classes/bugzilla.bbclass
@@ -105,8 +105,8 @@ python bugzilla_eventhandler() {
     data = e.data
     name = bb.event.getName(event)
     if name == "MsgNote":
-       # avoid recursion
-       return
+        # avoid recursion
+        return
 
     if name == "TaskFailed":
         xmlrpc  = data.getVar("BUGZILLA_XMLRPC", True)
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index dc9afb1..6fd13a8 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -65,7 +65,7 @@ def set_device(e):
     try:
         for line in open("/proc/diskstats", "r"):
             if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
-               rdev=line.split()[2]
+                rdev=line.split()[2]
     except:
         pass
     file = open(e.data.getVar('DEVFILE', True), "w")
@@ -100,10 +100,10 @@ def get_diskdata(var, dev, data):
     olddiskdata = data.getVar(var, False)
     diskdata = {}
     if olddiskdata is None:
-       return
+        return
     newdiskdata = get_diskstats(dev)
     for key in olddiskdata.iterkeys():
-        diskdata["Start"+key] = str(int(olddiskdata[key]))        
+        diskdata["Start"+key] = str(int(olddiskdata[key]))
         diskdata["End"+key] = str(int(newdiskdata[key]))    
     return diskdata
     
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 147accc..a093628 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -54,12 +54,12 @@ python build_grub_cfg() {
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
         return
-       
+
     labels = d.getVar('LABELS', True)
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
         return
-   
+
     if labels == []:
         bb.debug(1, "No labels, nothing to do")
         return
@@ -109,7 +109,7 @@ python build_grub_cfg() {
         if append:
             cfgfile.write('%s' % (append))
         cfgfile.write('\n')
-   
+
         if initrd:
             cfgfile.write('initrd /initrd')
         cfgfile.write('\n}\n')
diff --git a/meta/classes/image-swab.bbclass b/meta/classes/image-swab.bbclass
index 0414653..37d7535 100644
--- a/meta/classes/image-swab.bbclass
+++ b/meta/classes/image-swab.bbclass
@@ -51,13 +51,13 @@ python() {
     # and cross packages which aren't swabber-native or one of its dependencies
     # I have ignored them for now...
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('nativesdk', d) and not bb.data.inherits_class('cross', d):
-       deps = (d.getVarFlag('do_setscene', 'depends') or "").split()
-       deps.append('strace-native:do_populate_sysroot')
-       d.setVarFlag('do_setscene', 'depends', " ".join(deps))
-       logdir = d.expand("${TRACE_LOGDIR}")
-       bb.utils.mkdirhier(logdir)
+        deps = (d.getVarFlag('do_setscene', 'depends') or "").split()
+        deps.append('strace-native:do_populate_sysroot')
+        d.setVarFlag('do_setscene', 'depends', " ".join(deps))
+        logdir = d.expand("${TRACE_LOGDIR}")
+        bb.utils.mkdirhier(logdir)
     else:
-       d.setVar('STRACEFUNC', '')
+        d.setVar('STRACEFUNC', '')
 }
 
 STRACEPID = "${@os.getpid()}"
@@ -76,23 +76,23 @@ imageswab_attachstrace () {
 
 do_generate_swabber_report () {
 
-  update_distro ${HOST_DATA}
+	update_distro ${HOST_DATA}
 
-  # Swabber can't create the directory for us
-  mkdir -p ${SWABBER_REPORT}
+	# Swabber can't create the directory for us
+	mkdir -p ${SWABBER_REPORT}
 
-  REPORTSTAMP=${SWAB_ORIG_TASK}-`date +%2m%2d%2H%2M%Y`
+	REPORTSTAMP=${SWAB_ORIG_TASK}-`date +%2m%2d%2H%2M%Y`
 
-  if [ `which ccache` ] ; then
-    CCACHE_DIR=`( ccache -s | grep "cache directory" | grep -o '[^ ]*$' 2> /dev/null )`
-  fi
+	if [ `which ccache` ] ; then
+		CCACHE_DIR=`( ccache -s | grep "cache directory" | grep -o '[^ ]*$' 2> /dev/null )`
+ 	fi
 
-  if [ "$(ls -A ${HOST_DATA})" ]; then
-    echo "Generating swabber report"
-    swabber -d ${HOST_DATA} -l ${SWABBER_LOGS} -o ${SWABBER_REPORT}/report-${REPORTSTAMP}.txt -r ${SWABBER_REPORT}/extra_report-${REPORTSTAMP}.txt -c all -p ${TOPDIR} -f ${OEROOT}/meta/conf/swabber ${TOPDIR} ${OEROOT} ${CCACHE_DIR}
-  else
-    echo "No host data, cannot generate swabber report."
-  fi
+	if [ "$(ls -A ${HOST_DATA})" ]; then
+		echo "Generating swabber report"
+		swabber -d ${HOST_DATA} -l ${SWABBER_LOGS} -o ${SWABBER_REPORT}/report-${REPORTSTAMP}.txt -r ${SWABBER_REPORT}/extra_report-${REPORTSTAMP}.txt -c all -p ${TOPDIR} -f ${OEROOT}/meta/conf/swabber ${TOPDIR} ${OEROOT} ${CCACHE_DIR}
+	else
+		echo "No host data, cannot generate swabber report."
+	fi
 }
 addtask generate_swabber_report after do_${SWAB_ORIG_TASK}
 do_generate_swabber_report[depends] = "swabber-native:do_populate_sysroot"
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 556a176..0f3f1cd 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -109,7 +109,7 @@ def package_qa_get_machine_dict():
             "linux-gnux32" :       {
                         "x86_64":     (62,     0,    0,          True,          32),
                       },
-       }
+        }
 
 
 # Currently not being used by default "desktop"
@@ -719,19 +719,19 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
 
     cnf = d.getVar('EXTRA_OECONF', True) or ""
     if "gettext" not in d.getVar('P', True) and "gcc-runtime" not in d.getVar('P', True) and "--disable-nls" not in cnf:
-       ml = d.getVar("MLPREFIX", True) or ""
-       if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
-          gt = "gettext-native"
-       elif bb.data.inherits_class('cross-canadian', d):
-          gt = "gettext-nativesdk"
-       else:
-          gt = "virtual/" + ml + "gettext"
-       deps = bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
-       if gt not in deps:
-          for config in configs:
-              gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
-              if subprocess.call(gnu, shell=True) == 0:
-                 bb.fatal("""%s required but not in DEPENDS for file %s.
+        ml = d.getVar("MLPREFIX", True) or ""
+        if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
+            gt = "gettext-native"
+        elif bb.data.inherits_class('cross-canadian', d):
+            gt = "gettext-nativesdk"
+        else:
+            gt = "virtual/" + ml + "gettext"
+        deps = bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
+        if gt not in deps:
+            for config in configs:
+                gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
+                if subprocess.call(gnu, shell=True) == 0:
+                    bb.fatal("""%s required but not in DEPENDS for file %s.
 Missing inherit gettext?""" % (gt, config))
 
     if not package_qa_check_license(workdir, d):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 278f0f0..b17fa08 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -230,42 +230,42 @@ def splitfile2(debugsrcdir, d):
 
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
-       dvar = d.getVar('PKGD', True)
-       pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
-       strip = d.getVar("STRIP", True)
-       objcopy = d.getVar("OBJCOPY", True)
-       debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
-       workdir = d.getVar("WORKDIR", True)
-       workparentdir = os.path.dirname(workdir)
-       workbasedir = os.path.basename(workdir)
-
-       nosuchdir = []
-       basepath = dvar
-       for p in debugsrcdir.split("/"):
-           basepath = basepath + "/" + p
-           if not os.path.exists(basepath):
-               nosuchdir.append(basepath)
-       bb.mkdirhier(basepath)
-
-       processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
-       # We need to ignore files that are not actually ours
-       # we do this by only paying attention to items from this package
-       processdebugsrc += "fgrep -z '%s' | "
-       processdebugsrc += "(cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)"
-
-       subprocess.call(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir), shell=True)
-
-       # The copy by cpio may have resulted in some empty directories!  Remove these
-       for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
-          for d in dirs:
-              dir = os.path.join(root, d)
-              #bb.note("rmdir -p %s" % dir)
-              subprocess.call("rmdir -p %s 2>/dev/null" % dir, shell=True)
-
-       # Also remove debugsrcdir if its empty
-       for p in nosuchdir[::-1]:
-           if os.path.exists(p) and not os.listdir(p):
-               os.rmdir(p)
+        dvar = d.getVar('PKGD', True)
+        pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
+        strip = d.getVar("STRIP", True)
+        objcopy = d.getVar("OBJCOPY", True)
+        debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
+        workdir = d.getVar("WORKDIR", True)
+        workparentdir = os.path.dirname(workdir)
+        workbasedir = os.path.basename(workdir)
+
+        nosuchdir = []
+        basepath = dvar
+        for p in debugsrcdir.split("/"):
+            basepath = basepath + "/" + p
+            if not os.path.exists(basepath):
+                nosuchdir.append(basepath)
+        bb.mkdirhier(basepath)
+
+        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
+        # We need to ignore files that are not actually ours
+        # we do this by only paying attention to items from this package
+        processdebugsrc += "fgrep -z '%s' | "
+        processdebugsrc += "(cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)"
+
+        subprocess.call(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir), shell=True)
+
+        # The copy by cpio may have resulted in some empty directories!  Remove these
+        for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
+            for d in dirs:
+                dir = os.path.join(root, d)
+                #bb.note("rmdir -p %s" % dir)
+                subprocess.call("rmdir -p %s 2>/dev/null" % dir, shell=True)
+
+        # Also remove debugsrcdir if its empty
+        for p in nosuchdir[::-1]:
+            if os.path.exists(p) and not os.listdir(p):
+                os.rmdir(p)
 
 def runstrip(file, elftype, d):
     # Function to strip a single file, called from split_and_strip_files below
@@ -735,7 +735,7 @@ python split_and_strip_files () {
     file_list = {}
     file_links = {}
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1') and \
-       (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
+            (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
         for root, dirs, files in os.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a297a1f..e94586e 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -172,23 +172,23 @@ package_install_internal_ipk() {
 }
 
 ipk_log_check() {
-       target="$1"
-       lf_path="$2"
-
-       lf_txt="`cat $lf_path`"
-       for keyword_die in "exit 1" "Collected errors" ERR Fail
-       do
-               if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
-               then
-                       echo "log_check: There were error messages in the logfile"
-                       echo -e "log_check: Matched keyword: [$keyword_die]\n"
-                       echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
-                       echo ""
-                       do_exit=1
-               fi
-       done
-       test "$do_exit" = 1 && exit 1
-       true
+	target="$1"
+	lf_path="$2"
+
+	lf_txt="`cat $lf_path`"
+	for keyword_die in "exit 1" "Collected errors" ERR Fail
+	do
+		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		then
+			echo "log_check: There were error messages in the logfile"
+			echo -e "log_check: Matched keyword: [$keyword_die]\n"
+			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
+			echo ""
+			do_exit=1
+		fi
+	done
+	test "$do_exit" = 1 && exit 1
+	true
 }
 
 #
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index bfb346f..1266b5f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -101,23 +101,23 @@ package_generate_rpm_conf_common() {
 }
 
 rpm_log_check() {
-       target="$1"
-       lf_path="$2"
-
-       lf_txt="`cat $lf_path`"
-       for keyword_die in "Cannot find package" "exit 1" ERR Fail
-       do
-               if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
-               then
-                       echo "log_check: There were error messages in the logfile"
-                       echo -e "log_check: Matched keyword: [$keyword_die]\n"
-                       echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
-                       echo ""
-                       do_exit=1
-               fi
-       done
-       test "$do_exit" = 1 && exit 1
-       true
+	target="$1"
+	lf_path="$2"
+
+	lf_txt="`cat $lf_path`"
+	for keyword_die in "Cannot find package" "exit 1" ERR Fail
+	do
+		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		then
+			echo "log_check: There were error messages in the logfile"
+			echo -e "log_check: Matched keyword: [$keyword_die]\n"
+			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
+			echo ""
+			do_exit=1
+		fi
+	done
+	test "$do_exit" = 1 && exit 1
+	true
 }
 
 
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 63e9e7f..c3bd0d2 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -4,7 +4,7 @@ def __note(msg, d):
 __recipe_sanity_badruntimevars = "RDEPENDS RPROVIDES RRECOMMENDS RCONFLICTS"
 def bad_runtime_vars(cfgdata, d):
     if bb.data.inherits_class("native", d) or \
-       bb.data.inherits_class("cross", d):
+            bb.data.inherits_class("cross", d):
         return
 
     for var in d.getVar("__recipe_sanity_badruntimevars", True).split():
@@ -42,7 +42,7 @@ def var_renames_overwrite(cfgdata, d):
 
 def incorrect_nonempty_PACKAGES(cfgdata, d):
     if bb.data.inherits_class("native", d) or \
-       bb.data.inherits_class("cross", d):
+            bb.data.inherits_class("cross", d):
         if d.getVar("PACKAGES", True):
             return True
 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 575ce15..1a0c232 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -280,10 +280,10 @@ def check_sanity_validmachine(sanity_data):
             tunefound = True
 
     if len(dups):
-       messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
+        messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
 
     if tunefound == False:
-       messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
+        messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
 
     return messages
 
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e87f3c0..6762e32 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -174,7 +174,7 @@ def sstate_installpkg(ss, d):
     sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz"
 
     if not os.path.exists(sstatepkg):
-       pstaging_fetch(sstatefetch, sstatepkg, d)
+        pstaging_fetch(sstatefetch, sstatepkg, d)
 
     if not os.path.isfile(sstatepkg):
         bb.note("Staging package %s does not exist" % sstatepkg)
@@ -259,10 +259,10 @@ def sstate_clean_manifest(manifest, d):
         # so we ignore errors here.
         try:
             if entry.endswith("/"):
-               if os.path.islink(entry[:-1]):
-                  os.remove(entry[:-1])
-               elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
-                  os.rmdir(entry[:-1])
+                if os.path.islink(entry[:-1]):
+                    os.remove(entry[:-1])
+                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
+                    os.rmdir(entry[:-1])
             else:
                 oe.path.remove(entry)
         except OSError:
@@ -314,14 +314,14 @@ python sstate_cleanall() {
 
     for manifest in (os.listdir(manifest_dir)):
         if fnmatch.fnmatch(manifest, manifest_pattern):
-             name = manifest.replace(manifest_pattern[:-1], "")
-             namemap = d.getVar('SSTATETASKNAMES', True).split()
-             tasks = d.getVar('SSTATETASKS', True).split()
-             if name not in namemap:
-                  continue
-             taskname = tasks[namemap.index(name)]
-             shared_state = sstate_state_fromvars(d, taskname[3:])
-             sstate_clean(shared_state, d)
+            name = manifest.replace(manifest_pattern[:-1], "")
+            namemap = d.getVar('SSTATETASKNAMES', True).split()
+            tasks = d.getVar('SSTATETASKS', True).split()
+            if name not in namemap:
+                continue
+            taskname = tasks[namemap.index(name)]
+            shared_state = sstate_state_fromvars(d, taskname[3:])
+            sstate_clean(shared_state, d)
 }
 
 def sstate_hardcode_path(d):
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index eda415e..8b3dcb4 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -70,8 +70,8 @@ SYSROOT_LOCK = "${STAGING_DIR}/staging.lock"
 
 # We clean out any existing sstate from the sysroot if we rerun configure
 python sysroot_cleansstate () {
-     ss = sstate_state_fromvars(d, "populate_sysroot")
-     sstate_clean(ss, d)
+    ss = sstate_state_fromvars(d, "populate_sysroot")
+    sstate_clean(ss, d)
 }
 do_configure[prefuncs] += "sysroot_cleansstate"
 
diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclient.bbclass
index e57bc48..6984efd 100644
--- a/meta/classes/tinderclient.bbclass
+++ b/meta/classes/tinderclient.bbclass
@@ -2,20 +2,20 @@ def tinder_http_post(server, selector, content_type, body):
     import httplib
     # now post it
     for i in range(0,5):
-       try:
-           h = httplib.HTTP(server)
-           h.putrequest('POST', selector)
-           h.putheader('content-type', content_type)
-           h.putheader('content-length', str(len(body)))
-           h.endheaders()
-           h.send(body)
-           errcode, errmsg, headers = h.getreply()
-           #print errcode, errmsg, headers
-           return (errcode,errmsg, headers, h.file)
-       except:
-           print "Error sending the report!"
-           # try again
-           pass
+        try:
+            h = httplib.HTTP(server)
+            h.putrequest('POST', selector)
+            h.putheader('content-type', content_type)
+            h.putheader('content-length', str(len(body)))
+            h.endheaders()
+            h.send(body)
+            errcode, errmsg, headers = h.getreply()
+            #print errcode, errmsg, headers
+            return (errcode,errmsg, headers, h.file)
+        except:
+            print "Error sending the report!"
+            # try again
+            pass
 
     # return some garbage
     return (-1, "unknown", "unknown", None)
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 47215ad..4e1ff27 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -150,22 +150,22 @@ def update_alternatives_after_parse(d):
 UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
 
 def gen_updatealternativesvardeps(d):
-   pkgs = (d.getVar("PACKAGES", True) or "").split()
-   vars = (d.getVar("UPDALTVARS", True) or "").split()
-
-   # First compute them for non_pkg versions
-   for v in vars:
-      for flag in (d.getVarFlags(v) or {}):
-         if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
-            continue
-         d.appendVar('%s_VARDEPS' % (v), ' %s:%s' % (flag, d.getVarFlag(v, flag, False)))
-
-   for p in pkgs:
-      for v in vars:
-         for flag in (d.getVarFlags("%s_%s" % (v,p)) or {}):
+    pkgs = (d.getVar("PACKAGES", True) or "").split()
+    vars = (d.getVar("UPDALTVARS", True) or "").split()
+
+    # First compute them for non_pkg versions
+    for v in vars:
+        for flag in (d.getVarFlags(v) or {}):
             if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
-               continue
-            d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
+                continue
+            d.appendVar('%s_VARDEPS' % (v), ' %s:%s' % (flag, d.getVarFlag(v, flag, False)))
+
+    for p in pkgs:
+        for v in vars:
+            for flag in (d.getVarFlags("%s_%s" % (v,p)) or {}):
+                if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
+                    continue
+                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
 
 python __anonymous() {
     # deprecated stuff...
@@ -176,18 +176,18 @@ python __anonymous() {
 }
 
 def gen_updatealternativesvars(d):
-   ret = []
-   pkgs = (d.getVar("PACKAGES", True) or "").split()
-   vars = (d.getVar("UPDALTVARS", True) or "").split()
-
-   for v in vars:
-      ret.append(v + "_VARDEPS")
-
-   for p in pkgs:
-      for v in vars:
-         ret.append(v + "_" + p)
-         ret.append(v + "_VARDEPS_" + p)
-   return " ".join(ret)
+    ret = []
+    pkgs = (d.getVar("PACKAGES", True) or "").split()
+    vars = (d.getVar("UPDALTVARS", True) or "").split()
+
+    for v in vars:
+        ret.append(v + "_VARDEPS")
+
+    for p in pkgs:
+        for v in vars:
+            ret.append(v + "_" + p)
+            ret.append(v + "_VARDEPS_" + p)
+    return " ".join(ret)
 
 # First the deprecated items...
 populate_packages[vardeps] += "ALTERNATIVE_LINKS ALTERNATIVE_NAME ALTERNATIVE_PATH"
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 5740610..c47ad69 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -246,49 +246,49 @@ oe_machinstall() {
 }
 
 create_cmdline_wrapper () {
-   # Create a wrapper script
-   #
-   # These are useful to work around relocation issues, by setting environment
-   # variables which point to paths in the filesystem.
-   #
-   # Usage: create_wrapper FILENAME [[VAR=VALUE]..]
+	# Create a wrapper script
+	#
+	# These are useful to work around relocation issues, by setting environment
+	# variables which point to paths in the filesystem.
+	#
+	# Usage: create_wrapper FILENAME [[VAR=VALUE]..]
 
-   cmd=$1
-   shift
+	cmd=$1
+	shift
 
-   echo "Generating wrapper script for $cmd"
+	echo "Generating wrapper script for $cmd"
 
-   mv $cmd $cmd.real
-   cmdname=`basename $cmd`.real
-   cat <<END >$cmd
+	mv $cmd $cmd.real
+	cmdname=`basename $cmd`.real
+	cat <<END >$cmd
 #!/bin/sh
 realpath=\`readlink -fn \$0\`
 exec \`dirname \$realpath\`/$cmdname $@ "\$@"
 END
-   chmod +x $cmd
+	chmod +x $cmd
 }
 
 create_wrapper () {
-   # Create a wrapper script
-   #
-   # These are useful to work around relocation issues, by setting environment
-   # variables which point to paths in the filesystem.
-   #
-   # Usage: create_wrapper FILENAME [[VAR=VALUE]..]
+	# Create a wrapper script
+	#
+	# These are useful to work around relocation issues, by setting environment
+	# variables which point to paths in the filesystem.
+	#
+	# Usage: create_wrapper FILENAME [[VAR=VALUE]..]
 
-   cmd=$1
-   shift
+	cmd=$1
+	shift
 
-   echo "Generating wrapper script for $cmd"
+	echo "Generating wrapper script for $cmd"
 
-   mv $cmd $cmd.real
-   cmdname=`basename $cmd`.real
-   cat <<END >$cmd
+	mv $cmd $cmd.real
+	cmdname=`basename $cmd`.real
+	cat <<END >$cmd
 #!/bin/sh
 realpath=\`readlink -fn \$0\`
 exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
 END
-   chmod +x $cmd
+	chmod +x $cmd
 }
 
 def check_app_exists(app, d):




