Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAf2p-0008Aq-7Z
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 11:14:59 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAeuD-0007Dp-LY for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 06:06:05 -0400
Date: Thu, 22 Mar 2012 06:05:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203220604110.11655@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] Fix common typoes "existant", "dependant" and variations
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
X-List-Received-Date: Thu, 22 Mar 2012 10:14:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Fix a couple common typoes, all contained within comments so there
should be no effect on functionality.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 3126318..9459b00 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -79,7 +79,7 @@ license_create_manifest() {
     INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
     # list of installed packages is broken for deb
     for pkg in ${INSTALLED_PKGS}; do
-        # not the best way to do this but licenses are not arch dependant iirc
+        # not the best way to do this but licenses are not arch-dependent iirc
         files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
         for filename in $files; do
             pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 22ebcfd..c0a5380 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -1,6 +1,6 @@
 #
 # This class contains functions for recipes that need QEMU or test for its
-# existance.
+# existence.
 #

 def qemu_target_binary(data):
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index d984d0d..f4d6241 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -40,7 +40,7 @@ ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib p
  for which automatic shlib dependency tracking doesn't work."

 PACKAGE_ARCH[doc] = 'The architecture needed for using a resulting package. If you have \
-machine dependant configuration options in your bitbake file add a \
+machine-dependent configuration options in your bitbake file add a \
 PACKAGE_ARCH  = "${MACHINE_ARCH}" to the file.'

 PACKAGE_ARCHS[doc] = 'A list of architectures compatible with the given target in order of priority'
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf
index f0c993d..68258f5 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf
@@ -28,7 +28,7 @@
 # Parameters for the control interface. If this is specified, wpa_supplicant
 # will open a control interface that is available for external programs to
 # manage wpa_supplicant. The meaning of this string depends on which control
-# interface mechanism is used. For all cases, the existance of this parameter
+# interface mechanism is used. For all cases, the existence of this parameter
 # in configuration is used to determine whether the control interface is
 # enabled.
 #
diff --git a/meta/recipes-devtools/distcc/files/distcc-avahi.patch b/meta/recipes-devtools/distcc/files/distcc-avahi.patch
index 30b4c91..1f15d4b 100644
--- a/meta/recipes-devtools/distcc/files/distcc-avahi.patch
+++ b/meta/recipes-devtools/distcc/files/distcc-avahi.patch
@@ -899,7 +899,7 @@ Upstream-Status: Pending
 +    AvahiServiceResolver *resolver;
 +};
 +
-+/* A generic, system independant lock routine, similar to sys_lock,
++/* A generic, system-independent lock routine, similar to sys_lock,
 + * but more powerful:
 + *        rw:         if non-zero: r/w lock instead of r/o lock
 + *        enable:     lock or unlock
diff --git a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch b/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
index 5e6c40d..9dd10b2 100644
--- a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
+++ b/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
@@ -55,7 +55,7 @@ Index: trunk/libopkg/opkg_install.c
 +		    opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
 +		    err = opkg_install_pkg(dep, 0);
 +		    /* mark this package as having been automatically installed to
-+		     * satisfy a dependancy */
++		     * satisfy a dependency */
 +		    dep->auto_installed = 1;
 +		    if (err) {
 +			 pkg_vec_free(depends);
diff --git a/meta/recipes-devtools/opkg/opkg/track_parents.patch b/meta/recipes-devtools/opkg/opkg/track_parents.patch
index 1f54256..ef327e3 100644
--- a/meta/recipes-devtools/opkg/opkg/track_parents.patch
+++ b/meta/recipes-devtools/opkg/opkg/track_parents.patch
@@ -23,7 +23,7 @@ Index: trunk/libopkg/opkg_install.c
 +     	                 pkg_vec_insert(dep->wanted_by, pkg);
  		    err = opkg_install_pkg(dep, 0);
  		    /* mark this package as having been automatically installed to
- 		     * satisfy a dependancy */
+ 		     * satisfy a dependency */
 @@ -115,6 +121,8 @@
  	  /* The package was uninstalled when we started, but another
  	     dep earlier in this loop may have depended on it and pulled
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
index 26239d2..ae695c4 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
@@ -7,7 +7,7 @@
 #egrep -r "use|require" perl-module-* | grep ";" | egrep "\.pm:require | \.pm:use" | sed "s-/.*\.pm: *- += -g" | sed "s/[\"\']//g" | sed "s/;.*/\"/g" | sed "s/require */\"perl-module-/g" | sed "s/CPANPLUS::.*/cpanplus/g" | sed "s/CPAN::.*/cpan/g" | tr [:upper:] [:lower:] | sed "s/::/-/g" | grep -v perl-module-5 | sed "s/ [^+\"].*//g" | grep -v "\\$" | sed "s/_/-/g" | sed "s/\.pl\"$/\"/" | grep -v "\-vms\-" | sort -u > /tmp/1
 #find . -type f | sed "s-\./--" | sed "s-/.*--" | sort -u > /tmp/2
 #cat /tmp/1 | cut -f3 -d" " | sed "s/[\"\']//g" | sort -u > /tmp/3
-## these dependancies do not exist
+## these dependencies do not exist
 #diff -u /tmp/2 /tmp/3 | grep ^+perl-module


diff --git a/meta/recipes-extended/at/files/fix_parallel_build_error.patch b/meta/recipes-extended/at/files/fix_parallel_build_error.patch
index 877be35..66ff3e1 100644
--- a/meta/recipes-extended/at/files/fix_parallel_build_error.patch
+++ b/meta/recipes-extended/at/files/fix_parallel_build_error.patch
@@ -5,7 +5,7 @@ make -j was failing sometimesa like this
 | make: *** [lex.yy.o] Error 1
 | make: *** Waiting for unfinished jobs....

-Fixed the issue by adding a dependancy in the makefile.
+Fixed the issue by adding a dependency in the makefile.
 Nitin <nitin.a.kamble@intel.com>
 2010/09/02

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
index 5043634..37d291f 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.902.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Generic PCI access library for X"

 DESCRIPTION = "libpciaccess provides functionality for X to access the \
-PCI bus and devices in a platform-independant way."
+PCI bus and devices in a platform-independent way."

 require xorg-lib-common.inc

diff --git a/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch b/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
index 18237f2..bf45b2f 100644
--- a/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
+++ b/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
@@ -1027,7 +1027,7 @@ Index: taglib-1.6.1/acinclude.m4
 -   test -n "$_LT_AC_TAGVAR(runpath_var $1)" || \
 -   test "X$_LT_AC_TAGVAR(hardcode_automatic, $1)"="Xyes" ; then
 -
--  # We can hardcode non-existant directories.
+-  # We can hardcode non-existent directories.
 -  if test "$_LT_AC_TAGVAR(hardcode_direct, $1)" != no &&
 -     # If the only mechanism to avoid hardcoding is shlibpath_var, we
 -     # have to relink, otherwise we might link with an installed library


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


