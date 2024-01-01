Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AE8C52CE3
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4578.1704114718980537814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Gae7lZ3v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HK+MDDa+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018cc5270582-c52e1e72-a7f8-44c0-b537-e4af9aa4ccf5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=PPZtR7p6Yt8CMrw2yhGM5yJqLx03rMcMZ0DIn9g6Cfc=;
	b=Gae7lZ3vIWYvF3OWcZMhvo0nj4GEi69mXrdU/tkz/0yXuNm7475K6MfCYmWcwOkJ
	MItEZ7TMe+aImCR2YjU15SP39PSaVw2MeqBNji+C9uSY2YTSF+hoNKvG+Cv1E+96Ify
	gz1+LrsgJglK/DVZkIwwL2uFivKxf9FgqGR1b20Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=PPZtR7p6Yt8CMrw2yhGM5yJqLx03rMcMZ0DIn9g6Cfc=;
	b=HK+MDDa+6ui5fbtfm+vHCbZ/IoEPRH+GKwDoU0G6M4JLg3m0KeIXhXUd+KJEix2W
	M6cSCYsBDjHCFzEfConEe2uE+b12Kpf1CGDDfre/IcPDmgZTtdBjpGi8xn2nGrmLC4I
	0taJJrSOJUPLbew5S44fV6p3f+fAf0pSYFZWuA4c=
Content-Type: multipart/mixed; boundary="===============1927155740895686007=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.21 SUCCEEDED
Message-ID: <0101018cc5270582-c52e1e72-a7f8-44c0-b537-e4af9aa4ccf5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193101

--===============1927155740895686007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.20-9.18.21.patch
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
From e43750545b739f297b01306c048153bad7ccaca7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 05:12:01 +0000
Subject: [PATCH] bind: upgrade 9.18.20 -> 9.18.21

---
 ...1-avoid-start-failure-with-bind-user.patch |   8 +-
 ...d-V-and-start-log-hide-build-options.patch |   4 +-
 ...ching-for-json-headers-searches-sysr.patch |   6 +-
 .../recipes-connectivity/bind/bind/conf.patch | 138 ++++++++++++------
 ...t.d-add-support-for-read-only-rootfs.patch |  13 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  20 +--
 .../bind/{bind_9.18.20.bb => bind_9.18.21.bb} |   2 +-
 7 files changed, 121 insertions(+), 70 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.20.bb => bind_9.18.21.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index ec1bc7b567..0a19aa47f8 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From 29173207e381e8b14ccfaf32ef5b210f6b1a15db Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
@@ -6,12 +6,13 @@ Subject: [PATCH] avoid start failure with bind user
 Upstream-Status: Pending
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  init.d | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/init.d b/init.d
-index b2eec60..6e03936 100644
+index 95e8909..771d349 100644
 --- a/init.d
 +++ b/init.d
 @@ -57,6 +57,7 @@ case "$1" in
@@ -22,6 +23,3 @@ index b2eec60..6e03936 100644
  	    chmod 0640 /etc/bind/rndc.key
  	fi
  	if [ -f /var/run/named/named.pid ]; then
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 4c10f33f04..f735d60f2f 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From 91e8dd83007f7865055408cf60fd48ad9037d186 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -21,7 +21,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index bf20690..c5d330f 100644
+index 92fe983..8f3df42 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index f1abd179e8..acad8dbf98 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 246087f89e9434b726c7884e4c0964f71084f091 Mon Sep 17 00:00:00 2001
+From 5b165e1ea334d9e5b7267c4db74f011e444f6180 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -33,10 +33,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 10e8bf6..bf20690 100644
+index 2ab8ddd..92fe983 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -814,7 +814,7 @@ AS_CASE([$with_lmdb],
+@@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index aa3642acec..a689ae6002 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,44 @@
+From 419b7600b7fd77da59be99630ce438a9d03440b4 Mon Sep 17 00:00:00 2001
+From: Qing He <qing.he@intel.com>
+Date: Tue, 30 Nov 2010 13:35:42 +0800
+Subject: [PATCH] bind: add new recipe
+
 Upstream-Status: Inappropriate [configuration]
 
 the patch is imported from openembedded project
 
 11/30/2010 - Qing He <qing.he@intel.com>
 
-diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
---- bind-9.3.1.orig/conf/db.0	1970-01-01 01:00:00.000000000 +0100
-+++ bind-9.3.1/conf/db.0	2005-07-10 22:14:00.000000000 +0200
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
+
+diff --git a/conf/db.0 b/conf/db.0
+new file mode 100644
+index 0000000..e3aabdb
+--- /dev/null
++++ b/conf/db.0
 @@ -0,0 +1,12 @@
 +;
 +; BIND reverse data file for broadcast zone
@@ -20,9 +52,11 @@ diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
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
@@ -37,43 +71,49 @@ diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127
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
@@ -88,9 +128,11 @@ diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
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
@@ -137,9 +179,11 @@ diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
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
@@ -190,9 +234,11 @@ diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
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
@@ -202,9 +248,11 @@ diff -urN bind-9.3.1.orig/conf/named.conf.local bind-9.3.1/conf/named.conf.local
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
@@ -230,9 +278,11 @@ diff -urN bind-9.3.1.orig/conf/named.conf.options bind-9.3.1/conf/named.conf.opt
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
@@ -254,9 +304,11 @@ diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc1918
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
index 11db95ede1..f508af5d62 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,18 @@
-Subject: init.d: add support for read-only rootfs
+From 95213d538f1cd1e9b04b07c2f2292b59280979ae Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 27 Mar 2014 02:34:41 +0000
+Subject: [PATCH] init.d: add support for read-only rootfs
 
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
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
@@ -60,6 +64,3 @@ index 0111ed4..24677c8 100644
  test -x /usr/sbin/rndc || exit 0
  
  case "$1" in
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 146f3e35db..067bbaead0 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From 219cb343d385b6aba730d3276a1208ffbb9c2029 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Thu, 15 Nov 2012 02:27:54 +0000
+Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -6,14 +9,15 @@ Add some configurations, make rndc command be able to controls
 the named daemon.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
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
@@ -27,7 +31,7 @@ index 95829cf..c8899e7 100644
 +};
 diff --git a/conf/rndc.conf b/conf/rndc.conf
 new file mode 100644
-index 0000000..a0b481d
+index 0000000..4b43a3d
 --- /dev/null
 +++ b/conf/rndc.conf
 @@ -0,0 +1,5 @@
@@ -36,7 +40,3 @@ index 0000000..a0b481d
 +	default-server  localhost;
 +	default-key     rndc-key;
 +};
-
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/bind/bind_9.18.20.bb b/meta/recipes-connectivity/bind/bind_9.18.21.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.20.bb
rename to meta/recipes-connectivity/bind/bind_9.18.21.bb
index 187685eef5..f5fb4bd1e5 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.21.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "4b891ebf58d3f2a7ac3dd2682990f528a3448eaa1c992ddc5c141b8587a98ec5"
+SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.42.0


--===============1927155740895686007==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.20-9.18.21.patch"

RnJvbSBlNDM3NTA1NDViNzM5ZjI5N2IwMTMwNmMwNDgxNTNiYWQ3Y2NhY2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNToxMjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC4yMCAtPiA5LjE4LjIxCgotLS0KIC4uLjEtYXZvaWQtc3RhcnQtZmFp
bHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCB8ICAgOCArLQogLi4uZC1WLWFuZC1zdGFydC1sb2ct
aGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIHwgICA0ICstCiAuLi5jaGluZy1mb3ItanNvbi1oZWFk
ZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggfCAgIDYgKy0KIC4uLi9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvY29uZi5wYXRjaCB8IDEzOCArKysrKysrKysrKystLS0tLS0KIC4uLnQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCB8ICAxMyArLQogLi4uL2JpbmQv
bWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggIHwgIDIwICstLQogLi4uL2JpbmQv
e2JpbmRfOS4xOC4yMC5iYiA9PiBiaW5kXzkuMTguMjEuYmJ9IHwgICAyICstCiA3IGZpbGVzIGNo
YW5nZWQsIDEyMSBpbnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRfOS4xOC4yMC5iYiA9PiBiaW5kXzkuMTguMjEu
YmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdp
dGgtYmluZC11c2VyLnBhdGNoCmluZGV4IGVjMWJjN2I1NjcuLjBhMTlhYTQ3ZjggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQt
ZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMxZGRlMzU2MmYyODc0MjllZWE5NGI3NzI1MGQxODQ4
MThiNDkwNjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI5MTczMjA3ZTM4MWU4YjE0
Y2NmYWYzMmVmNWIyMTBmNmIxYTE1ZGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBD
aGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDE1IE9jdCAyMDE4IDE2
OjU1OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIHN0YXJ0IGZhaWx1cmUgd2l0aCBi
aW5kIHVzZXIKQEAgLTYsMTIgKzYsMTMgQEAgU3ViamVjdDogW1BBVENIXSBhdm9pZCBzdGFydCBm
YWlsdXJlIHdpdGggYmluZCB1c2VyCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogU2lnbmVk
LW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgorCiAtLS0KICBpbml0LmQg
fCAxICsKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL2lu
aXQuZCBiL2luaXQuZAotaW5kZXggYjJlZWM2MC4uNmUwMzkzNiAxMDA2NDQKK2luZGV4IDk1ZTg5
MDkuLjc3MWQzNDkgMTAwNjQ0CiAtLS0gYS9pbml0LmQKICsrKyBiL2luaXQuZAogQEAgLTU3LDYg
KzU3LDcgQEAgY2FzZSAiJDEiIGluCkBAIC0yMiw2ICsyMywzIEBAIGluZGV4IGIyZWVjNjAuLjZl
MDM5MzYgMTAwNjQ0CiAgCSAgICBjaG1vZCAwNjQwIC9ldGMvYmluZC9ybmRjLmtleQogIAlmaQog
IAlpZiBbIC1mIC92YXIvcnVuL25hbWVkL25hbWVkLnBpZCBdOyB0aGVuCi0tLSAKLTIuNy40Ci0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFt
ZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1z
dGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCmluZGV4IDRjMTBmMzNmMDQuLmY3MzVk
NjBmMmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jl
c2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNGU4MzM5MmU4NDBmYTdiMDVlNzc4NzEwYjhjMjAyZDEwMjQ3N2ExMyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTFlOGRkODMwMDdmNzg2NTA1NTQwOGNmNjBmZDQ4YWQ5
MDM3ZDE4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4
dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMjcgQXVnIDIwMTggMjE6MjQ6MjAgKzA4
MDAKIFN1YmplY3Q6IFtQQVRDSF0gYG5hbWVkL2x3cmVzZCAtVicgYW5kIHN0YXJ0IGxvZyBoaWRl
IGJ1aWxkIG9wdGlvbnMKQEAgLTIxLDcgKzIxLDcgQEAgU2lnbmVkLW9mZi1ieTogQXJtaW4gS3Vz
dGVyIDxha3VzdGVyQG12aXN0YS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMKLWluZGV4IGJmMjA2OTAuLmM1ZDMzMGYgMTAwNjQ0CitpbmRleCA5MmZlOTgzLi44ZjNkZjQy
IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0zNSw3
ICszNSw3IEBAIEFDX0RFRklORShbUEFDS0FHRV9WRVJTSU9OX0VYVFJBXSwgWyJdW2JpbmRfVkVS
U0lPTl9FWFRSQV1bIl0sIFtCSU5EIDkgRXh0cmEgcGFyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24t
aGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMt
c3lzci5wYXRjaAppbmRleCBmMWFiZDE3OWU4Li5hY2FkOGRiZjk4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9y
LWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJz
LXNlYXJjaGVzLXN5c3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI0NjA4N2Y4OWU5NDM0
YjcyNmM3ODg0ZTRjMDk2NGY3MTA4NGYwOTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDViMTY1ZTFlYTMzNGQ5ZTViNzI2N2M0ZGI3NGYwMTFlNDQ0ZjYxODAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVy
LmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAxNSAxMToyMjowMCAtMDQwMAogU3ViamVjdDogW1BB
VENIXSBiaW5kOiBlbnN1cmUgc2VhcmNoaW5nIGZvciBqc29uIGhlYWRlcnMgc2VhcmNoZXMgc3lz
cm9vdApAQCAtMzMsMTAgKzMzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFBhdWwgR29ydG1ha2VyIDxw
YXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCi1pbmRleCAxMGU4YmY2Li5iZjIwNjkwIDEwMDY0NAoraW5kZXggMmFiOGRkZC4uOTJm
ZTk4MyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAt
ODE0LDcgKzgxNCw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJdLAorQEAgLTc2MSw3ICs3NjEsNyBA
QCBBU19DQVNFKFskd2l0aF9sbWRiXSwKICAJW25vXSxbXSwKICAJW2F1dG98eWVzXSwgW1BLR19D
SEVDS19NT0RVTEVTKFtMTURCXSwgW2xtZGJdLAogIAkJCQkgICAgICAgW2FjX2xpYl9sbWRiX2Zv
dW5kPXllc10sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5w
YXRjaAppbmRleCBhYTM2NDJhY2VjLi5hNjg5YWU2MDAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsMTIgKzEsNDQgQEAKK0Zyb20g
NDE5Yjc2MDBiN2ZkNzdkYTU5YmU5OTYzMGNlNDM4YTlkMDM0NDBiNCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgorRGF0ZTogVHVlLCAz
MCBOb3YgMjAxMCAxMzozNTo0MiArMDgwMAorU3ViamVjdDogW1BBVENIXSBiaW5kOiBhZGQgbmV3
IHJlY2lwZQorCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25d
CiAKIHRoZSBwYXRjaCBpcyBpbXBvcnRlZCBmcm9tIG9wZW5lbWJlZGRlZCBwcm9qZWN0CiAKIDEx
LzMwLzIwMTAgLSBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNvbT4KIAotZGlmZiAtdXJOIGJpbmQt
OS4zLjEub3JpZy9jb25mL2RiLjAgYmluZC05LjMuMS9jb25mL2RiLjAKLS0tLSBiaW5kLTkuMy4x
Lm9yaWcvY29uZi9kYi4wCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysg
YmluZC05LjMuMS9jb25mL2RiLjAJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAK
Ky0tLQorIGNvbmYvZGIuMCAgICAgICAgICAgICAgIHwgMTIgKysrKysrKworIGNvbmYvZGIuMTI3
ICAgICAgICAgICAgIHwgMTMgKysrKysrKysKKyBjb25mL2RiLjI1NSAgICAgICAgICAgICB8IDEy
ICsrKysrKysKKyBjb25mL2RiLmVtcHR5ICAgICAgICAgICB8IDE0ICsrKysrKysrKworIGNvbmYv
ZGIubG9jYWwgICAgICAgICAgIHwgMTMgKysrKysrKysKKyBjb25mL2RiLnJvb3QgICAgICAgICAg
ICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrCisgY29uZi9uYW1lZC5jb25mICAgICAg
ICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKworIGNvbmYvbmFtZWQuY29uZi5s
b2NhbCAgIHwgIDggKysrKysKKyBjb25mL25hbWVkLmNvbmYub3B0aW9ucyB8IDI0ICsrKysrKysr
KysrKysrCisgY29uZi96b25lcy5yZmMxOTE4ICAgICAgfCAyMCArKysrKysrKysrKysKKyBpbml0
LmQgICAgICAgICAgICAgICAgICB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCisgMTEgZmlsZXMgY2hhbmdlZCwgMjgwIGluc2VydGlvbnMoKykKKyBjcmVhdGUg
bW9kZSAxMDA2NDQgY29uZi9kYi4wCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuMTI3Cisg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuMjU1CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYv
ZGIuZW1wdHkKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi5sb2NhbAorIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBjb25mL2RiLnJvb3QKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9uYW1lZC5jb25m
CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvbmFtZWQuY29uZi5sb2NhbAorIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBjb25mL25hbWVkLmNvbmYub3B0aW9ucworIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25m
L3pvbmVzLnJmYzE5MTgKKyBjcmVhdGUgbW9kZSAxMDA2NDQgaW5pdC5kCisKK2RpZmYgLS1naXQg
YS9jb25mL2RiLjAgYi9jb25mL2RiLjAKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAw
MDAwLi5lM2FhYmRiCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLjAKIEBAIC0wLDAgKzEs
MTIgQEAKICs7CiArOyBCSU5EIHJldmVyc2UgZGF0YSBmaWxlIGZvciBicm9hZGNhc3Qgem9uZQpA
QCAtMjAsOSArNTIsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjAgYmlu
ZC05LjMuMS9jb25mL2RiLjAKICsJCQkgNjA0ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKICs7
CiArQAlJTglOUwlsb2NhbGhvc3QuCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIu
MTI3IGJpbmQtOS4zLjEvY29uZi9kYi4xMjcKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4x
MjcJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2Nv
bmYvZGIuMTI3CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0
IGEvY29uZi9kYi4xMjcgYi9jb25mL2RiLjEyNworbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4
IDAwMDAwMDAuLmNkMDViZWYKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIuMTI3CiBAQCAt
MCwwICsxLDEzIEBACiArOwogKzsgQklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgbG9jYWwgbG9v
cGJhY2sgaW50ZXJmYWNlCkBAIC0zNyw0MyArNzEsNDkgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEu
b3JpZy9jb25mL2RiLjEyNyBiaW5kLTkuMy4xL2NvbmYvZGIuMTI3CiArOwogK0AJSU4JTlMJbG9j
YWxob3N0LgogKzEuMC4wCUlOCVBUUglsb2NhbGhvc3QuCi1kaWZmIC11ck4gYmluZC05LjMuMS5v
cmlnL2NvbmYvZGIuZW1wdHkgYmluZC05LjMuMS9jb25mL2RiLmVtcHR5Ci0tLS0gYmluZC05LjMu
MS5vcmlnL2NvbmYvZGIuZW1wdHkJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAK
LSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIuZW1wdHkJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAw
MDAgKzAyMDAKLUBAIC0wLDAgKzEsMTQgQEAKLSs7IEJJTkQgcmV2ZXJzZSBkYXRhIGZpbGUgZm9y
IGVtcHR5IHJmYzE5MTggem9uZQorZGlmZiAtLWdpdCBhL2NvbmYvZGIuMjU1IGIvY29uZi9kYi4y
NTUKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4xNmNkODE5CistLS0gL2Rl
di9udWxsCisrKysgYi9jb25mL2RiLjI1NQorQEAgLTAsMCArMSwxMiBAQAogKzsKLSs7IERPIE5P
VCBFRElUIFRISVMgRklMRSAtIGl0IGlzIHVzZWQgZm9yIG11bHRpcGxlIHpvbmVzLgotKzsgSW5z
dGVhZCwgY29weSBpdCwgZWRpdCBuYW1lZC5jb25mLCBhbmQgdXNlIHRoYXQgY29weS4KKys7IEJJ
TkQgcmVzZXJ2ZSBkYXRhIGZpbGUgZm9yIGJyb2FkY2FzdCB6b25lCiArOwotKyRUVEwJODY0MDAK
KyskVFRMCTYwNDgwMAogK0AJSU4JU09BCWxvY2FsaG9zdC4gcm9vdC5sb2NhbGhvc3QuICgKICsJ
CQkgICAgICAxCQk7IFNlcmlhbAogKwkJCSA2MDQ4MDAJCTsgUmVmcmVzaAogKwkJCSAgODY0MDAJ
CTsgUmV0cnkKICsJCQkyNDE5MjAwCQk7IEV4cGlyZQotKwkJCSAgODY0MDAgKQk7IE5lZ2F0aXZl
IENhY2hlIFRUTAorKwkJCSA2MDQ4MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAogKzsKICtACUlO
CU5TCWxvY2FsaG9zdC4KLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4yNTUgYmlu
ZC05LjMuMS9jb25mL2RiLjI1NQotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjI1NQkxOTcw
LTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi4y
NTUJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKLUBAIC0wLDAgKzEsMTIgQEAK
K2RpZmYgLS1naXQgYS9jb25mL2RiLmVtcHR5IGIvY29uZi9kYi5lbXB0eQorbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjhhMTI4NTgKKy0tLSAvZGV2L251bGwKKysrKyBiL2Nv
bmYvZGIuZW1wdHkKK0BAIC0wLDAgKzEsMTQgQEAKKys7IEJJTkQgcmV2ZXJzZSBkYXRhIGZpbGUg
Zm9yIGVtcHR5IHJmYzE5MTggem9uZQogKzsKLSs7IEJJTkQgcmVzZXJ2ZSBkYXRhIGZpbGUgZm9y
IGJyb2FkY2FzdCB6b25lCisrOyBETyBOT1QgRURJVCBUSElTIEZJTEUgLSBpdCBpcyB1c2VkIGZv
ciBtdWx0aXBsZSB6b25lcy4KKys7IEluc3RlYWQsIGNvcHkgaXQsIGVkaXQgbmFtZWQuY29uZiwg
YW5kIHVzZSB0aGF0IGNvcHkuCiArOwotKyRUVEwJNjA0ODAwCisrJFRUTAk4NjQwMAogK0AJSU4J
U09BCWxvY2FsaG9zdC4gcm9vdC5sb2NhbGhvc3QuICgKICsJCQkgICAgICAxCQk7IFNlcmlhbAog
KwkJCSA2MDQ4MDAJCTsgUmVmcmVzaAogKwkJCSAgODY0MDAJCTsgUmV0cnkKICsJCQkyNDE5MjAw
CQk7IEV4cGlyZQotKwkJCSA2MDQ4MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAorKwkJCSAgODY0
MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4KLWRpZmYg
LXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvZGIubG9j
YWwKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5sb2NhbAkxOTcwLTAxLTAxIDAxOjAwOjAw
LjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi5sb2NhbAkyMDA1LTA3LTEw
IDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvZGIubG9jYWwgYi9j
b25mL2RiLmxvY2FsCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uNjZiNDg5
MgorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi5sb2NhbAogQEAgLTAsMCArMSwxMyBAQAog
KzsKICs7IEJJTkQgZGF0YSBmaWxlIGZvciBsb2NhbCBsb29wYmFjayBpbnRlcmZhY2UKQEAgLTg4
LDkgKzEyOCwxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIubG9jYWwgYmlu
ZC05LjMuMS9jb25mL2RiLmxvY2FsCiArOwogK0AJSU4JTlMJbG9jYWxob3N0LgogK0AJSU4JQQkx
MjcuMC4wLjEKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5yb290IGJpbmQtOS4z
LjEvY29uZi9kYi5yb290Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIucm9vdAkxOTcwLTAx
LTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi5yb290
CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9k
Yi5yb290IGIvY29uZi9kYi5yb290CituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAw
MC4uMDFjMjBmMAorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi5yb290CiBAQCAtMCwwICsx
LDQ1IEBACiArCiArOyA8PD4+IERpRyA5LjIuMyA8PD4+IG5zIC4gQGEucm9vdC1zZXJ2ZXJzLm5l
dC4KQEAgLTEzNyw5ICsxNzksMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2Ri
LnJvb3QgYmluZC05LjMuMS9jb25mL2RiLnJvb3QKICs7OyBXSEVOOiBTdW4gRmViICAxIDExOjI3
OjE0IDIwMDQKICs7OyBNU0cgU0laRSAgcmN2ZDogNDM2CiArCi1kaWZmIC11ck4gYmluZC05LjMu
MS5vcmlnL2NvbmYvbmFtZWQuY29uZiBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZgotLS0tIGJp
bmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAw
MDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZgkyMDA1LTA3LTEwIDIyOjMz
OjQ2LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvbmFtZWQuY29uZiBiL2NvbmYv
bmFtZWQuY29uZgorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjk1ODI5Y2YK
Ky0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvbmFtZWQuY29uZgogQEAgLTAsMCArMSw0OSBAQAog
Ky8vIFRoaXMgaXMgdGhlIHByaW1hcnkgY29uZmlndXJhdGlvbiBmaWxlIGZvciB0aGUgQklORCBE
TlMgc2VydmVyIG5hbWVkLgogKy8vCkBAIC0xOTAsOSArMjM0LDExIEBAIGRpZmYgLXVyTiBiaW5k
LTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mCiAr
Ly8gcm9vdC1kZWxlZ2F0aW9uLW9ubHkgZXhjbHVkZSB7ICJERSI7ICJNVVNFVU0iOyB9OwogKwog
K2luY2x1ZGUgIi9ldGMvYmluZC9uYW1lZC5jb25mLmxvY2FsIjsKLWRpZmYgLXVyTiBiaW5kLTku
My4xLm9yaWcvY29uZi9uYW1lZC5jb25mLmxvY2FsIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25m
LmxvY2FsCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5sb2NhbAkxOTcwLTAx
LTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5j
b25mLmxvY2FsCTIwMDUtMDctMTAgMjI6MTQ6MDYuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0
IGEvY29uZi9uYW1lZC5jb25mLmxvY2FsIGIvY29uZi9uYW1lZC5jb25mLmxvY2FsCituZXcgZmls
ZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uN2E1N2IxMAorLS0tIC9kZXYvbnVsbAorKysr
IGIvY29uZi9uYW1lZC5jb25mLmxvY2FsCiBAQCAtMCwwICsxLDggQEAKICsvLwogKy8vIERvIGFu
eSBsb2NhbCBjb25maWd1cmF0aW9uIGhlcmUKQEAgLTIwMiw5ICsyNDgsMTEgQEAgZGlmZiAtdXJO
IGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYubG9jYWwgYmluZC05LjMuMS9jb25mL25h
bWVkLmNvbmYubG9jYWwKICsvLyBvcmdhbml6YXRpb24KICsvL2luY2x1ZGUgIi9ldGMvYmluZC96
b25lcy5yZmMxOTE4IjsKICsKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5j
b25mLm9wdGlvbnMgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYub3B0aW9ucwotLS0tIGJpbmQt
OS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYub3B0aW9ucwkxOTcwLTAxLTAxIDAxOjAwOjAwLjAw
MDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMJMjAw
NS0wNy0xMCAyMjoxNDowNi4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL25hbWVk
LmNvbmYub3B0aW9ucyBiL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zCituZXcgZmlsZSBtb2RlIDEw
MDY0NAoraW5kZXggMDAwMDAwMC4uODEzMTkzZAorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9u
YW1lZC5jb25mLm9wdGlvbnMKIEBAIC0wLDAgKzEsMjQgQEAKICtvcHRpb25zIHsKICsJZGlyZWN0
b3J5ICIvdmFyL2NhY2hlL2JpbmQiOwpAQCAtMjMwLDkgKzI3OCwxMSBAQCBkaWZmIC11ck4gYmlu
ZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zIGJpbmQtOS4zLjEvY29uZi9uYW1l
ZC5jb25mLm9wdAogKwogK307CiArCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvem9u
ZXMucmZjMTkxOCBiaW5kLTkuMy4xL2NvbmYvem9uZXMucmZjMTkxOAotLS0tIGJpbmQtOS4zLjEu
b3JpZy9jb25mL3pvbmVzLnJmYzE5MTgJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAx
MDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvem9uZXMucmZjMTkxOAkyMDA1LTA3LTEwIDIyOjE0OjEw
LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvem9uZXMucmZjMTkxOCBiL2NvbmYv
em9uZXMucmZjMTkxOAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjAzYjU1
NDYKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvem9uZXMucmZjMTkxOAogQEAgLTAsMCArMSwy
MCBAQAogK3pvbmUgIjEwLmluLWFkZHIuYXJwYSIgICAgICB7IHR5cGUgbWFzdGVyOyBmaWxlICIv
ZXRjL2JpbmQvZGIuZW1wdHkiOyB9OwogKyAKQEAgLTI1NCw5ICszMDQsMTEgQEAgZGlmZiAtdXJO
IGJpbmQtOS4zLjEub3JpZy9jb25mL3pvbmVzLnJmYzE5MTggYmluZC05LjMuMS9jb25mL3pvbmVz
LnJmYzE5MTgKICt6b25lICIzMS4xNzIuaW4tYWRkci5hcnBhIiAgeyB0eXBlIG1hc3RlcjsgZmls
ZSAiL2V0Yy9iaW5kL2RiLmVtcHR5IjsgfTsKICsKICt6b25lICIxNjguMTkyLmluLWFkZHIuYXJw
YSIgeyB0eXBlIG1hc3RlcjsgZmlsZSAiL2V0Yy9iaW5kL2RiLmVtcHR5IjsgfTsKLWRpZmYgLXVy
TiBiaW5kLTkuMy4xLm9yaWcvaW5pdC5kIGJpbmQtOS4zLjEvaW5pdC5kCi0tLS0gYmluZC05LjMu
MS5vcmlnL2luaXQuZAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJp
bmQtOS4zLjEvaW5pdC5kCTIwMDUtMDctMTAgMjM6MDk6NTguMDAwMDAwMDAwICswMjAwCitkaWZm
IC0tZ2l0IGEvaW5pdC5kIGIvaW5pdC5kCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAw
MDAwMC4uMmVmMjI3NworLS0tIC9kZXYvbnVsbAorKysrIGIvaW5pdC5kCiBAQCAtMCwwICsxLDcw
IEBACiArIyEvYmluL3NoCiArCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQt
Zm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKaW5kZXggMTFkYjk1ZWRlMS4uZjUwOGFmNWQ2MiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJv
b3Rmcy5wYXRjaApAQCAtMSwxNCArMSwxOCBAQAotU3ViamVjdDogaW5pdC5kOiBhZGQgc3VwcG9y
dCBmb3IgcmVhZC1vbmx5IHJvb3RmcworRnJvbSA5NTIxM2Q1MzhmMWNkMWU5YjA0YjA3YzJmMjI5
MmI1OTI4MDk3OWFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQ2hlbiBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPgorRGF0ZTogVGh1LCAyNyBNYXIgMjAxNCAwMjozNDo0MSArMDAw
MAorU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFkZCBzdXBwb3J0IGZvciByZWFkLW9ubHkgcm9v
dGZzCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNdCiAKIFNp
Z25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KKwogLS0tCi0gaW5p
dC5kIHwgICA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCisgaW5p
dC5kIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogIDEgZmls
ZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9pbml0LmQgYi9pbml0
LmQKLWluZGV4IDAxMTFlZDQuLjI0Njc3YzggMTAwNjQ0CitpbmRleCAyZWYyMjc3Li45NWU4OTA5
IDEwMDY0NAogLS0tIGEvaW5pdC5kCiArKysgYi9pbml0LmQKIEBAIC02LDggKzYsNDggQEAgUEFU
SD0vc2JpbjovYmluOi91c3Ivc2JpbjovdXNyL2JpbgpAQCAtNjAsNiArNjQsMyBAQCBpbmRleCAw
MTExZWQ0Li4yNDY3N2M4IDEwMDY0NAogIHRlc3QgLXggL3Vzci9zYmluL3JuZGMgfHwgZXhpdCAw
CiAgCiAgY2FzZSAiJDEiIGluCi0tLSAKLTEuNy45LjUKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0
ZC1iaW5kLXN0b3Atd29yay5wYXRjaAppbmRleCAxNDZmM2UzNWRiLi4wNjdiYmFlYWQwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0
ZC1iaW5kLXN0b3Atd29yay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDcg
QEAKLWJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2JpbmQgc3RvcCIgd29yaworRnJvbSAyMTljYjM0
M2QzODViNmFiYTczMGQzMjc2YTEyMDhmZmJiOWMyMDI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIuY29tPgorRGF0ZTogVGh1LCAx
NSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAorU3ViamVjdDogW1BBVENIXSBiaW5kOiBtYWtlICIv
ZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlIFtjb25maWd1cmF0aW9uXQogCkBAIC02LDE0ICs5LDE1IEBAIEFkZCBzb21lIGNvbmZpZ3Vy
YXRpb25zLCBtYWtlIHJuZGMgY29tbWFuZCBiZSBhYmxlIHRvIGNvbnRyb2xzCiB0aGUgbmFtZWQg
ZGFlbW9uLgogCiBTaWduZWQtb2ZmLWJ5OiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5j
b20+CisKIC0tLQotIGNvbmYvbmFtZWQuY29uZiB8ICAgIDUgKysrKysKLSBjb25mL3JuZGMuY29u
ZiAgfCAgICA1ICsrKysrCi0gMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAwIGRl
bGV0aW9ucygtKQorIGNvbmYvbmFtZWQuY29uZiB8IDUgKysrKysKKyBjb25mL3JuZGMuY29uZiAg
fCA1ICsrKysrCisgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmYvcm5kYy5jb25mCiAKIGRpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYg
Yi9jb25mL25hbWVkLmNvbmYKLWluZGV4IDk1ODI5Y2YuLmM4ODk5ZTcgMTAwNjQ0CitpbmRleCA5
NTgyOWNmLi4wMjFkYmNhIDEwMDY0NAogLS0tIGEvY29uZi9uYW1lZC5jb25mCiArKysgYi9jb25m
L25hbWVkLmNvbmYKIEBAIC00NywzICs0Nyw4IEBAIHpvbmUgIjI1NS5pbi1hZGRyLmFycGEiIHsK
QEAgLTI3LDcgKzMxLDcgQEAgaW5kZXggOTU4MjljZi4uYzg4OTllNyAxMDA2NDQKICt9OwogZGlm
ZiAtLWdpdCBhL2NvbmYvcm5kYy5jb25mIGIvY29uZi9ybmRjLmNvbmYKIG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Ci1pbmRleCAwMDAwMDAwLi5hMGI0ODFkCitpbmRleCAwMDAwMDAwLi40YjQzYTNkCiAt
LS0gL2Rldi9udWxsCiArKysgYi9jb25mL3JuZGMuY29uZgogQEAgLTAsMCArMSw1IEBACkBAIC0z
Niw3ICs0MCwzIEBAIGluZGV4IDAwMDAwMDAuLmEwYjQ4MWQKICsJZGVmYXVsdC1zZXJ2ZXIgIGxv
Y2FsaG9zdDsKICsJZGVmYXVsdC1rZXkgICAgIHJuZGMta2V5OwogK307Ci0KLS0tIAotMS43LjUu
NAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4
LjIwLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4yMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZF85LjE4LjIwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZF85LjE4LjIxLmJiCmluZGV4IDE4NzY4NWVlZjUuLmY1ZmI0YmQxZTUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4yMS5iYgpAQCAtMjAs
NyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9
LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFy
dC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNGI4OTFlYmY1OGQzZjJhN2FjM2RkMjY4Mjk5MGY1MjhhMzQ0OGVhYTFj
OTkyZGRjNWMxNDFiODU4N2E5OGVjNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNTU2YmUyMjUw
NWQ5ZWE0ZjljNjcxN2FlZTljNTQ5NzM5YzY4NDk4YWZmM2NhNjkwMzU3ODdlY2M2NDhmZWM1Igog
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgog
IyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi40Mi4wCgo=

--===============1927155740895686007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.18.20.so /usr/lib/libbind9-9.18.20.so /usr/lib/libisccc-9.18.20.so /usr/lib/libisccfg-9.18.20.so /usr/lib/libdns-9.18.20.so /usr/lib/libirs-9.18.20.so /usr/lib/libisc-9.18.20.so", added "/usr/lib/libns-9.18.21.so /usr/lib/libisccfg-9.18.21.so /usr/lib/libisc-9.18.21.so /usr/lib/libbind9-9.18.21.so /usr/lib/libdns-9.18.21.so /usr/lib/libisccc-9.18.21.so /usr/lib/libirs-9.18.21.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.20.so to libbind9-9.18.21.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.20.so to libdns-9.18.21.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.20.so to libirs-9.18.21.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.20.so to libisccc-9.18.21.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.20.so to libisccfg-9.18.21.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.20.so to libisc-9.18.21.so
  /usr/lib/libns.so changed symlink target from libns-9.18.20.so to libns-9.18.21.so
  /usr/lib/libbind9-9.18.20.so moved to /usr/lib/libbind9-9.18.21.so
  /usr/lib/libdns-9.18.20.so moved to /usr/lib/libdns-9.18.21.so
  /usr/lib/libirs-9.18.20.so moved to /usr/lib/libirs-9.18.21.so
  /usr/lib/libisc-9.18.20.so moved to /usr/lib/libisc-9.18.21.so
  /usr/lib/libisccc-9.18.20.so moved to /usr/lib/libisccc-9.18.21.so
  /usr/lib/libisccfg-9.18.20.so moved to /usr/lib/libisccfg-9.18.21.so
  /usr/lib/libns-9.18.20.so moved to /usr/lib/libns-9.18.21.so

--===============1927155740895686007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisc-9.18.20.so /usr/lib/.debug/libdns-9.18.20.so /usr/lib/.debug/libns-9.18.20.so /usr/lib/.debug/libbind9-9.18.20.so /usr/lib/.debug/libirs-9.18.20.so /usr/lib/.debug/libisccfg-9.18.20.so /usr/lib/.debug/libisccc-9.18.20.so", added "/usr/lib/.debug/libns-9.18.21.so /usr/lib/.debug/libisc-9.18.21.so /usr/lib/.debug/libirs-9.18.21.so /usr/lib/.debug/libisccfg-9.18.21.so /usr/lib/.debug/libisccc-9.18.21.so /usr/lib/.debug/libdns-9.18.21.so /usr/lib/.debug/libbind9-9.18.21.so"
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 13326496 to 13328960 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1458450 to 1458404 (-0%)
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libbind9-9.18.20.so /usr/lib/libisccc-9.18.20.so /usr/lib/libisccfg-9.18.20.so /usr/lib/libirs-9.18.20.so /usr/lib/libisc-9.18.20.so /usr/lib/libns-9.18.20.so /usr/lib/libdns-9.18.20.so", added "/usr/lib/libisccfg-9.18.21.so /usr/lib/libisccc-9.18.21.so /usr/lib/libdns-9.18.21.so /usr/lib/libisc-9.18.21.so /usr/lib/libns-9.18.21.so /usr/lib/libirs-9.18.21.so /usr/lib/libbind9-9.18.21.so"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.20.so", added "/usr/lib/*-9.18.21.so"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9620333 to 9622747 (+0%)
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.20/bind-9.18.20.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.21/bind-9.18.21.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-64-poky-linux/bind: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.18.20" to "9.18.21"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.20.so to libbind9-9.18.21.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.20.so to libdns-9.18.21.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.20.so to libirs-9.18.21.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.20.so to libisccc-9.18.21.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.20.so to libisccfg-9.18.21.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.20.so to libisc-9.18.21.so
  /usr/lib/libns.so changed symlink target from libns-9.18.20.so to libns-9.18.21.so
  /usr/lib/libbind9-9.18.20.so moved to /usr/lib/libbind9-9.18.21.so
  /usr/lib/libdns-9.18.20.so moved to /usr/lib/libdns-9.18.21.so
  /usr/lib/libirs-9.18.20.so moved to /usr/lib/libirs-9.18.21.so
  /usr/lib/libisc-9.18.20.so moved to /usr/lib/libisc-9.18.21.so
  /usr/lib/libisccc-9.18.20.so moved to /usr/lib/libisccc-9.18.21.so
  /usr/lib/libisccfg-9.18.20.so moved to /usr/lib/libisccfg-9.18.21.so
  /usr/lib/libns-9.18.20.so moved to /usr/lib/libns-9.18.21.so

--===============1927155740895686007==--

