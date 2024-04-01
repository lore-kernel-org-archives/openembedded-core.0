Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE26CD1294
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1985.1711994600711238198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dyax0EF7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XQbvlpz2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e9ad4799e-0fd7f13e-16e9-4f2c-9c18-09d545a3e1e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cBDnUhGlnHEbIjiQapZVpArCKT6PXmVy70QoU5GNQMY=;
	b=Dyax0EF79r3lSyvnXwXM8uvjx+lTO0NG+x3IYF/8Na9K1L9UelrP6cXa68ArgC4V
	+Xec+5qRUbzVhDT0vUCUMXslzSBCfOaWTUTwFhP/A35f8FHG0nU2++EvakBDB/EMI+D
	9gBgpD6AO+2UP4KFZaIWxFN6CTJHVLXOkV0Qf5A4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cBDnUhGlnHEbIjiQapZVpArCKT6PXmVy70QoU5GNQMY=;
	b=XQbvlpz2iqUGAgqJfiLM3HSbE8qu+8Q2isJP5Z9BXQcWehHvyue2LABGm3meUt8w
	JQ1DWCNPyEJrzDVZhewlhoPINmXwQlPi2KYzuxB5D0VtDBQBBqiaDuxEGvoA5wPQ1l5
	XlvqwZ5sfSSW3FbTWvfz4gSetEvpNZ0D5Exm/4+0=
Content-Type: multipart/mixed; boundary="===============4540913740775935188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.25 SUCCEEDED
Message-ID: <0101018e9ad4799e-0fd7f13e-16e9-4f2c-9c18-09d545a3e1e3-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197692

--===============4540913740775935188==
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
From f2eb00871050615611d0f2b64eea941113952013 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 05:29:26 +0000
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
index ec1bc7b567..66b25a957b 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From 9ca0bb5251c04f527d9b179e80c15dc01df1b991 Mon Sep 17 00:00:00 2001
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
index 4c10f33f04..e1af3f9eef 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From c678edb54aa51f845a67c7999b95f1711ab6d261 Mon Sep 17 00:00:00 2001
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
index 38d07cae39..a489ce0fef 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
+From dbfc4020361e31e33c76ed21fa1cfdd7f0985480 Mon Sep 17 00:00:00 2001
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
index aa3642acec..cd432d62b3 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,43 @@
+From b1070634b4fc48986df5a3f045e355c16f227b39 Mon Sep 17 00:00:00 2001
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
index 11db95ede1..59154e84d0 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,17 @@
-Subject: init.d: add support for read-only rootfs
+From 6a1b71eef1d238d955896448472dac91592e6fc6 Mon Sep 17 00:00:00 2001
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
index 146f3e35db..62dceb8470 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From fcc72707e8782147401266a7b041cb8721a20d02 Mon Sep 17 00:00:00 2001
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


--===============4540913740775935188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.24-9.18.25.patch"

RnJvbSBmMmViMDA4NzEwNTA2MTU2MTFkMGYyYjY0ZWVhOTQxMTEzOTUyMDEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNToyOToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC4yNCAtPiA5LjE4LjI1CgotLS0KIC4uLjEtYXZvaWQtc3RhcnQtZmFp
bHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCB8ICAgNyArLQogLi4uZC1WLWFuZC1zdGFydC1sb2ct
aGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIHwgICA1ICstCiAuLi5jaGluZy1mb3ItanNvbi1oZWFk
ZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggfCAgIDUgKy0KIC4uLi9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvY29uZi5wYXRjaCB8IDEzNyArKysrKysrKysrKystLS0tLS0KIC4uLnQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCB8ICAxMiArLQogLi4uL2JpbmQv
bWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggIHwgIDE5ICsrLQogLi4uL2JpbmQv
e2JpbmRfOS4xOC4yNC5iYiA9PiBiaW5kXzkuMTguMjUuYmJ9IHwgICAyICstCiA3IGZpbGVzIGNo
YW5nZWQsIDExNiBpbnNlcnRpb25zKCspLCA3MSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRfOS4xOC4yNC5iYiA9PiBiaW5kXzkuMTguMjUu
YmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdp
dGgtYmluZC11c2VyLnBhdGNoCmluZGV4IGVjMWJjN2I1NjcuLjY2YjI1YTk1N2IgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQt
ZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMxZGRlMzU2MmYyODc0MjllZWE5NGI3NzI1MGQxODQ4
MThiNDkwNjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDljYTBiYjUyNTFjMDRmNTI3
ZDliMTc5ZTgwYzE1ZGMwMWRmMWI5OTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBD
aGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDE1IE9jdCAyMDE4IDE2
OjU1OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIHN0YXJ0IGZhaWx1cmUgd2l0aCBi
aW5kIHVzZXIKQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hl
bkB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZm
IC0tZ2l0IGEvaW5pdC5kIGIvaW5pdC5kCi1pbmRleCBiMmVlYzYwLi42ZTAzOTM2IDEwMDY0NAor
aW5kZXggOTVlODkwOS4uNzcxZDM0OSAxMDA2NDQKIC0tLSBhL2luaXQuZAogKysrIGIvaW5pdC5k
CiBAQCAtNTcsNiArNTcsNyBAQCBjYXNlICIkMSIgaW4KQEAgLTIyLDYgKzIyLDMgQEAgaW5kZXgg
YjJlZWM2MC4uNmUwMzkzNiAxMDA2NDQKICAJICAgIGNobW9kIDA2NDAgL2V0Yy9iaW5kL3JuZGMu
a2V5CiAgCWZpCiAgCWlmIFsgLWYgL3Zhci9ydW4vbmFtZWQvbmFtZWQucGlkIF07IHRoZW4KLS0t
IAotMi43LjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdy
ZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKaW5kZXggNGMxMGYz
M2YwNC4uZTFhZjNmOWVlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0
aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA0ZTgzMzkyZTg0MGZhN2IwNWU3Nzg3MTBiOGMyMDJkMTAyNDc3
YTEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNjc4ZWRiNTRhYTUxZjg0NWE2N2M3
OTk5Yjk1ZjE3MTFhYjZkMjYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1
IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAyNyBBdWcgMjAxOCAy
MToyNDoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBgbmFtZWQvbHdyZXNkIC1WJyBhbmQgc3Rh
cnQgbG9nIGhpZGUgYnVpbGQgb3B0aW9ucwpAQCAtMTUsMTMgKzE1LDEyIEBAIFNpZ25lZC1vZmYt
Ynk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIAogUmVmcmVzaGVkIGZv
ciA5LjE2LjAKIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEuY29t
PgotCiAtLS0KICBjb25maWd1cmUuYWMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMKLWluZGV4IGJmMjA2OTAuLmM1ZDMzMGYgMTAwNjQ0CitpbmRleCBkZjg5Y2IyLi5m
ODU1MzZiIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBA
IC0zNSw3ICszNSw3IEBAIEFDX0RFRklORShbUEFDS0FHRV9WRVJTSU9OX0VYVFJBXSwgWyJdW2Jp
bmRfVkVSU0lPTl9FWFRSQV1bIl0sIFtCSU5EIDkgRXh0cmEgcGFyCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9y
LWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2Vh
cmNoZXMtc3lzci5wYXRjaAppbmRleCAzOGQwN2NhZTM5Li5hNDg5Y2UwZmVmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hp
bmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1o
ZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhZTMwMzI5
ZjE2OGMxZThkMmUwYzM4MzE5ODhhNGYzZTkwOTZlMzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGRiZmM0MDIwMzYxZTMxZTMzYzc2ZWQyMWZhMWNmZGQ3ZjA5ODU0ODAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAxNSAxMToyMjowMCAtMDQwMAogU3ViamVj
dDogW1BBVENIXSBiaW5kOiBlbnN1cmUgc2VhcmNoaW5nIGZvciBqc29uIGhlYWRlcnMgc2VhcmNo
ZXMgc3lzcm9vdApAQCAtMjcsMTMgKzI3LDEyIEBAIHRvIG1ha2UgdXNlIG9mIHRoZSBjb21iaW5h
dGlvbiBzb21lIGRheS4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBTcGVj
aWZpY10KIFNpZ25lZC1vZmYtYnk6IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5k
cml2ZXIuY29tPgotCiAtLS0KICBjb25maWd1cmUuYWMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUu
YWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDJhYjhkZGQuLjkyZmU5ODMgMTAwNjQ0CitpbmRleCA2
ZDEwOGEyLi5kZjg5Y2IyIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1
cmUuYWMKIEBAIC03NjEsNyArNzYxLDcgQEAgQVNfQ0FTRShbJHdpdGhfbG1kYl0sCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAppbmRleCBhYTM2NDJh
Y2VjLi5jZDQzMmQ2MmIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kL2NvbmYucGF0Y2gKQEAgLTEsMTIgKzEsNDMgQEAKK0Zyb20gYjEwNzA2MzRiNGZjNDg5ODZk
ZjVhM2YwNDVlMzU1YzE2ZjIyN2IzOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFFp
bmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgorRGF0ZTogVHVlLCAzMCBOb3YgMjAxMCAxMzozNTo0
MiArMDgwMAorU3ViamVjdDogW1BBVENIXSBiaW5kOiBhZGQgbmV3IHJlY2lwZQorCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAKIHRoZSBwYXRjaCBpcyBp
bXBvcnRlZCBmcm9tIG9wZW5lbWJlZGRlZCBwcm9qZWN0CiAKIDExLzMwLzIwMTAgLSBRaW5nIEhl
IDxxaW5nLmhlQGludGVsLmNvbT4KKy0tLQorIGNvbmYvZGIuMCAgICAgICAgICAgICAgIHwgMTIg
KysrKysrKworIGNvbmYvZGIuMTI3ICAgICAgICAgICAgIHwgMTMgKysrKysrKysKKyBjb25mL2Ri
LjI1NSAgICAgICAgICAgICB8IDEyICsrKysrKysKKyBjb25mL2RiLmVtcHR5ICAgICAgICAgICB8
IDE0ICsrKysrKysrKworIGNvbmYvZGIubG9jYWwgICAgICAgICAgIHwgMTMgKysrKysrKysKKyBj
b25mL2RiLnJvb3QgICAgICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrCisg
Y29uZi9uYW1lZC5jb25mICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KworIGNvbmYvbmFtZWQuY29uZi5sb2NhbCAgIHwgIDggKysrKysKKyBjb25mL25hbWVkLmNvbmYu
b3B0aW9ucyB8IDI0ICsrKysrKysrKysrKysrCisgY29uZi96b25lcy5yZmMxOTE4ICAgICAgfCAy
MCArKysrKysrKysrKysKKyBpbml0LmQgICAgICAgICAgICAgICAgICB8IDcwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCisgMTEgZmlsZXMgY2hhbmdlZCwgMjgwIGlu
c2VydGlvbnMoKykKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi4wCisgY3JlYXRlIG1vZGUg
MTAwNjQ0IGNvbmYvZGIuMTI3CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuMjU1CisgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuZW1wdHkKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9k
Yi5sb2NhbAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLnJvb3QKKyBjcmVhdGUgbW9kZSAx
MDA2NDQgY29uZi9uYW1lZC5jb25mCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvbmFtZWQuY29u
Zi5sb2NhbAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL25hbWVkLmNvbmYub3B0aW9ucworIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBjb25mL3pvbmVzLnJmYzE5MTgKKyBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5pdC5kCiAKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4wIGJpbmQtOS4zLjEv
Y29uZi9kYi4wCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMAkxOTcwLTAxLTAxIDAxOjAw
OjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi4wCTIwMDUtMDctMTAg
MjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9kYi4wIGIvY29uZi9k
Yi4wCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uZTNhYWJkYgorLS0tIC9k
ZXYvbnVsbAorKysrIGIvY29uZi9kYi4wCiBAQCAtMCwwICsxLDEyIEBACiArOwogKzsgQklORCBy
ZXZlcnNlIGRhdGEgZmlsZSBmb3IgYnJvYWRjYXN0IHpvbmUKQEAgLTIwLDkgKzUxLDExIEBAIGRp
ZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4wIGJpbmQtOS4zLjEvY29uZi9kYi4wCiAr
CQkJIDYwNDgwMCApCTsgTmVnYXRpdmUgQ2FjaGUgVFRMCiArOwogK0AJSU4JTlMJbG9jYWxob3N0
LgotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjEyNyBiaW5kLTkuMy4xL2NvbmYv
ZGIuMTI3Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMTI3CTE5NzAtMDEtMDEgMDE6MDA6
MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL2RiLjEyNwkyMDA1LTA3LTEw
IDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvZGIuMTI3IGIvY29u
Zi9kYi4xMjcKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi5jZDA1YmVmCist
LS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLjEyNwogQEAgLTAsMCArMSwxMyBAQAogKzsKICs7
IEJJTkQgcmV2ZXJzZSBkYXRhIGZpbGUgZm9yIGxvY2FsIGxvb3BiYWNrIGludGVyZmFjZQpAQCAt
MzcsNDMgKzcwLDQ5IEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4xMjcgYmlu
ZC05LjMuMS9jb25mL2RiLjEyNwogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4KICsxLjAuMAlJTglQ
VFIJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLmVtcHR5IGJp
bmQtOS4zLjEvY29uZi9kYi5lbXB0eQotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLmVtcHR5
CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25m
L2RiLmVtcHR5CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCi1AQCAtMCwwICsx
LDE0IEBACi0rOyBCSU5EIHJldmVyc2UgZGF0YSBmaWxlIGZvciBlbXB0eSByZmMxOTE4IHpvbmUK
K2RpZmYgLS1naXQgYS9jb25mL2RiLjI1NSBiL2NvbmYvZGIuMjU1CituZXcgZmlsZSBtb2RlIDEw
MDY0NAoraW5kZXggMDAwMDAwMC4uMTZjZDgxOQorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9k
Yi4yNTUKK0BAIC0wLDAgKzEsMTIgQEAKICs7Ci0rOyBETyBOT1QgRURJVCBUSElTIEZJTEUgLSBp
dCBpcyB1c2VkIGZvciBtdWx0aXBsZSB6b25lcy4KLSs7IEluc3RlYWQsIGNvcHkgaXQsIGVkaXQg
bmFtZWQuY29uZiwgYW5kIHVzZSB0aGF0IGNvcHkuCisrOyBCSU5EIHJlc2VydmUgZGF0YSBmaWxl
IGZvciBicm9hZGNhc3Qgem9uZQogKzsKLSskVFRMCTg2NDAwCisrJFRUTAk2MDQ4MDAKICtACUlO
CVNPQQlsb2NhbGhvc3QuIHJvb3QubG9jYWxob3N0LiAoCiArCQkJICAgICAgMQkJOyBTZXJpYWwK
ICsJCQkgNjA0ODAwCQk7IFJlZnJlc2gKICsJCQkgIDg2NDAwCQk7IFJldHJ5CiArCQkJMjQxOTIw
MAkJOyBFeHBpcmUKLSsJCQkgIDg2NDAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKKysJCQkgNjA0
ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCi1kaWZm
IC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMjU1IGJpbmQtOS4zLjEvY29uZi9kYi4yNTUK
LS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4yNTUJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAw
MDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIuMjU1CTIwMDUtMDctMTAgMjI6MTQ6
MDAuMDAwMDAwMDAwICswMjAwCi1AQCAtMCwwICsxLDEyIEBACitkaWZmIC0tZ2l0IGEvY29uZi9k
Yi5lbXB0eSBiL2NvbmYvZGIuZW1wdHkKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAw
MDAwLi44YTEyODU4CistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLmVtcHR5CitAQCAtMCww
ICsxLDE0IEBACisrOyBCSU5EIHJldmVyc2UgZGF0YSBmaWxlIGZvciBlbXB0eSByZmMxOTE4IHpv
bmUKICs7Ci0rOyBCSU5EIHJlc2VydmUgZGF0YSBmaWxlIGZvciBicm9hZGNhc3Qgem9uZQorKzsg
RE8gTk9UIEVESVQgVEhJUyBGSUxFIC0gaXQgaXMgdXNlZCBmb3IgbXVsdGlwbGUgem9uZXMuCisr
OyBJbnN0ZWFkLCBjb3B5IGl0LCBlZGl0IG5hbWVkLmNvbmYsIGFuZCB1c2UgdGhhdCBjb3B5Lgog
KzsKLSskVFRMCTYwNDgwMAorKyRUVEwJODY0MDAKICtACUlOCVNPQQlsb2NhbGhvc3QuIHJvb3Qu
bG9jYWxob3N0LiAoCiArCQkJICAgICAgMQkJOyBTZXJpYWwKICsJCQkgNjA0ODAwCQk7IFJlZnJl
c2gKICsJCQkgIDg2NDAwCQk7IFJldHJ5CiArCQkJMjQxOTIwMAkJOyBFeHBpcmUKLSsJCQkgNjA0
ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKKysJCQkgIDg2NDAwICkJOyBOZWdhdGl2ZSBDYWNo
ZSBUVEwKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmln
L2NvbmYvZGIubG9jYWwgYmluZC05LjMuMS9jb25mL2RiLmxvY2FsCi0tLS0gYmluZC05LjMuMS5v
cmlnL2NvbmYvZGIubG9jYWwJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsr
KyBiaW5kLTkuMy4xL2NvbmYvZGIubG9jYWwJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAg
KzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL2RiLmxvY2FsIGIvY29uZi9kYi5sb2NhbAorbmV3IGZp
bGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjY2YjQ4OTIKKy0tLSAvZGV2L251bGwKKysr
KyBiL2NvbmYvZGIubG9jYWwKIEBAIC0wLDAgKzEsMTMgQEAKICs7CiArOyBCSU5EIGRhdGEgZmls
ZSBmb3IgbG9jYWwgbG9vcGJhY2sgaW50ZXJmYWNlCkBAIC04OCw5ICsxMjcsMTEgQEAgZGlmZiAt
dXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLmxvY2FsIGJpbmQtOS4zLjEvY29uZi9kYi5sb2Nh
bAogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4KICtACUlOCUEJMTI3LjAuMC4xCi1kaWZmIC11ck4g
YmluZC05LjMuMS5vcmlnL2NvbmYvZGIucm9vdCBiaW5kLTkuMy4xL2NvbmYvZGIucm9vdAotLS0t
IGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLnJvb3QJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAw
MDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIucm9vdAkyMDA1LTA3LTEwIDIyOjE0OjAw
LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvZGIucm9vdCBiL2NvbmYvZGIucm9v
dAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjAxYzIwZjAKKy0tLSAvZGV2
L251bGwKKysrKyBiL2NvbmYvZGIucm9vdAogQEAgLTAsMCArMSw0NSBAQAogKwogKzsgPDw+PiBE
aUcgOS4yLjMgPDw+PiBucyAuIEBhLnJvb3Qtc2VydmVycy5uZXQuCkBAIC0xMzcsOSArMTc4LDEx
IEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5yb290IGJpbmQtOS4zLjEvY29u
Zi9kYi5yb290CiArOzsgV0hFTjogU3VuIEZlYiAgMSAxMToyNzoxNCAyMDA0CiArOzsgTVNHIFNJ
WkUgIHJjdmQ6IDQzNgogKwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNv
bmYgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9u
YW1lZC5jb25mCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05
LjMuMS9jb25mL25hbWVkLmNvbmYJMjAwNS0wNy0xMCAyMjozMzo0Ni4wMDAwMDAwMDAgKzAyMDAK
K2RpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYgYi9jb25mL25hbWVkLmNvbmYKK25ldyBmaWxl
IG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi45NTgyOWNmCistLS0gL2Rldi9udWxsCisrKysg
Yi9jb25mL25hbWVkLmNvbmYKIEBAIC0wLDAgKzEsNDkgQEAKICsvLyBUaGlzIGlzIHRoZSBwcmlt
YXJ5IGNvbmZpZ3VyYXRpb24gZmlsZSBmb3IgdGhlIEJJTkQgRE5TIHNlcnZlciBuYW1lZC4KICsv
LwpAQCAtMTkwLDkgKzIzMywxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFt
ZWQuY29uZiBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZgogKy8vIHJvb3QtZGVsZWdhdGlvbi1v
bmx5IGV4Y2x1ZGUgeyAiREUiOyAiTVVTRVVNIjsgfTsKICsKICtpbmNsdWRlICIvZXRjL2JpbmQv
bmFtZWQuY29uZi5sb2NhbCI7Ci1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQu
Y29uZi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5sb2NhbAotLS0tIGJpbmQtOS4z
LjEub3JpZy9jb25mL25hbWVkLmNvbmYubG9jYWwJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAw
MDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5sb2NhbAkyMDA1LTA3LTEw
IDIyOjE0OjA2LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvbmFtZWQuY29uZi5s
b2NhbCBiL2NvbmYvbmFtZWQuY29uZi5sb2NhbAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4
IDAwMDAwMDAuLjdhNTdiMTAKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvbmFtZWQuY29uZi5s
b2NhbAogQEAgLTAsMCArMSw4IEBACiArLy8KICsvLyBEbyBhbnkgbG9jYWwgY29uZmlndXJhdGlv
biBoZXJlCkBAIC0yMDIsOSArMjQ3LDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29u
Zi9uYW1lZC5jb25mLmxvY2FsIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLmxvY2FsCiArLy8g
b3JnYW5pemF0aW9uCiArLy9pbmNsdWRlICIvZXRjL2JpbmQvem9uZXMucmZjMTkxOCI7CiArCi1k
aWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zIGJpbmQtOS4z
LjEvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1l
ZC5jb25mLm9wdGlvbnMJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBi
aW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zCTIwMDUtMDctMTAgMjI6MTQ6MDYuMDAw
MDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMgYi9jb25m
L25hbWVkLmNvbmYub3B0aW9ucworbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAu
LjgxMzE5M2QKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zCiBA
QCAtMCwwICsxLDI0IEBACiArb3B0aW9ucyB7CiArCWRpcmVjdG9yeSAiL3Zhci9jYWNoZS9iaW5k
IjsKQEAgLTIzMCw5ICsyNzcsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25h
bWVkLmNvbmYub3B0aW9ucyBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5vcHQKICsKICt9Owog
KwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL3pvbmVzLnJmYzE5MTggYmluZC05LjMu
MS9jb25mL3pvbmVzLnJmYzE5MTgKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi96b25lcy5yZmMx
OTE4CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9j
b25mL3pvbmVzLnJmYzE5MTgJMjAwNS0wNy0xMCAyMjoxNDoxMC4wMDAwMDAwMDAgKzAyMDAKK2Rp
ZmYgLS1naXQgYS9jb25mL3pvbmVzLnJmYzE5MTggYi9jb25mL3pvbmVzLnJmYzE5MTgKK25ldyBm
aWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4wM2I1NTQ2CistLS0gL2Rldi9udWxsCisr
KysgYi9jb25mL3pvbmVzLnJmYzE5MTgKIEBAIC0wLDAgKzEsMjAgQEAKICt6b25lICIxMC5pbi1h
ZGRyLmFycGEiICAgICAgeyB0eXBlIG1hc3RlcjsgZmlsZSAiL2V0Yy9iaW5kL2RiLmVtcHR5Ijsg
fTsKICsgCkBAIC0yNTQsOSArMzAzLDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29u
Zi96b25lcy5yZmMxOTE4IGJpbmQtOS4zLjEvY29uZi96b25lcy5yZmMxOTE4CiArem9uZSAiMzEu
MTcyLmluLWFkZHIuYXJwYSIgIHsgdHlwZSBtYXN0ZXI7IGZpbGUgIi9ldGMvYmluZC9kYi5lbXB0
eSI7IH07CiArCiArem9uZSAiMTY4LjE5Mi5pbi1hZGRyLmFycGEiIHsgdHlwZSBtYXN0ZXI7IGZp
bGUgIi9ldGMvYmluZC9kYi5lbXB0eSI7IH07Ci1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2lu
aXQuZCBiaW5kLTkuMy4xL2luaXQuZAotLS0tIGJpbmQtOS4zLjEub3JpZy9pbml0LmQJMTk3MC0w
MS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2luaXQuZAkyMDA1
LTA3LTEwIDIzOjA5OjU4LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2luaXQuZCBiL2lu
aXQuZAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjJlZjIyNzcKKy0tLSAv
ZGV2L251bGwKKysrKyBiL2luaXQuZAogQEAgLTAsMCArMSw3MCBAQAogKyMhL2Jpbi9zaAogKwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZz
LnBhdGNoCmluZGV4IDExZGI5NWVkZTEuLjU5MTU0ZTg0ZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1v
bmx5LXJvb3Rmcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKQEAgLTEsMTQg
KzEsMTcgQEAKLVN1YmplY3Q6IGluaXQuZDogYWRkIHN1cHBvcnQgZm9yIHJlYWQtb25seSByb290
ZnMKK0Zyb20gNmExYjcxZWVmMWQyMzhkOTU1ODk2NDQ4NDcyZGFjOTE1OTJlNmZjNiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4K
K0RhdGU6IFRodSwgMjcgTWFyIDIwMTQgMDI6MzQ6NDEgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0g
aW5pdC5kOiBhZGQgc3VwcG9ydCBmb3IgcmVhZC1vbmx5IHJvb3RmcwogCiBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFp
IDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAtLS0KLSBpbml0LmQgfCAgIDQwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKKyBpbml0LmQgfCA0MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlv
bnMoKykKIAogZGlmZiAtLWdpdCBhL2luaXQuZCBiL2luaXQuZAotaW5kZXggMDExMWVkNC4uMjQ2
NzdjOCAxMDA2NDQKK2luZGV4IDJlZjIyNzcuLjk1ZTg5MDkgMTAwNjQ0CiAtLS0gYS9pbml0LmQK
ICsrKyBiL2luaXQuZAogQEAgLTYsOCArNiw0OCBAQCBQQVRIPS9zYmluOi9iaW46L3Vzci9zYmlu
Oi91c3IvYmluCkBAIC02MCw2ICs2MywzIEBAIGluZGV4IDAxMTFlZDQuLjI0Njc3YzggMTAwNjQ0
CiAgdGVzdCAteCAvdXNyL3NiaW4vcm5kYyB8fCBleGl0IDAKICAKICBjYXNlICIkMSIgaW4KLS0t
IAotMS43LjkuNQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNo
CmluZGV4IDE0NmYzZTM1ZGIuLjYyZGNlYjg0NzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRk
LWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNyBAQAotYmluZDogbWFrZSAiL2V0Yy9p
bml0LmQvYmluZCBzdG9wIiB3b3JrCitGcm9tIGZjYzcyNzA3ZTg3ODIxNDc0MDEyNjZhN2IwNDFj
Yjg3MjFhMjBkMDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSb3kgTGkgPHJvbmdx
aW5nLmxpQHdpbmRyaXZlci5jb20+CitEYXRlOiBUaHUsIDE1IE5vdiAyMDEyIDAyOjI3OjU0ICsw
MDAwCitTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2JpbmQgc3RvcCIg
d29yawogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAK
QEAgLTcsMTMgKzEwLDEzIEBAIHRoZSBuYW1lZCBkYWVtb24uCiAKIFNpZ25lZC1vZmYtYnk6IFJv
eSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIC0tLQotIGNvbmYvbmFtZWQuY29uZiB8
ICAgIDUgKysrKysKLSBjb25mL3JuZGMuY29uZiAgfCAgICA1ICsrKysrCi0gMiBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQorIGNvbmYvbmFtZWQuY29uZiB8
IDUgKysrKysKKyBjb25mL3JuZGMuY29uZiAgfCA1ICsrKysrCisgMiBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvcm5kYy5jb25mCiAKIGRp
ZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYgYi9jb25mL25hbWVkLmNvbmYKLWluZGV4IDk1ODI5
Y2YuLmM4ODk5ZTcgMTAwNjQ0CitpbmRleCA5NTgyOWNmLi4wMjFkYmNhIDEwMDY0NAogLS0tIGEv
Y29uZi9uYW1lZC5jb25mCiArKysgYi9jb25mL25hbWVkLmNvbmYKIEBAIC00NywzICs0Nyw4IEBA
IHpvbmUgIjI1NS5pbi1hZGRyLmFycGEiIHsKQEAgLTI3LDcgKzMwLDcgQEAgaW5kZXggOTU4Mjlj
Zi4uYzg4OTllNyAxMDA2NDQKICt9OwogZGlmZiAtLWdpdCBhL2NvbmYvcm5kYy5jb25mIGIvY29u
Zi9ybmRjLmNvbmYKIG5ldyBmaWxlIG1vZGUgMTAwNjQ0Ci1pbmRleCAwMDAwMDAwLi5hMGI0ODFk
CitpbmRleCAwMDAwMDAwLi40YjQzYTNkCiAtLS0gL2Rldi9udWxsCiArKysgYi9jb25mL3JuZGMu
Y29uZgogQEAgLTAsMCArMSw1IEBACkBAIC0zNiw3ICszOSwzIEBAIGluZGV4IDAwMDAwMDAuLmEw
YjQ4MWQKICsJZGVmYXVsdC1zZXJ2ZXIgIGxvY2FsaG9zdDsKICsJZGVmYXVsdC1rZXkgICAgIHJu
ZGMta2V5OwogK307Ci0KLS0tIAotMS43LjUuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjI0LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmRfOS4xOC4yNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjI0LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjI1LmJiCmluZGV4IDI4
NzQ5OTAzMjAuLmNjMzU2MDRhYmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kXzkuMTguMjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmRfOS4xOC4yNS5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8v
ZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNo
IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzA5ZDczMDIzYzkxMTVk
ZGFkM2JhYjY1YjZjOGM3OWE1OTAxOTZkMGQxMTRmNWQwY2EyNTMzZGJkNTJkZGY2NiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1YTRhNzA0MzJhMzNkMDA5ZjBlNmU5ZGJiMzI4YWFlN2E1ZTI3NTA3
ZTk4ZTI4YmYzYzBjNmIyNTBjY2IyYWIzIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6
Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZp
c2libGUgYnkgMgotLSAKMi40Mi4wCgo=

--===============4540913740775935188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.18.24.so /usr/lib/libisccfg-9.18.24.so /usr/lib/libns-9.18.24.so /usr/lib/libisc-9.18.24.so /usr/lib/libdns-9.18.24.so /usr/lib/libbind9-9.18.24.so /usr/lib/libirs-9.18.24.so", added "/usr/lib/libbind9-9.18.25.so /usr/lib/libns-9.18.25.so /usr/lib/libdns-9.18.25.so /usr/lib/libirs-9.18.25.so /usr/lib/libisc-9.18.25.so /usr/lib/libisccc-9.18.25.so /usr/lib/libisccfg-9.18.25.so"
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

--===============4540913740775935188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.18.24.so /usr/lib/.debug/libisc-9.18.24.so /usr/lib/.debug/libisccfg-9.18.24.so /usr/lib/.debug/libirs-9.18.24.so /usr/lib/.debug/libisccc-9.18.24.so /usr/lib/.debug/libns-9.18.24.so /usr/lib/.debug/libbind9-9.18.24.so", added "/usr/lib/.debug/libisccfg-9.18.25.so /usr/lib/.debug/libirs-9.18.25.so /usr/lib/.debug/libdns-9.18.25.so /usr/lib/.debug/libns-9.18.25.so /usr/lib/.debug/libisc-9.18.25.so /usr/lib/.debug/libisccc-9.18.25.so /usr/lib/.debug/libbind9-9.18.25.so"
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 13349648 to 13349792 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1457787 to 1457644 (-0%)
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.24.so", added "/usr/lib/*-9.18.25.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisc-9.18.24.so /usr/lib/libbind9-9.18.24.so /usr/lib/libisccfg-9.18.24.so /usr/lib/libirs-9.18.24.so /usr/lib/libdns-9.18.24.so /usr/lib/libns-9.18.24.so /usr/lib/libisccc-9.18.24.so", added "/usr/lib/libdns-9.18.25.so /usr/lib/libisccfg-9.18.25.so /usr/lib/libbind9-9.18.25.so /usr/lib/libisccc-9.18.25.so /usr/lib/libirs-9.18.25.so /usr/lib/libisc-9.18.25.so /usr/lib/libns-9.18.25.so"
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9630613 to 9632264 (+0%)
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.24/bind-9.18.24.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.25/bind-9.18.25.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-64-poky-linux/bind: PV changed from "9.18.24" to "9.18.25"
packages/core2-64-poky-linux/bind: PKGV changed from 9.18.24 [default] to 9.18.25 [default]
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

--===============4540913740775935188==--

