Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 18DF178A5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:59 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id m12so18074582wrm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=j6+RJIbYhRfsu5pJ7BTnCUt9/8vZ6Mtjv55NUY+ja5s=;
	b=G5W7JeocKX9DromVSzqCMohzcw8YaLuVWBWWa5cUhPFWgeMAjwRgdW6x34/h7HhwYT
	R6Fj7D2QanQwGRAlBqdWl5U3VTiOEInDnGZRZiWwaprYtxvektX/0Gm5vVVGyCgUsbGJ
	8Oe9y8TJj0T/x+YAchyt3lZ66mP8b0gTC3Morcnnj5bdS3+o6UbQD4sDABWQVWwT0gcv
	mK6iJNtOyyQkf264Zg9ME39jOk2N61eRTBBhMYup++yk0tdk3Bh2bM+Dr6fu8XcZ2wGZ
	tlTK03QaPMJQbsUAhi47vKUUgLSsgxJid7M3ddrH2/PJYL6BxtA13LoHrKrRoJyqLmdV
	FuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j6+RJIbYhRfsu5pJ7BTnCUt9/8vZ6Mtjv55NUY+ja5s=;
	b=YDoHbIZK3Od0qxj8lWahSR4txf766G9SMgp1+etMi7t0wIljyU8S1vwkGmJktLbPcz
	f6v2ZGTpTj7sMSqrofoqF3FW5OFZU+Ub8cX82/PRa6yqhlpMLfROQG24Y1sio6ElrTyx
	cAdzvpYoyiBXRUwElVr2FCAdWkzgvSAyk1kvt/qanXz8u1I9V6rukW6UA7OFjMAWx0Pl
	0+gVNydWDLgBkh8etncFNIYVD7T+X3qgHZGc6LJ+Vt3wTFKRK+QFZQm89anhgrHHSYaK
	RQf7sHZnmSPpOi/IEc9at+LZXrrlY/Rm9gX/xz2dFZdG+Zo1WC366UKummfUhJrRk5Qf
	NBvQ==
X-Gm-Message-State: APf1xPAU/tQnQmf1OBhvZVwxl9nTXGIgj9TjjwMEkAPn7TV7VkENzIUJ
	RhkSOFhZudzIh9rAqMOYS4Ox/Fs/
X-Google-Smtp-Source: AG47ELs4P4knrHCGrcUDpxByzBDAi80FbtMoT1Qu5vKd4O/OBslaN0q1lveF4rZN4qAjiq0zyAhj/w==
X-Received: by 10.223.158.196 with SMTP id b4mr12976980wrf.112.1520270460519; 
	Mon, 05 Mar 2018 09:21:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:26 +0000
Message-Id: <20180305172046.21729-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 09/29] nfs-utils: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/bugfix-adjust-statd-service-name.patch      | 15 ++++++---------
 ...nfigure-Allow-to-explicitly-disable-nfsidmap.patch | 19 ++++++++-----------
 .../nfs-utils-1.2.3-sm-notify-res_init.patch          | 11 ++++++-----
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch b/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
index 14bd4036af4..822939f0d24 100644
--- a/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
+++ b/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
@@ -16,11 +16,11 @@ Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
  utils/statd/start-statd | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/utils/statd/start-statd b/utils/statd/start-statd
-index 8211a90..3c2aa6f 100755
---- a/utils/statd/start-statd
-+++ b/utils/statd/start-statd
-@@ -16,7 +16,7 @@ fi
+Index: nfs-utils-2.1.1/utils/statd/start-statd
+===================================================================
+--- nfs-utils-2.1.1.orig/utils/statd/start-statd
++++ nfs-utils-2.1.1/utils/statd/start-statd
+@@ -28,7 +28,7 @@ fi
  # First try systemd if it's installed.
  if [ -d /run/systemd/system ]; then
      # Quit only if the call worked.
@@ -28,7 +28,4 @@ index 8211a90..3c2aa6f 100755
 +    systemctl start nfs-statd.service && exit
  fi
  
- # Fall back to launching it ourselves.
--- 
-2.1.4
-
+ cd /
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
index 7025fb555cb..26b558c81fe 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
@@ -12,11 +12,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  configure.ac | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index bf433d6..28a8f62 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -69,6 +69,12 @@ AC_ARG_ENABLE(nfsv4,
+Index: nfs-utils-2.1.1/configure.ac
+===================================================================
+--- nfs-utils-2.1.1.orig/configure.ac
++++ nfs-utils-2.1.1/configure.ac
+@@ -92,6 +92,12 @@ AC_ARG_ENABLE(nfsv4,
  	AC_SUBST(enable_nfsv4)
  	AM_CONDITIONAL(CONFIG_NFSV4, [test "$enable_nfsv4" = "yes"])
  
@@ -27,9 +27,9 @@ index bf433d6..28a8f62 100644
 +        enable_nfsidmap=yes)
 +
  AC_ARG_ENABLE(nfsv41,
- 	[AC_HELP_STRING([--enable-nfsv41],
-                         [enable support for NFSv41 @<:@default=yes@:>@])],
-@@ -296,7 +302,7 @@ fi
+ 	[AC_HELP_STRING([--disable-nfsv41],
+                         [disable support for NFSv41 @<:@default=no@:>@])],
+@@ -339,7 +345,7 @@ fi
  
  dnl enable nfsidmap when its support by libnfsidmap
  AM_CONDITIONAL(CONFIG_NFSDCLTRACK, [test "$enable_nfsdcltrack" = "yes" ])
@@ -38,6 +38,3 @@ index bf433d6..28a8f62 100644
  
  
  if test "$knfsd_cv_glibc2" = no; then
--- 
-1.8.4.3
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
index d8f81816701..89a8a572602 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
@@ -13,9 +13,10 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 
-diff -up nfs-utils-1.2.3/utils/statd/sm-notify.c.orig nfs-utils-1.2.3/utils/statd/sm-notify.c
---- nfs-utils-1.2.3/utils/statd/sm-notify.c.orig	2010-09-28 08:24:16.000000000 -0400
-+++ nfs-utils-1.2.3/utils/statd/sm-notify.c	2010-10-15 16:44:43.487119601 -0400
+Index: nfs-utils-2.1.1/utils/statd/sm-notify.c
+===================================================================
+--- nfs-utils-2.1.1.orig/utils/statd/sm-notify.c
++++ nfs-utils-2.1.1/utils/statd/sm-notify.c
 @@ -28,6 +28,9 @@
  #include <netdb.h>
  #include <errno.h>
@@ -24,9 +25,9 @@ diff -up nfs-utils-1.2.3/utils/statd/sm-notify.c.orig nfs-utils-1.2.3/utils/stat
 +#include <arpa/nameser.h>
 +#include <resolv.h>
  
+ #include "conffile.h"
  #include "sockaddr.h"
- #include "xlog.h"
-@@ -84,6 +87,7 @@ smn_lookup(const char *name)
+@@ -89,6 +92,7 @@ smn_lookup(const char *name)
  	};
  	int error;
  
-- 
2.11.0


