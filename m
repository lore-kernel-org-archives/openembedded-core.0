Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D18C54F20
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.20320.1708018343443766229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L8Ah7eSe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=E1u2T9WJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dadd39a7c-ea0ec342-2944-4ee7-b79a-bc1b11492c05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018342;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=su5R5OzcrhdyVY4JxSxyOt7CGIDE1PR2HLYmmDPJfwQ=;
	b=L8Ah7eSezRCwejCmSGe3EjWSaCuEMhEYAji+hW2dyly3lqyExsOZw4C/j88aQDXs
	GPQen6KGiWYnZY/4Oxk24pC2b7rFQgsOw4xx+fFZ9KtMUW0EBlR0lDBWOWXsfBKcSTB
	jjHCiRgqd22+GutYyvVLHksdEiOLYbyOkqMXiTCk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018342;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=su5R5OzcrhdyVY4JxSxyOt7CGIDE1PR2HLYmmDPJfwQ=;
	b=E1u2T9WJ/dFXdh6A4gHfaiMekWyEy4oeYGHuB7IbktQujDDEiLgP1L0z/VQ7rVZ5
	aUd1J8YEOUILTktGHQQAE9n5cH1aZJSeOoT+RhiJEozo5X6sUP4QnfIGQgkkv7FMc9L
	kYIFj6IdJb4EkeT0hbQ+GxQXnx4Pg2AaDE0SGFlQ=
Content-Type: multipart/mixed; boundary="===============1238124274318838013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.24 SUCCEEDED
Message-ID: <0101018dadd39a7c-ea0ec342-2944-4ee7-b79a-bc1b11492c05-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195558

--===============1238124274318838013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.21-9.18.24.patch
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
From 082de050671d3212eb50df1125ff3fda485bd971 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 05:19:07 +0000
Subject: [PATCH] bind: upgrade 9.18.21 -> 9.18.24

---
 ...1-avoid-start-failure-with-bind-user.patch |   8 +-
 ...d-V-and-start-log-hide-build-options.patch |   4 +-
 ...ching-for-json-headers-searches-sysr.patch |   4 +-
 .../recipes-connectivity/bind/bind/conf.patch | 138 ++++++++++++------
 ...t.d-add-support-for-read-only-rootfs.patch |  13 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  20 +--
 .../bind/{bind_9.18.21.bb => bind_9.18.24.bb} |   2 +-
 7 files changed, 120 insertions(+), 69 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.21.bb => bind_9.18.24.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index ec1bc7b567..c45da02ac0 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From dbbb43ee107b2a614104b6880bf8557ed73dc577 Mon Sep 17 00:00:00 2001
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
index 4c10f33f04..057540df74 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From 65650ece1254e4f4ce92f17a6e078924fcea31e9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -21,7 +21,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index bf20690..c5d330f 100644
+index d8bfd85..d3be5a0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d07cae39..462418810c 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
+From ca74b2646432db9993c6ac659726dcea135ceaf3 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -33,7 +33,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2ab8ddd..92fe983 100644
+index 8aa7a90..d8bfd85 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index aa3642acec..99bdda97c4 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,44 @@
+From 77bf9cc217ecf43ca7d1d1ac070d0bd09c34e13e Mon Sep 17 00:00:00 2001
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
index 11db95ede1..40040be8b0 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,18 @@
-Subject: init.d: add support for read-only rootfs
+From 9ccb0c9322b47374daaa13c792eb0af97037d397 Mon Sep 17 00:00:00 2001
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
index 146f3e35db..553f0a14fb 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From aa163490b961b8ba9e099140c89e7f5797093726 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-connectivity/bind/bind_9.18.21.bb b/meta/recipes-connectivity/bind/bind_9.18.24.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.21.bb
rename to meta/recipes-connectivity/bind/bind_9.18.24.bb
index f5fb4bd1e5..2874990320 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
+SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.42.0


--===============1238124274318838013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.21-9.18.24.patch"

RnJvbSAwODJkZTA1MDY3MWQzMjEyZWI1MGRmMTEyNWZmM2ZkYTQ4NWJkOTcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDU6MTk6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMTguMjEgLT4gOS4xOC4yNAoKLS0tCiAuLi4xLWF2b2lkLXN0YXJ0LWZh
aWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggfCAgIDggKy0KIC4uLmQtVi1hbmQtc3RhcnQtbG9n
LWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8ICAgNCArLQogLi4uY2hpbmctZm9yLWpzb24taGVh
ZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIHwgICA0ICstCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kL2NvbmYucGF0Y2ggfCAxMzggKysrKysrKysrKysrLS0tLS0tCiAuLi50LmQt
YWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggfCAgMTMgKy0KIC4uLi9iaW5k
L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICB8ICAyMCArLS0KIC4uLi9iaW5k
L3tiaW5kXzkuMTguMjEuYmIgPT4gYmluZF85LjE4LjI0LmJifSB8ICAgMiArLQogNyBmaWxlcyBj
aGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgNjkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzkuMTguMjEuYmIgPT4gYmluZF85LjE4LjI0
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13
aXRoLWJpbmQtdXNlci5wYXRjaAppbmRleCBlYzFiYzdiNTY3Li5jNDVkYTAyYWMwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0
LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMWRkZTM1NjJmMjg3NDI5ZWVhOTRiNzcyNTBkMTg0
ODE4YjQ5MDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkYmJiNDNlZTEwN2IyYTYx
NDEwNGI2ODgwYmY4NTU3ZWQ3M2RjNTc3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Q2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAxNSBPY3QgMjAxOCAx
Njo1NTowOSArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBzdGFydCBmYWlsdXJlIHdpdGgg
YmluZCB1c2VyCkBAIC02LDEyICs2LDEzIEBAIFN1YmplY3Q6IFtQQVRDSF0gYXZvaWQgc3RhcnQg
ZmFpbHVyZSB3aXRoIGJpbmQgdXNlcgogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25l
ZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KKwogLS0tCiAgaW5pdC5k
IHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9p
bml0LmQgYi9pbml0LmQKLWluZGV4IGIyZWVjNjAuLjZlMDM5MzYgMTAwNjQ0CitpbmRleCA5NWU4
OTA5Li43NzFkMzQ5IDEwMDY0NAogLS0tIGEvaW5pdC5kCiArKysgYi9pbml0LmQKIEBAIC01Nyw2
ICs1Nyw3IEBAIGNhc2UgIiQxIiBpbgpAQCAtMjIsNiArMjMsMyBAQCBpbmRleCBiMmVlYzYwLi42
ZTAzOTM2IDEwMDY0NAogIAkgICAgY2htb2QgMDY0MCAvZXRjL2JpbmQvcm5kYy5rZXkKICAJZmkK
ICAJaWYgWyAtZiAvdmFyL3J1bi9uYW1lZC9uYW1lZC5waWQgXTsgdGhlbgotLS0gCi0yLjcuNAot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5h
bWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQt
c3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAppbmRleCA0YzEwZjMzZjA0Li4wNTc1
NDBkZjc0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8w
MDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdy
ZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDRlODMzOTJlODQwZmE3YjA1ZTc3ODcxMGI4YzIwMmQxMDI0NzdhMTMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY1NjUwZWNlMTI1NGU0ZjRjZTkyZjE3YTZlMDc4OTI0
ZmNlYTMxZTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25n
eHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBuYW1lZC9sd3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlk
ZSBidWlsZCBvcHRpb25zCkBAIC0yMSw3ICsyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1
c3RlciA8YWt1c3RlckBtdmlzdGEuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJl
LmFjCi1pbmRleCBiZjIwNjkwLi5jNWQzMzBmIDEwMDY0NAoraW5kZXggZDhiZmQ4NS4uZDNiZTVh
MCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUs
NyArMzUsNyBAQCBBQ19ERUZJTkUoW1BBQ0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZF
UlNJT05fRVhUUkFdWyJdLCBbQklORCA5IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29u
LWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVz
LXN5c3IucGF0Y2gKaW5kZXggMzhkMDdjYWUzOS4uNDYyNDE4ODEwYyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZv
ci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVy
cy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1YWUzMDMyOWYxNjhj
MWU4ZDJlMGMzODMxOTg4YTRmM2U5MDk2ZTM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjYTc0YjI2NDY0MzJkYjk5OTNjNmFjNjU5NzI2ZGNlYTEzNWNlYWYzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUdWUsIDkgSnVuIDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYmluZDogZW5zdXJlIHNlYXJjaGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5
c3Jvb3QKQEAgLTMzLDcgKzMzLDcgQEAgU2lnbmVkLW9mZi1ieTogUGF1bCBHb3J0bWFrZXIgPHBh
dWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1
cmUuYWMKLWluZGV4IDJhYjhkZGQuLjkyZmU5ODMgMTAwNjQ0CitpbmRleCA4YWE3YTkwLi5kOGJm
ZDg1IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC03
NjEsNyArNzYxLDcgQEAgQVNfQ0FTRShbJHdpdGhfbG1kYl0sCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAppbmRleCBhYTM2NDJhY2VjLi45OWJkZGE5
N2M0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25m
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0
Y2gKQEAgLTEsMTIgKzEsNDQgQEAKK0Zyb20gNzdiZjljYzIxN2VjZjQzY2E3ZDFkMWFjMDcwZDBi
ZDA5YzM0ZTEzZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFFpbmcgSGUgPHFpbmcu
aGVAaW50ZWwuY29tPgorRGF0ZTogVHVlLCAzMCBOb3YgMjAxMCAxMzozNTo0MiArMDgwMAorU3Vi
amVjdDogW1BBVENIXSBiaW5kOiBhZGQgbmV3IHJlY2lwZQorCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAKIHRoZSBwYXRjaCBpcyBpbXBvcnRlZCBmcm9t
IG9wZW5lbWJlZGRlZCBwcm9qZWN0CiAKIDExLzMwLzIwMTAgLSBRaW5nIEhlIDxxaW5nLmhlQGlu
dGVsLmNvbT4KIAotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjAgYmluZC05LjMu
MS9jb25mL2RiLjAKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4wCTE5NzAtMDEtMDEgMDE6
MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL2RiLjAJMjAwNS0wNy0x
MCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKKy0tLQorIGNvbmYvZGIuMCAgICAgICAgICAgICAg
IHwgMTIgKysrKysrKworIGNvbmYvZGIuMTI3ICAgICAgICAgICAgIHwgMTMgKysrKysrKysKKyBj
b25mL2RiLjI1NSAgICAgICAgICAgICB8IDEyICsrKysrKysKKyBjb25mL2RiLmVtcHR5ICAgICAg
ICAgICB8IDE0ICsrKysrKysrKworIGNvbmYvZGIubG9jYWwgICAgICAgICAgIHwgMTMgKysrKysr
KysKKyBjb25mL2RiLnJvb3QgICAgICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysr
KysrCisgY29uZi9uYW1lZC5jb25mICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKworIGNvbmYvbmFtZWQuY29uZi5sb2NhbCAgIHwgIDggKysrKysKKyBjb25mL25hbWVk
LmNvbmYub3B0aW9ucyB8IDI0ICsrKysrKysrKysrKysrCisgY29uZi96b25lcy5yZmMxOTE4ICAg
ICAgfCAyMCArKysrKysrKysrKysKKyBpbml0LmQgICAgICAgICAgICAgICAgICB8IDcwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCisgMTEgZmlsZXMgY2hhbmdlZCwg
MjgwIGluc2VydGlvbnMoKykKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi4wCisgY3JlYXRl
IG1vZGUgMTAwNjQ0IGNvbmYvZGIuMTI3CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuMjU1
CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuZW1wdHkKKyBjcmVhdGUgbW9kZSAxMDA2NDQg
Y29uZi9kYi5sb2NhbAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLnJvb3QKKyBjcmVhdGUg
bW9kZSAxMDA2NDQgY29uZi9uYW1lZC5jb25mCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvbmFt
ZWQuY29uZi5sb2NhbAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL25hbWVkLmNvbmYub3B0aW9u
cworIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL3pvbmVzLnJmYzE5MTgKKyBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5pdC5kCisKK2RpZmYgLS1naXQgYS9jb25mL2RiLjAgYi9jb25mL2RiLjAKK25ldyBm
aWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi5lM2FhYmRiCistLS0gL2Rldi9udWxsCisr
KysgYi9jb25mL2RiLjAKIEBAIC0wLDAgKzEsMTIgQEAKICs7CiArOyBCSU5EIHJldmVyc2UgZGF0
YSBmaWxlIGZvciBicm9hZGNhc3Qgem9uZQpAQCAtMjAsOSArNTIsMTEgQEAgZGlmZiAtdXJOIGJp
bmQtOS4zLjEub3JpZy9jb25mL2RiLjAgYmluZC05LjMuMS9jb25mL2RiLjAKICsJCQkgNjA0ODAw
ICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCi1kaWZmIC11
ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMTI3IGJpbmQtOS4zLjEvY29uZi9kYi4xMjcKLS0t
LSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4xMjcJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAw
MDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIuMTI3CTIwMDUtMDctMTAgMjI6MTQ6MDAu
MDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9kYi4xMjcgYi9jb25mL2RiLjEyNwor
bmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLmNkMDViZWYKKy0tLSAvZGV2L251
bGwKKysrKyBiL2NvbmYvZGIuMTI3CiBAQCAtMCwwICsxLDEzIEBACiArOwogKzsgQklORCByZXZl
cnNlIGRhdGEgZmlsZSBmb3IgbG9jYWwgbG9vcGJhY2sgaW50ZXJmYWNlCkBAIC0zNyw0MyArNzEs
NDkgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjEyNyBiaW5kLTkuMy4xL2Nv
bmYvZGIuMTI3CiArOwogK0AJSU4JTlMJbG9jYWxob3N0LgogKzEuMC4wCUlOCVBUUglsb2NhbGhv
c3QuCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuZW1wdHkgYmluZC05LjMuMS9j
b25mL2RiLmVtcHR5Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuZW1wdHkJMTk3MC0wMS0w
MSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIuZW1wdHkJ
MjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKLUBAIC0wLDAgKzEsMTQgQEAKLSs7
IEJJTkQgcmV2ZXJzZSBkYXRhIGZpbGUgZm9yIGVtcHR5IHJmYzE5MTggem9uZQorZGlmZiAtLWdp
dCBhL2NvbmYvZGIuMjU1IGIvY29uZi9kYi4yNTUKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRl
eCAwMDAwMDAwLi4xNmNkODE5CistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLjI1NQorQEAg
LTAsMCArMSwxMiBAQAogKzsKLSs7IERPIE5PVCBFRElUIFRISVMgRklMRSAtIGl0IGlzIHVzZWQg
Zm9yIG11bHRpcGxlIHpvbmVzLgotKzsgSW5zdGVhZCwgY29weSBpdCwgZWRpdCBuYW1lZC5jb25m
LCBhbmQgdXNlIHRoYXQgY29weS4KKys7IEJJTkQgcmVzZXJ2ZSBkYXRhIGZpbGUgZm9yIGJyb2Fk
Y2FzdCB6b25lCiArOwotKyRUVEwJODY0MDAKKyskVFRMCTYwNDgwMAogK0AJSU4JU09BCWxvY2Fs
aG9zdC4gcm9vdC5sb2NhbGhvc3QuICgKICsJCQkgICAgICAxCQk7IFNlcmlhbAogKwkJCSA2MDQ4
MDAJCTsgUmVmcmVzaAogKwkJCSAgODY0MDAJCTsgUmV0cnkKICsJCQkyNDE5MjAwCQk7IEV4cGly
ZQotKwkJCSAgODY0MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAorKwkJCSA2MDQ4MDAgKQk7IE5l
Z2F0aXZlIENhY2hlIFRUTAogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4KLWRpZmYgLXVyTiBiaW5k
LTkuMy4xLm9yaWcvY29uZi9kYi4yNTUgYmluZC05LjMuMS9jb25mL2RiLjI1NQotLS0tIGJpbmQt
OS4zLjEub3JpZy9jb25mL2RiLjI1NQkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEw
MAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi4yNTUJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAw
MDAgKzAyMDAKLUBAIC0wLDAgKzEsMTIgQEAKK2RpZmYgLS1naXQgYS9jb25mL2RiLmVtcHR5IGIv
Y29uZi9kYi5lbXB0eQorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjhhMTI4
NTgKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIuZW1wdHkKK0BAIC0wLDAgKzEsMTQgQEAK
Kys7IEJJTkQgcmV2ZXJzZSBkYXRhIGZpbGUgZm9yIGVtcHR5IHJmYzE5MTggem9uZQogKzsKLSs7
IEJJTkQgcmVzZXJ2ZSBkYXRhIGZpbGUgZm9yIGJyb2FkY2FzdCB6b25lCisrOyBETyBOT1QgRURJ
VCBUSElTIEZJTEUgLSBpdCBpcyB1c2VkIGZvciBtdWx0aXBsZSB6b25lcy4KKys7IEluc3RlYWQs
IGNvcHkgaXQsIGVkaXQgbmFtZWQuY29uZiwgYW5kIHVzZSB0aGF0IGNvcHkuCiArOwotKyRUVEwJ
NjA0ODAwCisrJFRUTAk4NjQwMAogK0AJSU4JU09BCWxvY2FsaG9zdC4gcm9vdC5sb2NhbGhvc3Qu
ICgKICsJCQkgICAgICAxCQk7IFNlcmlhbAogKwkJCSA2MDQ4MDAJCTsgUmVmcmVzaAogKwkJCSAg
ODY0MDAJCTsgUmV0cnkKICsJCQkyNDE5MjAwCQk7IEV4cGlyZQotKwkJCSA2MDQ4MDAgKQk7IE5l
Z2F0aXZlIENhY2hlIFRUTAorKwkJCSAgODY0MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAogKzsK
ICtACUlOCU5TCWxvY2FsaG9zdC4KLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5s
b2NhbCBiaW5kLTkuMy4xL2NvbmYvZGIubG9jYWwKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9k
Yi5sb2NhbAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4z
LjEvY29uZi9kYi5sb2NhbAkyMDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlm
ZiAtLWdpdCBhL2NvbmYvZGIubG9jYWwgYi9jb25mL2RiLmxvY2FsCituZXcgZmlsZSBtb2RlIDEw
MDY0NAoraW5kZXggMDAwMDAwMC4uNjZiNDg5MgorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9k
Yi5sb2NhbAogQEAgLTAsMCArMSwxMyBAQAogKzsKICs7IEJJTkQgZGF0YSBmaWxlIGZvciBsb2Nh
bCBsb29wYmFjayBpbnRlcmZhY2UKQEAgLTg4LDkgKzEyOCwxMSBAQCBkaWZmIC11ck4gYmluZC05
LjMuMS5vcmlnL2NvbmYvZGIubG9jYWwgYmluZC05LjMuMS9jb25mL2RiLmxvY2FsCiArOwogK0AJ
SU4JTlMJbG9jYWxob3N0LgogK0AJSU4JQQkxMjcuMC4wLjEKLWRpZmYgLXVyTiBiaW5kLTkuMy4x
Lm9yaWcvY29uZi9kYi5yb290IGJpbmQtOS4zLjEvY29uZi9kYi5yb290Ci0tLS0gYmluZC05LjMu
MS5vcmlnL2NvbmYvZGIucm9vdAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAot
KysrIGJpbmQtOS4zLjEvY29uZi9kYi5yb290CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAw
ICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9kYi5yb290IGIvY29uZi9kYi5yb290CituZXcgZmls
ZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uMDFjMjBmMAorLS0tIC9kZXYvbnVsbAorKysr
IGIvY29uZi9kYi5yb290CiBAQCAtMCwwICsxLDQ1IEBACiArCiArOyA8PD4+IERpRyA5LjIuMyA8
PD4+IG5zIC4gQGEucm9vdC1zZXJ2ZXJzLm5ldC4KQEAgLTEzNyw5ICsxNzksMTEgQEAgZGlmZiAt
dXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLnJvb3QgYmluZC05LjMuMS9jb25mL2RiLnJvb3QK
ICs7OyBXSEVOOiBTdW4gRmViICAxIDExOjI3OjE0IDIwMDQKICs7OyBNU0cgU0laRSAgcmN2ZDog
NDM2CiArCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZiBiaW5kLTku
My4xL2NvbmYvbmFtZWQuY29uZgotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYJ
MTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYv
bmFtZWQuY29uZgkyMDA1LTA3LTEwIDIyOjMzOjQ2LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdp
dCBhL2NvbmYvbmFtZWQuY29uZiBiL2NvbmYvbmFtZWQuY29uZgorbmV3IGZpbGUgbW9kZSAxMDA2
NDQKK2luZGV4IDAwMDAwMDAuLjk1ODI5Y2YKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvbmFt
ZWQuY29uZgogQEAgLTAsMCArMSw0OSBAQAogKy8vIFRoaXMgaXMgdGhlIHByaW1hcnkgY29uZmln
dXJhdGlvbiBmaWxlIGZvciB0aGUgQklORCBETlMgc2VydmVyIG5hbWVkLgogKy8vCkBAIC0xOTAs
OSArMjM0LDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mIGJp
bmQtOS4zLjEvY29uZi9uYW1lZC5jb25mCiArLy8gcm9vdC1kZWxlZ2F0aW9uLW9ubHkgZXhjbHVk
ZSB7ICJERSI7ICJNVVNFVU0iOyB9OwogKwogK2luY2x1ZGUgIi9ldGMvYmluZC9uYW1lZC5jb25m
LmxvY2FsIjsKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLmxvY2Fs
IGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLmxvY2FsCi0tLS0gYmluZC05LjMuMS5vcmlnL2Nv
bmYvbmFtZWQuY29uZi5sb2NhbAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAot
KysrIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLmxvY2FsCTIwMDUtMDctMTAgMjI6MTQ6MDYu
MDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9uYW1lZC5jb25mLmxvY2FsIGIvY29u
Zi9uYW1lZC5jb25mLmxvY2FsCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4u
N2E1N2IxMAorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9uYW1lZC5jb25mLmxvY2FsCiBAQCAt
MCwwICsxLDggQEAKICsvLwogKy8vIERvIGFueSBsb2NhbCBjb25maWd1cmF0aW9uIGhlcmUKQEAg
LTIwMiw5ICsyNDgsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNv
bmYubG9jYWwgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYubG9jYWwKICsvLyBvcmdhbml6YXRp
b24KICsvL2luY2x1ZGUgIi9ldGMvYmluZC96b25lcy5yZmMxOTE4IjsKICsKLWRpZmYgLXVyTiBi
aW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMgYmluZC05LjMuMS9jb25mL25h
bWVkLmNvbmYub3B0aW9ucwotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYub3B0
aW9ucwkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEv
Y29uZi9uYW1lZC5jb25mLm9wdGlvbnMJMjAwNS0wNy0xMCAyMjoxNDowNi4wMDAwMDAwMDAgKzAy
MDAKK2RpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYub3B0aW9ucyBiL2NvbmYvbmFtZWQuY29u
Zi5vcHRpb25zCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uODEzMTkzZAor
LS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMKIEBAIC0wLDAgKzEs
MjQgQEAKICtvcHRpb25zIHsKICsJZGlyZWN0b3J5ICIvdmFyL2NhY2hlL2JpbmQiOwpAQCAtMjMw
LDkgKzI3OCwxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5v
cHRpb25zIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLm9wdAogKwogK307CiArCi1kaWZmIC11
ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvem9uZXMucmZjMTkxOCBiaW5kLTkuMy4xL2NvbmYvem9u
ZXMucmZjMTkxOAotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL3pvbmVzLnJmYzE5MTgJMTk3MC0w
MS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvem9uZXMu
cmZjMTkxOAkyMDA1LTA3LTEwIDIyOjE0OjEwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBh
L2NvbmYvem9uZXMucmZjMTkxOCBiL2NvbmYvem9uZXMucmZjMTkxOAorbmV3IGZpbGUgbW9kZSAx
MDA2NDQKK2luZGV4IDAwMDAwMDAuLjAzYjU1NDYKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYv
em9uZXMucmZjMTkxOAogQEAgLTAsMCArMSwyMCBAQAogK3pvbmUgIjEwLmluLWFkZHIuYXJwYSIg
ICAgICB7IHR5cGUgbWFzdGVyOyBmaWxlICIvZXRjL2JpbmQvZGIuZW1wdHkiOyB9OwogKyAKQEAg
LTI1NCw5ICszMDQsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL3pvbmVzLnJm
YzE5MTggYmluZC05LjMuMS9jb25mL3pvbmVzLnJmYzE5MTgKICt6b25lICIzMS4xNzIuaW4tYWRk
ci5hcnBhIiAgeyB0eXBlIG1hc3RlcjsgZmlsZSAiL2V0Yy9iaW5kL2RiLmVtcHR5IjsgfTsKICsK
ICt6b25lICIxNjguMTkyLmluLWFkZHIuYXJwYSIgeyB0eXBlIG1hc3RlcjsgZmlsZSAiL2V0Yy9i
aW5kL2RiLmVtcHR5IjsgfTsKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvaW5pdC5kIGJpbmQt
OS4zLjEvaW5pdC5kCi0tLS0gYmluZC05LjMuMS5vcmlnL2luaXQuZAkxOTcwLTAxLTAxIDAxOjAw
OjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvaW5pdC5kCTIwMDUtMDctMTAgMjM6
MDk6NTguMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvaW5pdC5kIGIvaW5pdC5kCituZXcg
ZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uMmVmMjI3NworLS0tIC9kZXYvbnVsbAor
KysrIGIvaW5pdC5kCiBAQCAtMCwwICsxLDcwIEBACiArIyEvYmluL3NoCiArCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQt
Zm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKaW5k
ZXggMTFkYjk1ZWRlMS4uNDAwNDBiZThiMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApAQCAtMSwxNCArMSwxOCBAQAot
U3ViamVjdDogaW5pdC5kOiBhZGQgc3VwcG9ydCBmb3IgcmVhZC1vbmx5IHJvb3RmcworRnJvbSA5
Y2NiMGM5MzIyYjQ3Mzc0ZGFhYTEzYzc5MmViMGFmOTcwMzdkMzk3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgorRGF0ZTogVGh1
LCAyNyBNYXIgMjAxNCAwMjozNDo0MSArMDAwMAorU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFk
ZCBzdXBwb3J0IGZvciByZWFkLW9ubHkgcm9vdGZzCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbb2Ugc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4KKwogLS0tCi0gaW5pdC5kIHwgICA0MCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCisgaW5pdC5kIHwgNDAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCiAK
IGRpZmYgLS1naXQgYS9pbml0LmQgYi9pbml0LmQKLWluZGV4IDAxMTFlZDQuLjI0Njc3YzggMTAw
NjQ0CitpbmRleCAyZWYyMjc3Li45NWU4OTA5IDEwMDY0NAogLS0tIGEvaW5pdC5kCiArKysgYi9p
bml0LmQKIEBAIC02LDggKzYsNDggQEAgUEFUSD0vc2JpbjovYmluOi91c3Ivc2JpbjovdXNyL2Jp
bgpAQCAtNjAsNiArNjQsMyBAQCBpbmRleCAwMTExZWQ0Li4yNDY3N2M4IDEwMDY0NAogIHRlc3Qg
LXggL3Vzci9zYmluL3JuZGMgfHwgZXhpdCAwCiAgCiAgY2FzZSAiJDEiIGluCi0tLSAKLTEuNy45
LjUKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFr
ZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaAppbmRleCAx
NDZmM2UzNWRiLi41NTNmMGExNGZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0
b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLWJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2Jp
bmQgc3RvcCIgd29yaworRnJvbSBhYTE2MzQ5MGI5NjFiOGJhOWUwOTkxNDBjODllN2Y1Nzk3MDkz
NzI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3
aW5kcml2ZXIuY29tPgorRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAorU3Vi
amVjdDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKIAog
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogCkBAIC02LDE0
ICs5LDE1IEBAIEFkZCBzb21lIGNvbmZpZ3VyYXRpb25zLCBtYWtlIHJuZGMgY29tbWFuZCBiZSBh
YmxlIHRvIGNvbnRyb2xzCiB0aGUgbmFtZWQgZGFlbW9uLgogCiBTaWduZWQtb2ZmLWJ5OiBSb3kg
TGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CisKIC0tLQotIGNvbmYvbmFtZWQuY29uZiB8
ICAgIDUgKysrKysKLSBjb25mL3JuZGMuY29uZiAgfCAgICA1ICsrKysrCi0gMiBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQorIGNvbmYvbmFtZWQuY29uZiB8
IDUgKysrKysKKyBjb25mL3JuZGMuY29uZiAgfCA1ICsrKysrCisgMiBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvcm5kYy5jb25mCiAKIGRp
ZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYgYi9jb25mL25hbWVkLmNvbmYKLWluZGV4IDk1ODI5
Y2YuLmM4ODk5ZTcgMTAwNjQ0CitpbmRleCA5NTgyOWNmLi4wMjFkYmNhIDEwMDY0NAogLS0tIGEv
Y29uZi9uYW1lZC5jb25mCiArKysgYi9jb25mL25hbWVkLmNvbmYKIEBAIC00NywzICs0Nyw4IEBA
IHpvbmUgIjI1NS5pbi1hZGRyLmFycGEiIHsKQEAgLTI3LDcgKzMxLDcgQEAgaW5kZXggOTU4Mjlj
Zi4uYzg4OTllNyAxMDA2NDQKICt9OwogZGlmZiAtLWdpdCBhL2NvbmYvcm5kYy5jb25mIGIvY29u
Zi9ybmRjLmNvbmYKIG5ldyBmaWxlIG1vZGUgMTAwNjQ0Ci1pbmRleCAwMDAwMDAwLi5hMGI0ODFk
CitpbmRleCAwMDAwMDAwLi40YjQzYTNkCiAtLS0gL2Rldi9udWxsCiArKysgYi9jb25mL3JuZGMu
Y29uZgogQEAgLTAsMCArMSw1IEBACkBAIC0zNiw3ICs0MCwzIEBAIGluZGV4IDAwMDAwMDAuLmEw
YjQ4MWQKICsJZGVmYXVsdC1zZXJ2ZXIgIGxvY2FsaG9zdDsKICsJZGVmYXVsdC1rZXkgICAgIHJu
ZGMta2V5OwogK307Ci0KLS0tIAotMS43LjUuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjIxLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmRfOS4xOC4yNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjIxLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjI0LmJiCmluZGV4IGY1
ZmI0YmQxZTUuLjI4NzQ5OTAzMjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kXzkuMTguMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmRfOS4xOC4yNC5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8v
ZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNo
IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTU1NmJlMjI1MDVkOWVh
NGY5YzY3MTdhZWU5YzU0OTczOWM2ODQ5OGFmZjNjYTY5MDM1Nzg3ZWNjNjQ4ZmVjNSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3MDlkNzMwMjNjOTExNWRkYWQzYmFiNjViNmM4Yzc5YTU5MDE5NmQw
ZDExNGY1ZDBjYTI1MzNkYmQ1MmRkZjY2IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6
Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZp
c2libGUgYnkgMgotLSAKMi40Mi4wCgo=

--===============1238124274318838013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 13329080 to 13349408 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libbind9-9.18.21.so /usr/lib/.debug/libdns-9.18.21.so /usr/lib/.debug/libisc-9.18.21.so /usr/lib/.debug/libirs-9.18.21.so /usr/lib/.debug/libns-9.18.21.so /usr/lib/.debug/libisccc-9.18.21.so /usr/lib/.debug/libisccfg-9.18.21.so", added "/usr/lib/.debug/libbind9-9.18.24.so /usr/lib/.debug/libdns-9.18.24.so /usr/lib/.debug/libisc-9.18.24.so /usr/lib/.debug/libirs-9.18.24.so /usr/lib/.debug/libns-9.18.24.so /usr/lib/.debug/libisccc-9.18.24.so /usr/lib/.debug/libisccfg-9.18.24.so"
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1458404 to 1457787 (-0%)
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-libs: PKGSIZE changed from 3333608 to 3333768 (+0%)
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.21.so", added "/usr/lib/*-9.18.24.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libirs-9.18.21.so /usr/lib/libdns-9.18.21.so /usr/lib/libns-9.18.21.so /usr/lib/libisccfg-9.18.21.so /usr/lib/libisccc-9.18.21.so /usr/lib/libisc-9.18.21.so /usr/lib/libbind9-9.18.21.so", added "/usr/lib/libisc-9.18.24.so /usr/lib/libdns-9.18.24.so /usr/lib/libns-9.18.24.so /usr/lib/libbind9-9.18.24.so /usr/lib/libisccfg-9.18.24.so /usr/lib/libirs-9.18.24.so /usr/lib/libisccc-9.18.24.so"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9622747 to 9630613 (+0%)
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind-utils: PKGSIZE changed from 475376 to 475416 (+0%)
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.18.21" to "9.18.24"
packages/core2-64-poky-linux/bind: PKGV changed from 9.18.21 [default] to 9.18.24 [default]
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.21/bind-9.18.21.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.24/bind-9.18.24.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-64-poky-linux/bind: PV changed from "9.18.21" to "9.18.24"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.21.so to libbind9-9.18.24.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.21.so to libdns-9.18.24.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.21.so to libirs-9.18.24.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.21.so to libisccc-9.18.24.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.21.so to libisccfg-9.18.24.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.21.so to libisc-9.18.24.so
  /usr/lib/libns.so changed symlink target from libns-9.18.21.so to libns-9.18.24.so
  /usr/lib/libbind9-9.18.21.so moved to /usr/lib/libbind9-9.18.24.so
  /usr/lib/libdns-9.18.21.so moved to /usr/lib/libdns-9.18.24.so
  /usr/lib/libirs-9.18.21.so moved to /usr/lib/libirs-9.18.24.so
  /usr/lib/libisc-9.18.21.so moved to /usr/lib/libisc-9.18.24.so
  /usr/lib/libisccc-9.18.21.so moved to /usr/lib/libisccc-9.18.24.so
  /usr/lib/libisccfg-9.18.21.so moved to /usr/lib/libisccfg-9.18.24.so
  /usr/lib/libns-9.18.21.so moved to /usr/lib/libns-9.18.24.so

--===============1238124274318838013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libbind9-9.18.21.so /usr/lib/libdns-9.18.21.so /usr/lib/libirs-9.18.21.so /usr/lib/libisc-9.18.21.so /usr/lib/libisccfg-9.18.21.so /usr/lib/libisccc-9.18.21.so /usr/lib/libns-9.18.21.so", added "/usr/lib/libbind9-9.18.24.so /usr/lib/libirs-9.18.24.so /usr/lib/libisc-9.18.24.so /usr/lib/libisccfg-9.18.24.so /usr/lib/libdns-9.18.24.so /usr/lib/libisccc-9.18.24.so /usr/lib/libns-9.18.24.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.21.so to libbind9-9.18.24.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.21.so to libdns-9.18.24.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.21.so to libirs-9.18.24.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.21.so to libisccc-9.18.24.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.21.so to libisccfg-9.18.24.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.21.so to libisc-9.18.24.so
  /usr/lib/libns.so changed symlink target from libns-9.18.21.so to libns-9.18.24.so
  /usr/lib/libbind9-9.18.21.so moved to /usr/lib/libbind9-9.18.24.so
  /usr/lib/libdns-9.18.21.so moved to /usr/lib/libdns-9.18.24.so
  /usr/lib/libirs-9.18.21.so moved to /usr/lib/libirs-9.18.24.so
  /usr/lib/libisc-9.18.21.so moved to /usr/lib/libisc-9.18.24.so
  /usr/lib/libisccc-9.18.21.so moved to /usr/lib/libisccc-9.18.24.so
  /usr/lib/libisccfg-9.18.21.so moved to /usr/lib/libisccfg-9.18.24.so
  /usr/lib/libns-9.18.21.so moved to /usr/lib/libns-9.18.24.so

--===============1238124274318838013==--

