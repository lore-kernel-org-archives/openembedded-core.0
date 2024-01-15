Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C67C47DB0
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.88838.1705340028922522286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c6duUUpN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JoMDWRY2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d0e2fc46f-6dc1de8b-5cda-4dd7-b36a-85d9f5cb130c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340028;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=GD6MeS3Va9Jy3gcP7hl568xiEW/2CxJtRE+B7a2XIdg=;
	b=c6duUUpNiAcgVRoFyfbL94nstHM+NLCqgbrjZGlw8UYC7fzEQ8YpOwyTErspCUve
	KVam3JNDv3Zr67hKAXalEl7Pj7prW9xRcg3I2Z5Sil16zbyKQlpZMcH5V+4UdJwAuRo
	2EDXOKvgKsrgk/7tIAib4SPZsg6gBzT+/WSbxAqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340028;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=GD6MeS3Va9Jy3gcP7hl568xiEW/2CxJtRE+B7a2XIdg=;
	b=JoMDWRY24wGrUOtTSipyCqmnvK0KG8H2ZfgFM3ARgQjWBquh2JH2C1cx2R/AU1y2
	aGeH4IVJDX/1PlrwiapkPGj29RP6bxqv97J3aNQQc2oSeXFpv4SHQzE2Iy+ReVH/syu
	gPOiTBSX0bZUgEtXVxTQELPNAuVhbIWnLBC1kjjc=
Content-Type: multipart/mixed; boundary="===============1190946069135822878=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.21 SUCCEEDED
Message-ID: <0101018d0e2fc46f-6dc1de8b-5cda-4dd7-b36a-85d9f5cb130c-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193695

--===============1190946069135822878==
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
From b0293fca7b399fe8ef64d65a60378a0a07676169 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 05:10:59 +0000
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
index ec1bc7b567..f44b8541ce 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From a52c93887d3d846196d125014d0d37177da84115 Mon Sep 17 00:00:00 2001
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
index 4c10f33f04..77653440d1 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From cf2fec76742a86dbdb3da1cbd9ae7815b9cefad7 Mon Sep 17 00:00:00 2001
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
index f1abd179e8..2584fce995 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 246087f89e9434b726c7884e4c0964f71084f091 Mon Sep 17 00:00:00 2001
+From d1ed23fc64d8ee892d05235dd45dd42a1d88fb64 Mon Sep 17 00:00:00 2001
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
index aa3642acec..a624a9074c 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,44 @@
+From 23df7806f7b1557bbe1f66de0ef6bdef3b0794d2 Mon Sep 17 00:00:00 2001
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
index 11db95ede1..365f65f322 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,18 @@
-Subject: init.d: add support for read-only rootfs
+From 88875b05033b3fcee7676de15e71d243b5a66057 Mon Sep 17 00:00:00 2001
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
index 146f3e35db..3c01ab0f26 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From c20c3d32af5308422e8c73999d8617ccd32a42a5 Mon Sep 17 00:00:00 2001
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


--===============1190946069135822878==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.20-9.18.21.patch"

RnJvbSBiMDI5M2ZjYTdiMzk5ZmU4ZWY2NGQ2NWE2MDM3OGEwYTA3Njc2MTY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDU6MTA6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMTguMjAgLT4gOS4xOC4yMQoKLS0tCiAuLi4xLWF2b2lkLXN0YXJ0LWZh
aWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggfCAgIDggKy0KIC4uLmQtVi1hbmQtc3RhcnQtbG9n
LWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8ICAgNCArLQogLi4uY2hpbmctZm9yLWpzb24taGVh
ZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIHwgICA2ICstCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kL2NvbmYucGF0Y2ggfCAxMzggKysrKysrKysrKysrLS0tLS0tCiAuLi50LmQt
YWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggfCAgMTMgKy0KIC4uLi9iaW5k
L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICB8ICAyMCArLS0KIC4uLi9iaW5k
L3tiaW5kXzkuMTguMjAuYmIgPT4gYmluZF85LjE4LjIxLmJifSB8ICAgMiArLQogNyBmaWxlcyBj
aGFuZ2VkLCAxMjEgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzkuMTguMjAuYmIgPT4gYmluZF85LjE4LjIx
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13
aXRoLWJpbmQtdXNlci5wYXRjaAppbmRleCBlYzFiYzdiNTY3Li5mNDRiODU0MWNlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0
LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMWRkZTM1NjJmMjg3NDI5ZWVhOTRiNzcyNTBkMTg0
ODE4YjQ5MDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNTJjOTM4ODdkM2Q4NDYx
OTZkMTI1MDE0ZDBkMzcxNzdkYTg0MTE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
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
c3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAppbmRleCA0YzEwZjMzZjA0Li43NzY1
MzQ0MGQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8w
MDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdy
ZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDRlODMzOTJlODQwZmE3YjA1ZTc3ODcxMGI4YzIwMmQxMDI0NzdhMTMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNmMmZlYzc2NzQyYTg2ZGJkYjNkYTFjYmQ5YWU3ODE1
YjljZWZhZDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25n
eHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDI3IEF1ZyAyMDE4IDIxOjI0OjIwICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBuYW1lZC9sd3Jlc2QgLVYnIGFuZCBzdGFydCBsb2cgaGlk
ZSBidWlsZCBvcHRpb25zCkBAIC0yMSw3ICsyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1
c3RlciA8YWt1c3RlckBtdmlzdGEuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJl
LmFjCi1pbmRleCBiZjIwNjkwLi5jNWQzMzBmIDEwMDY0NAoraW5kZXggOTJmZTk4My4uOGYzZGY0
MiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMzUs
NyArMzUsNyBAQCBBQ19ERUZJTkUoW1BBQ0tBR0VfVkVSU0lPTl9FWFRSQV0sIFsiXVtiaW5kX1ZF
UlNJT05fRVhUUkFdWyJdLCBbQklORCA5IEV4dHJhIHBhcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29u
LWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVz
LXN5c3IucGF0Y2gKaW5kZXggZjFhYmQxNzllOC4uMjU4NGZjZTk5NSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZv
ci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVy
cy1zZWFyY2hlcy1zeXNyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNDYwODdmODllOTQz
NGI3MjZjNzg4NGU0YzA5NjRmNzEwODRmMDkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBkMWVkMjNmYzY0ZDhlZTg5MmQwNTIzNWRkNDVkZDQyYTFkODhmYjY0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUGF1bCBHb3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUdWUsIDkgSnVuIDIwMTUgMTE6MjI6MDAgLTA0MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYmluZDogZW5zdXJlIHNlYXJjaGluZyBmb3IganNvbiBoZWFkZXJzIHNlYXJjaGVzIHN5
c3Jvb3QKQEAgLTMzLDEwICszMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBQYXVsIEdvcnRtYWtlciA8
cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZp
Z3VyZS5hYwotaW5kZXggMTBlOGJmNi4uYmYyMDY5MCAxMDA2NDQKK2luZGV4IDJhYjhkZGQuLjky
ZmU5ODMgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAg
LTgxNCw3ICs4MTQsNyBAQCBBU19DQVNFKFskd2l0aF9sbWRiXSwKK0BAIC03NjEsNyArNzYxLDcg
QEAgQVNfQ0FTRShbJHdpdGhfbG1kYl0sCiAgCVtub10sW10sCiAgCVthdXRvfHllc10sIFtQS0df
Q0hFQ0tfTU9EVUxFUyhbTE1EQl0sIFtsbWRiXSwKICAJCQkJICAgICAgIFthY19saWJfbG1kYl9m
b3VuZD15ZXNdLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYu
cGF0Y2gKaW5kZXggYWEzNjQyYWNlYy4uYTYyNGE5MDc0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCkBAIC0xLDEyICsxLDQ0IEBACitGcm9t
IDIzZGY3ODA2ZjdiMTU1N2JiZTFmNjZkZTBlZjZiZGVmM2IwNzk0ZDIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNvbT4KK0RhdGU6IFR1ZSwg
MzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gYmluZDogYWRkIG5l
dyByZWNpcGUKKwogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9u
XQogCiB0aGUgcGF0Y2ggaXMgaW1wb3J0ZWQgZnJvbSBvcGVuZW1iZWRkZWQgcHJvamVjdAogCiAx
MS8zMC8yMDEwIC0gUWluZyBIZSA8cWluZy5oZUBpbnRlbC5jb20+CiAKLWRpZmYgLXVyTiBiaW5k
LTkuMy4xLm9yaWcvY29uZi9kYi4wIGJpbmQtOS4zLjEvY29uZi9kYi4wCi0tLS0gYmluZC05LjMu
MS5vcmlnL2NvbmYvZGIuMAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysr
IGJpbmQtOS4zLjEvY29uZi9kYi4wCTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAw
CistLS0KKyBjb25mL2RiLjAgICAgICAgICAgICAgICB8IDEyICsrKysrKysKKyBjb25mL2RiLjEy
NyAgICAgICAgICAgICB8IDEzICsrKysrKysrCisgY29uZi9kYi4yNTUgICAgICAgICAgICAgfCAx
MiArKysrKysrCisgY29uZi9kYi5lbXB0eSAgICAgICAgICAgfCAxNCArKysrKysrKysKKyBjb25m
L2RiLmxvY2FsICAgICAgICAgICB8IDEzICsrKysrKysrCisgY29uZi9kYi5yb290ICAgICAgICAg
ICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKworIGNvbmYvbmFtZWQuY29uZiAgICAg
ICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKKyBjb25mL25hbWVkLmNvbmYu
bG9jYWwgICB8ICA4ICsrKysrCisgY29uZi9uYW1lZC5jb25mLm9wdGlvbnMgfCAyNCArKysrKysr
KysrKysrKworIGNvbmYvem9uZXMucmZjMTkxOCAgICAgIHwgMjAgKysrKysrKysrKysrCisgaW5p
dC5kICAgICAgICAgICAgICAgICAgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKworIDExIGZpbGVzIGNoYW5nZWQsIDI4MCBpbnNlcnRpb25zKCspCisgY3JlYXRl
IG1vZGUgMTAwNjQ0IGNvbmYvZGIuMAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLjEyNwor
IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLjI1NQorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25m
L2RiLmVtcHR5CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIubG9jYWwKKyBjcmVhdGUgbW9k
ZSAxMDA2NDQgY29uZi9kYi5yb290CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvbmFtZWQuY29u
ZgorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL25hbWVkLmNvbmYubG9jYWwKKyBjcmVhdGUgbW9k
ZSAxMDA2NDQgY29uZi9uYW1lZC5jb25mLm9wdGlvbnMKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29u
Zi96b25lcy5yZmMxOTE4CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGluaXQuZAorCitkaWZmIC0tZ2l0
IGEvY29uZi9kYi4wIGIvY29uZi9kYi4wCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAw
MDAwMC4uZTNhYWJkYgorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi4wCiBAQCAtMCwwICsx
LDEyIEBACiArOwogKzsgQklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgYnJvYWRjYXN0IHpvbmUK
QEAgLTIwLDkgKzUyLDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4wIGJp
bmQtOS4zLjEvY29uZi9kYi4wCiArCQkJIDYwNDgwMCApCTsgTmVnYXRpdmUgQ2FjaGUgVFRMCiAr
OwogK0AJSU4JTlMJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2Ri
LjEyNyBiaW5kLTkuMy4xL2NvbmYvZGIuMTI3Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIu
MTI3CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9j
b25mL2RiLjEyNwkyMDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdp
dCBhL2NvbmYvZGIuMTI3IGIvY29uZi9kYi4xMjcKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRl
eCAwMDAwMDAwLi5jZDA1YmVmCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLjEyNwogQEAg
LTAsMCArMSwxMyBAQAogKzsKICs7IEJJTkQgcmV2ZXJzZSBkYXRhIGZpbGUgZm9yIGxvY2FsIGxv
b3BiYWNrIGludGVyZmFjZQpAQCAtMzcsNDMgKzcxLDQ5IEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4x
Lm9yaWcvY29uZi9kYi4xMjcgYmluZC05LjMuMS9jb25mL2RiLjEyNwogKzsKICtACUlOCU5TCWxv
Y2FsaG9zdC4KICsxLjAuMAlJTglQVFIJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQtOS4zLjEu
b3JpZy9jb25mL2RiLmVtcHR5IGJpbmQtOS4zLjEvY29uZi9kYi5lbXB0eQotLS0tIGJpbmQtOS4z
LjEub3JpZy9jb25mL2RiLmVtcHR5CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAw
Ci0rKysgYmluZC05LjMuMS9jb25mL2RiLmVtcHR5CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAw
MDAwICswMjAwCi1AQCAtMCwwICsxLDE0IEBACi0rOyBCSU5EIHJldmVyc2UgZGF0YSBmaWxlIGZv
ciBlbXB0eSByZmMxOTE4IHpvbmUKK2RpZmYgLS1naXQgYS9jb25mL2RiLjI1NSBiL2NvbmYvZGIu
MjU1CituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uMTZjZDgxOQorLS0tIC9k
ZXYvbnVsbAorKysrIGIvY29uZi9kYi4yNTUKK0BAIC0wLDAgKzEsMTIgQEAKICs7Ci0rOyBETyBO
T1QgRURJVCBUSElTIEZJTEUgLSBpdCBpcyB1c2VkIGZvciBtdWx0aXBsZSB6b25lcy4KLSs7IElu
c3RlYWQsIGNvcHkgaXQsIGVkaXQgbmFtZWQuY29uZiwgYW5kIHVzZSB0aGF0IGNvcHkuCisrOyBC
SU5EIHJlc2VydmUgZGF0YSBmaWxlIGZvciBicm9hZGNhc3Qgem9uZQogKzsKLSskVFRMCTg2NDAw
CisrJFRUTAk2MDQ4MDAKICtACUlOCVNPQQlsb2NhbGhvc3QuIHJvb3QubG9jYWxob3N0LiAoCiAr
CQkJICAgICAgMQkJOyBTZXJpYWwKICsJCQkgNjA0ODAwCQk7IFJlZnJlc2gKICsJCQkgIDg2NDAw
CQk7IFJldHJ5CiArCQkJMjQxOTIwMAkJOyBFeHBpcmUKLSsJCQkgIDg2NDAwICkJOyBOZWdhdGl2
ZSBDYWNoZSBUVEwKKysJCQkgNjA0ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKICs7CiArQAlJ
TglOUwlsb2NhbGhvc3QuCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMjU1IGJp
bmQtOS4zLjEvY29uZi9kYi4yNTUKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4yNTUJMTk3
MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIu
MjU1CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCi1AQCAtMCwwICsxLDEyIEBA
CitkaWZmIC0tZ2l0IGEvY29uZi9kYi5lbXB0eSBiL2NvbmYvZGIuZW1wdHkKK25ldyBmaWxlIG1v
ZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi44YTEyODU4CistLS0gL2Rldi9udWxsCisrKysgYi9j
b25mL2RiLmVtcHR5CitAQCAtMCwwICsxLDE0IEBACisrOyBCSU5EIHJldmVyc2UgZGF0YSBmaWxl
IGZvciBlbXB0eSByZmMxOTE4IHpvbmUKICs7Ci0rOyBCSU5EIHJlc2VydmUgZGF0YSBmaWxlIGZv
ciBicm9hZGNhc3Qgem9uZQorKzsgRE8gTk9UIEVESVQgVEhJUyBGSUxFIC0gaXQgaXMgdXNlZCBm
b3IgbXVsdGlwbGUgem9uZXMuCisrOyBJbnN0ZWFkLCBjb3B5IGl0LCBlZGl0IG5hbWVkLmNvbmYs
IGFuZCB1c2UgdGhhdCBjb3B5LgogKzsKLSskVFRMCTYwNDgwMAorKyRUVEwJODY0MDAKICtACUlO
CVNPQQlsb2NhbGhvc3QuIHJvb3QubG9jYWxob3N0LiAoCiArCQkJICAgICAgMQkJOyBTZXJpYWwK
ICsJCQkgNjA0ODAwCQk7IFJlZnJlc2gKICsJCQkgIDg2NDAwCQk7IFJldHJ5CiArCQkJMjQxOTIw
MAkJOyBFeHBpcmUKLSsJCQkgNjA0ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKKysJCQkgIDg2
NDAwICkJOyBOZWdhdGl2ZSBDYWNoZSBUVEwKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCi1kaWZm
IC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIubG9jYWwgYmluZC05LjMuMS9jb25mL2RiLmxv
Y2FsCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIubG9jYWwJMTk3MC0wMS0wMSAwMTowMDow
MC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIubG9jYWwJMjAwNS0wNy0x
MCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL2RiLmxvY2FsIGIv
Y29uZi9kYi5sb2NhbAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjY2YjQ4
OTIKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIubG9jYWwKIEBAIC0wLDAgKzEsMTMgQEAK
ICs7CiArOyBCSU5EIGRhdGEgZmlsZSBmb3IgbG9jYWwgbG9vcGJhY2sgaW50ZXJmYWNlCkBAIC04
OCw5ICsxMjgsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLmxvY2FsIGJp
bmQtOS4zLjEvY29uZi9kYi5sb2NhbAogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4KICtACUlOCUEJ
MTI3LjAuMC4xCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIucm9vdCBiaW5kLTku
My4xL2NvbmYvZGIucm9vdAotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLnJvb3QJMTk3MC0w
MS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIucm9v
dAkyMDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYv
ZGIucm9vdCBiL2NvbmYvZGIucm9vdAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAw
MDAuLjAxYzIwZjAKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIucm9vdAogQEAgLTAsMCAr
MSw0NSBAQAogKwogKzsgPDw+PiBEaUcgOS4yLjMgPDw+PiBucyAuIEBhLnJvb3Qtc2VydmVycy5u
ZXQuCkBAIC0xMzcsOSArMTc5LDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9k
Yi5yb290IGJpbmQtOS4zLjEvY29uZi9kYi5yb290CiArOzsgV0hFTjogU3VuIEZlYiAgMSAxMToy
NzoxNCAyMDA0CiArOzsgTVNHIFNJWkUgIHJjdmQ6IDQzNgogKwotZGlmZiAtdXJOIGJpbmQtOS4z
LjEub3JpZy9jb25mL25hbWVkLmNvbmYgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYKLS0tLSBi
aW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAw
MDAwICswMTAwCi0rKysgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYJMjAwNS0wNy0xMCAyMjoz
Mzo0Ni4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYgYi9jb25m
L25hbWVkLmNvbmYKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi45NTgyOWNm
CistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL25hbWVkLmNvbmYKIEBAIC0wLDAgKzEsNDkgQEAK
ICsvLyBUaGlzIGlzIHRoZSBwcmltYXJ5IGNvbmZpZ3VyYXRpb24gZmlsZSBmb3IgdGhlIEJJTkQg
RE5TIHNlcnZlciBuYW1lZC4KICsvLwpAQCAtMTkwLDkgKzIzNCwxMSBAQCBkaWZmIC11ck4gYmlu
ZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZiBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZgog
Ky8vIHJvb3QtZGVsZWdhdGlvbi1vbmx5IGV4Y2x1ZGUgeyAiREUiOyAiTVVTRVVNIjsgfTsKICsK
ICtpbmNsdWRlICIvZXRjL2JpbmQvbmFtZWQuY29uZi5sb2NhbCI7Ci1kaWZmIC11ck4gYmluZC05
LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29u
Zi5sb2NhbAotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYubG9jYWwJMTk3MC0w
MS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvbmFtZWQu
Y29uZi5sb2NhbAkyMDA1LTA3LTEwIDIyOjE0OjA2LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdp
dCBhL2NvbmYvbmFtZWQuY29uZi5sb2NhbCBiL2NvbmYvbmFtZWQuY29uZi5sb2NhbAorbmV3IGZp
bGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjdhNTdiMTAKKy0tLSAvZGV2L251bGwKKysr
KyBiL2NvbmYvbmFtZWQuY29uZi5sb2NhbAogQEAgLTAsMCArMSw4IEBACiArLy8KICsvLyBEbyBh
bnkgbG9jYWwgY29uZmlndXJhdGlvbiBoZXJlCkBAIC0yMDIsOSArMjQ4LDExIEBAIGRpZmYgLXVy
TiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLmxvY2FsIGJpbmQtOS4zLjEvY29uZi9u
YW1lZC5jb25mLmxvY2FsCiArLy8gb3JnYW5pemF0aW9uCiArLy9pbmNsdWRlICIvZXRjL2JpbmQv
em9uZXMucmZjMTkxOCI7CiArCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQu
Y29uZi5vcHRpb25zIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMKLS0tLSBiaW5k
LTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLm9wdGlvbnMJMTk3MC0wMS0wMSAwMTowMDowMC4w
MDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zCTIw
MDUtMDctMTAgMjI6MTQ6MDYuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEvY29uZi9uYW1l
ZC5jb25mLm9wdGlvbnMgYi9jb25mL25hbWVkLmNvbmYub3B0aW9ucworbmV3IGZpbGUgbW9kZSAx
MDA2NDQKK2luZGV4IDAwMDAwMDAuLjgxMzE5M2QKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYv
bmFtZWQuY29uZi5vcHRpb25zCiBAQCAtMCwwICsxLDI0IEBACiArb3B0aW9ucyB7CiArCWRpcmVj
dG9yeSAiL3Zhci9jYWNoZS9iaW5kIjsKQEAgLTIzMCw5ICsyNzgsMTEgQEAgZGlmZiAtdXJOIGJp
bmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYub3B0aW9ucyBiaW5kLTkuMy4xL2NvbmYvbmFt
ZWQuY29uZi5vcHQKICsKICt9OwogKwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL3pv
bmVzLnJmYzE5MTggYmluZC05LjMuMS9jb25mL3pvbmVzLnJmYzE5MTgKLS0tLSBiaW5kLTkuMy4x
Lm9yaWcvY29uZi96b25lcy5yZmMxOTE4CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICsw
MTAwCi0rKysgYmluZC05LjMuMS9jb25mL3pvbmVzLnJmYzE5MTgJMjAwNS0wNy0xMCAyMjoxNDox
MC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL3pvbmVzLnJmYzE5MTggYi9jb25m
L3pvbmVzLnJmYzE5MTgKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4wM2I1
NTQ2CistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL3pvbmVzLnJmYzE5MTgKIEBAIC0wLDAgKzEs
MjAgQEAKICt6b25lICIxMC5pbi1hZGRyLmFycGEiICAgICAgeyB0eXBlIG1hc3RlcjsgZmlsZSAi
L2V0Yy9iaW5kL2RiLmVtcHR5IjsgfTsKICsgCkBAIC0yNTQsOSArMzA0LDExIEBAIGRpZmYgLXVy
TiBiaW5kLTkuMy4xLm9yaWcvY29uZi96b25lcy5yZmMxOTE4IGJpbmQtOS4zLjEvY29uZi96b25l
cy5yZmMxOTE4CiArem9uZSAiMzEuMTcyLmluLWFkZHIuYXJwYSIgIHsgdHlwZSBtYXN0ZXI7IGZp
bGUgIi9ldGMvYmluZC9kYi5lbXB0eSI7IH07CiArCiArem9uZSAiMTY4LjE5Mi5pbi1hZGRyLmFy
cGEiIHsgdHlwZSBtYXN0ZXI7IGZpbGUgIi9ldGMvYmluZC9kYi5lbXB0eSI7IH07Ci1kaWZmIC11
ck4gYmluZC05LjMuMS5vcmlnL2luaXQuZCBiaW5kLTkuMy4xL2luaXQuZAotLS0tIGJpbmQtOS4z
LjEub3JpZy9pbml0LmQJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBi
aW5kLTkuMy4xL2luaXQuZAkyMDA1LTA3LTEwIDIzOjA5OjU4LjAwMDAwMDAwMCArMDIwMAorZGlm
ZiAtLWdpdCBhL2luaXQuZCBiL2luaXQuZAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAw
MDAwMDAuLjJlZjIyNzcKKy0tLSAvZGV2L251bGwKKysrKyBiL2luaXQuZAogQEAgLTAsMCArMSw3
MCBAQAogKyMhL2Jpbi9zaAogKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0
LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmluZGV4IDExZGI5NWVkZTEuLjM2NWY2NWYzMjIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1y
b290ZnMucGF0Y2gKQEAgLTEsMTQgKzEsMTggQEAKLVN1YmplY3Q6IGluaXQuZDogYWRkIHN1cHBv
cnQgZm9yIHJlYWQtb25seSByb290ZnMKK0Zyb20gODg4NzViMDUwMzNiM2ZjZWU3Njc2ZGUxNWU3
MWQyNDNiNWE2NjA1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENoZW4gUWkgPFFp
LkNoZW5Ad2luZHJpdmVyLmNvbT4KK0RhdGU6IFRodSwgMjcgTWFyIDIwMTQgMDI6MzQ6NDEgKzAw
MDAKK1N1YmplY3Q6IFtQQVRDSF0gaW5pdC5kOiBhZGQgc3VwcG9ydCBmb3IgcmVhZC1vbmx5IHJv
b3RmcwogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQogCiBT
aWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CisKIC0tLQotIGlu
aXQuZCB8ICAgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKworIGlu
aXQuZCB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKICAxIGZp
bGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvaW5pdC5kIGIvaW5p
dC5kCi1pbmRleCAwMTExZWQ0Li4yNDY3N2M4IDEwMDY0NAoraW5kZXggMmVmMjI3Ny4uOTVlODkw
OSAxMDA2NDQKIC0tLSBhL2luaXQuZAogKysrIGIvaW5pdC5kCiBAQCAtNiw4ICs2LDQ4IEBAIFBB
VEg9L3NiaW46L2JpbjovdXNyL3NiaW46L3Vzci9iaW4KQEAgLTYwLDYgKzY0LDMgQEAgaW5kZXgg
MDExMWVkNC4uMjQ2NzdjOCAxMDA2NDQKICB0ZXN0IC14IC91c3Ivc2Jpbi9ybmRjIHx8IGV4aXQg
MAogIAogIGNhc2UgIiQxIiBpbgotLS0gCi0xLjcuOS41Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3Jr
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5p
dGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKaW5kZXggMTQ2ZjNlMzVkYi4uM2MwMWFiMGYyNiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5p
dGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKQEAgLTEsNCArMSw3
IEBACi1iaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKK0Zyb20gYzIwYzNk
MzJhZjUzMDg0MjJlOGM3Mzk5OWQ4NjE3Y2NkMzJhNDJhNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KK0RhdGU6IFRodSwg
MTUgTm92IDIwMTIgMDI6Mjc6NTQgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gYmluZDogbWFrZSAi
L2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbY29uZmlndXJhdGlvbl0KIApAQCAtNiwxNCArOSwxNSBAQCBBZGQgc29tZSBjb25maWd1
cmF0aW9ucywgbWFrZSBybmRjIGNvbW1hbmQgYmUgYWJsZSB0byBjb250cm9scwogdGhlIG5hbWVk
IGRhZW1vbi4KIAogU2lnbmVkLW9mZi1ieTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIu
Y29tPgorCiAtLS0KLSBjb25mL25hbWVkLmNvbmYgfCAgICA1ICsrKysrCi0gY29uZi9ybmRjLmNv
bmYgIHwgICAgNSArKysrKwotIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMCBk
ZWxldGlvbnMoLSkKKyBjb25mL25hbWVkLmNvbmYgfCA1ICsrKysrCisgY29uZi9ybmRjLmNvbmYg
IHwgNSArKysrKworIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQogIGNyZWF0ZSBt
b2RlIDEwMDY0NCBjb25mL3JuZGMuY29uZgogCiBkaWZmIC0tZ2l0IGEvY29uZi9uYW1lZC5jb25m
IGIvY29uZi9uYW1lZC5jb25mCi1pbmRleCA5NTgyOWNmLi5jODg5OWU3IDEwMDY0NAoraW5kZXgg
OTU4MjljZi4uMDIxZGJjYSAxMDA2NDQKIC0tLSBhL2NvbmYvbmFtZWQuY29uZgogKysrIGIvY29u
Zi9uYW1lZC5jb25mCiBAQCAtNDcsMyArNDcsOCBAQCB6b25lICIyNTUuaW4tYWRkci5hcnBhIiB7
CkBAIC0yNyw3ICszMSw3IEBAIGluZGV4IDk1ODI5Y2YuLmM4ODk5ZTcgMTAwNjQ0CiArfTsKIGRp
ZmYgLS1naXQgYS9jb25mL3JuZGMuY29uZiBiL2NvbmYvcm5kYy5jb25mCiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAotaW5kZXggMDAwMDAwMC4uYTBiNDgxZAoraW5kZXggMDAwMDAwMC4uNGI0M2EzZAog
LS0tIC9kZXYvbnVsbAogKysrIGIvY29uZi9ybmRjLmNvbmYKIEBAIC0wLDAgKzEsNSBAQApAQCAt
MzYsNyArNDAsMyBAQCBpbmRleCAwMDAwMDAwLi5hMGI0ODFkCiArCWRlZmF1bHQtc2VydmVyICBs
b2NhbGhvc3Q7CiArCWRlZmF1bHQta2V5ICAgICBybmRjLWtleTsKICt9OwotCi0tLSAKLTEuNy41
LjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4x
OC4yMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMjEuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmRfOS4xOC4yMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmRfOS4xOC4yMS5iYgppbmRleCAxODc2ODVlZWY1Li5mNWZiNGJkMWU1IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjIwLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMjEuYmIKQEAgLTIw
LDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BW
fS8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYXZvaWQtc3Rh
cnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjRiODkxZWJmNThkM2YyYTdhYzNkZDI2ODI5OTBmNTI4YTM0NDhlYWEx
Yzk5MmRkYzVjMTQxYjg1ODdhOThlYzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTU1NmJlMjI1
MDVkOWVhNGY5YzY3MTdhZWU5YzU0OTczOWM2ODQ5OGFmZjNjYTY5MDM1Nzg3ZWNjNjQ4ZmVjNSIK
IAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIK
ICMgZm9sbG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDIuMAoK

--===============1190946069135822878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libirs-9.18.20.so /usr/lib/libisc-9.18.20.so /usr/lib/libisccfg-9.18.20.so /usr/lib/libbind9-9.18.20.so /usr/lib/libisccc-9.18.20.so /usr/lib/libns-9.18.20.so /usr/lib/libdns-9.18.20.so", added "/usr/lib/libbind9-9.18.21.so /usr/lib/libirs-9.18.21.so /usr/lib/libisc-9.18.21.so /usr/lib/libisccc-9.18.21.so /usr/lib/libns-9.18.21.so /usr/lib/libdns-9.18.21.so /usr/lib/libisccfg-9.18.21.so"
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

--===============1190946069135822878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.18.20.so /usr/lib/.debug/libisccfg-9.18.20.so /usr/lib/.debug/libirs-9.18.20.so /usr/lib/.debug/libns-9.18.20.so /usr/lib/.debug/libisc-9.18.20.so /usr/lib/.debug/libbind9-9.18.20.so /usr/lib/.debug/libisccc-9.18.20.so", added "/usr/lib/.debug/libisc-9.18.21.so /usr/lib/.debug/libirs-9.18.21.so /usr/lib/.debug/libdns-9.18.21.so /usr/lib/.debug/libbind9-9.18.21.so /usr/lib/.debug/libns-9.18.21.so /usr/lib/.debug/libisccfg-9.18.21.so /usr/lib/.debug/libisccc-9.18.21.so"
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 13326496 to 13328960 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1458450 to 1458404 (-0%)
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.18.20.so /usr/lib/libns-9.18.20.so /usr/lib/libisc-9.18.20.so /usr/lib/libdns-9.18.20.so /usr/lib/libirs-9.18.20.so /usr/lib/libbind9-9.18.20.so /usr/lib/libisccc-9.18.20.so", added "/usr/lib/libbind9-9.18.21.so /usr/lib/libisccc-9.18.21.so /usr/lib/libns-9.18.21.so /usr/lib/libirs-9.18.21.so /usr/lib/libisc-9.18.21.so /usr/lib/libdns-9.18.21.so /usr/lib/libisccfg-9.18.21.so"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.20.so", added "/usr/lib/*-9.18.21.so"
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9620333 to 9622747 (+0%)
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.18.20" to "9.18.21"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.20/bind-9.18.20.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.21/bind-9.18.21.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-64-poky-linux/bind: PKGV changed from 9.18.20 [default] to 9.18.21 [default]
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

--===============1190946069135822878==--

