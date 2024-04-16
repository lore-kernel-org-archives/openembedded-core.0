Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D7DC32718
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13423.1713248037148990084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TbqXuom1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZsfPbVld;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58a65bc-b389dfab-b256-4c8c-b24e-93144910a84b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=qbCuXIzRobjCoAhGlqRdHh0Oc0rO/raMChduvBzMAbo=;
	b=TbqXuom1Pnloh8iDHbnR2fRYKrEceYNgNbQXPmB3Q8y7DHy8z0OmXAKZS/0xN5ax
	0Vd9qjvCi6ljZlFAtplNsHN3n61SU4+HX66Y360vHSdaN78lL4/uGla+L5+u9IVycIa
	Iuw3T/PI+31bLOIu5zTqACgWLYHJxrd+G+Tas+bw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=qbCuXIzRobjCoAhGlqRdHh0Oc0rO/raMChduvBzMAbo=;
	b=ZsfPbVldiQx7ne7e+dDXpg7fgV2U/AOwm5cVEo0TuHu+C5fs5x3hWrUuA6fRZAGd
	ScQtWuhSxolc32WtulkdBQe0eFW31YBWoDMhjhYHRsKHi0BBMOLgTMeUOH1h1TpgpTq
	tznPF0bZ/mB4NzPYgEqrKHIy+n7h33IoAF89UX7A=
Content-Type: multipart/mixed; boundary="===============0962416928247778039=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.25 SUCCEEDED
Message-ID: <0101018ee58a65bc-b389dfab-b256-4c8c-b24e-93144910a84b-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198254

--===============0962416928247778039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.24-9.18.25.patch
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
From 7e0c826e4ed793d2c73c4da6b1b62b7b5646d691 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 17:23:48 +0000
Subject: [PATCH] bind: upgrade 9.18.24 -> 9.18.25

---
 ...1-avoid-start-failure-with-bind-user.patch |   7 +-
 ...d-V-and-start-log-hide-build-options.patch |   5 +-
 ...ching-for-json-headers-searches-sysr.patch |   5 +-
 .../recipes-connectivity/bind/bind/conf.patch | 137 ++++++++++++------
 ...t.d-add-support-for-read-only-rootfs.patch |  12 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  19 ++-
 .../bind/{bind_9.18.24.bb => bind_9.18.25.bb} |   2 +-
 7 files changed, 116 insertions(+), 71 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.25.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index ec1bc7b567..26a582a539 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From 44699f91ab6ca6ef9a310c4af5b6343e18942416 Mon Sep 17 00:00:00 2001
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
index 4c10f33f04..b1cd04d5f6 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From 97f6d106d251d7c3ef5b320a9b6569e0d6aa33a5 Mon Sep 17 00:00:00 2001
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
+index df89cb2..f85536b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d07cae39..532722a3ce 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
+From cfd632c24ae08e5ad207f87e4b5f03b1b4fe24e2 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -27,13 +27,12 @@ to make use of the combination some day.
 
 Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2ab8ddd..92fe983 100644
+index 6d108a2..df89cb2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index aa3642acec..c9f7394e88 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,43 @@
+From 34d6184fbe43e709331d04fe1a8df42537f63d22 Mon Sep 17 00:00:00 2001
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
index 11db95ede1..368e911138 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,17 @@
-Subject: init.d: add support for read-only rootfs
+From ac601a6c06e4db7bbe4c92da2fefa7c7f37ebd73 Mon Sep 17 00:00:00 2001
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
index 146f3e35db..7d46a2ee2b 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From aa940c7b278b0eb2c35a5fe0dd8004a5cb9d0e64 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-connectivity/bind/bind_9.18.24.bb b/meta/recipes-connectivity/bind/bind_9.18.25.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.24.bb
rename to meta/recipes-connectivity/bind/bind_9.18.25.bb
index 2874990320..cc35604aba 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.25.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
+SRC_URI[sha256sum] = "5a4a70432a33d009f0e6e9dbb328aae7a5e27507e98e28bf3c0c6b250ccb2ab3"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.42.0


--===============0962416928247778039==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.24-9.18.25.patch"

RnJvbSA3ZTBjODI2ZTRlZDc5M2QyYzczYzRkYTZiMWI2MmI3YjU2NDZkNjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTc6MjM6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMTguMjQgLT4gOS4xOC4yNQoKLS0tCiAuLi4xLWF2b2lkLXN0YXJ0LWZh
aWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggfCAgIDcgKy0KIC4uLmQtVi1hbmQtc3RhcnQtbG9n
LWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8ICAgNSArLQogLi4uY2hpbmctZm9yLWpzb24taGVh
ZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIHwgICA1ICstCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kL2NvbmYucGF0Y2ggfCAxMzcgKysrKysrKysrKysrLS0tLS0tCiAuLi50LmQt
YWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggfCAgMTIgKy0KIC4uLi9iaW5k
L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICB8ICAxOSArKy0KIC4uLi9iaW5k
L3tiaW5kXzkuMTguMjQuYmIgPT4gYmluZF85LjE4LjI1LmJifSB8ICAgMiArLQogNyBmaWxlcyBj
aGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzkuMTguMjQuYmIgPT4gYmluZF85LjE4LjI1
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13
aXRoLWJpbmQtdXNlci5wYXRjaAppbmRleCBlYzFiYzdiNTY3Li4yNmE1ODJhNTM5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0
LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMWRkZTM1NjJmMjg3NDI5ZWVhOTRiNzcyNTBkMTg0
ODE4YjQ5MDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NDY5OWY5MWFiNmNhNmVm
OWEzMTBjNGFmNWI2MzQzZTE4OTQyNDE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Q2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAxNSBPY3QgMjAxOCAx
Njo1NTowOSArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBzdGFydCBmYWlsdXJlIHdpdGgg
YmluZCB1c2VyCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNo
ZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlm
ZiAtLWdpdCBhL2luaXQuZCBiL2luaXQuZAotaW5kZXggYjJlZWM2MC4uNmUwMzkzNiAxMDA2NDQK
K2luZGV4IDk1ZTg5MDkuLjc3MWQzNDkgMTAwNjQ0CiAtLS0gYS9pbml0LmQKICsrKyBiL2luaXQu
ZAogQEAgLTU3LDYgKzU3LDcgQEAgY2FzZSAiJDEiIGluCkBAIC0yMiw2ICsyMiwzIEBAIGluZGV4
IGIyZWVjNjAuLjZlMDM5MzYgMTAwNjQ0CiAgCSAgICBjaG1vZCAwNjQwIC9ldGMvYmluZC9ybmRj
LmtleQogIAlmaQogIAlpZiBbIC1mIC92YXIvcnVuL25hbWVkL25hbWVkLnBpZCBdOyB0aGVuCi0t
LSAKLTIuNy40Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3
cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCmluZGV4IDRjMTBm
MzNmMDQuLmIxY2QwNGQ1ZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9w
dGlvbnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAw
MS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNGU4MzM5MmU4NDBmYTdiMDVlNzc4NzEwYjhjMjAyZDEwMjQ3
N2ExMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTdmNmQxMDZkMjUxZDdjM2VmNWIz
MjBhOWI2NTY5ZTBkNmFhMzNhNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4
dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMjcgQXVnIDIwMTgg
MjE6MjQ6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYG5hbWVkL2x3cmVzZCAtVicgYW5kIHN0
YXJ0IGxvZyBoaWRlIGJ1aWxkIG9wdGlvbnMKQEAgLTE1LDEzICsxNSwxMiBAQCBTaWduZWQtb2Zm
LWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAKIFJlZnJlc2hlZCBm
b3IgOS4xNi4wCiBTaWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXJAbXZpc3RhLmNv
bT4KLQogLS0tCiAgY29uZmlndXJlLmFjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29u
ZmlndXJlLmFjCi1pbmRleCBiZjIwNjkwLi5jNWQzMzBmIDEwMDY0NAoraW5kZXggZGY4OWNiMi4u
Zjg1NTM2YiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBA
QCAtMzUsNyArMzUsNyBAQCBBQ19ERUZJTkUoW1BBQ0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVti
aW5kX1ZFUlNJT05fRVhUUkFdWyJdLCBbQklORCA5IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZv
ci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNl
YXJjaGVzLXN5c3IucGF0Y2gKaW5kZXggMzhkMDdjYWUzOS4uNTMyNzIyYTNjZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNo
aW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24t
aGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1YWUzMDMy
OWYxNjhjMWU4ZDJlMGMzODMxOTg4YTRmM2U5MDk2ZTM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBjZmQ2MzJjMjRhZTA4ZTVhZDIwN2Y4N2U0YjVmMDNiMWI0ZmUyNGUyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdp
bmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDkgSnVuIDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gYmluZDogZW5zdXJlIHNlYXJjaGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJj
aGVzIHN5c3Jvb3QKQEAgLTI3LDEzICsyNywxMiBAQCB0byBtYWtlIHVzZSBvZiB0aGUgY29tYmlu
YXRpb24gc29tZSBkYXkuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0UgU3Bl
Y2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2lu
ZHJpdmVyLmNvbT4KLQogLS0tCiAgY29uZmlndXJlLmFjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJl
LmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAyYWI4ZGRkLi45MmZlOTgzIDEwMDY0NAoraW5kZXgg
NmQxMDhhMi4uZGY4OWNiMiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmln
dXJlLmFjCiBAQCAtNzYxLDcgKzc2MSw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJdLApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKaW5kZXggYWEzNjQy
YWNlYy4uYzlmNzM5NGU4OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9jb25mLnBhdGNoCkBAIC0xLDEyICsxLDQzIEBACitGcm9tIDM0ZDYxODRmYmU0M2U3MDkz
MzFkMDRmZTFhOGRmNDI1MzdmNjNkMjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBR
aW5nIEhlIDxxaW5nLmhlQGludGVsLmNvbT4KK0RhdGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6
NDIgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gYmluZDogYWRkIG5ldyByZWNpcGUKKwogVXBzdHJl
YW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogCiB0aGUgcGF0Y2ggaXMg
aW1wb3J0ZWQgZnJvbSBvcGVuZW1iZWRkZWQgcHJvamVjdAogCiAxMS8zMC8yMDEwIC0gUWluZyBI
ZSA8cWluZy5oZUBpbnRlbC5jb20+CistLS0KKyBjb25mL2RiLjAgICAgICAgICAgICAgICB8IDEy
ICsrKysrKysKKyBjb25mL2RiLjEyNyAgICAgICAgICAgICB8IDEzICsrKysrKysrCisgY29uZi9k
Yi4yNTUgICAgICAgICAgICAgfCAxMiArKysrKysrCisgY29uZi9kYi5lbXB0eSAgICAgICAgICAg
fCAxNCArKysrKysrKysKKyBjb25mL2RiLmxvY2FsICAgICAgICAgICB8IDEzICsrKysrKysrCisg
Y29uZi9kYi5yb290ICAgICAgICAgICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKwor
IGNvbmYvbmFtZWQuY29uZiAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKKyBjb25mL25hbWVkLmNvbmYubG9jYWwgICB8ICA4ICsrKysrCisgY29uZi9uYW1lZC5jb25m
Lm9wdGlvbnMgfCAyNCArKysrKysrKysrKysrKworIGNvbmYvem9uZXMucmZjMTkxOCAgICAgIHwg
MjAgKysrKysrKysrKysrCisgaW5pdC5kICAgICAgICAgICAgICAgICAgfCA3MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKworIDExIGZpbGVzIGNoYW5nZWQsIDI4MCBp
bnNlcnRpb25zKCspCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuMAorIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBjb25mL2RiLjEyNworIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLjI1NQorIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLmVtcHR5CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYv
ZGIubG9jYWwKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi5yb290CisgY3JlYXRlIG1vZGUg
MTAwNjQ0IGNvbmYvbmFtZWQuY29uZgorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL25hbWVkLmNv
bmYubG9jYWwKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9uYW1lZC5jb25mLm9wdGlvbnMKKyBj
cmVhdGUgbW9kZSAxMDA2NDQgY29uZi96b25lcy5yZmMxOTE4CisgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluaXQuZAogCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMCBiaW5kLTkuMy4x
L2NvbmYvZGIuMAotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjAJMTk3MC0wMS0wMSAwMTow
MDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIuMAkyMDA1LTA3LTEw
IDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvZGIuMCBiL2NvbmYv
ZGIuMAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLmUzYWFiZGIKKy0tLSAv
ZGV2L251bGwKKysrKyBiL2NvbmYvZGIuMAogQEAgLTAsMCArMSwxMiBAQAogKzsKICs7IEJJTkQg
cmV2ZXJzZSBkYXRhIGZpbGUgZm9yIGJyb2FkY2FzdCB6b25lCkBAIC0yMCw5ICs1MSwxMSBAQCBk
aWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMCBiaW5kLTkuMy4xL2NvbmYvZGIuMAog
KwkJCSA2MDQ4MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAogKzsKICtACUlOCU5TCWxvY2FsaG9z
dC4KLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4xMjcgYmluZC05LjMuMS9jb25m
L2RiLjEyNwotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjEyNwkxOTcwLTAxLTAxIDAxOjAw
OjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi4xMjcJMjAwNS0wNy0x
MCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL2RiLjEyNyBiL2Nv
bmYvZGIuMTI3CituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uY2QwNWJlZgor
LS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi4xMjcKIEBAIC0wLDAgKzEsMTMgQEAKICs7CiAr
OyBCSU5EIHJldmVyc2UgZGF0YSBmaWxlIGZvciBsb2NhbCBsb29wYmFjayBpbnRlcmZhY2UKQEAg
LTM3LDQzICs3MCw0OSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMTI3IGJp
bmQtOS4zLjEvY29uZi9kYi4xMjcKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCiArMS4wLjAJSU4J
UFRSCWxvY2FsaG9zdC4KLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5lbXB0eSBi
aW5kLTkuMy4xL2NvbmYvZGIuZW1wdHkKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5lbXB0
eQkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29u
Zi9kYi5lbXB0eQkyMDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAotQEAgLTAsMCAr
MSwxNCBAQAotKzsgQklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgZW1wdHkgcmZjMTkxOCB6b25l
CitkaWZmIC0tZ2l0IGEvY29uZi9kYi4yNTUgYi9jb25mL2RiLjI1NQorbmV3IGZpbGUgbW9kZSAx
MDA2NDQKK2luZGV4IDAwMDAwMDAuLjE2Y2Q4MTkKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYv
ZGIuMjU1CitAQCAtMCwwICsxLDEyIEBACiArOwotKzsgRE8gTk9UIEVESVQgVEhJUyBGSUxFIC0g
aXQgaXMgdXNlZCBmb3IgbXVsdGlwbGUgem9uZXMuCi0rOyBJbnN0ZWFkLCBjb3B5IGl0LCBlZGl0
IG5hbWVkLmNvbmYsIGFuZCB1c2UgdGhhdCBjb3B5LgorKzsgQklORCByZXNlcnZlIGRhdGEgZmls
ZSBmb3IgYnJvYWRjYXN0IHpvbmUKICs7Ci0rJFRUTAk4NjQwMAorKyRUVEwJNjA0ODAwCiArQAlJ
TglTT0EJbG9jYWxob3N0LiByb290LmxvY2FsaG9zdC4gKAogKwkJCSAgICAgIDEJCTsgU2VyaWFs
CiArCQkJIDYwNDgwMAkJOyBSZWZyZXNoCiArCQkJICA4NjQwMAkJOyBSZXRyeQogKwkJCTI0MTky
MDAJCTsgRXhwaXJlCi0rCQkJICA4NjQwMCApCTsgTmVnYXRpdmUgQ2FjaGUgVFRMCisrCQkJIDYw
NDgwMCApCTsgTmVnYXRpdmUgQ2FjaGUgVFRMCiArOwogK0AJSU4JTlMJbG9jYWxob3N0LgotZGlm
ZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjI1NSBiaW5kLTkuMy4xL2NvbmYvZGIuMjU1
Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMjU1CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAw
MDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL2RiLjI1NQkyMDA1LTA3LTEwIDIyOjE0
OjAwLjAwMDAwMDAwMCArMDIwMAotQEAgLTAsMCArMSwxMiBAQAorZGlmZiAtLWdpdCBhL2NvbmYv
ZGIuZW1wdHkgYi9jb25mL2RiLmVtcHR5CituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAw
MDAwMC4uOGExMjg1OAorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi5lbXB0eQorQEAgLTAs
MCArMSwxNCBAQAorKzsgQklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgZW1wdHkgcmZjMTkxOCB6
b25lCiArOwotKzsgQklORCByZXNlcnZlIGRhdGEgZmlsZSBmb3IgYnJvYWRjYXN0IHpvbmUKKys7
IERPIE5PVCBFRElUIFRISVMgRklMRSAtIGl0IGlzIHVzZWQgZm9yIG11bHRpcGxlIHpvbmVzLgor
KzsgSW5zdGVhZCwgY29weSBpdCwgZWRpdCBuYW1lZC5jb25mLCBhbmQgdXNlIHRoYXQgY29weS4K
ICs7Ci0rJFRUTAk2MDQ4MDAKKyskVFRMCTg2NDAwCiArQAlJTglTT0EJbG9jYWxob3N0LiByb290
LmxvY2FsaG9zdC4gKAogKwkJCSAgICAgIDEJCTsgU2VyaWFsCiArCQkJIDYwNDgwMAkJOyBSZWZy
ZXNoCiArCQkJICA4NjQwMAkJOyBSZXRyeQogKwkJCTI0MTkyMDAJCTsgRXhwaXJlCi0rCQkJIDYw
NDgwMCApCTsgTmVnYXRpdmUgQ2FjaGUgVFRMCisrCQkJICA4NjQwMCApCTsgTmVnYXRpdmUgQ2Fj
aGUgVFRMCiArOwogK0AJSU4JTlMJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3Jp
Zy9jb25mL2RiLmxvY2FsIGJpbmQtOS4zLjEvY29uZi9kYi5sb2NhbAotLS0tIGJpbmQtOS4zLjEu
b3JpZy9jb25mL2RiLmxvY2FsCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0r
KysgYmluZC05LjMuMS9jb25mL2RiLmxvY2FsCTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAw
ICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9kYi5sb2NhbCBiL2NvbmYvZGIubG9jYWwKK25ldyBm
aWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi42NmI0ODkyCistLS0gL2Rldi9udWxsCisr
KysgYi9jb25mL2RiLmxvY2FsCiBAQCAtMCwwICsxLDEzIEBACiArOwogKzsgQklORCBkYXRhIGZp
bGUgZm9yIGxvY2FsIGxvb3BiYWNrIGludGVyZmFjZQpAQCAtODgsOSArMTI3LDExIEBAIGRpZmYg
LXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvZGIubG9j
YWwKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCiArQAlJTglBCTEyNy4wLjAuMQotZGlmZiAtdXJO
IGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLnJvb3QgYmluZC05LjMuMS9jb25mL2RiLnJvb3QKLS0t
LSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5yb290CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAw
MDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL2RiLnJvb3QJMjAwNS0wNy0xMCAyMjoxNDow
MC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL2RiLnJvb3QgYi9jb25mL2RiLnJv
b3QKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4wMWMyMGYwCistLS0gL2Rl
di9udWxsCisrKysgYi9jb25mL2RiLnJvb3QKIEBAIC0wLDAgKzEsNDUgQEAKICsKICs7IDw8Pj4g
RGlHIDkuMi4zIDw8Pj4gbnMgLiBAYS5yb290LXNlcnZlcnMubmV0LgpAQCAtMTM3LDkgKzE3OCwx
MSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIucm9vdCBiaW5kLTkuMy4xL2Nv
bmYvZGIucm9vdAogKzs7IFdIRU46IFN1biBGZWIgIDEgMTE6Mjc6MTQgMjAwNAogKzs7IE1TRyBT
SVpFICByY3ZkOiA0MzYKICsKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5j
b25mIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYv
bmFtZWQuY29uZgkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQt
OS4zLjEvY29uZi9uYW1lZC5jb25mCTIwMDUtMDctMTAgMjI6MzM6NDYuMDAwMDAwMDAwICswMjAw
CitkaWZmIC0tZ2l0IGEvY29uZi9uYW1lZC5jb25mIGIvY29uZi9uYW1lZC5jb25mCituZXcgZmls
ZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uOTU4MjljZgorLS0tIC9kZXYvbnVsbAorKysr
IGIvY29uZi9uYW1lZC5jb25mCiBAQCAtMCwwICsxLDQ5IEBACiArLy8gVGhpcyBpcyB0aGUgcHJp
bWFyeSBjb25maWd1cmF0aW9uIGZpbGUgZm9yIHRoZSBCSU5EIEROUyBzZXJ2ZXIgbmFtZWQuCiAr
Ly8KQEAgLTE5MCw5ICsyMzMsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25h
bWVkLmNvbmYgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYKICsvLyByb290LWRlbGVnYXRpb24t
b25seSBleGNsdWRlIHsgIkRFIjsgIk1VU0VVTSI7IH07CiArCiAraW5jbHVkZSAiL2V0Yy9iaW5k
L25hbWVkLmNvbmYubG9jYWwiOwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVk
LmNvbmYubG9jYWwgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYubG9jYWwKLS0tLSBiaW5kLTku
My4xLm9yaWcvY29uZi9uYW1lZC5jb25mLmxvY2FsCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAw
MDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYubG9jYWwJMjAwNS0wNy0x
MCAyMjoxNDowNi4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYu
bG9jYWwgYi9jb25mL25hbWVkLmNvbmYubG9jYWwKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRl
eCAwMDAwMDAwLi43YTU3YjEwCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL25hbWVkLmNvbmYu
bG9jYWwKIEBAIC0wLDAgKzEsOCBAQAogKy8vCiArLy8gRG8gYW55IGxvY2FsIGNvbmZpZ3VyYXRp
b24gaGVyZQpAQCAtMjAyLDkgKzI0NywxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2Nv
bmYvbmFtZWQuY29uZi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5sb2NhbAogKy8v
IG9yZ2FuaXphdGlvbgogKy8vaW5jbHVkZSAiL2V0Yy9iaW5kL3pvbmVzLnJmYzE5MTgiOwogKwot
ZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYub3B0aW9ucyBiaW5kLTku
My4xL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFt
ZWQuY29uZi5vcHRpb25zCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysg
YmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYub3B0aW9ucwkyMDA1LTA3LTEwIDIyOjE0OjA2LjAw
MDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zIGIvY29u
Zi9uYW1lZC5jb25mLm9wdGlvbnMKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAw
Li44MTMxOTNkCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL25hbWVkLmNvbmYub3B0aW9ucwog
QEAgLTAsMCArMSwyNCBAQAogK29wdGlvbnMgewogKwlkaXJlY3RvcnkgIi92YXIvY2FjaGUvYmlu
ZCI7CkBAIC0yMzAsOSArMjc3LDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9u
YW1lZC5jb25mLm9wdGlvbnMgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYub3B0CiArCiArfTsK
ICsKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi96b25lcy5yZmMxOTE4IGJpbmQtOS4z
LjEvY29uZi96b25lcy5yZmMxOTE4Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvem9uZXMucmZj
MTkxOAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEv
Y29uZi96b25lcy5yZmMxOTE4CTIwMDUtMDctMTAgMjI6MTQ6MTAuMDAwMDAwMDAwICswMjAwCitk
aWZmIC0tZ2l0IGEvY29uZi96b25lcy5yZmMxOTE4IGIvY29uZi96b25lcy5yZmMxOTE4CituZXcg
ZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uMDNiNTU0NgorLS0tIC9kZXYvbnVsbAor
KysrIGIvY29uZi96b25lcy5yZmMxOTE4CiBAQCAtMCwwICsxLDIwIEBACiArem9uZSAiMTAuaW4t
YWRkci5hcnBhIiAgICAgIHsgdHlwZSBtYXN0ZXI7IGZpbGUgIi9ldGMvYmluZC9kYi5lbXB0eSI7
IH07CiArIApAQCAtMjU0LDkgKzMwMywxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2Nv
bmYvem9uZXMucmZjMTkxOCBiaW5kLTkuMy4xL2NvbmYvem9uZXMucmZjMTkxOAogK3pvbmUgIjMx
LjE3Mi5pbi1hZGRyLmFycGEiICB7IHR5cGUgbWFzdGVyOyBmaWxlICIvZXRjL2JpbmQvZGIuZW1w
dHkiOyB9OwogKwogK3pvbmUgIjE2OC4xOTIuaW4tYWRkci5hcnBhIiB7IHR5cGUgbWFzdGVyOyBm
aWxlICIvZXRjL2JpbmQvZGIuZW1wdHkiOyB9OwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9p
bml0LmQgYmluZC05LjMuMS9pbml0LmQKLS0tLSBiaW5kLTkuMy4xLm9yaWcvaW5pdC5kCTE5NzAt
MDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9pbml0LmQJMjAw
NS0wNy0xMCAyMzowOTo1OC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9pbml0LmQgYi9p
bml0LmQKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4yZWYyMjc3CistLS0g
L2Rldi9udWxsCisrKysgYi9pbml0LmQKIEBAIC0wLDAgKzEsNzAgQEAKICsjIS9iaW4vc2gKICsK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rm
cy5wYXRjaAppbmRleCAxMWRiOTVlZGUxLi4zNjhlOTExMTM4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQt
b25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCkBAIC0xLDE0
ICsxLDE3IEBACi1TdWJqZWN0OiBpbml0LmQ6IGFkZCBzdXBwb3J0IGZvciByZWFkLW9ubHkgcm9v
dGZzCitGcm9tIGFjNjAxYTZjMDZlNGRiN2JiZTRjOTJkYTJmZWZhN2M3ZjM3ZWJkNzMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+
CitEYXRlOiBUaHUsIDI3IE1hciAyMDE0IDAyOjM0OjQxICswMDAwCitTdWJqZWN0OiBbUEFUQ0hd
IGluaXQuZDogYWRkIHN1cHBvcnQgZm9yIHJlYWQtb25seSByb290ZnMKIAogVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtvZSBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogQ2hlbiBR
aSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogLS0tCi0gaW5pdC5kIHwgICA0MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCisgaW5pdC5kIHwgNDAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRp
b25zKCspCiAKIGRpZmYgLS1naXQgYS9pbml0LmQgYi9pbml0LmQKLWluZGV4IDAxMTFlZDQuLjI0
Njc3YzggMTAwNjQ0CitpbmRleCAyZWYyMjc3Li45NWU4OTA5IDEwMDY0NAogLS0tIGEvaW5pdC5k
CiArKysgYi9pbml0LmQKIEBAIC02LDggKzYsNDggQEAgUEFUSD0vc2JpbjovYmluOi91c3Ivc2Jp
bjovdXNyL2JpbgpAQCAtNjAsNiArNjMsMyBAQCBpbmRleCAwMTExZWQ0Li4yNDY3N2M4IDEwMDY0
NAogIHRlc3QgLXggL3Vzci9zYmluL3JuZGMgfHwgZXhpdCAwCiAgCiAgY2FzZSAiJDEiIGluCi0t
LSAKLTEuNy45LjUKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRj
aAppbmRleCAxNDZmM2UzNWRiLi43ZDQ2YTJlZTJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0
ZC1iaW5kLXN0b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLWJpbmQ6IG1ha2UgIi9ldGMv
aW5pdC5kL2JpbmQgc3RvcCIgd29yaworRnJvbSBhYTk0MGM3YjI3OGIwZWIyYzM1YTVmZTBkZDgw
MDRhNWNiOWQwZTY0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUm95IExpIDxyb25n
cWluZy5saUB3aW5kcml2ZXIuY29tPgorRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCAr
MDAwMAorU3ViamVjdDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3Ai
IHdvcmsKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQog
CkBAIC03LDEzICsxMCwxMyBAQCB0aGUgbmFtZWQgZGFlbW9uLgogCiBTaWduZWQtb2ZmLWJ5OiBS
b3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiAtLS0KLSBjb25mL25hbWVkLmNvbmYg
fCAgICA1ICsrKysrCi0gY29uZi9ybmRjLmNvbmYgIHwgICAgNSArKysrKwotIDIgZmlsZXMgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKKyBjb25mL25hbWVkLmNvbmYg
fCA1ICsrKysrCisgY29uZi9ybmRjLmNvbmYgIHwgNSArKysrKworIDIgZmlsZXMgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQogIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL3JuZGMuY29uZgogCiBk
aWZmIC0tZ2l0IGEvY29uZi9uYW1lZC5jb25mIGIvY29uZi9uYW1lZC5jb25mCi1pbmRleCA5NTgy
OWNmLi5jODg5OWU3IDEwMDY0NAoraW5kZXggOTU4MjljZi4uMDIxZGJjYSAxMDA2NDQKIC0tLSBh
L2NvbmYvbmFtZWQuY29uZgogKysrIGIvY29uZi9uYW1lZC5jb25mCiBAQCAtNDcsMyArNDcsOCBA
QCB6b25lICIyNTUuaW4tYWRkci5hcnBhIiB7CkBAIC0yNyw3ICszMCw3IEBAIGluZGV4IDk1ODI5
Y2YuLmM4ODk5ZTcgMTAwNjQ0CiArfTsKIGRpZmYgLS1naXQgYS9jb25mL3JuZGMuY29uZiBiL2Nv
bmYvcm5kYy5jb25mCiBuZXcgZmlsZSBtb2RlIDEwMDY0NAotaW5kZXggMDAwMDAwMC4uYTBiNDgx
ZAoraW5kZXggMDAwMDAwMC4uNGI0M2EzZAogLS0tIC9kZXYvbnVsbAogKysrIGIvY29uZi9ybmRj
LmNvbmYKIEBAIC0wLDAgKzEsNSBAQApAQCAtMzYsNyArMzksMyBAQCBpbmRleCAwMDAwMDAwLi5h
MGI0ODFkCiArCWRlZmF1bHQtc2VydmVyICBsb2NhbGhvc3Q7CiArCWRlZmF1bHQta2V5ICAgICBy
bmRjLWtleTsKICt9OwotCi0tLSAKLTEuNy41LjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4yNC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kXzkuMTguMjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4yNC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4yNS5iYgppbmRleCAy
ODc0OTkwMzIwLi5jYzM1NjA0YWJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZF85LjE4LjI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kXzkuMTguMjUuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRwczov
L2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRj
aCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcwOWQ3MzAyM2M5MTE1
ZGRhZDNiYWI2NWI2YzhjNzlhNTkwMTk2ZDBkMTE0ZjVkMGNhMjUzM2RiZDUyZGRmNjYiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNWE0YTcwNDMyYTMzZDAwOWYwZTZlOWRiYjMyOGFhZTdhNWUyNzUw
N2U5OGUyOGJmM2MwYzZiMjUwY2NiMmFiMyIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBz
Oi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2
aXNpYmxlIGJ5IDIKLS0gCjIuNDIuMAoK

--===============0962416928247778039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.18.24.so /usr/lib/libirs-9.18.24.so /usr/lib/libisc-9.18.24.so /usr/lib/libns-9.18.24.so /usr/lib/libisccfg-9.18.24.so /usr/lib/libbind9-9.18.24.so /usr/lib/libisccc-9.18.24.so", added "/usr/lib/libisccfg-9.18.25.so /usr/lib/libdns-9.18.25.so /usr/lib/libirs-9.18.25.so /usr/lib/libisc-9.18.25.so /usr/lib/libns-9.18.25.so /usr/lib/libisccc-9.18.25.so /usr/lib/libbind9-9.18.25.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.24.so to libbind9-9.18.25.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.24.so to libdns-9.18.25.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.24.so to libirs-9.18.25.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.24.so to libisccc-9.18.25.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.24.so to libisccfg-9.18.25.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.24.so to libisc-9.18.25.so
  /usr/lib/libns.so changed symlink target from libns-9.18.24.so to libns-9.18.25.so
  /usr/lib/libbind9-9.18.24.so moved to /usr/lib/libbind9-9.18.25.so
  /usr/lib/libdns-9.18.24.so moved to /usr/lib/libdns-9.18.25.so
  /usr/lib/libirs-9.18.24.so moved to /usr/lib/libirs-9.18.25.so
  /usr/lib/libisc-9.18.24.so moved to /usr/lib/libisc-9.18.25.so
  /usr/lib/libisccc-9.18.24.so moved to /usr/lib/libisccc-9.18.25.so
  /usr/lib/libisccfg-9.18.24.so moved to /usr/lib/libisccfg-9.18.25.so
  /usr/lib/libns-9.18.24.so moved to /usr/lib/libns-9.18.25.so

--===============0962416928247778039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 13349648 to 13349792 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccfg-9.18.24.so /usr/lib/.debug/libbind9-9.18.24.so /usr/lib/.debug/libdns-9.18.24.so /usr/lib/.debug/libirs-9.18.24.so /usr/lib/.debug/libisc-9.18.24.so /usr/lib/.debug/libns-9.18.24.so /usr/lib/.debug/libisccc-9.18.24.so", added "/usr/lib/.debug/libbind9-9.18.25.so /usr/lib/.debug/libdns-9.18.25.so /usr/lib/.debug/libirs-9.18.25.so /usr/lib/.debug/libisc-9.18.25.so /usr/lib/.debug/libisccfg-9.18.25.so /usr/lib/.debug/libisccc-9.18.25.so /usr/lib/.debug/libns-9.18.25.so"
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1457787 to 1457644 (-0%)
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.24.so", added "/usr/lib/*-9.18.25.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libbind9-9.18.24.so /usr/lib/libisccfg-9.18.24.so /usr/lib/libdns-9.18.24.so /usr/lib/libirs-9.18.24.so /usr/lib/libisc-9.18.24.so /usr/lib/libisccc-9.18.24.so /usr/lib/libns-9.18.24.so", added "/usr/lib/libdns-9.18.25.so /usr/lib/libirs-9.18.25.so /usr/lib/libisc-9.18.25.so /usr/lib/libisccfg-9.18.25.so /usr/lib/libbind9-9.18.25.so /usr/lib/libns-9.18.25.so /usr/lib/libisccc-9.18.25.so"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9630613 to 9632264 (+0%)
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.24/bind-9.18.24.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.25/bind-9.18.25.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-64-poky-linux/bind: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.18.24" to "9.18.25"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.24.so to libbind9-9.18.25.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.24.so to libdns-9.18.25.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.24.so to libirs-9.18.25.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.24.so to libisccc-9.18.25.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.24.so to libisccfg-9.18.25.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.24.so to libisc-9.18.25.so
  /usr/lib/libns.so changed symlink target from libns-9.18.24.so to libns-9.18.25.so
  /usr/lib/libbind9-9.18.24.so moved to /usr/lib/libbind9-9.18.25.so
  /usr/lib/libdns-9.18.24.so moved to /usr/lib/libdns-9.18.25.so
  /usr/lib/libirs-9.18.24.so moved to /usr/lib/libirs-9.18.25.so
  /usr/lib/libisc-9.18.24.so moved to /usr/lib/libisc-9.18.25.so
  /usr/lib/libisccc-9.18.24.so moved to /usr/lib/libisccc-9.18.25.so
  /usr/lib/libisccfg-9.18.24.so moved to /usr/lib/libisccfg-9.18.25.so
  /usr/lib/libns-9.18.24.so moved to /usr/lib/libns-9.18.25.so

--===============0962416928247778039==--

