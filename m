Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7xPq-0008Jy-IV
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 00:15:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2012 16:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77642787"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2012 16:06:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 16:06:43 -0700
Message-Id: <1331766403-27044-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] distro_tracking_fields: Fix EOL Comments and missing Quotes
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
X-List-Received-Date: Wed, 14 Mar 2012 23:15:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  294 +++++++++++++-------
 1 files changed, 196 insertions(+), 98 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 2fcd52d..8ad924b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -152,7 +152,8 @@ DISTRO_PN_ALIAS_pn-web = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-web = "Nov 30, 2010"
 RECIPE_MAINTAINER_pn-web = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-icu = "yellow" #do_configure for autotool;icu-3.6.inc
+RECIPE_STATUS_pn-icu = "yellow"
+#do_configure for autotool;icu-3.6.inc
 RECIPE_DEPENDENCY_CHECK_pn-icu = "not done"
 RECIPE_LATEST_VERSION_pn-icu = "3.6"
 RECIPE_PATCH_pn-icu+gccfix = "to be pushed upstream"
@@ -165,7 +166,8 @@ RECIPE_LAST_UPDATE_pn-icu = "Dec 6, 2007"
 RECIPE_MANUAL_CHECK_DATE_pn-icu = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-icu = "Scott Garman <scott.a.garman@intel.com>"
 
-RECIPE_STATUS_pn-eggdbus = "yellow" # patch comment
+RECIPE_STATUS_pn-eggdbus = "yellow"
+# patch comment
 RECIPE_DEPENDENCY_CHECK_pn-eggdbus = "not done"
 RECIPE_LATEST_VERSION_pn-eggdbus = "0.6"
 RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Dec 24, 2011"
@@ -214,7 +216,8 @@ RECIPE_LAST_UPDATE_pn-libpam = "Jan 12, 2012"
 RECIPE_MANUAL_CHECK_DATE_pn-libpam = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-libpam = "Scott Garman <scott.a.garman@intel.com>"
 
-RECIPE_STATUS_pn-libgpg-error = "yellow" # specific .pc handle
+RECIPE_STATUS_pn-libgpg-error = "yellow"
+# specific .pc handle
 RECIPE_DEPENDENCY_CHECK_pn-libgpg-error = "not done"
 RECIPE_LATEST_VERSION_pn-libgpg-error = "1.9"
 RECIPE_PATCH_pn-libgpg-error+pkgconfig = "long existing since 0.7; no exact commit; it's to add a .pc.in. perhaps we don't require it now?"
@@ -366,14 +369,16 @@ RECIPE_LAST_UPDATE_pn-gdbm = "Nov 28, 2011"
 RECIPE_MAINTAINER_pn-gdbm = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-gdbm = "base libs"
 
-RECIPE_STATUS_pn-pth = "yellow"    # custom do_configure
+RECIPE_STATUS_pn-pth = "yellow"   
+# custom do_configure
 RECIPE_LAST_UPDATE_pn-pth = "Mar 14, 2008"
 RECIPE_MAINTAINER_pn-pth = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-pth = "2.0.7"
 RECIPE_INTEL_SECTION_pn-pth = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-pth = "Jun 01, 2006"
 
-RECIPE_STATUS_pn-python-pycurl = "yellow"  # several exports to work with python
+RECIPE_STATUS_pn-python-pycurl = "yellow" 
+# several exports to work with python
 RECIPE_LAST_UPDATE_pn-python-pycurl = "Mar 25, 2010"
 RECIPE_DEPENDENCY_CHECK_pn-python-pycurl = "not done"
 RECIPE_LATEST_VERSION_pn-python-pycurl = "7.19.0"
@@ -413,7 +418,8 @@ RECIPE_INTEL_SECTION_pn-libnl = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-libnl = "Oct 01, 2010"
 RECIPE_NO_UPDATE_REASON_pn-libnl = "libnl-3.2.2 is incompatible with libnl2, so no Upgrade"
 
-RECIPE_STATUS_pn-zlib = "yellow"  # local config scripts
+RECIPE_STATUS_pn-zlib = "yellow" 
+# local config scripts
 RECIPE_LATEST_VERSION_pn-zlib = "1.2.5"
 RECIPE_LATEST_RELEASE_DATE_pn-zlib = "Mar 01, 2010"
 RECIPE_LAST_UPDATE_pn-zlib = "Jun 11, 2010"
@@ -463,7 +469,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgcrypt = "11 months"
 RECIPE_COMMENTS_pn-libgcrypt = ""
 RECIPE_MANUAL_CHECK_DATE_pn-libgcrypt = "Nov 23, 2011"
 
-RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
+RECIPE_STATUS_pn-gnutls = "yellow"
+# need explict pre configure
 RECIPE_LATEST_VERSION_pn-gnutls = "2.12.16"
 RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "Jan 06, 2012"
 RECIPE_LAST_UPDATE_pn-gnutls = "Feb 02, 2012"
@@ -527,7 +534,8 @@ RECIPE_LATEST_VERSION_pn-popt = "1.16"
 RECIPE_INTEL_SECTION_pn-popt = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-popt = "May 01, 2010"
 
-RECIPE_STATUS_pn-sqlite3 = "green"   # need upgrade
+RECIPE_STATUS_pn-sqlite3 = "green"   
+# need upgrade
 RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.10"
 RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Jan 16, 2012"
 RECIPE_LAST_UPDATE_pn-sqlite3 = "Feb 27, 2012"
@@ -548,14 +556,16 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpthread-stubs = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-libpthread-stubs = "Oct 01, 2009"
 RECIPE_COMMENTS_pn-libpthread-stubs = "0.1: Nov 01, 2006, 0.2: 09/2009, 0.3: 10/2009"
 
-RECIPE_STATUS_pn-attr = "yellow"   # the recipe is quite hacky
+RECIPE_STATUS_pn-attr = "yellow"   
+# the recipe is quite hacky
 RECIPE_LAST_UPDATE_pn-attr = "Jul 7, 2010"
 RECIPE_MAINTAINER_pn-attr = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-attr = "2.4.44"
 RECIPE_INTEL_SECTION_pn-attr = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-attr = "Aug 01, 2009"
 
-RECIPE_STATUS_pn-libcap = "yellow"   # hand crafted Makefiles
+RECIPE_STATUS_pn-libcap = "yellow"   
+# hand crafted Makefiles
 RECIPE_LATEST_VERSION_pn-libcap = "2.22"
 RECIPE_LATEST_RELEASE_DATE_pn-libcap = "Jan 01, 2010"
 RECIPE_LAST_UPDATE_pn-libcap = "Jul 25, 2011"
@@ -581,7 +591,8 @@ RECIPE_LATEST_VERSION_pn-libnfsidmap = "0.24"
 RECIPE_INTEL_SECTION_pn-libnfsidmap = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-libnfsidmap = "Dec 01, 2010"
 
-RECIPE_STATUS_pn-acl = "yellow"   # hacky as attr
+RECIPE_STATUS_pn-acl = "yellow"   
+# hacky as attr
 RECIPE_LAST_UPDATE_pn-acl = "Jul 29, 2010"
 RECIPE_MAINTAINER_pn-acl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-acl = "done"
@@ -591,7 +602,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-acl = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-acl = "Nov 01, 2009"
 RECIPE_COMMENTS_pn-acl = ""
 
-RECIPE_STATUS_pn-tcp-wrappers = "yellow"    # custom build system
+RECIPE_STATUS_pn-tcp-wrappers = "yellow"    
+# custom build system
 RECIPE_DEPENDENCY_CHECK_pn-tcp-wrappers = "done"
 RECIPE_LAST_UPDATE_pn-tcp-wrappers = "Aug 11, 2010"
 RECIPE_MAINTAINER_pn-tcp-wrappers = "Saul Wold <sgw@linux.intel.com>"
@@ -663,7 +675,8 @@ RECIPE_COMMENTS_pn-dbus-wait = "o-hand project"
 RECIPE_LAST_UPDATE_pn-dbus-wait = "Aug 12, 2010"
 RECIPE_MAINTAINER_pn-dbus-wait= "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-e2fsprogs = "yellow" # patch comment
+RECIPE_STATUS_pn-e2fsprogs = "yellow" 
+# patch comment
 RECIPE_DEPENDENCY_CHECK_pn-e2fsprogs = "not done"
 RECIPE_LATEST_VERSION_pn-e2fsprogs = "1.42"
 RECIPE_PATCH_pn-e2fsprogs+quotefix = "to be pushed upstream"
@@ -795,7 +808,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-opkg_nogpg = "Feb 01, 2010"
 RECIPE_COMMENTS_pn-opkg_nogpg = ""
 RECIPE_LAST_UPDATE_pn-opkg_nogpg = "Jul 21, 2010"
 RECIPE_MAINTAINER_pn-opkg_nogpg = "Dongxiao Xu <dongxiao.xu@intel.com>"
-DISTRO_PN_ALIAS_pn-opkg_nogpg = "OSPDT upstream=http://svn.openmoko.org/trunk/s
+DISTRO_PN_ALIAS_pn-opkg_nogpg = "OSPDT upstream=http://svn.openmoko.org/trunk/src/tar"
 
 
 RECIPE_STATUS_pn-dpkg = "green"
@@ -1414,7 +1427,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-time = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-time = "Jul 01, 1996"
 RECIPE_COMMENTS_pn-time = ""
 
-RECIPE_STATUS_pn-bzip2 = "yellow"  # local config scripts
+RECIPE_STATUS_pn-bzip2 = "yellow"  
+# local config scripts
 RECIPE_LAST_UPDATE_pn-bzip2 = "Nov 3, 2010"
 RECIPE_MAINTAINER_pn-bzip2 = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-bzip2 = "not done"
@@ -1494,7 +1508,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bash = "10 months"
 RECIPE_LATEST_RELEASE_DATE_pn-bash = "Dec 01, 2009"
 RECIPE_COMMENTS_pn-bash = ""
 
-RECIPE_STATUS_pn-syslinux = "yellow"    # need mangling on LDFLAGS
+RECIPE_STATUS_pn-syslinux = "yellow"    
+# need mangling on LDFLAGS
 RECIPE_LAST_UPDATE_pn-syslinux = "Nov 16, 2010"
 RECIPE_MAINTAINER_pn-syslinux = "Darren Hart <dvhart@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-syslinux = "not done"
@@ -1551,7 +1566,8 @@ RECIPE_LATEST_RELEASE_DATE_pn-gconf-dbus = "n/a"
 RECIPE_COMMENTS_pn-gconf-dbus = "difficult to identify official site and current status"
 RECIPE_MANUAL_CHECK_DATE_pn-gconf-dbus = "Jul 01, 2011"
 
-RECIPE_STATUS_pn-elfutils ="green" # no update needed
+RECIPE_STATUS_pn-elfutils ="green" 
+# no update needed
 RECIPE_LAST_UPDATE_pn-elfutils = "Jul 16, 2010"
 RECIPE_MAINTAINER_pn-elfutils = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gconf-dbus = "not done"
@@ -1631,9 +1647,11 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rsync = "7 months"
 RECIPE_LATEST_RELEASE_DATE_pn-rsync = "Dec 01, 2009"
 RECIPE_COMMENTS_pn-rsync = ""
 
-RECIPE_STATUS_pn-nfs-utils = "yellow"   # no auto stage
+RECIPE_STATUS_pn-nfs-utils = "yellow"   
+# no auto stage
 RECIPE_LAST_UPDATE_pn-nfs-utils = "Nov 9, 2010"
-RECIPE_DEPENDENCY_CHECK_pn-nfs-utils = "done"  # still missing libwrap, libgss, libtirpc
+RECIPE_DEPENDENCY_CHECK_pn-nfs-utils = "done"  
+# still missing libwrap, libgss, libtirpc
 RECIPE_LATEST_VERSION_pn-nfs-utils = "1.2.5"
 RECIPE_PATCH_pn-nfs-utils+nfs-utils-1.0.6-uclibc.patch = "uclibc missing some functions"
 RECIPE_PATCH_pn-nfs-utils+nfsserver = "init script"
@@ -1700,7 +1718,8 @@ RECIPE_INTEL_SECTION_pn-avahi-ui = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-avahi-ui = "3 month"
 RECIPE_COMMENTS_pn-avahi-ui = ""
 
-RECIPE_STATUS_pn-js = "yellow"    # may not work for platforms other than 32bit x86
+RECIPE_STATUS_pn-js = "yellow"    
+# may not work for platforms other than 32bit x86
 RECIPE_LAST_UPDATE_pn-js = "Jul 5, 2010"
 RECIPE_MAINTAINER_pn-js = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-js = "not done"
@@ -1766,7 +1785,8 @@ RECIPE_MAINTAINER_pn-dhcp = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-dhcp = "base utils"
 RECIPE_COMMENTS_pn-dhcp = "several major release, others are 3.1.3, 4.0.2-P1, need to identify"
 
-RECIPE_STATUS_pn-v86d = "yellow"   # self written configure
+RECIPE_STATUS_pn-v86d = "yellow"   
+# self written configure
 RECIPE_LAST_UPDATE_pn-v86d = "Oct 11, 2011"
 RECIPE_MAINTAINER_pn-v86d = "Joshua Lock <josh@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-v86d = "not done"
@@ -1777,7 +1797,8 @@ RECIPE_LATEST_RELEASE_DATE_pn-v86d = "Feb 25, 2011"
 RECIPE_COMMENTS_pn-v86d = "contains code under other licenses"
 DISTRO_PN_ALIAS_pn-v86d = "Debian=v86d Ubuntu=v86d"
 
-RECIPE_STATUS_pn-udev = "yellow"   # needs to delete old versions
+RECIPE_STATUS_pn-udev = "yellow"   
+# needs to delete old versions
 RECIPE_LAST_UPDATE_pn-udev = "Dec 7, 2010"
 RECIPE_MAINTAINER_pn-udev = "Joshua Lock <josh@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-udev = "not done"
@@ -1800,7 +1821,8 @@ RECIPE_COMMENTS_pn-tzdata = ""
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 
 
-RECIPE_STATUS_pn-tinylogin = "yellow"    # replaced, place holder for tracking
+RECIPE_STATUS_pn-tinylogin = "yellow"    
+# replaced, place holder for tracking
 RECIPE_LAST_UPDATE_pn-tinylogin = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-tinylogin = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tinylogin = "not done"
@@ -1813,7 +1835,8 @@ RECIPE_COMMENTS_pn-tinylogin = "merged into busybox"
 RECIPE_MANUAL_CHECK_DATE_pn-tinylogin = "Dec 24, 2011"
 DISTRO_PN_ALIAS_pn-tinylogin = "Debian=busybox Ubuntu=busybox Mandriva=busybox"
 
-RECIPE_STATUS_pn-rpm = "red"   # need upgrade
+RECIPE_STATUS_pn-rpm = "red"   
+# need upgrade
 RECIPE_LAST_UPDATE_pn-rpm = "Aug 20, 2010"
 RECIPE_MAINTAINER_pn-rpm = "Joshua Lock <joshua.lock@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-rpm = "not done"
@@ -1849,7 +1872,8 @@ RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-usbutils = "2 months"
 RECIPE_COMMENTS_pn-usbutils = "No update on kernel.org"
 
-RECIPE_STATUS_pn-pciutils = "yellow"    # custom build system, several hacks
+RECIPE_STATUS_pn-pciutils = "yellow"    
+# custom build system, several hacks
 RECIPE_LAST_UPDATE_pn-pciutils = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-pciutils = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-pciutils = "done"
@@ -1890,12 +1914,14 @@ RECIPE_LAST_UPDATE_pn-sysstat = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Feb 26, 2012"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
+RECIPE_STATUS_pn-sysklogd = "red"    
+# need upgrade
 RECIPE_LAST_UPDATE_pn-sysklogd = "Aug 27, 2010"
 RECIPE_MAINTAINER_pn-sysklogd = "Joshua Lock <josh@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-sysklogd = "1.5"
 
-RECIPE_STATUS_pn-gawk = "red"    # need upgrade
+RECIPE_STATUS_pn-gawk = "red"    
+# need upgrade
 RECIPE_LAST_UPDATE_pn-gawk = "Jul 5, 2011"
 RECIPE_MAINTAINER_pn-gawk = "Shane Wang <shane.wang@intel.com>"
 RECIPE_LATEST_VERSION_pn-gawk = "4.0.0"
@@ -2137,7 +2163,8 @@ RECIPE_LAST_UPDATE_pn-tar = "Jun 5, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-tar = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-tar = "Scott Garman <scott.a.garman@intel.com>"
 
-RECIPE_STATUS_pn-lrzsz="yellow" # patch investigation needed.
+RECIPE_STATUS_pn-lrzsz="yellow" 
+# patch investigation needed.
 RECIPE_LATEST_VERSION_pn-lrzsz="0.12.20"
 RECIPE_NO_OF_PATCHES_pn-lrzsz="3"
 RECIPE_LATEST_RELEASE_DATE_pn-lrzsz="Dec 31, 1998"
@@ -2146,7 +2173,8 @@ RECIPE_LAST_UPDATE_pn-lrzsz = "Jul 21, 2006"
 RECIPE_MANUAL_CHECK_DATE_pn-lrzsz = "Jan 30, 2011"
 RECIPE_MAINTAINER_pn-lrzsz = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-wireless-tools="yellow" # patch investigation needed
+RECIPE_STATUS_pn-wireless-tools="yellow" 
+# patch investigation needed
 RECIPE_LATEST_VERSION_pn-wireless-tools="29"
 RECIPE_NO_OF_PATCHES_pn-wireless-tools="3"
 RECIPE_LATEST_RELEASE_DATE_pn-wireless-tools="Sep 18, 2007"
@@ -2155,7 +2183,8 @@ RECIPE_LAST_UPDATE_pn-wireless-tools = "Oct 19, 2007"
 RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-wireless-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-bluez-dtl1-workaround="yellow" # LICENSE double check
+RECIPE_STATUS_pn-bluez-dtl1-workaround="yellow" 
+# LICENSE double check
 RECIPE_LATEST_VERSION_pn-bluez-dtl1-workaround="1.0"
 RECIPE_NO_OF_PATCHES_pn-bluez-dtl1-workaround="0"
 RECIPE_LATEST_RELEASE_DATE_pn-bluez-dtl1-workaround="n/a"
@@ -2412,7 +2441,8 @@ RECIPE_LATEST_VERSION_pn-libetpan = "1.0"
 RECIPE_LAST_UPDATE_pn-libetpan = "May 13, 2008"
 RECIPE_MAINTAINER_pn-libetpan = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-hostap-utils="yellow" # patch investigation needed; hostap-utils.inc is only included by one bb file.
+RECIPE_STATUS_pn-hostap-utils="yellow" 
+# patch investigation needed; hostap-utils.inc is only included by one bb file.
 RECIPE_LATEST_VERSION_pn-hostap-utils="0.4.7"
 RECIPE_NO_OF_PATCHES_pn-hostap-utils="1"
 RECIPE_LATEST_RELEASE_DATE_pn-hostap-utils="Dec 03, 2008"
@@ -2643,7 +2673,8 @@ RECIPE_LATEST_VERSION_pn-core-image-sato-sdk-directdisk = "1.0"
 RECIPE_MAINTAINER_pn-core-image-sato-sdk-directdisk = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-core-image-sato-sdk-directdisk = "OE-Core"
 
-RECIPE_STATUS_pn-liba52="yellow" # patch investigation needed
+RECIPE_STATUS_pn-liba52="yellow" 
+# patch investigation needed
 DISTRO_PN_ALIAS_pn-liba52 = "Mandriva=a52dec Debian=a52dec"
 RECIPE_LATEST_VERSION_pn-liba52="0.7.4"
 RECIPE_NO_OF_PATCHES_pn-liba52="1"
@@ -2653,7 +2684,8 @@ RECIPE_LAST_UPDATE_pn-liba52 = "Sep 1, 2006"
 RECIPE_MANUAL_CHECK_DATE_pn-liba52 = "Jan 30, 2011"
 RECIPE_MAINTAINER_pn-liba52 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-libid3tag="yellow" # patch investigation needed
+RECIPE_STATUS_pn-libid3tag="yellow" 
+# patch investigation needed
 RECIPE_LATEST_VERSION_pn-libid3tag="0.15.1b"
 RECIPE_NO_OF_PATCHES_pn-libid3tag="1"
 RECIPE_LATEST_RELEASE_DATE_pn-libid3tag="Feb 18, 2004"
@@ -3132,7 +3164,8 @@ RECIPE_LAST_UPDATE_pn-make = "Nov 8, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-make = "May 23, 2011" 
 RECIPE_MAINTAINER_pn-make = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
-RECIPE_STATUS_pn-run-postinsts="green" # all local code
+RECIPE_STATUS_pn-run-postinsts="green" 
+# all local code
 RECIPE_LATEST_VERSION_pn-postinsts="1.0"
 RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
@@ -3226,7 +3259,8 @@ RECIPE_LAST_UPDATE_pn-tcl = "Nov 16, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-tcl = "Feb 01, 2012" 
 RECIPE_MAINTAINER_pn-tcl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
-RECIPE_STATUS_pn-unifdef="green" # poky local source files
+RECIPE_STATUS_pn-unifdef="green" 
+# poky local source files
 RECIPE_LATEST_VERSION_pn-unifdef="2.6.18+git"
 RECIPE_MAINTAINER_pn-unifdef = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
@@ -3286,7 +3320,8 @@ RECIPE_MANUAL_CHECK_DATE_pn-m4 = "Jul 06, 2011"
 RECIPE_MAINTAINER_pn-m4="Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_COMMENTS_pn-m4= "Dongxiao Xu <dongxiao.xu@intel.com> will own GPLv2 m4"
 
-RECIPE_STATUS_pn-owl-video = "green" # no update needed
+RECIPE_STATUS_pn-owl-video = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-owl-video = "not done"
 RECIPE_LATEST_VERSION_pn-owl-video = "0.0+svnr394"
 RECIPE_NO_OF_PATCHES_pn-owl-video = "0"
@@ -3296,7 +3331,8 @@ RECIPE_LATEST_RELEASE_DATE_pn-owl-video = "Jun 01, 2008"
 RECIPE_COMMENTS_pn-owl-video = ""
 RECIPE_MAINTAINER_pn-owl-video = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-xtscal = "green" # no update needed
+RECIPE_STATUS_pn-xtscal = "green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-xtscal = "OSPDT upstream=http://gpe.linuxtogo.org/download/source/"
 RECIPE_DEPENDENCY_CHECK_pn-xtscal = "not done"
 RECIPE_LATEST_VERSION_pn-xtscal = "0.6.3"
@@ -3308,7 +3344,8 @@ RECIPE_COMMENTS_pn-xtscal = ""
 RECIPE_LAST_UPDATE_pn-xtscal = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-xtscal = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-xrestop = "green" # no update needed
+RECIPE_STATUS_pn-xrestop = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-xrestop = "not done"
 RECIPE_LATEST_VERSION_pn-xrestop = "0.4"
 RECIPE_MANUAL_CHECK_DATE_pn-xrestop = "Nov 18, 2010"
@@ -3332,7 +3369,8 @@ RECIPE_LAST_UPDATE_pn-pcmanfm = "Nov 19, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-pcmanfm = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-oh-puzzles = "green" # no update needed
+RECIPE_STATUS_pn-oh-puzzles = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-oh-puzzles = "not done"
 RECIPE_LATEST_VERSION_pn-oh-puzzles = "0.1+svnr23"
 RECIPE_NO_OF_PATCHES_pn-oh-puzzles = "1"
@@ -3433,7 +3471,8 @@ RECIPE_LAST_UPDATE_pn-x11vnc = "Nov 30, 2010"
 RECIPE_MAINTAINER_pn-x11vnc = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
 
-RECIPE_STATUS_pn-mkfontdir="green" # no update needed
+RECIPE_STATUS_pn-mkfontdir="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-mkfontdir="1.0.7"
 RECIPE_NO_OF_PATCHES_pn-mkfontdir="0"
 RECIPE_LATEST_RELEASE_DATE_pn-mkfontdir="Feb 10, 2012"
@@ -3442,7 +3481,8 @@ RECIPE_LAST_UPDATE_pn-mkfontdir = "Feb 27, 2012"
 RECIPE_MAINTAINER_pn-mkfontdir="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mkfontdir = "Mandriva=mkfontdir Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
 
-RECIPE_STATUS_pn-mkfontscale="green" # no update needed
+RECIPE_STATUS_pn-mkfontscale="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-mkfontscale="1.10.0"
 RECIPE_LATEST_RELEASE_DATE_pn-mkfontscale="Feb 10, 2012"
 RECIPE_LAST_UPDATE_pn-mkfontscale = "Feb 27, 2012"
@@ -3452,7 +3492,8 @@ RECIPE_INTEL_SECTION_pn-mkfontscale="graphic apps"
 RECIPE_MAINTAINER_pn-mkfontscale="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mkfontscale = "Mandriva=mkfontscale Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
 
-RECIPE_STATUS_pn-xauth="green" # no update needed
+RECIPE_STATUS_pn-xauth="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xauth="1.0.5"
 RECIPE_NO_OF_PATCHES_pn-xauth="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xauth="1 year"
@@ -3461,7 +3502,8 @@ RECIPE_INTEL_SECTION_pn-xauth="graphic app"
 RECIPE_LAST_UPDATE_pn-xauth = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xauth="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xdpyinfo="green" # no update needed
+RECIPE_STATUS_pn-xdpyinfo="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xdpyinfo="1.3.0"
 RECIPE_LATEST_RELEASE_DATE_pn-xdpyinfo="Oct 21, 2011"
 RECIPE_LAST_UPDATE_pn-xdpyinfo = "Nov 28, 2011"
@@ -3471,7 +3513,8 @@ RECIPE_INTEL_SECTION_pn-xdpyinfo="graphic app"
 RECIPE_MAINTAINER_pn-xdpyinfo="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xdpyinfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
-RECIPE_STATUS_pn-xhost="green" # no update needed
+RECIPE_STATUS_pn-xhost="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xhost="1.0.3"
 RECIPE_NO_OF_PATCHES_pn-xhost="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xhost="2 years"
@@ -3481,7 +3524,8 @@ RECIPE_LAST_UPDATE_pn-xhost = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-xhost="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xhost = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
 
-RECIPE_STATUS_pn-xinit="green" # no update needed
+RECIPE_STATUS_pn-xinit="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xinit="1.3.2"
 RECIPE_LATEST_RELEASE_DATE_pn-xinit="Jan 27, 2012"
 RECIPE_LAST_UPDATE_pn-xinit = "Feb 02, 2012"
@@ -3490,7 +3534,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xinit="4 monthes"
 RECIPE_INTEL_SECTION_pn-xinit="graphic app"
 RECIPE_MAINTAINER_pn-xinit="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xkbcomp="green" # no update needed
+RECIPE_STATUS_pn-xkbcomp="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xkbcomp="1.2.3"
 RECIPE_LATEST_RELEASE_DATE_pn-xkbcomp="Jun 21, 2011"
 RECIPE_LAST_UPDATE_pn-xkbcomp = "Nov 28, 2011"
@@ -3500,7 +3545,8 @@ RECIPE_INTEL_SECTION_pn-xkbcomp="graphic app"
 RECIPE_MAINTAINER_pn-xkbcomp="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xkbcomp = "Ubuntu=x11-xkb-utils Fedora=xorg-x11-xkb-utils"
 
-RECIPE_STATUS_pn-xmodmap="green" # no update needed
+RECIPE_STATUS_pn-xmodmap="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xmodmap="1.0.5"
 RECIPE_NO_OF_PATCHES_pn-xmodmap="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xmodmap="2 years"
@@ -3510,7 +3556,8 @@ RECIPE_LAST_UPDATE_pn-xmodmap = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xmodmap="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xmodmap = "Meego=xorg-x11-utils-xmodmap Fedora=xorg-x11-server-utils Ubuntu=x11-xserver-utils"
 
-RECIPE_STATUS_pn-xprop="green" # no update needed
+RECIPE_STATUS_pn-xprop="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xprop="1.2.1"
 RECIPE_LATEST_RELEASE_DATE_pn-xprop="Jun 29, 2011"
 RECIPE_LAST_UPDATE_pn-xprop = "Nov 28, 2011"
@@ -3520,7 +3567,8 @@ RECIPE_INTEL_SECTION_pn-xprop="graphic app"
 RECIPE_MAINTAINER_pn-xprop="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xprop = "Meego=xorg-x11-utils-xprop Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
-RECIPE_STATUS_pn-xset="green" # no update needed
+RECIPE_STATUS_pn-xset="green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-xset = "Fedora=xorg-x11-server-utils Ubuntu=x11-xserver-utils Debian=x11-xserver-utils Opensuse=xorg-x11"
 RECIPE_LATEST_VERSION_pn-xset="1.2.2"
 RECIPE_LATEST_RELEASE_DATE_pn-xset="Jul 28, 2011"
@@ -3530,7 +3578,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xset="1 year"
 RECIPE_INTEL_SECTION_pn-xset="graphic app"
 RECIPE_MAINTAINER_pn-xset="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xwininfo="green" # no update needed
+RECIPE_STATUS_pn-xwininfo="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xwininfo="1.1.2"
 RECIPE_LATEST_RELEASE_DATE_pn-xwininfo="Jun 29, 2010"
 RECIPE_LAST_UPDATE_pn-xwininfo = "Nov 28, 2011"
@@ -3540,7 +3589,8 @@ RECIPE_INTEL_SECTION_pn-xwininfo="graphic app"
 RECIPE_MAINTAINER_pn-xwininfo="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xwininfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
-RECIPE_STATUS_pn-xrandr="green" # no update needed
+RECIPE_STATUS_pn-xrandr="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xrandr="1.3.5"
 RECIPE_LATEST_RELEASE_DATE_pn-xrandr="Jun 29, 2011"
 RECIPE_LAST_UPDATE_pn-xrandr = "Nov 28, 2011"
@@ -3550,7 +3600,8 @@ RECIPE_INTEL_SECTION_pn-xrandr="graphic app"
 RECIPE_MAINTAINER_pn-xrandr="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xrandr = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
 
-RECIPE_STATUS_pn-vte="green" # no update needed
+RECIPE_STATUS_pn-vte="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-vte="0.24.3"
 RECIPE_NO_OF_PATCHES_pn-vte="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-vte="3 monthes"
@@ -3559,7 +3610,8 @@ RECIPE_INTEL_SECTION_pn-vte="graphic app"
 RECIPE_LAST_UPDATE_pn-vte = "Jul 19, 2010"
 RECIPE_MAINTAINER_pn-vte="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-qemugl="green" # no update needed
+RECIPE_STATUS_pn-qemugl="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-qemugl="0.0+git0+d888bbc723c00d197d34a39b5b7448660ec1b1c0"
 RECIPE_NO_OF_PATCHES_pn-qemugl="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qemugl="n/a"
@@ -3570,7 +3622,8 @@ RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because
 RECIPE_MAINTAINER_pn-qemugl="Saul Wold <sgw@linux.intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Feb 26, 2012"
 
-RECIPE_STATUS_pn-fotowall="green" # no update needed
+RECIPE_STATUS_pn-fotowall="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-fotowall="0.9"
 RECIPE_NO_OF_PATCHES_pn-fotowall="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-fotowall="2 monthes"
@@ -3591,7 +3644,8 @@ RECIPE_LAST_UPDATE_pn-imake = "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-imake = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-imake = "Mandriva=xutils Ubuntu=xutils"
 
-RECIPE_STATUS_pn-qt4-native = "green" # no update needed
+RECIPE_STATUS_pn-qt4-native = "green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-qt4-native = "4.8.0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-native = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-qt4-native = "Dec 15, 2011"
@@ -3623,7 +3677,8 @@ RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Dec 15, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
 
-RECIPE_STATUS_pn-quicky = "green" # no update needed
+RECIPE_STATUS_pn-quicky = "green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-quicky = "0.4"
 RECIPE_NO_OF_PATCHES_pn-quicky = "0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quicky = "n/a"
@@ -3632,11 +3687,13 @@ RECIPE_INTEL_SECTION_pn-quicky = "graphic app"
 RECIPE_LAST_UPDATE_pn-quicky = "Aug 25, 2010"
 RECIPE_MAINTAINER_pn-quicky = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-quicky = "OSPDT"
+
 #
 # distro tracking filed for X core packages
 #
 
-RECIPE_STATUS_pn-bigreqsproto="green" # no update needed
+RECIPE_STATUS_pn-bigreqsproto="green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-bigreqsproto = "Meego=xorg-x11-proto-bigreqsproto"
 RECIPE_LATEST_VERSION_pn-bigreqsproto="1.1.0"
 RECIPE_NO_OF_PATCHES_pn-bigreqsproto="0"
@@ -3646,7 +3703,8 @@ RECIPE_INTEL_SECTION_pn-bigreqsproto="graphic core"
 RECIPE_LAST_UPDATE_pn-bigreqsproto = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-bigreqsproto="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-evieext="green" # no update needed
+RECIPE_STATUS_pn-evieext="green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-evieext = "Meego=xorg-x11-proto-evieext Debian=x11proto-evie"
 RECIPE_LATEST_VERSION_pn-evieext="1.1.0"
 RECIPE_NO_OF_PATCHES_pn-evieext="0"
@@ -3656,7 +3714,8 @@ RECIPE_INTEL_SECTION_pn-evieext="graphic core"
 RECIPE_LAST_UPDATE_pn-evieext = "Feb 3, 2010"
 RECIPE_MAINTAINER_pn-evieext="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-libxxf86dga="green" # no update needed
+RECIPE_STATUS_pn-libxxf86dga="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-libxxf86dga="1.1.1"
 RECIPE_NO_OF_PATCHES_pn-libxxf86dga="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxxf86dga="1 month"
@@ -3665,16 +3724,20 @@ RECIPE_INTEL_SECTION_pn-libxxf86dga="graphic core"
 RECIPE_LAST_UPDATE_pn-libxxf86dga = "Nov 24, 2010"
 RECIPE_MAINTAINER_pn-libxxf86dga="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-x11-common="green" # no update needed
+RECIPE_STATUS_pn-x11-common="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-x11-common="0.1"
 RECIPE_NO_OF_PATCHES_pn-x11-common="0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-x11-common="n/a" # local file without release
-RECIPE_LATEST_RELEASE_DATE_pn-x11-common="Sep 22, 2008" # per poky git log
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-x11-common="n/a" 
+# local file without release
+RECIPE_LATEST_RELEASE_DATE_pn-x11-common="Sep 22, 2008" 
+# per poky git log
 RECIPE_INTEL_SECTION_pn-x11-common="graphic core"
 RECIPE_LAST_UPDATE_pn-x11-common = "Sep 22, 2008"
 RECIPE_MAINTAINER_pn-x11-common="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xf86-input-keyboard="green" # no update needed
+RECIPE_STATUS_pn-xf86-input-keyboard="green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-keyboard = "Meego=xorg-x11-drv-keyboard Fedora=xorg-x11-drv-keyboard Mandriva=x11-driver-input-keyboard Debian=xserver-xorg-input-keyboard"
 RECIPE_LATEST_VERSION_pn-xf86-input-keyboard="1.6.1"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-keyboard="0"
@@ -3684,7 +3747,8 @@ RECIPE_INTEL_SECTION_pn-xf86-input-keyboard="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-input-keyboard = "Feb 02, 2012"
 RECIPE_MAINTAINER_pn-xf86-input-keyboard="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xf86-input-mouse="green" # no update needed
+RECIPE_STATUS_pn-xf86-input-mouse="green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-mouse = "Ubuntu=xserver-xorg-input-mouse Mandriva=x11-driver-input-mouse Debian=xserver-xorg-input-mouse"
 RECIPE_LATEST_VERSION_pn-xf86-input-mouse="1.7.1"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-mouse="Jul 05, 2011"
@@ -3694,7 +3758,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-mouse="9 monthes"
 RECIPE_INTEL_SECTION_pn-xf86-input-mouse="graphic core"
 RECIPE_MAINTAINER_pn-xf86-input-mouse="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xf86-input-vmmouse="green" # update needed
+RECIPE_STATUS_pn-xf86-input-vmmouse="green" 
+# update needed
 DISTRO_PN_ALIAS_pn-xf86-input-vmmouse = "Fedora=xorg-x11-drv-vmmouse Ubuntu=xserver-xorg-input-vmmouse Mandriva=x11-driver-input-vmmouse Debian=xserver-xorg-input-vmmouse"
 RECIPE_LATEST_VERSION_pn-xf86-input-vmmouse="12.6.10"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-vmmouse="0"
@@ -3704,7 +3769,8 @@ RECIPE_INTEL_SECTION_pn-xf86-input-vmmouse="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-input-vmmouse = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xf86-input-vmmouse="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-libdrm="green" # no update needed
+RECIPE_STATUS_pn-libdrm="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-libdrm = "2.4.31"
 RECIPE_LATEST_RELEASE_DATE_pn-libdrm = "Feb 06, 2012"
 RECIPE_LAST_UPDATE_pn-libdrm = "Feb 27, 2012"
@@ -3713,7 +3779,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm="1 month"
 RECIPE_INTEL_SECTION_pn-libdrm="graphic core"
 RECIPE_MAINTAINER_pn-libdrm="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-python-pycairo="green" # no upgrade needed
+RECIPE_STATUS_pn-python-pycairo="green" 
+# no upgrade needed
 RECIPE_LATEST_VERSION_pn-python-pycairo="1.10.0"
 RECIPE_LATEST_RELEASE_DATE_pn-python-pycairo="Apr 18, 2011"
 RECIPE_LAST_UPDATE_pn-python-pycairo = "Dec 19, 2011"
@@ -3723,7 +3790,8 @@ RECIPE_INTEL_SECTION_pn-python-pycairo="graphic core"
 RECIPE_MAINTAINER_pn-python-pycairo="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
 
-RECIPE_STATUS_pn-libxfontcache="green" # no update neededd
+RECIPE_STATUS_pn-libxfontcache="green" 
+# no update neededd
 RECIPE_LATEST_VERSION_pn-libxfontcache="1.0.5"
 RECIPE_NO_OF_PATCHES_pn-libxfontcache="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxfontcache="3 years"
@@ -3733,7 +3801,8 @@ RECIPE_LAST_UPDATE_pn-libxfontcache = "Jun 23, 2010"
 RECIPE_MAINTAINER_pn-libxfontcache="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-libxfontcache = "Mandriva=libxfontcache Debian=libxfontcache"
 
-RECIPE_STATUS_pn-xf86-input-evdev="green" # no update needed
+RECIPE_STATUS_pn-xf86-input-evdev="green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-evdev = "Ubuntu=xserver-xorg-input-evdev Mandriva=x11-driver-input-evdev Debian=xserver-xorg-input-evdev Fedora=xorg-x11-drv-evdev Meego=xorg-x11-drv-evdev"
 RECIPE_LATEST_VERSION_pn-xf86-input-evdev="2.6.0"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-evdev="0"
@@ -3744,7 +3813,8 @@ RECIPE_LAST_UPDATE_pn-xf86-input-evdev = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-xf86-input-evdev="Saul Wold <sgw@linux.intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-xf86-input-evdev = "Do not update to *99* unstable versions"
 
-RECIPE_STATUS_pn-xf86-video-vmware="green" # no update needed
+RECIPE_STATUS_pn-xf86-video-vmware="green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-xf86-video-vmware = "Debian=xserver-xorg-video-vmware Fedora=xorg-x11-drv-vmware Mandriva=x11-driver-video-vmware Ubuntu=xserver-xorg-video-vmware"
 RECIPE_LATEST_VERSION_pn-xf86-video-vmware="11.0.3"
 RECIPE_NO_OF_PATCHES_pn-xf86-video-vmware="0"
@@ -3755,7 +3825,8 @@ RECIPE_LAST_UPDATE_pn-xf86-video-vmware = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xf86-video-vmware="Saul Wold <sgw@linux.intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-xf86-video-vmware = "Do not update to *99* unstable versions"
 
-RECIPE_STATUS_pn-xf86-video-vesa = "green" # no update needed
+RECIPE_STATUS_pn-xf86-video-vesa = "green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xf86-video-vesa = "2.3.0"
 RECIPE_NO_OF_PATCHES_pn-xf86-video-vesa = "0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vesa = "6 monthes"
@@ -3765,7 +3836,8 @@ RECIPE_LAST_UPDATE_pn-xf86-video-vesa = "May 17, 2010"
 RECIPE_MAINTAINER_pn-xf86-video-vesa = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xf86-video-vesa = "Debian=xserver-xorg-video-vesa Fedora=xorg-x11-drv-vesa Mandriva=x11-driver-video-vesa Ubuntu=xserver-xorg-video-vesa"
 
-RECIPE_STATUS_pn-cairo="green" # no update needed
+RECIPE_STATUS_pn-cairo="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-cairo="1.9.10"
 RECIPE_NO_UPDATE_REASON_pn-cairo="latest version is not stable release"
 RECIPE_NO_OF_PATCHES_pn-cairo="1"
@@ -3775,7 +3847,8 @@ RECIPE_INTEL_SECTION_pn-cairo="graphic core"
 RECIPE_LAST_UPDATE_pn-cairo = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-cairo="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xserver-nodm-init="green" # no update needed
+RECIPE_STATUS_pn-xserver-nodm-init="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xserver-nodm-init="1.0"
 RECIPE_NO_OF_PATCHES_pn-xserver-nodm-init="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-nodm-init=""
@@ -3783,7 +3856,8 @@ RECIPE_LATEST_RELEASE_DATE_pn-xserver-nodm-init=""
 RECIPE_INTEL_SECTION_pn-xserver-nodm-init="graphic core"
 RECIPE_MAINTAINER_pn-xserver-nodm-init="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xserver-xf86-config="green" # no update needed
+RECIPE_STATUS_pn-xserver-xf86-config="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xserver-xf86-config="0.1"
 RECIPE_NO_OF_PATCHES_pn-xserver-xf86-config="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-config=""
@@ -3792,7 +3866,8 @@ RECIPE_INTEL_SECTION_pn-xserver-xf86-config="graphic core"
 RECIPE_LAST_UPDATE_pn-xserver-xf86-config = "May 31, 2009"
 RECIPE_MAINTAINER_pn-xserver-xf86-config="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-pango="green" # no update needed
+RECIPE_STATUS_pn-pango="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-pango="1.28.0"
 RECIPE_NO_OF_PATCHES_pn-pango="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pango="1 month"
@@ -3801,7 +3876,8 @@ RECIPE_INTEL_SECTION_pn-pango="graphic core"
 RECIPE_LAST_UPDATE_pn-pango = "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-pango="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-mesa-dri="green" # no update needed
+RECIPE_STATUS_pn-mesa-dri="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-mesa-dri="7.8.2"
 RECIPE_NO_OF_PATCHES_pn-mesa-dri="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mesa-dri="2 monthes"
@@ -3813,7 +3889,8 @@ DISTRO_PN_ALIAS_pn-mesa-dri = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
 
 DISTRO_PN_ALIAS_pn-mesa-xlib = "Fedora=mesa Ubuntu=libgl1-mesa-swx11"
 
-RECIPE_STATUS_pn-mesa-dri-glsl-native="green" # no update needed
+RECIPE_STATUS_pn-mesa-dri-glsl-native="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-mesa-dri-glsl-native="7.8.2"
 RECIPE_NO_OF_PATCHES_pn-mesa-dri-glsl-native="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mesa-dri-glsl-native="2 monthes"
@@ -3823,7 +3900,8 @@ RECIPE_LAST_UPDATE_pn-mesa-dri-glsl-native = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-mesa-dri-glsl-native = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mesa-dri-glsl-native = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
 
-RECIPE_STATUS_pn-mesa-xlib="green" # no update needed
+RECIPE_STATUS_pn-mesa-xlib="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-mesa-xlib="7.8.2"
 RECIPE_NO_OF_PATCHES_pn-mesa-xlib="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mesa-xlib="2 monthes"
@@ -3832,7 +3910,8 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib="graphic core"
 RECIPE_LAST_UPDATE_pn-mesa-xlib = "Nov 27, 2010"
 RECIPE_MAINTAINER_pn-mesa-xlib="Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-xserver-xorg="green" # no update needed
+RECIPE_STATUS_pn-xserver-xorg="green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-xserver-xorg="1.11.2"
 RECIPE_NO_OF_PATCHES_pn-xserver-xorg="2"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg="2 monthes"
@@ -3861,7 +3940,8 @@ RECIPE_LATEST_VERSION_pn-xf86-video-omapfb = "0.1.1+git_db636c8436265c3d86"
 RECIPE_LAST_UPDATE_pn-xf86-video-omapfb = "Mar 1, 2010"
 RECIPE_MAINTAINER_pn-xf86-video-omapfb = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-libdrm-poulsbo = "green" # no update needed
+RECIPE_STATUS_pn-libdrm-poulsbo = "green" 
+# no update needed
 RECIPE_LATEST_VERSION_pn-libdrm-poulsbo = "2.3.0"
 RECIPE_NO_OF_PATCHES_pn-libdrm-poulsbo = "1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm-poulsbo = "n/a"
@@ -5005,11 +5085,13 @@ RECIPE_STATUS_pn-libxklavier = "red"
 RECIPE_LATEST_VERSION_pn-libxklavier = "5.0"
 RECIPE_LAST_UPDATE_pn-libxklavier = "Jun 10, 2009"
 RECIPE_MAINTAINER_pn-libxklavier = "Dexuan Cui <dexuan.cui@intel.com>"
+
 #
 # distro tracking fields for X11 UX
 #
 
-RECIPE_STATUS_pn-gnome-mime-data = "green" # no update needed
+RECIPE_STATUS_pn-gnome-mime-data = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-gnome-mime-data = "not done"
 RECIPE_LATEST_VERSION_pn-gnome-mime-data = "2.18.0"
 RECIPE_NO_OF_PATCHES_pn-gnome-mime-data = "1"
@@ -5020,7 +5102,8 @@ RECIPE_COMMENTS_pn-gnome-mime-data = ""
 RECIPE_LAST_UPDATE_pn-gnome-mime-data = "Aug 2, 2007"
 RECIPE_MAINTAINER_pn-gnome-mime-data = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-libmatchbox = "green" # no update needed
+RECIPE_STATUS_pn-libmatchbox = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-libmatchbox = "not done"
 RECIPE_LATEST_VERSION_pn-libmatchbox = "1.9"
 RECIPE_NO_OF_PATCHES_pn-libmatchbox = "2"
@@ -5031,7 +5114,8 @@ RECIPE_COMMENTS_pn-libmatchbox = ""
 RECIPE_LAST_UPDATE_pn-libmatchbox = "Aug 7, 2006"
 RECIPE_MAINTAINER_pn-libmatchbox = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-libowl = "green" # no update needed
+RECIPE_STATUS_pn-libowl = "green" 
+# no update needed
 DISTRO_PN_ALIAS_pn-libowl = "Debian=owl OpenedHand"
 RECIPE_DEPENDENCY_CHECK_pn-libowl = "not done"
 RECIPE_LATEST_VERSION_pn-libowl = "0.0+svnr408"
@@ -5043,7 +5127,8 @@ RECIPE_COMMENTS_pn-libowl = ""
 RECIPE_LAST_UPDATE_pn-libowl= "Sep 16, 2008"
 RECIPE_MAINTAINER_pn-libowl = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-libowl-av = "green" # no update needed
+RECIPE_STATUS_pn-libowl-av = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-libowl-av = "not done"
 RECIPE_LATEST_VERSION_pn-libowl-av = "0.0+svnr416"
 RECIPE_NO_OF_PATCHES_pn-libowl-av = "0"
@@ -5055,7 +5140,8 @@ RECIPE_MAINTAINER_pn-libowl-av = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_LAST_UPDATE_pn-libowl-av = "Nov 19, 2010"
 DISTRO_PN_ALIAS_pn-libowl-av = "OpenedHand"
 
-RECIPE_STATUS_pn-matchbox-desktop = "green" # no update needed
+RECIPE_STATUS_pn-matchbox-desktop = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-desktop = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-desktop = "2.0+svnr2096"
 RECIPE_NO_OF_PATCHES_pn-matchbox-desktop = "0"
@@ -5067,7 +5153,8 @@ RECIPE_LAST_UPDATE_pn-matchbox-desktop = "Dec 4, 2008"
 RECIPE_MAINTAINER_pn-matchbox-desktop = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-matchbox-desktop = "Mandriva=matchbox-desktop Ubuntu=matchbox-desktop"
 
-RECIPE_STATUS_pn-matchbox-desktop-sato = "green" # no update needed
+RECIPE_STATUS_pn-matchbox-desktop-sato = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-desktop-sato = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-desktop-sato = "0.0+svnr76"
 RECIPE_NO_OF_PATCHES_pn-matchbox-desktop-sato = "0"
@@ -5078,7 +5165,8 @@ RECIPE_COMMENTS_pn-matchbox-desktop-sato = ""
 RECIPE_LAST_UPDATE_pn-matchbox-desktop-sato = "Jul 5, 2007"
 RECIPE_MAINTAINER_pn-matchbox-desktop-sato = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-matchbox-session = "green" # no update needed
+RECIPE_STATUS_pn-matchbox-session = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-session = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-session = "0.1"
 RECIPE_NO_OF_PATCHES_pn-matchbox-session = "0"
@@ -5089,7 +5177,8 @@ RECIPE_COMMENTS_pn-matchbox-session = ""
 RECIPE_LAST_UPDATE_pn-matchbox-session = "Apr 9, 2008"
 RECIPE_MAINTAINER_pn-matchbox-session = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-matchbox-session-sato = "green" # no update needed
+RECIPE_STATUS_pn-matchbox-session-sato = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-session-sato = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-session-sato = "0.1"
 RECIPE_NO_OF_PATCHES_pn-matchbox-session-sato = "0"
@@ -5100,7 +5189,8 @@ RECIPE_COMMENTS_pn-matchbox-session-sato = ""
 RECIPE_LAST_UPDATE_pn-matchbox-session-sato = "Apr 9, 2008"
 RECIPE_MAINTAINER_pn-matchbox-session-sato = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-matchbox-terminal = "green" # no update needed
+RECIPE_STATUS_pn-matchbox-terminal = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-terminal = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-terminal = "0.0+svnr1816"
 RECIPE_NO_OF_PATCHES_pn-matchbox-terminal = "0"
@@ -5111,7 +5201,8 @@ RECIPE_COMMENTS_pn-matchbox-terminal = ""
 RECIPE_LAST_UPDATE_pn-matchbox-terminal = "Aug 18, 2009"
 RECIPE_MAINTAINER_pn-matchbox-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-matchbox-theme-sato = "green" # no update needed
+RECIPE_STATUS_pn-matchbox-theme-sato = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-theme-sato = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-theme-sato = "0.1"
 RECIPE_NO_OF_PATCHES_pn-matchbox-theme-sato = "0"
@@ -5122,7 +5213,8 @@ RECIPE_COMMENTS_pn-matchbox-theme-sato = ""
 RECIPE_LAST_UPDATE_pn-matchbox-theme-sato = "Jul 31, 2007"
 RECIPE_MAINTAINER_pn-matchbox-theme-sato = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-matchbox-theme-sato-2 = "green" # no update needed
+RECIPE_STATUS_pn-matchbox-theme-sato-2 = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-theme-sato-2 = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-theme-sato-2 = "0.1"
 RECIPE_NO_OF_PATCHES_pn-matchbox-theme-sato-2 = "0"
@@ -5133,7 +5225,8 @@ RECIPE_COMMENTS_pn-matchbox-theme-sato-2 = ""
 RECIPE_LAST_UPDATE_pn-matchbox-theme-sato-2 = "Jul 31, 2007"
 RECIPE_MAINTAINER_pn-matchbox-theme-sato-2 = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-sato-icon-theme = "green" # no update needed
+RECIPE_STATUS_pn-sato-icon-theme = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-sato-icon-theme = "not done"
 RECIPE_LATEST_VERSION_pn-sato-icon-theme = "0.4.1"
 RECIPE_NO_OF_PATCHES_pn-sato-icon-theme = "0"
@@ -5144,7 +5237,8 @@ RECIPE_COMMENTS_pn-sato-icon-theme = ""
 RECIPE_LAST_UPDATE_pn-sato-icon-theme = "Feb 25, 2008"
 RECIPE_MAINTAINER_pn-sato-icon-theme = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-tslib = "green" # no update needed
+RECIPE_STATUS_pn-tslib = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-tslib = "not done"
 RECIPE_LATEST_VERSION_pn-tslib = "1.0"
 RECIPE_NO_OF_PATCHES_pn-tslib = "3"
@@ -5155,7 +5249,8 @@ RECIPE_COMMENTS_pn-tslib = ""
 RECIPE_LAST_UPDATE_pn-tslib = "Aug 17, 2006"
 RECIPE_MAINTAINER_pn-tslib = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-xcursor-transparent-theme = "green" # no update needed
+RECIPE_STATUS_pn-xcursor-transparent-theme = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-xcursor-transparent-theme = "not done"
 RECIPE_LATEST_VERSION_pn-xcursor-transparent-theme = "0.1.1"
 RECIPE_NO_OF_PATCHES_pn-xcursor-transparent-theme = "2"
@@ -5265,7 +5360,8 @@ RECIPE_LATEST_VERSION_pn-gdk-pixbuf = "2.22.1"
 RECIPE_LAST_UPDATE_pn-gdk-pixbuf = "Nov 25, 2010"
 RECIPE_MAINTAINER_pn-gdk-pixbuf = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-gdk-pixbuf-csource-native = "red" # update needed
+RECIPE_STATUS_pn-gdk-pixbuf-csource-native = "red" 
+# update needed
 RECIPE_DEPENDENCY_CHECK_pn-gdk-pixbuf-csource-native = "not done"
 RECIPE_LATEST_VERSION_pn-gdk-pixbuf-csource-native = "2.20.1"
 RECIPE_NO_OF_PATCHES_pn-gdk-pixbuf-csource-native = "1"
@@ -5277,7 +5373,8 @@ RECIPE_LAST_UPDATE_pn-gdk-pixbuf-csource-native = "Sep 24, 2008"
 RECIPE_MAINTAINER_pn-gdk-pixbuf-csource-native = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-gdk-pixbuf-csource-native = "Debian=libgdk-pixbuf2.0-0 Fedora=gdk-pixbuf2"
 
-RECIPE_STATUS_pn-gobject-introspection = "red" # update needed
+RECIPE_STATUS_pn-gobject-introspection = "red" 
+# update needed
 RECIPE_DEPENDENCY_CHECK_pn-gobject-introspection = "not done"
 RECIPE_LATEST_VERSION_pn-gobject-introspection = "1.31.20"
 RECIPE_NO_OF_PATCHES_pn-gobject-introspection = "3"
@@ -5376,7 +5473,8 @@ RECIPE_LAST_UPDATE_pn-jpeg = "Apr 14, 2011"
 RECIPE_MAINTAINER_pn-jpeg = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-jpeg="OpenSuSE=libjpeg Ubuntu=libjpeg62"
 
-RECIPE_STATUS_pn-libfakekey = "green" # no update needed
+RECIPE_STATUS_pn-libfakekey = "green" 
+# no update needed
 RECIPE_DEPENDENCY_CHECK_pn-libfakekey = "not done"
 RECIPE_LATEST_VERSION_pn-libfakekey = "0.0+svnr2031"
 RECIPE_NO_OF_PATCHES_pn-libfakekey = "0"
@@ -5961,7 +6059,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Nov 22, 2011"
 RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
 RECIPE_MAINTAINER_pn-texinfo = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_LATEST_VERSION_pn-texi2html = "5.0
+RECIPE_LATEST_VERSION_pn-texi2html = "5.0"
 RECIPE_LATEST_RELEASE_DATE_pn-texi2html = "Jul 01, 2010"
 RECIPE_LAST_UPDATE_pn-texi2html = "Dec 18, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-texi2html = "Dec 18, 2011"
-- 
1.7.7.6



