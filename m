Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DA7C5473A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.75738.1722536823030410136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Jdt/rZ18;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oWPP+EgY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101910f3206ac-86d4813a-82f6-4748-bb6d-bbcd483a2820-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rHsszGrCRBrPMU4N2hFHTFKfg0QL8QxeNd5aaXPbJpk=;
	b=Jdt/rZ18VZ/8uge6yER17k+xb0ExaVQLQ/wmGdzw6+t1nsOWMijbVj8EYRsuprDY
	jyu1ewZifTqfF/izW1EI/SG7BaeFR2+QIPbQYVjEC66xlSMZASzaC5fqkjZ/nGav3JA
	plkXCoJuckj8qkmp8DJkGjGo0cONPUYhGdPuuRHo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rHsszGrCRBrPMU4N2hFHTFKfg0QL8QxeNd5aaXPbJpk=;
	b=oWPP+EgY1kgKgPtwJ3gy9M3ONEmk/OTI7nKy7qkWVukRZC9KNy5Fv/P5VbspAobl
	gdgH5i2tuRwiNO0kGTjBsXqDiRF0hasHkE6XWs8DBIL5TLuhBS5Ucto3rjOoy1JkXdz
	F64iC02YSvPfEgbSvuXHjP3RASARXczFtpFXocZ0=
Content-Type: multipart/mixed; boundary="===============4058676006594759053=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.0 FAILED
Message-ID: <010101910f3206ac-86d4813a-82f6-4748-bb6d-bbcd483a2820-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202774

--===============4058676006594759053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.27-9.20.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From cdede33fe5da2caee255364519e2bdaff02fed8b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 08:20:22 +0000
Subject: [PATCH] bind: upgrade 9.18.27 -> 9.20.0

---
 ...1-avoid-start-failure-with-bind-user.patch |   7 +-
 ...d-V-and-start-log-hide-build-options.patch |   5 +-
 ...ching-for-json-headers-searches-sysr.patch |   7 +-
 .../recipes-connectivity/bind/bind/conf.patch | 137 ++++++++++++------
 ...t.d-add-support-for-read-only-rootfs.patch |  12 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  19 ++-
 .../bind/{bind_9.18.27.bb => bind_9.20.0.bb}  |   2 +-
 7 files changed, 117 insertions(+), 72 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.27.bb => bind_9.20.0.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index ec1bc7b567..abe430dc34 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From 22fb9c185aa239fcfdf55c1a785a215f22a72659 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
@@ -11,7 +11,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/init.d b/init.d
-index b2eec60..6e03936 100644
+index 95e8909..771d349 100644
 --- a/init.d
 +++ b/init.d
 @@ -57,6 +57,7 @@ case "$1" in
@@ -22,6 +22,3 @@ index b2eec60..6e03936 100644
  	    chmod 0640 /etc/bind/rndc.key
  	fi
  	if [ -f /var/run/named/named.pid ]; then
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 4c10f33f04..91930097c4 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From bc79dea3ea7466dfea3e2c48d25110514ef4ff13 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -15,13 +15,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Refreshed for 9.16.0
 Signed-off-by: Armin Kuster <akuster@mvista.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index bf20690..c5d330f 100644
+index b07de85..5691dab 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d07cae39..1dcd3502ca 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
+From be989e998b81b9147588736573aa017a2a4cdbd3 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -27,16 +27,15 @@ to make use of the combination some day.
 
 Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2ab8ddd..92fe983 100644
+index a911163..b07de85 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
+@@ -857,7 +857,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index aa3642acec..5d29d36ac1 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,43 @@
+From d7a8f0a3c475ab391bc62e0e3f5c70b3ba59ca90 Mon Sep 17 00:00:00 2001
+From: Qing He <qing.he@intel.com>
+Date: Tue, 30 Nov 2010 13:35:42 +0800
+Subject: [PATCH] bind: add new recipe
+
 Upstream-Status: Inappropriate [configuration]
 
 the patch is imported from openembedded project
 
 11/30/2010 - Qing He <qing.he@intel.com>
+---
+ conf/db.0               | 12 +++++++
+ conf/db.127             | 13 ++++++++
+ conf/db.255             | 12 +++++++
+ conf/db.empty           | 14 +++++++++
+ conf/db.local           | 13 ++++++++
+ conf/db.root            | 45 ++++++++++++++++++++++++++
+ conf/named.conf         | 49 +++++++++++++++++++++++++++++
+ conf/named.conf.local   |  8 +++++
+ conf/named.conf.options | 24 ++++++++++++++
+ conf/zones.rfc1918      | 20 ++++++++++++
+ init.d                  | 70 +++++++++++++++++++++++++++++++++++++++++
+ 11 files changed, 280 insertions(+)
+ create mode 100644 conf/db.0
+ create mode 100644 conf/db.127
+ create mode 100644 conf/db.255
+ create mode 100644 conf/db.empty
+ create mode 100644 conf/db.local
+ create mode 100644 conf/db.root
+ create mode 100644 conf/named.conf
+ create mode 100644 conf/named.conf.local
+ create mode 100644 conf/named.conf.options
+ create mode 100644 conf/zones.rfc1918
+ create mode 100644 init.d
 
-diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
---- bind-9.3.1.orig/conf/db.0	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.0	2005-07-10 22:14:00.000000000 +0200
+diff --git a/conf/db.0 b/conf/db.0
+new file mode 100644
+index 0000000..e3aabdb
+--- /dev/null
++++ b/conf/db.0
 @@ -0,0 +1,12 @@
 +;
 +; BIND reverse data file for broadcast zone
@@ -20,9 +51,11 @@ diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
 +			 604800 )	; Negative Cache TTL
 +;
 +@	IN	NS	localhost.
-diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127
---- bind-9.3.1.orig/conf/db.127	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.127	2005-07-10 22:14:00.000000000 +0200
+diff --git a/conf/db.127 b/conf/db.127
+new file mode 100644
+index 0000000..cd05bef
+--- /dev/null
++++ b/conf/db.127
 @@ -0,0 +1,13 @@
 +;
 +; BIND reverse data file for local loopback interface
@@ -37,43 +70,49 @@ diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127
 +;
 +@	IN	NS	localhost.
 +1.0.0	IN	PTR	localhost.
-diff -urN bind-9.3.1.orig/conf/db.empty bind-9.3.1/conf/db.empty
---- bind-9.3.1.orig/conf/db.empty	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.empty	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,14 @@
-+; BIND reverse data file for empty rfc1918 zone
+diff --git a/conf/db.255 b/conf/db.255
+new file mode 100644
+index 0000000..16cd819
+--- /dev/null
++++ b/conf/db.255
+@@ -0,0 +1,12 @@
 +;
-+; DO NOT EDIT THIS FILE - it is used for multiple zones.
-+; Instead, copy it, edit named.conf, and use that copy.
++; BIND reserve data file for broadcast zone
 +;
-+$TTL	86400
++$TTL	604800
 +@	IN	SOA	localhost. root.localhost. (
 +			      1		; Serial
 +			 604800		; Refresh
 +			  86400		; Retry
 +			2419200		; Expire
-+			  86400 )	; Negative Cache TTL
++			 604800 )	; Negative Cache TTL
 +;
 +@	IN	NS	localhost.
-diff -urN bind-9.3.1.orig/conf/db.255 bind-9.3.1/conf/db.255
---- bind-9.3.1.orig/conf/db.255	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.255	2005-07-10 22:14:00.000000000 +0200
-@@ -0,0 +1,12 @@
+diff --git a/conf/db.empty b/conf/db.empty
+new file mode 100644
+index 0000000..8a12858
+--- /dev/null
++++ b/conf/db.empty
+@@ -0,0 +1,14 @@
++; BIND reverse data file for empty rfc1918 zone
 +;
-+; BIND reserve data file for broadcast zone
++; DO NOT EDIT THIS FILE - it is used for multiple zones.
++; Instead, copy it, edit named.conf, and use that copy.
 +;
-+$TTL	604800
++$TTL	86400
 +@	IN	SOA	localhost. root.localhost. (
 +			      1		; Serial
 +			 604800		; Refresh
 +			  86400		; Retry
 +			2419200		; Expire
-+			 604800 )	; Negative Cache TTL
++			  86400 )	; Negative Cache TTL
 +;
 +@	IN	NS	localhost.
-diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
---- bind-9.3.1.orig/conf/db.local	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.local	2005-07-10 22:14:00.000000000 +0200
+diff --git a/conf/db.local b/conf/db.local
+new file mode 100644
+index 0000000..66b4892
+--- /dev/null
++++ b/conf/db.local
 @@ -0,0 +1,13 @@
 +;
 +; BIND data file for local loopback interface
@@ -88,9 +127,11 @@ diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
 +;
 +@	IN	NS	localhost.
 +@	IN	A	127.0.0.1
-diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
---- bind-9.3.1.orig/conf/db.root	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.root	2005-07-10 22:14:00.000000000 +0200
+diff --git a/conf/db.root b/conf/db.root
+new file mode 100644
+index 0000000..01c20f0
+--- /dev/null
++++ b/conf/db.root
 @@ -0,0 +1,45 @@
 +
 +; <<>> DiG 9.2.3 <<>> ns . @a.root-servers.net.
@@ -137,9 +178,11 @@ diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
 +;; WHEN: Sun Feb  1 11:27:14 2004
 +;; MSG SIZE  rcvd: 436
 +
-diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
---- bind-9.3.1.orig/conf/named.conf	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/named.conf	2005-07-10 22:33:46.000000000 +0200
+diff --git a/conf/named.conf b/conf/named.conf
+new file mode 100644
+index 0000000..95829cf
+--- /dev/null
++++ b/conf/named.conf
 @@ -0,0 +1,49 @@
 +// This is the primary configuration file for the BIND DNS server named.
 +//
@@ -190,9 +233,11 @@ diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
 +// root-delegation-only exclude { "DE"; "MUSEUM"; };
 +
 +include "/etc/bind/named.conf.local";
-diff -urN bind-9.3.1.orig/conf/named.conf.local bind-9.3.1/conf/named.conf.local
---- bind-9.3.1.orig/conf/named.conf.local	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/named.conf.local	2005-07-10 22:14:06.000000000 +0200
+diff --git a/conf/named.conf.local b/conf/named.conf.local
+new file mode 100644
+index 0000000..7a57b10
+--- /dev/null
++++ b/conf/named.conf.local
 @@ -0,0 +1,8 @@
 +//
 +// Do any local configuration here
@@ -202,9 +247,11 @@ diff -urN bind-9.3.1.orig/conf/named.conf.local bind-9.3.1/conf/named.conf.local
 +// organization
 +//include "/etc/bind/zones.rfc1918";
 +
-diff -urN bind-9.3.1.orig/conf/named.conf.options bind-9.3.1/conf/named.conf.options
---- bind-9.3.1.orig/conf/named.conf.options	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/named.conf.options	2005-07-10 22:14:06.000000000 +0200
+diff --git a/conf/named.conf.options b/conf/named.conf.options
+new file mode 100644
+index 0000000..813193d
+--- /dev/null
++++ b/conf/named.conf.options
 @@ -0,0 +1,24 @@
 +options {
 +	directory "/var/cache/bind";
@@ -230,9 +277,11 @@ diff -urN bind-9.3.1.orig/conf/named.conf.options bind-9.3.1/conf/named.conf.opt
 +
 +};
 +
-diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc1918
---- bind-9.3.1.orig/conf/zones.rfc1918	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/zones.rfc1918	2005-07-10 22:14:10.000000000 +0200
+diff --git a/conf/zones.rfc1918 b/conf/zones.rfc1918
+new file mode 100644
+index 0000000..03b5546
+--- /dev/null
++++ b/conf/zones.rfc1918
 @@ -0,0 +1,20 @@
 +zone "10.in-addr.arpa"      { type master; file "/etc/bind/db.empty"; };
 + 
@@ -254,9 +303,11 @@ diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc1918
 +zone "31.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
 +
 +zone "168.192.in-addr.arpa" { type master; file "/etc/bind/db.empty"; };
-diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
---- bind-9.3.1.orig/init.d	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/init.d	2005-07-10 23:09:58.000000000 +0200
+diff --git a/init.d b/init.d
+new file mode 100644
+index 0000000..2ef2277
+--- /dev/null
++++ b/init.d
 @@ -0,0 +1,70 @@
 +#!/bin/sh
 +
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 11db95ede1..afa74bfa1a 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,17 @@
-Subject: init.d: add support for read-only rootfs
+From 7ef459be0b63ecb8cbe023debbe2c1ccb7f0a111 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 27 Mar 2014 02:34:41 +0000
+Subject: [PATCH] init.d: add support for read-only rootfs
 
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- init.d |   40 ++++++++++++++++++++++++++++++++++++++++
+ init.d | 40 ++++++++++++++++++++++++++++++++++++++++
  1 file changed, 40 insertions(+)
 
 diff --git a/init.d b/init.d
-index 0111ed4..24677c8 100644
+index 2ef2277..95e8909 100644
 --- a/init.d
 +++ b/init.d
 @@ -6,8 +6,48 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
@@ -60,6 +63,3 @@ index 0111ed4..24677c8 100644
  test -x /usr/sbin/rndc || exit 0
  
  case "$1" in
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 146f3e35db..30626a1090 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From 829976cb65fc8231751ed13ed3e6c4cea322466b Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Thu, 15 Nov 2012 02:27:54 +0000
+Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -7,13 +10,13 @@ the named daemon.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 ---
- conf/named.conf |    5 +++++
- conf/rndc.conf  |    5 +++++
- 2 files changed, 10 insertions(+), 0 deletions(-)
+ conf/named.conf | 5 +++++
+ conf/rndc.conf  | 5 +++++
+ 2 files changed, 10 insertions(+)
  create mode 100644 conf/rndc.conf
 
 diff --git a/conf/named.conf b/conf/named.conf
-index 95829cf..c8899e7 100644
+index 95829cf..021dbca 100644
 --- a/conf/named.conf
 +++ b/conf/named.conf
 @@ -47,3 +47,8 @@ zone "255.in-addr.arpa" {
@@ -27,7 +30,7 @@ index 95829cf..c8899e7 100644
 +};
 diff --git a/conf/rndc.conf b/conf/rndc.conf
 new file mode 100644
-index 0000000..a0b481d
+index 0000000..4b43a3d
 --- /dev/null
 +++ b/conf/rndc.conf
 @@ -0,0 +1,5 @@
@@ -36,7 +39,3 @@ index 0000000..a0b481d
 +	default-server  localhost;
 +	default-key     rndc-key;
 +};
-
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/bind/bind_9.18.27.bb b/meta/recipes-connectivity/bind/bind_9.20.0.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.27.bb
rename to meta/recipes-connectivity/bind/bind_9.20.0.bb
index 0d22bace6f..3b00a6fa94 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.27.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "ea3f3d8cfa2f6ae78c8722751d008f54bc17a3aed2be3f7399eb7bf5f4cda8f1"
+SRC_URI[sha256sum] = "cc580998017b51f273964058e8cb3aa5482bc785243dea71e5556ec565a13347"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.44.0


--===============4058676006594759053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-81d30a96054345a4c3f2ecac1287e16adb088d32"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:81d30a96054345a4c3f2ecac1287e16adb088d32"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 140 Local 128 Mirrors 0 Missed 12 Current 296 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1012 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_recipe_qa)
NOTE: recipe bind-9.20.0-r0: task do_recipe_qa: Started
NOTE: recipe bind-9.20.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1228 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_fetch)
NOTE: recipe bind-9.20.0-r0: task do_fetch: Started
NOTE: recipe bind-9.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1229 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_unpack)
NOTE: Running task 1230 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bind-9.20.0-r0: task do_unpack: Started
NOTE: recipe bind-9.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bind-9.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bind-9.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_patch)
NOTE: Running task 1232 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_collect_spdx_deps)
NOTE: recipe bind-9.20.0-r0: task do_patch: Started
NOTE: recipe bind-9.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bind-9.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bind-9.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1233 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1234 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_populate_lic)
NOTE: recipe bind-9.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bind-9.20.0-r0: task do_populate_lic: Started
NOTE: recipe bind-9.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1235 of 1247 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_configure)
NOTE: recipe bind-9.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe bind-9.20.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/libuv/libuv_1.48.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8
 .bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do
 _populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libuv', 'openssl', 'base-files', 'base-passwd', 'gettext-minimal-native', 'glibc', 'initscripts', 'libxcrypt', 'ncurses', 'readline', 'systemd-systemctl-native', 'update-rc.d', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'cracklib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'linux-libc-headers', 'attr', 'libcap', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/bind-9.20.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/bind-9.20.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal/ --force
| fatal: not a git repository (or any of the parent directories): .git
| autoreconf: configure.ac: tracing
| fatal: not a git repository (or any of the parent directories): .git
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/bind-9.20.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal/ --force
| fatal: not a git repository (or any of the parent directories): .git
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/bind-9.20.0/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal/ --force
| fatal: not a git repository (or any of the parent directories): .git
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/bind-9.20.0/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/share/aclocal/ --force
| fatal: not a git repository (or any of the parent directories): .git
| autoreconf: running: automake --add-missing --copy --force-missing
| fatal: not a git repository (or any of the parent directories): .git
| configure.ac:69: installing './compile'
| configure.ac:51: installing './missing'
| bin/check/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: './install-sh' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../bind-9.20.0/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --disable-auto-validation                  --with-gssapi=no --with-lmdb=no --with-zlib                  --sysconfdir=/etc/bind                  --with-openssl=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot/usr                 --disable-static  --disable-doh --without-libxml2 --with-readline=readline
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking target system type... x86_64-poky-linux-gnu
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot... (cached) none
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for x86_64-pc-linux-gnu-gcc... gcc
| checking whether the compiler supports GNU C... yes
| checking whether gcc  accepts -g... yes
| checking for gcc  option to enable C11 features... none needed
| checking whether gcc  understands -c and -o together... yes
| checking dependency style of gcc ... none
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking how to run the C preprocessor... gcc  -E
| checking whether byte ordering is bigendian... (cached) no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot option to enable large file support... none needed
| checking for declarations of fseeko and ftello... yes
| checking whether make sets $(MAKE)... (cached) yes
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking the archiver (x86_64-poky-linux-gcc-ar) interface... ar
| checking whether ln -s works... yes
| checking for a POSIX-compatible shell... /bin/bash
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot   option to reload object files... -r
| checking for file... file
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... (cached) x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking for shl_load... no
| checking for shl_load in -ldld... no
| checking for dlopen... yes
| checking whether a program can dlopen itself... cross
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking whether C compiler accepts -fno-strict-aliasing... yes
| checking whether C compiler accepts -Werror -fno-delete-null-pointer-checks... yes
| checking whether C compiler accepts -fdiagnostics-show-option... yes
| checking whether the linker accepts -Wl,--export-dynamic... yes
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking liburcu flavor... liburcu
| checking for liburcu >= 0.13.0 liburcu-cds >= 0.13.0... no
| checking for liburcu >= 0.10.0 liburcu-cds >= 0.10.0... no
| configure: error: Package requirements (liburcu >= 0.10.0 liburcu-cds >= 0.10.0) were not met:
| 
| No package 'liburcu' found
| No package 'liburcu-cds' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables LIBURCU_CFLAGS
| and LIBURCU_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/run.do_configure.1343057:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/run.do_configure.1343057, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/run.do_configure.1343057, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/run.do_configure.1343057, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/run.do_configure.1343057, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/run.do_configure.1343057, line 289
NOTE: recipe bind-9.20.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1235 tasks of which 1226 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801081952.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801081952.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: bind-9.20.0-r0 do_configure: configure failed
ERROR: bind-9.20.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/run.do_configure.1343057', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bind/9.20.0/temp/log.do_configure.1343057
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bind/bind_9.20.0.bb:do_configure) failed with exit code '1'

--===============4058676006594759053==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.27-9.20.0.patch"

RnJvbSBjZGVkZTMzZmU1ZGEyY2FlZTI1NTM2NDUxOWUyYmRhZmYwMmZlZDhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwODoyMDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC4yNyAtPiA5LjIwLjAKCi0tLQogLi4uMS1hdm9pZC1zdGFydC1mYWls
dXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIHwgICA3ICstCiAuLi5kLVYtYW5kLXN0YXJ0LWxvZy1o
aWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggfCAgIDUgKy0KIC4uLmNoaW5nLWZvci1qc29uLWhlYWRl
cnMtc2VhcmNoZXMtc3lzci5wYXRjaCB8ICAgNyArLQogLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9jb25mLnBhdGNoIHwgMTM3ICsrKysrKysrKysrKy0tLS0tLQogLi4udC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoIHwgIDEyICstCiAuLi4vYmluZC9t
YWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgfCAgMTkgKystCiAuLi4vYmluZC97
YmluZF85LjE4LjI3LmJiID0+IGJpbmRfOS4yMC4wLmJifSAgfCAgIDIgKy0KIDcgZmlsZXMgY2hh
bmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjE4LjI3LmJiID0+IGJpbmRfOS4yMC4wLmJi
fSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
LzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRo
LWJpbmQtdXNlci5wYXRjaAppbmRleCBlYzFiYzdiNTY3Li5hYmU0MzBkYzM0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZh
aWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMWRkZTM1NjJmMjg3NDI5ZWVhOTRiNzcyNTBkMTg0ODE4
YjQ5MDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyMmZiOWMxODVhYTIzOWZjZmRm
NTVjMWE3ODVhMjE1ZjIyYTcyNjU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hl
biBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAxNSBPY3QgMjAxOCAxNjo1
NTowOSArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBzdGFydCBmYWlsdXJlIHdpdGggYmlu
ZCB1c2VyCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAt
LWdpdCBhL2luaXQuZCBiL2luaXQuZAotaW5kZXggYjJlZWM2MC4uNmUwMzkzNiAxMDA2NDQKK2lu
ZGV4IDk1ZTg5MDkuLjc3MWQzNDkgMTAwNjQ0CiAtLS0gYS9pbml0LmQKICsrKyBiL2luaXQuZAog
QEAgLTU3LDYgKzU3LDcgQEAgY2FzZSAiJDEiIGluCkBAIC0yMiw2ICsyMiwzIEBAIGluZGV4IGIy
ZWVjNjAuLjZlMDM5MzYgMTAwNjQ0CiAgCSAgICBjaG1vZCAwNjQwIC9ldGMvYmluZC9ybmRjLmtl
eQogIAlmaQogIAlpZiBbIC1mIC92YXIvcnVuL25hbWVkL25hbWVkLnBpZCBdOyB0aGVuCi0tLSAK
LTIuNy40Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
LzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVz
ZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCmluZGV4IDRjMTBmMzNm
MDQuLjkxOTMwMDk3YzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlv
bnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNGU4MzM5MmU4NDBmYTdiMDVlNzc4NzEwYjhjMjAyZDEwMjQ3N2Ex
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmM3OWRlYTNlYTc0NjZkZmVhM2UyYzQ4
ZDI1MTEwNTE0ZWY0ZmYxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMjcgQXVnIDIwMTggMjE6
MjQ6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYG5hbWVkL2x3cmVzZCAtVicgYW5kIHN0YXJ0
IGxvZyBoaWRlIGJ1aWxkIG9wdGlvbnMKQEAgLTE1LDEzICsxNSwxMiBAQCBTaWduZWQtb2ZmLWJ5
OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAKIFJlZnJlc2hlZCBmb3Ig
OS4xNi4wCiBTaWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXJAbXZpc3RhLmNvbT4K
LQogLS0tCiAgY29uZmlndXJlLmFjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCi1pbmRleCBiZjIwNjkwLi5jNWQzMzBmIDEwMDY0NAoraW5kZXggYjA3ZGU4NS4uNTY5
MWRhYiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAt
MzUsNyArMzUsNyBAQCBBQ19ERUZJTkUoW1BBQ0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5k
X1ZFUlNJT05fRVhUUkFdWyJdLCBbQklORCA5IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1q
c29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJj
aGVzLXN5c3IucGF0Y2gKaW5kZXggMzhkMDdjYWUzOS4uMWRjZDM1MDJjYSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5n
LWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVh
ZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1YWUzMDMyOWYx
NjhjMWU4ZDJlMGMzODMxOTg4YTRmM2U5MDk2ZTM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBiZTk4OWU5OThiODFiOTE0NzU4ODczNjU3M2FhMDE3YTJhNGNkYmQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBUdWUsIDkgSnVuIDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6
IFtQQVRDSF0gYmluZDogZW5zdXJlIHNlYXJjaGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJjaGVz
IHN5c3Jvb3QKQEAgLTI3LDE2ICsyNywxNSBAQCB0byBtYWtlIHVzZSBvZiB0aGUgY29tYmluYXRp
b24gc29tZSBkYXkuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0UgU3BlY2lm
aWNdCiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJp
dmVyLmNvbT4KLQogLS0tCiAgY29uZmlndXJlLmFjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFj
IGIvY29uZmlndXJlLmFjCi1pbmRleCAyYWI4ZGRkLi45MmZlOTgzIDEwMDY0NAoraW5kZXggYTkx
MTE2My4uYjA3ZGU4NSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJl
LmFjCi1AQCAtNzYxLDcgKzc2MSw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJdLAorQEAgLTg1Nyw3
ICs4NTcsNyBAQCBBU19DQVNFKFskd2l0aF9sbWRiXSwKICAJW25vXSxbXSwKICAJW2F1dG98eWVz
XSwgW1BLR19DSEVDS19NT0RVTEVTKFtMTURCXSwgW2xtZGJdLAogIAkJCQkgICAgICAgW2FjX2xp
Yl9sbWRiX2ZvdW5kPXllc10sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvY29uZi5wYXRjaAppbmRleCBhYTM2NDJhY2VjLi41ZDI5ZDM2YWMxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsMTIgKzEsNDMg
QEAKK0Zyb20gZDdhOGYwYTNjNDc1YWIzOTFiYzYyZTBlM2Y1YzcwYjNiYTU5Y2E5MCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgorRGF0
ZTogVHVlLCAzMCBOb3YgMjAxMCAxMzozNTo0MiArMDgwMAorU3ViamVjdDogW1BBVENIXSBiaW5k
OiBhZGQgbmV3IHJlY2lwZQorCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZp
Z3VyYXRpb25dCiAKIHRoZSBwYXRjaCBpcyBpbXBvcnRlZCBmcm9tIG9wZW5lbWJlZGRlZCBwcm9q
ZWN0CiAKIDExLzMwLzIwMTAgLSBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNvbT4KKy0tLQorIGNv
bmYvZGIuMCAgICAgICAgICAgICAgIHwgMTIgKysrKysrKworIGNvbmYvZGIuMTI3ICAgICAgICAg
ICAgIHwgMTMgKysrKysrKysKKyBjb25mL2RiLjI1NSAgICAgICAgICAgICB8IDEyICsrKysrKysK
KyBjb25mL2RiLmVtcHR5ICAgICAgICAgICB8IDE0ICsrKysrKysrKworIGNvbmYvZGIubG9jYWwg
ICAgICAgICAgIHwgMTMgKysrKysrKysKKyBjb25mL2RiLnJvb3QgICAgICAgICAgICB8IDQ1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrCisgY29uZi9uYW1lZC5jb25mICAgICAgICAgfCA0OSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKworIGNvbmYvbmFtZWQuY29uZi5sb2NhbCAgIHwg
IDggKysrKysKKyBjb25mL25hbWVkLmNvbmYub3B0aW9ucyB8IDI0ICsrKysrKysrKysrKysrCisg
Y29uZi96b25lcy5yZmMxOTE4ICAgICAgfCAyMCArKysrKysrKysrKysKKyBpbml0LmQgICAgICAg
ICAgICAgICAgICB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CisgMTEgZmlsZXMgY2hhbmdlZCwgMjgwIGluc2VydGlvbnMoKykKKyBjcmVhdGUgbW9kZSAxMDA2
NDQgY29uZi9kYi4wCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuMTI3CisgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmYvZGIuMjU1CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuZW1wdHkK
KyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi5sb2NhbAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBj
b25mL2RiLnJvb3QKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9uYW1lZC5jb25mCisgY3JlYXRl
IG1vZGUgMTAwNjQ0IGNvbmYvbmFtZWQuY29uZi5sb2NhbAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBj
b25mL25hbWVkLmNvbmYub3B0aW9ucworIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL3pvbmVzLnJm
YzE5MTgKKyBjcmVhdGUgbW9kZSAxMDA2NDQgaW5pdC5kCiAKLWRpZmYgLXVyTiBiaW5kLTkuMy4x
Lm9yaWcvY29uZi9kYi4wIGJpbmQtOS4zLjEvY29uZi9kYi4wCi0tLS0gYmluZC05LjMuMS5vcmln
L2NvbmYvZGIuMAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQt
OS4zLjEvY29uZi9kYi4wCTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCitkaWZm
IC0tZ2l0IGEvY29uZi9kYi4wIGIvY29uZi9kYi4wCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5k
ZXggMDAwMDAwMC4uZTNhYWJkYgorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi4wCiBAQCAt
MCwwICsxLDEyIEBACiArOwogKzsgQklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgYnJvYWRjYXN0
IHpvbmUKQEAgLTIwLDkgKzUxLDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9k
Yi4wIGJpbmQtOS4zLjEvY29uZi9kYi4wCiArCQkJIDYwNDgwMCApCTsgTmVnYXRpdmUgQ2FjaGUg
VFRMCiArOwogK0AJSU4JTlMJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9j
b25mL2RiLjEyNyBiaW5kLTkuMy4xL2NvbmYvZGIuMTI3Ci0tLS0gYmluZC05LjMuMS5vcmlnL2Nv
bmYvZGIuMTI3CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05
LjMuMS9jb25mL2RiLjEyNwkyMDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlm
ZiAtLWdpdCBhL2NvbmYvZGIuMTI3IGIvY29uZi9kYi4xMjcKK25ldyBmaWxlIG1vZGUgMTAwNjQ0
CitpbmRleCAwMDAwMDAwLi5jZDA1YmVmCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLjEy
NwogQEAgLTAsMCArMSwxMyBAQAogKzsKICs7IEJJTkQgcmV2ZXJzZSBkYXRhIGZpbGUgZm9yIGxv
Y2FsIGxvb3BiYWNrIGludGVyZmFjZQpAQCAtMzcsNDMgKzcwLDQ5IEBAIGRpZmYgLXVyTiBiaW5k
LTkuMy4xLm9yaWcvY29uZi9kYi4xMjcgYmluZC05LjMuMS9jb25mL2RiLjEyNwogKzsKICtACUlO
CU5TCWxvY2FsaG9zdC4KICsxLjAuMAlJTglQVFIJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQt
OS4zLjEub3JpZy9jb25mL2RiLmVtcHR5IGJpbmQtOS4zLjEvY29uZi9kYi5lbXB0eQotLS0tIGJp
bmQtOS4zLjEub3JpZy9jb25mL2RiLmVtcHR5CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAw
ICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL2RiLmVtcHR5CTIwMDUtMDctMTAgMjI6MTQ6MDAu
MDAwMDAwMDAwICswMjAwCi1AQCAtMCwwICsxLDE0IEBACi0rOyBCSU5EIHJldmVyc2UgZGF0YSBm
aWxlIGZvciBlbXB0eSByZmMxOTE4IHpvbmUKK2RpZmYgLS1naXQgYS9jb25mL2RiLjI1NSBiL2Nv
bmYvZGIuMjU1CituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uMTZjZDgxOQor
LS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi4yNTUKK0BAIC0wLDAgKzEsMTIgQEAKICs7Ci0r
OyBETyBOT1QgRURJVCBUSElTIEZJTEUgLSBpdCBpcyB1c2VkIGZvciBtdWx0aXBsZSB6b25lcy4K
LSs7IEluc3RlYWQsIGNvcHkgaXQsIGVkaXQgbmFtZWQuY29uZiwgYW5kIHVzZSB0aGF0IGNvcHku
CisrOyBCSU5EIHJlc2VydmUgZGF0YSBmaWxlIGZvciBicm9hZGNhc3Qgem9uZQogKzsKLSskVFRM
CTg2NDAwCisrJFRUTAk2MDQ4MDAKICtACUlOCVNPQQlsb2NhbGhvc3QuIHJvb3QubG9jYWxob3N0
LiAoCiArCQkJICAgICAgMQkJOyBTZXJpYWwKICsJCQkgNjA0ODAwCQk7IFJlZnJlc2gKICsJCQkg
IDg2NDAwCQk7IFJldHJ5CiArCQkJMjQxOTIwMAkJOyBFeHBpcmUKLSsJCQkgIDg2NDAwICkJOyBO
ZWdhdGl2ZSBDYWNoZSBUVEwKKysJCQkgNjA0ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKICs7
CiArQAlJTglOUwlsb2NhbGhvc3QuCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIu
MjU1IGJpbmQtOS4zLjEvY29uZi9kYi4yNTUKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4y
NTUJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2Nv
bmYvZGIuMjU1CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCi1AQCAtMCwwICsx
LDEyIEBACitkaWZmIC0tZ2l0IGEvY29uZi9kYi5lbXB0eSBiL2NvbmYvZGIuZW1wdHkKK25ldyBm
aWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi44YTEyODU4CistLS0gL2Rldi9udWxsCisr
KysgYi9jb25mL2RiLmVtcHR5CitAQCAtMCwwICsxLDE0IEBACisrOyBCSU5EIHJldmVyc2UgZGF0
YSBmaWxlIGZvciBlbXB0eSByZmMxOTE4IHpvbmUKICs7Ci0rOyBCSU5EIHJlc2VydmUgZGF0YSBm
aWxlIGZvciBicm9hZGNhc3Qgem9uZQorKzsgRE8gTk9UIEVESVQgVEhJUyBGSUxFIC0gaXQgaXMg
dXNlZCBmb3IgbXVsdGlwbGUgem9uZXMuCisrOyBJbnN0ZWFkLCBjb3B5IGl0LCBlZGl0IG5hbWVk
LmNvbmYsIGFuZCB1c2UgdGhhdCBjb3B5LgogKzsKLSskVFRMCTYwNDgwMAorKyRUVEwJODY0MDAK
ICtACUlOCVNPQQlsb2NhbGhvc3QuIHJvb3QubG9jYWxob3N0LiAoCiArCQkJICAgICAgMQkJOyBT
ZXJpYWwKICsJCQkgNjA0ODAwCQk7IFJlZnJlc2gKICsJCQkgIDg2NDAwCQk7IFJldHJ5CiArCQkJ
MjQxOTIwMAkJOyBFeHBpcmUKLSsJCQkgNjA0ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKKysJ
CQkgIDg2NDAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKICs7CiArQAlJTglOUwlsb2NhbGhvc3Qu
Ci1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIubG9jYWwgYmluZC05LjMuMS9jb25m
L2RiLmxvY2FsCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIubG9jYWwJMTk3MC0wMS0wMSAw
MTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIubG9jYWwJMjAw
NS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL2RiLmxv
Y2FsIGIvY29uZi9kYi5sb2NhbAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAu
LjY2YjQ4OTIKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIubG9jYWwKIEBAIC0wLDAgKzEs
MTMgQEAKICs7CiArOyBCSU5EIGRhdGEgZmlsZSBmb3IgbG9jYWwgbG9vcGJhY2sgaW50ZXJmYWNl
CkBAIC04OCw5ICsxMjcsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLmxv
Y2FsIGJpbmQtOS4zLjEvY29uZi9kYi5sb2NhbAogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4KICtA
CUlOCUEJMTI3LjAuMC4xCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIucm9vdCBi
aW5kLTkuMy4xL2NvbmYvZGIucm9vdAotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLnJvb3QJ
MTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYv
ZGIucm9vdAkyMDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBh
L2NvbmYvZGIucm9vdCBiL2NvbmYvZGIucm9vdAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4
IDAwMDAwMDAuLjAxYzIwZjAKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIucm9vdAogQEAg
LTAsMCArMSw0NSBAQAogKwogKzsgPDw+PiBEaUcgOS4yLjMgPDw+PiBucyAuIEBhLnJvb3Qtc2Vy
dmVycy5uZXQuCkBAIC0xMzcsOSArMTc4LDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcv
Y29uZi9kYi5yb290IGJpbmQtOS4zLjEvY29uZi9kYi5yb290CiArOzsgV0hFTjogU3VuIEZlYiAg
MSAxMToyNzoxNCAyMDA0CiArOzsgTVNHIFNJWkUgIHJjdmQ6IDQzNgogKwotZGlmZiAtdXJOIGJp
bmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYK
LS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mCTE5NzAtMDEtMDEgMDE6MDA6MDAu
MDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYJMjAwNS0wNy0x
MCAyMjozMzo0Ni4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYg
Yi9jb25mL25hbWVkLmNvbmYKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi45
NTgyOWNmCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL25hbWVkLmNvbmYKIEBAIC0wLDAgKzEs
NDkgQEAKICsvLyBUaGlzIGlzIHRoZSBwcmltYXJ5IGNvbmZpZ3VyYXRpb24gZmlsZSBmb3IgdGhl
IEJJTkQgRE5TIHNlcnZlciBuYW1lZC4KICsvLwpAQCAtMTkwLDkgKzIzMywxMSBAQCBkaWZmIC11
ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZiBiaW5kLTkuMy4xL2NvbmYvbmFtZWQu
Y29uZgogKy8vIHJvb3QtZGVsZWdhdGlvbi1vbmx5IGV4Y2x1ZGUgeyAiREUiOyAiTVVTRVVNIjsg
fTsKICsKICtpbmNsdWRlICIvZXRjL2JpbmQvbmFtZWQuY29uZi5sb2NhbCI7Ci1kaWZmIC11ck4g
YmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvbmFt
ZWQuY29uZi5sb2NhbAotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYubG9jYWwJ
MTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYv
bmFtZWQuY29uZi5sb2NhbAkyMDA1LTA3LTEwIDIyOjE0OjA2LjAwMDAwMDAwMCArMDIwMAorZGlm
ZiAtLWdpdCBhL2NvbmYvbmFtZWQuY29uZi5sb2NhbCBiL2NvbmYvbmFtZWQuY29uZi5sb2NhbAor
bmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjdhNTdiMTAKKy0tLSAvZGV2L251
bGwKKysrKyBiL2NvbmYvbmFtZWQuY29uZi5sb2NhbAogQEAgLTAsMCArMSw4IEBACiArLy8KICsv
LyBEbyBhbnkgbG9jYWwgY29uZmlndXJhdGlvbiBoZXJlCkBAIC0yMDIsOSArMjQ3LDExIEBAIGRp
ZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLmxvY2FsIGJpbmQtOS4zLjEv
Y29uZi9uYW1lZC5jb25mLmxvY2FsCiArLy8gb3JnYW5pemF0aW9uCiArLy9pbmNsdWRlICIvZXRj
L2JpbmQvem9uZXMucmZjMTkxOCI7CiArCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYv
bmFtZWQuY29uZi5vcHRpb25zIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMKLS0t
LSBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMJMTk3MC0wMS0wMSAwMTow
MDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5vcHRp
b25zCTIwMDUtMDctMTAgMjI6MTQ6MDYuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvY29u
Zi9uYW1lZC5jb25mLm9wdGlvbnMgYi9jb25mL25hbWVkLmNvbmYub3B0aW9ucworbmV3IGZpbGUg
bW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjgxMzE5M2QKKy0tLSAvZGV2L251bGwKKysrKyBi
L2NvbmYvbmFtZWQuY29uZi5vcHRpb25zCiBAQCAtMCwwICsxLDI0IEBACiArb3B0aW9ucyB7CiAr
CWRpcmVjdG9yeSAiL3Zhci9jYWNoZS9iaW5kIjsKQEAgLTIzMCw5ICsyNzcsMTEgQEAgZGlmZiAt
dXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYub3B0aW9ucyBiaW5kLTkuMy4xL2Nv
bmYvbmFtZWQuY29uZi5vcHQKICsKICt9OwogKwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9j
b25mL3pvbmVzLnJmYzE5MTggYmluZC05LjMuMS9jb25mL3pvbmVzLnJmYzE5MTgKLS0tLSBiaW5k
LTkuMy4xLm9yaWcvY29uZi96b25lcy5yZmMxOTE4CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAw
MDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL3pvbmVzLnJmYzE5MTgJMjAwNS0wNy0xMCAy
MjoxNDoxMC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL3pvbmVzLnJmYzE5MTgg
Yi9jb25mL3pvbmVzLnJmYzE5MTgKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAw
Li4wM2I1NTQ2CistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL3pvbmVzLnJmYzE5MTgKIEBAIC0w
LDAgKzEsMjAgQEAKICt6b25lICIxMC5pbi1hZGRyLmFycGEiICAgICAgeyB0eXBlIG1hc3Rlcjsg
ZmlsZSAiL2V0Yy9iaW5kL2RiLmVtcHR5IjsgfTsKICsgCkBAIC0yNTQsOSArMzAzLDExIEBAIGRp
ZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi96b25lcy5yZmMxOTE4IGJpbmQtOS4zLjEvY29u
Zi96b25lcy5yZmMxOTE4CiArem9uZSAiMzEuMTcyLmluLWFkZHIuYXJwYSIgIHsgdHlwZSBtYXN0
ZXI7IGZpbGUgIi9ldGMvYmluZC9kYi5lbXB0eSI7IH07CiArCiArem9uZSAiMTY4LjE5Mi5pbi1h
ZGRyLmFycGEiIHsgdHlwZSBtYXN0ZXI7IGZpbGUgIi9ldGMvYmluZC9kYi5lbXB0eSI7IH07Ci1k
aWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2luaXQuZCBiaW5kLTkuMy4xL2luaXQuZAotLS0tIGJp
bmQtOS4zLjEub3JpZy9pbml0LmQJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAK
LSsrKyBiaW5kLTkuMy4xL2luaXQuZAkyMDA1LTA3LTEwIDIzOjA5OjU4LjAwMDAwMDAwMCArMDIw
MAorZGlmZiAtLWdpdCBhL2luaXQuZCBiL2luaXQuZAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2lu
ZGV4IDAwMDAwMDAuLjJlZjIyNzcKKy0tLSAvZGV2L251bGwKKysrKyBiL2luaXQuZAogQEAgLTAs
MCArMSw3MCBAQAogKyMhL2Jpbi9zaAogKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1z
dXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmluZGV4IDExZGI5NWVkZTEuLmFmYTc0
YmZhMWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2lu
aXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQt
b25seS1yb290ZnMucGF0Y2gKQEAgLTEsMTQgKzEsMTcgQEAKLVN1YmplY3Q6IGluaXQuZDogYWRk
IHN1cHBvcnQgZm9yIHJlYWQtb25seSByb290ZnMKK0Zyb20gN2VmNDU5YmUwYjYzZWNiOGNiZTAy
M2RlYmJlMmMxY2NiN2YwYTExMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENoZW4g
UWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KK0RhdGU6IFRodSwgMjcgTWFyIDIwMTQgMDI6MzQ6
NDEgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gaW5pdC5kOiBhZGQgc3VwcG9ydCBmb3IgcmVhZC1v
bmx5IHJvb3RmcwogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmlj
XQogCiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAtLS0K
LSBpbml0LmQgfCAgIDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
KyBpbml0LmQgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAg
MSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2luaXQuZCBi
L2luaXQuZAotaW5kZXggMDExMWVkNC4uMjQ2NzdjOCAxMDA2NDQKK2luZGV4IDJlZjIyNzcuLjk1
ZTg5MDkgMTAwNjQ0CiAtLS0gYS9pbml0LmQKICsrKyBiL2luaXQuZAogQEAgLTYsOCArNiw0OCBA
QCBQQVRIPS9zYmluOi9iaW46L3Vzci9zYmluOi91c3IvYmluCkBAIC02MCw2ICs2MywzIEBAIGlu
ZGV4IDAxMTFlZDQuLjI0Njc3YzggMTAwNjQ0CiAgdGVzdCAteCAvdXNyL3NiaW4vcm5kYyB8fCBl
eGl0IDAKICAKICBjYXNlICIkMSIgaW4KLS0tIAotMS43LjkuNQotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3At
d29yay5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRj
LWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCmluZGV4IDE0NmYzZTM1ZGIuLjMwNjI2YTEwOTAg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRj
LWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQg
KzEsNyBAQAotYmluZDogbWFrZSAiL2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCitGcm9tIDgy
OTk3NmNiNjVmYzgyMzE3NTFlZDEzZWQzZTZjNGNlYTMyMjQ2NmIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CitEYXRlOiBU
aHUsIDE1IE5vdiAyMDEyIDAyOjI3OjU0ICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IG1h
a2UgIi9ldGMvaW5pdC5kL2JpbmQgc3RvcCIgd29yawogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAKQEAgLTcsMTMgKzEwLDEzIEBAIHRoZSBuYW1lZCBk
YWVtb24uCiAKIFNpZ25lZC1vZmYtYnk6IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNv
bT4KIC0tLQotIGNvbmYvbmFtZWQuY29uZiB8ICAgIDUgKysrKysKLSBjb25mL3JuZGMuY29uZiAg
fCAgICA1ICsrKysrCi0gMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0
aW9ucygtKQorIGNvbmYvbmFtZWQuY29uZiB8IDUgKysrKysKKyBjb25mL3JuZGMuY29uZiAgfCA1
ICsrKysrCisgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGNvbmYvcm5kYy5jb25mCiAKIGRpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYgYi9j
b25mL25hbWVkLmNvbmYKLWluZGV4IDk1ODI5Y2YuLmM4ODk5ZTcgMTAwNjQ0CitpbmRleCA5NTgy
OWNmLi4wMjFkYmNhIDEwMDY0NAogLS0tIGEvY29uZi9uYW1lZC5jb25mCiArKysgYi9jb25mL25h
bWVkLmNvbmYKIEBAIC00NywzICs0Nyw4IEBAIHpvbmUgIjI1NS5pbi1hZGRyLmFycGEiIHsKQEAg
LTI3LDcgKzMwLDcgQEAgaW5kZXggOTU4MjljZi4uYzg4OTllNyAxMDA2NDQKICt9OwogZGlmZiAt
LWdpdCBhL2NvbmYvcm5kYy5jb25mIGIvY29uZi9ybmRjLmNvbmYKIG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Ci1pbmRleCAwMDAwMDAwLi5hMGI0ODFkCitpbmRleCAwMDAwMDAwLi40YjQzYTNkCiAtLS0g
L2Rldi9udWxsCiArKysgYi9jb25mL3JuZGMuY29uZgogQEAgLTAsMCArMSw1IEBACkBAIC0zNiw3
ICszOSwzIEBAIGluZGV4IDAwMDAwMDAuLmEwYjQ4MWQKICsJZGVmYXVsdC1zZXJ2ZXIgIGxvY2Fs
aG9zdDsKICsJZGVmYXVsdC1rZXkgICAgIHJuZGMta2V5OwogK307Ci0KLS0tIAotMS43LjUuNAot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjI3
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kXzkuMTguMjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kXzkuMjAuMC5iYgppbmRleCAwZDIyYmFjZTZmLi4zYjAwYTZmYTk0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjI3LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMC5iYgpAQCAtMjAsNyArMjAs
NyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBO
fS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFydC1mYWls
dXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZWEzZjNkOGNmYTJmNmFlNzhjODcyMjc1MWQwMDhmNTRiYzE3YTNhZWQyYmUzZjcz
OTllYjdiZjVmNGNkYThmMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjYzU4MDk5ODAxN2I1MWYy
NzM5NjQwNThlOGNiM2FhNTQ4MmJjNzg1MjQzZGVhNzFlNTU1NmVjNTY1YTEzMzQ3IgogCiBVUFNU
UkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xs
b3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi40NC4wCgo=

--===============4058676006594759053==--

