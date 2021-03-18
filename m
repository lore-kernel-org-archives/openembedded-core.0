Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web08.6497.1616058346296746763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id D5/21-44603-7E713506; Thu, 18 Mar 2021 09:05:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRqvtcPDj
  BYOUTJos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPRvv0sBd8tKj72rmNvYGwz6mLk4hAS2Mwk
  8WTjVjYI5wSjxKT/L9m7GDk52AQ0JXq3bGHsYuTgEBHQk7j6TxQkzCygLnFpXQsLiC0sYCXx7
  cpkMJtFQFVi3/t1bCA2r4CrxJ3D+xhBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8wQNYoSsy
  83s0DYVRJrOqaxTWDknYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXXNdA0tzPQSq3S
  T9FJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBAZZSyLZrB+Pn1x/0DjFKcjApifL+5Q9O
  EOJLyk+pzEgszogvKs1JLT7EKMPBoSTBawYMWSHBotT01Iq0zBxgsMOkJTh4lER4P3EDpXmLC
  xJzizPTIVKnGBWlxHlPigElBEASGaV5cG2wCLvEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZ
  jXDWQKT2ZeCdz0V0CLmYAWR/AHgSwuSURISTUwTez43r3ZKLIl5tcC/QrXR5vcUvzWxX/Km+4
  dpG5kple4/kfHf4X703qvx5rfmbmlt26N4R+vKr1Va14qtad93lulM7/jpN7SS8ffHp/H7ufV
  lrea3+3P0+A04R7xxOOe1jG7Nv5fl+Vj8umRR4lvzYLOm20amuvW/P9bxqf0suv3k4nZOj6K7
  oznLqwXXLNBzFboWuxSU+M0k988JkfCkp0D/XakTX/SO19/1e27nVKVqZb5VQGJ+0N4P//8xi
  9bp3u1qvJU9NvJsZlidcyGgRmdcQnFJ9ZpzhR/tM951aLbUkdu+kRzrLuw7hCn4L+bE7RsnbX
  2dkyyfGCvKrNy0Ummk72Sa97Ivjfa0OOtxFKckWioxVxUnAgAJ5munysDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-34.tower-245.messagelabs.com!1616058342!2591902!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19421 invoked from network); 18 Mar 2021 09:05:42 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-34.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 09:05:42 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I95b37024268
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 09:05:42 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 09:05:35 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] systemd: upgrade 247.3 -> 247.4
Date: Thu, 18 Mar 2021 17:05:26 +0800
Message-ID: <1616058326-25639-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

refresh the following patches:
systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
systemd/0006-Include-netinet-if_ether.h.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...md-boot_247.3.bb => systemd-boot_247.4.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...se-ROOTPREFIX-without-suffixed-slash.patch |  9 ++++--
 .../0006-Include-netinet-if_ether.h.patch     | 28 ++++++++++---------
 .../{systemd_247.3.bb => systemd_247.4.bb}    |  0
 5 files changed, 23 insertions(+), 16 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_247.3.bb => systemd-boot_247.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_247.3.bb => systemd_247.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_247.3.bb b/meta/recipes-core/systemd/systemd-boot_247.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_247.3.bb
rename to meta/recipes-core/systemd/systemd-boot_247.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ccff8c8b9e..098bca98f1 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "551dd873b0bdfb9e7e47431b2933c8b910228f0c"
+SRCREV = "069525e84a67375e27429cb490e8d28af78e673a"
 SRCBRANCH = "v247-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
index e49e06672e..752824688f 100644
--- a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
+++ b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
@@ -12,10 +12,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/core/systemd.pc.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
+diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
+index b5cc8f9..21dbf30 100644
 --- a/src/core/systemd.pc.in
 +++ b/src/core/systemd.pc.in
 @@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
- tmpfiles_dir=/usr/lib/tmpfiles.d
+ tmpfiles_dir=${prefix}/lib/tmpfiles.d
  tmpfilesdir=${tmpfiles_dir}
  
 -sysusers_dir=${rootprefix}/lib/sysusers.d
@@ -34,4 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +modules_load_dir=${prefix}/lib/modules-load.d
  modulesloaddir=${modules_load_dir}
  
- catalog_dir=/usr/lib/systemd/catalog
+ catalog_dir=${prefix}/lib/systemd/catalog
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index b689cf1297..a978558b42 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -41,20 +41,22 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/network/netdev/netdev-gperf.gperf     | 1 +
  src/network/netdev/netdev.c               | 1 +
  src/network/networkd-brvlan.c             | 1 +
- src/network/networkd-dhcp-common.c        | 1 +
+ src/network/networkd-dhcp-common.c        | 4 +++-
+ src/network/networkd-dhcp-server.c        | 4 ++--
  src/network/networkd-dhcp4.c              | 2 +-
  src/network/networkd-dhcp6.c              | 2 +-
  src/network/networkd-link.c               | 2 +-
  src/network/networkd-network.c            | 1 +
+ src/network/networkd-route.c              | 5 ++++-
  src/network/test-network-tables.c         | 1 +
  src/shared/ethtool-util.c                 | 1 +
  src/shared/ethtool-util.h                 | 1 +
  src/udev/net/link-config.c                | 1 +
  src/udev/udev-builtin-net_setup_link.c    | 1 +
- 19 files changed, 18 insertions(+), 4 deletions(-)
+ 21 files changed, 26 insertions(+), 8 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index 30ac526fc9..126077e13c 100644
+index 66f87c4b95..de1264ae46 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -158,7 +160,7 @@ index e53c73c30c..9bf0771b84 100644
  #include <stdbool.h>
  
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index c338c775a7..ab35d65c53 100644
+index 9f58121350..554d006cb8 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -171,7 +173,7 @@ index c338c775a7..ab35d65c53 100644
  
  #include "dhcp-internal.h"
  #include "dhcp6-internal.h"
-@@ -10,6 +10,7 @@
+@@ -10,6 +11,7 @@
  #include "networkd-dhcp-common.h"
  #include "networkd-link.h"
  #include "networkd-manager.h"
@@ -195,7 +197,7 @@ index cf279c640d..bae541029b 100644
  #include "sd-dhcp-server.h"
  
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 02d33841b6..a30d8dd82c 100644
+index f3c1e5f609..e4ef6eca63 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -1,9 +1,9 @@
@@ -210,7 +212,7 @@ index 02d33841b6..a30d8dd82c 100644
  #include "escape.h"
  #include "alloc-util.h"
 diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
-index d4d4182ee5..635d08f7d5 100644
+index 5c077c1ec8..fa98042aa5 100644
 --- a/src/network/networkd-dhcp6.c
 +++ b/src/network/networkd-dhcp6.c
 @@ -3,9 +3,9 @@
@@ -225,7 +227,7 @@ index d4d4182ee5..635d08f7d5 100644
  #include "sd-dhcp6-client.h"
  
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index ced18de425..07b43770de 100644
+index 3bfe636691..e0c68c8ad3 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -1,8 +1,8 @@
@@ -250,7 +252,7 @@ index 3254641461..f0ada419fd 100644
  #include <netinet/in.h>
  #include <linux/netdevice.h>
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 10f30c1a7e..579885726c 100644
+index 0ed89584ef..e7e157c201 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,7 +1,10 @@
@@ -311,16 +313,16 @@ index d12fd0e299..636806dc23 100644
  #include <netinet/ether.h>
  #include <unistd.h>
 diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index cb12b943fe..5a28c8b563 100644
+index 87e1fb133e..13876029d0 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
  
 +#include <netinet/if_ether.h>
- #include "device-util.h"
  #include "alloc-util.h"
- #include "link-config.h"
+ #include "device-util.h"
+ #include "errno-util.h"
 -- 
-2.27.0
+2.25.1
 
diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_247.3.bb
rename to meta/recipes-core/systemd/systemd_247.4.bb
-- 
2.25.1

