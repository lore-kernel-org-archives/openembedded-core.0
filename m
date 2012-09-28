Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1THhwS-0006uQ-Au
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 23:17:48 +0200
Received: by eeit10 with SMTP id t10so1439380eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=NrtIaxTqA5Pl7enxwOczsLP4kiZC2783fIZJ263PHvA=;
	b=F07gsaK8Gb/rYnIM9B8pt/RxzUgxyvS3bj87cLziO4bTrFgl2ie+InFPqscwaQ7Gfj
	D6Ew9coSCDO4rjFvMS8vfyBj8bxf494sgsmYELaRvrcBHoKK2LCZnu81PkfDs5Tjm1yG
	VPAYWoCyT7+I0y+6T32/2PAhOA3xBIPxI9JJv5y1Ko6FbebDdQ9mJa0TU0o4Pp40iEvK
	8ghzZWJx1nKw7tX0h3VJz9bTPFTudGD5gdZllP6irs7oGv0sQGjwJJHomWFTh7CcoDFB
	I0LP+XUIzVWU3s6EzaWQE1YX+cgi8Dc38pQGQlDB8MhC0d/RxGALHtfNQvKycwetmtDe
	ffMA==
Received: by 10.14.203.73 with SMTP id e49mr11390732eeo.27.1348866294562;
	Fri, 28 Sep 2012 14:04:54 -0700 (PDT)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id t1sm28793914eeo.3.2012.09.28.14.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 14:04:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2012 23:04:42 +0200
Message-Id: <1348866282-30437-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnCJqH4Ant8JrST9ZPLdF1u/whyKg/MHfCxISgsg9I9tAIWfGjpLMY39onx7fXD9KWGXrGx
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] Revert "opkg svn: respect to the arch priority"
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
X-List-Received-Date: Fri, 28 Sep 2012 21:17:49 -0000

This completely breaks installing packages from feeds:

root@bone-mainline:~# opkg install libgtk-2.0
Installing libgtk-2.0 (2.24.8-r7.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/libgtk-2.0_2.24.8-r7.1_armv7a-vfp-neon.ipk.
Installing pango (1.30.0-r1.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/pango_1.30.0-r1.1_armv7a-vfp-neon.ipk.
Installing pango-module-basic-x (1.30.0-r1.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/pango-module-basic-x_1.30.0-r1.1_armv7a-vfp-neon.ipk.
Installing pango-module-basic-fc (1.30.0-r1.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/pango-module-basic-fc_1.30.0-r1.1_armv7a-vfp-neon.ipk.
Installing shared-mime-info (0.91-r4.9) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/shared-mime-info_0.91-r4.9_armv7a-vfp-neon.ipk.
Installing gdk-pixbuf-loader-png (2.24.1-r7.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/gdk-pixbuf-loader-png_2.24.1-r7.1_armv7a-vfp-neon.ipk.
Installing gdk-pixbuf-loader-jpeg (2.24.1-r7.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/gdk-pixbuf-loader-jpeg_2.24.1-r7.1_armv7a-vfp-neon.ipk.
Installing libjpeg8 (8d+1.2.1-r1.1) to root...
Configuring pango-module-basic-x.
Configuring pango.
Configuring pango-module-basic-fc.
Configuring shared-mime-info.
Configuring hicolor-icon-theme.
//var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: gtk-update-icon-cache: command not found
Configuring gdk-pixbuf-loader-png.
Collected errors:
 * opkg_download_pkg: Package libjpeg8 is not available from any configured src.
 * opkg_install_pkg: Failed to download libjpeg8. Perhaps you need to run 'opkg update'?
 * opkg_install_cmd: Cannot install package libgtk-2.0.
 * pkg_run_script: package "hicolor-icon-theme" postinst script returned status 127.
 * opkg_configure: hicolor-icon-theme.postinst returned 127.

root@bone-mainline:~# opkg install libjpeg8
Installing libjpeg8 (8d+1.2.1-r1.2) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/libjpeg8_8d+1.2.1-r1.2_armv7a-vfp-neon.ipk.
Configuring libjpeg8.
Configuring hicolor-icon-theme.
//var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: gtk-update-icon-cache: command not found
Collected errors:
 * pkg_run_script: package "hicolor-icon-theme" postinst script returned status 127.
 * opkg_configure: hicolor-icon-theme.postinst returned 127.

root@bone-mainline:~# opkg install libgtk-2.0
Installing libgtk-2.0 (2.24.8-r7.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/libgtk-2.0_2.24.8-r7.1_armv7a-vfp-neon.ipk.
Installing gdk-pixbuf-loader-jpeg (2.24.1-r7.1) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/gdk-pixbuf-loader-jpeg_2.24.1-r7.1_armv7a-vfp-neon.ipk.
Installing liberation-fonts (1:1.04-r2.1) to root...
Downloading http://feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/all/liberation-fonts_1.04-r2.1_all.ipk.
Installing fontconfig-utils (2.9.0-r0.8) to root...
Configuring hicolor-icon-theme.
//var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: gtk-update-icon-cache: command not found
Configuring gdk-pixbuf-loader-jpeg.
Collected errors:
 * opkg_download_pkg: Package fontconfig-utils is not available from any configured src.
 * opkg_install_pkg: Failed to download fontconfig-utils. Perhaps you need to run 'opkg update'?
 * opkg_install_cmd: Cannot install package libgtk-2.0.
 * pkg_run_script: package "hicolor-icon-theme" postinst script returned status 127.
 * opkg_configure: hicolor-icon-theme.postinst returned 127.

root@bone-mainline:~# opkg install fontconfig-utils
Installing fontconfig-utils (2.9.0-r0.9) to root...
Downloading http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp-neon/base/fontconfig-utils_2.9.0-r0.9_armv7a-vfp-neon.ipk.
Configuring hicolor-icon-theme.
//var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: gtk-update-icon-cache: command not found
Configuring fontconfig-utils.

And on ...

This reverts commit 0a80a02644f624443cef8cc4f604edb5ef8e6975.
---
 .../opkg/opkg/0008-select_higher_version.patch     |  102 --------------------
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 2 files changed, 1 insertion(+), 104 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch b/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
deleted file mode 100644
index 46d11b0..0000000
--- a/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-Add the --select-higher-version option
-
-If there were more than one candidate which had the same pkg name in the
-candidate list, for example, the same pkg with different versions, then
-it would use the last one which was the highest version one in the past,
-but it will use the higher arch priority one now.
-
-Add the "--select-higher-version" option to let it use the higher
-version package when enabled. the default is no.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libopkg/opkg_conf.h |    1 +
- libopkg/pkg_hash.c  |   18 +++++++++++++++---
- src/opkg-cl.c       |    9 +++++++++
- 3 files changed, 25 insertions(+), 3 deletions(-)
-
-diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
---- a/libopkg/opkg_conf.h
-+++ b/libopkg/opkg_conf.h
-@@ -77,6 +77,7 @@ struct opkg_conf
-      int force_removal_of_essential_packages;
-      int force_postinstall;
-      int force_remove;
-+     int select_higher_version;
-      int check_signature;
-      int nodeps; /* do not follow dependencies */
-      char *offline_root;
-diff --git a/libopkg/pkg_hash.c b/libopkg/pkg_hash.c
---- a/libopkg/pkg_hash.c
-+++ b/libopkg/pkg_hash.c
-@@ -376,10 +376,22 @@ pkg_hash_fetch_best_installation_candidate(abstract_pkg_t *apkg,
-           if (constraint_fcn(matching, cdata)) {
-              opkg_msg(DEBUG, "Candidate: %s %s.\n",
- 			     matching->name, matching->version) ;
--             good_pkg_by_name = matching;
- 	     /* It has been provided by hand, so it is what user want */
--             if (matching->provided_by_hand == 1)
--                break;
-+             if (matching->provided_by_hand == 1) {
-+                 good_pkg_by_name = matching;
-+                 break;
-+             }
-+             /* Respect to the arch priorities when given alternatives */
-+             if (good_pkg_by_name && !conf->select_higher_version) {
-+                 if (matching->arch_priority >= good_pkg_by_name->arch_priority) {
-+                     good_pkg_by_name = matching;
-+                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
-+                         matching->name, matching->version) ;
-+                 } else
-+                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
-+                         good_pkg_by_name->name, good_pkg_by_name->version) ;
-+             } else
-+                 good_pkg_by_name = matching;
-           }
-      }
- 
-diff --git a/src/opkg-cl.c b/src/opkg-cl.c
---- a/src/opkg-cl.c
-+++ b/src/opkg-cl.c
-@@ -42,6 +42,7 @@ enum {
- 	ARGS_OPT_FORCE_SPACE,
- 	ARGS_OPT_FORCE_POSTINSTALL,
- 	ARGS_OPT_FORCE_REMOVE,
-+	ARGS_OPT_SELECT_HIGHER_VERSION,
- 	ARGS_OPT_ADD_ARCH,
- 	ARGS_OPT_ADD_DEST,
- 	ARGS_OPT_NOACTION,
-@@ -83,6 +84,8 @@ static struct option long_options[] = {
- 	{"force_postinstall", 0, 0, ARGS_OPT_FORCE_POSTINSTALL},
- 	{"force-remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
- 	{"force_remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
-+	{"select-higher-version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
-+	{"select_higher_version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
- 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
- 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
- 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
-@@ -173,6 +176,9 @@ args_parse(int argc, char *argv[])
- 		case ARGS_OPT_FORCE_REMOVE:
- 			conf->force_remove = 1;
- 			break;
-+		case ARGS_OPT_SELECT_HIGHER_VERSION:
-+			conf->select_higher_version = 1;
-+			break;
- 		case ARGS_OPT_NODEPS:
- 			conf->nodeps = 1;
- 			break;
-@@ -271,6 +277,9 @@ usage()
- 	printf("\t--offline-root <dir>	offline installation of packages.\n");
- 	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
- 	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
-+	printf("\t--select-higher-version\t 	Use the higher version package rather\n");
-+	printf("\t				than the higher arch priority one if more\n");
-+	printf("\t				than one candidate is found.\n");
- 
- 	printf("\nForce Options:\n");
- 	printf("\t--force-depends		Install/remove despite failed dependencies\n");
--- 
-1.7.1
-
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 820a224..9a03f2e 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -8,7 +8,6 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
   file://0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch \
   file://0006-detect-circular-dependencies.patch \
   file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch \
-  file://0008-select_higher_version.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -16,4 +15,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.3"
-- 
1.7.10



