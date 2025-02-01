Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7321C02198
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.42714.1738416048290413255
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZRuD3q2h;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QOe/1eKa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abc5ee-43abc7d6-58d2-4f78-99de-61b74ec9d274-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=klcpugBdO5KLLS5daBTedTsgAXDqZqpN65YXVaEA85I=;
	b=ZRuD3q2hKYlvSmG+I1hcbMcCEb4EWtduPlwCoMQkDLZ/sRjiAg3KfhVLjzaQog/b
	RjtkSvVcRSwae2bhHbXFEU75hwaarfyPSj7UvxHmKyGaimKCpwGDJpYsvxrQLOiD+Q7
	D+gybuytWajbNTrh2TPY/j/BoAHJ5B9ZQSqsvBHM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=klcpugBdO5KLLS5daBTedTsgAXDqZqpN65YXVaEA85I=;
	b=QOe/1eKanSEKsqDWk2PEI+2CFHTN1uroy0TG5EHSxz1QLlILb9U/LpUwdqXlKD4W
	Py7yEQWKEx92cUzHUq3f9PfgnOgL7BkKaaNOpvIg5XFiVjb3NJoeUJ7xS43Y2ZZTcyo
	pKbAeiyZDmG9mw1deA8yDl9EueVlgsZfFBafxzLM=
Content-Type: multipart/mixed; boundary="===============3270431218959796654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.5 SUCCEEDED
Message-ID: <01010194c1abc5ee-43abc7d6-58d2-4f78-99de-61b74ec9d274-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210519

--===============3270431218959796654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.4-9.20.5.patch
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
From 81862415da4669ef85601ddf87d7443313707174 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 06:46:03 +0000
Subject: [PATCH] bind: upgrade 9.20.4 -> 9.20.5

---
 ...1-avoid-start-failure-with-bind-user.patch |   7 +-
 ...d-V-and-start-log-hide-build-options.patch |   5 +-
 ...ching-for-json-headers-searches-sysr.patch |   4 +-
 .../recipes-connectivity/bind/bind/conf.patch | 137 ++++++++++++------
 ...t.d-add-support-for-read-only-rootfs.patch |  12 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  19 ++-
 .../bind/{bind_9.20.4.bb => bind_9.20.5.bb}   |   2 +-
 7 files changed, 116 insertions(+), 70 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.4.bb => bind_9.20.5.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index ec1bc7b567..0d670edda6 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From 0a45935f9d1207535f83df62ed52f358ed546bbe Mon Sep 17 00:00:00 2001
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
index 4c10f33f04..10b8caafbb 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From dd484b0bd58832fc241afdc8ea05693228348353 Mon Sep 17 00:00:00 2001
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
+index 13f9d7f..6516d0d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 2fa4ba1952..49b0a5eea1 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 0b3f9331639695300a1ec89e3020765ab1ef5e31 Mon Sep 17 00:00:00 2001
+From 9a06dbf831f012c6019237527d2bf1aa7a3a543a Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 865b4d0..a80b6ce 100644
+index 168a77a..13f9d7f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index aa3642acec..16ac510cfa 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,43 @@
+From 27d1113a4c378583e0fcff91d70256bdcd78de0b Mon Sep 17 00:00:00 2001
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
index 11db95ede1..baeeafe33e 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,17 @@
-Subject: init.d: add support for read-only rootfs
+From 1fa4d0eb9631771bd751f04ce898433580996e5e Mon Sep 17 00:00:00 2001
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
index 146f3e35db..93aa304126 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From 2ea2e4e502e5840d52e76461e071882cc65f1766 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-connectivity/bind/bind_9.20.4.bb b/meta/recipes-connectivity/bind/bind_9.20.5.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.4.bb
rename to meta/recipes-connectivity/bind/bind_9.20.5.bb
index d9ea440fbd..abd2da5249 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.5.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3a8e1a05e00e3e9bc02bdffded7862faf7726ba76ba997f42ab487777bd8210b"
+SRC_URI[sha256sum] = "19274fd739c023772b4212a0b6c201cf4364855fa7e6a7d3db49693f55db1ab8"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.44.1


--===============3270431218959796654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccfg-9.20.4.so /usr/lib/.debug/libdns-9.20.4.so /usr/lib/.debug/libns-9.20.4.so /usr/lib/.debug/libisccc-9.20.4.so /usr/lib/.debug/libisc-9.20.4.so", added "/usr/lib/.debug/libdns-9.20.5.so /usr/lib/.debug/libisc-9.20.5.so /usr/lib/.debug/libns-9.20.5.so /usr/lib/.debug/libisccfg-9.20.5.so /usr/lib/.debug/libisccc-9.20.5.so"
packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 15281888 to 15291368 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1582032 to 1584477 (+0%)
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.4.so", added "/usr/lib/*-9.20.5.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.4.so /usr/lib/libns-9.20.4.so /usr/lib/libisccc-9.20.4.so /usr/lib/libdns-9.20.4.so /usr/lib/libisc-9.20.4.so", added "/usr/lib/libisccfg-9.20.5.so /usr/lib/libisccc-9.20.5.so /usr/lib/libdns-9.20.5.so /usr/lib/libisc-9.20.5.so /usr/lib/libns-9.20.5.so"
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-libs: PKGSIZE changed from 3483088 to 3491152 (+0%)
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9966529 to 9972246 (+0%)
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind-utils: PKGSIZE changed from 479560 to 479512 (-0%)
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind/bind: PKGSIZE changed from 1312937 to 1312969 (+0%)
packages/core2-64-poky-linux/bind: PKGV changed from 9.20.4 [default] to 9.20.5 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.20.4" to "9.20.5"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.4/bind-9.20.4.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.5/bind-9.20.5.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.4.so to libdns-9.20.5.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.4.so to libisccc-9.20.5.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.4.so to libisccfg-9.20.5.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.4.so to libisc-9.20.5.so
  /usr/lib/libns.so changed symlink target from libns-9.20.4.so to libns-9.20.5.so
  /usr/lib/libdns-9.20.4.so moved to /usr/lib/libdns-9.20.5.so
  /usr/lib/libisc-9.20.4.so moved to /usr/lib/libisc-9.20.5.so
  /usr/lib/libisccc-9.20.4.so moved to /usr/lib/libisccc-9.20.5.so
  /usr/lib/libisccfg-9.20.4.so moved to /usr/lib/libisccfg-9.20.5.so
  /usr/lib/libns-9.20.4.so moved to /usr/lib/libns-9.20.5.so

--===============3270431218959796654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.4.so /usr/lib/libisccfg-9.20.4.so /usr/lib/libisc-9.20.4.so /usr/lib/libisccc-9.20.4.so /usr/lib/libns-9.20.4.so", added "/usr/lib/libdns-9.20.5.so /usr/lib/libisc-9.20.5.so /usr/lib/libisccc-9.20.5.so /usr/lib/libns-9.20.5.so /usr/lib/libisccfg-9.20.5.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.4.so to libdns-9.20.5.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.4.so to libisccc-9.20.5.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.4.so to libisccfg-9.20.5.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.4.so to libisc-9.20.5.so
  /usr/lib/libns.so changed symlink target from libns-9.20.4.so to libns-9.20.5.so
  /usr/lib/libdns-9.20.4.so moved to /usr/lib/libdns-9.20.5.so
  /usr/lib/libisc-9.20.4.so moved to /usr/lib/libisc-9.20.5.so
  /usr/lib/libisccc-9.20.4.so moved to /usr/lib/libisccc-9.20.5.so
  /usr/lib/libisccfg-9.20.4.so moved to /usr/lib/libisccfg-9.20.5.so
  /usr/lib/libns-9.20.4.so moved to /usr/lib/libns-9.20.5.so

--===============3270431218959796654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.4-9.20.5.patch"

RnJvbSA4MTg2MjQxNWRhNDY2OWVmODU2MDFkZGY4N2Q3NDQzMzEzNzA3MTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNjo0NjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4yMC40IC0+IDkuMjAuNQoKLS0tCiAuLi4xLWF2b2lkLXN0YXJ0LWZhaWx1
cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggfCAgIDcgKy0KIC4uLmQtVi1hbmQtc3RhcnQtbG9nLWhp
ZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCB8ICAgNSArLQogLi4uY2hpbmctZm9yLWpzb24taGVhZGVy
cy1zZWFyY2hlcy1zeXNyLnBhdGNoIHwgICA0ICstCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2NvbmYucGF0Y2ggfCAxMzcgKysrKysrKysrKysrLS0tLS0tCiAuLi50LmQtYWRk
LXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggfCAgMTIgKy0KIC4uLi9iaW5kL21h
a2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoICB8ICAxOSArKy0KIC4uLi9iaW5kL3ti
aW5kXzkuMjAuNC5iYiA9PiBiaW5kXzkuMjAuNS5iYn0gICB8ICAgMiArLQogNyBmaWxlcyBjaGFu
Z2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzkuMjAuNC5iYiA9PiBiaW5kXzkuMjAuNS5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8w
MDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1i
aW5kLXVzZXIucGF0Y2gKaW5kZXggZWMxYmM3YjU2Ny4uMGQ2NzBlZGRhNiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWls
dXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMzFkZGUzNTYyZjI4NzQyOWVlYTk0Yjc3MjUwZDE4NDgxOGI0
OTA2MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGE0NTkzNWY5ZDEyMDc1MzVmODNk
ZjYyZWQ1MmYzNThlZDU0NmJiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4g
UWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6NTU6
MDkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXZvaWQgc3RhcnQgZmFpbHVyZSB3aXRoIGJpbmQg
dXNlcgpAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdp
bmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1n
aXQgYS9pbml0LmQgYi9pbml0LmQKLWluZGV4IGIyZWVjNjAuLjZlMDM5MzYgMTAwNjQ0CitpbmRl
eCA5NWU4OTA5Li43NzFkMzQ5IDEwMDY0NAogLS0tIGEvaW5pdC5kCiArKysgYi9pbml0LmQKIEBA
IC01Nyw2ICs1Nyw3IEBAIGNhc2UgIiQxIiBpbgpAQCAtMjIsNiArMjIsMyBAQCBpbmRleCBiMmVl
YzYwLi42ZTAzOTM2IDEwMDY0NAogIAkgICAgY2htb2QgMDY0MCAvZXRjL2JpbmQvcm5kYy5rZXkK
ICAJZmkKICAJaWYgWyAtZiAvdmFyL3J1bi9uYW1lZC9uYW1lZC5waWQgXTsgdGhlbgotLS0gCi0y
LjcuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8w
MDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2Qt
Vi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAppbmRleCA0YzEwZjMzZjA0
Li4xMGI4Y2FhZmJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25z
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFt
ZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDRlODMzOTJlODQwZmE3YjA1ZTc3ODcxMGI4YzIwMmQxMDI0NzdhMTMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRkNDg0YjBiZDU4ODMyZmMyNDFhZmRjOGVh
MDU2OTMyMjgzNDgzNTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDI3IEF1ZyAyMDE4IDIxOjI0
OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGBuYW1lZC9sd3Jlc2QgLVYnIGFuZCBzdGFydCBs
b2cgaGlkZSBidWlsZCBvcHRpb25zCkBAIC0xNSwxMyArMTUsMTIgQEAgU2lnbmVkLW9mZi1ieTog
SG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogCiBSZWZyZXNoZWQgZm9yIDku
MTYuMAogU2lnbmVkLW9mZi1ieTogQXJtaW4gS3VzdGVyIDxha3VzdGVyQG12aXN0YS5jb20+Ci0K
IC0tLQogIGNvbmZpZ3VyZS5hYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3Vy
ZS5hYwotaW5kZXggYmYyMDY5MC4uYzVkMzMwZiAxMDA2NDQKK2luZGV4IDEzZjlkN2YuLjY1MTZk
MGQgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTM1
LDcgKzM1LDcgQEAgQUNfREVGSU5FKFtQQUNLQUdFX1ZFUlNJT05fRVhUUkFdLCBbIl1bYmluZF9W
RVJTSU9OX0VYVFJBXVsiXSwgW0JJTkQgOSBFeHRyYSBwYXIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNv
bi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hl
cy1zeXNyLnBhdGNoCmluZGV4IDJmYTRiYTE5NTIuLjQ5YjBhNWVlYTEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1m
b3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRl
cnMtc2VhcmNoZXMtc3lzci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGIzZjkzMzE2Mzk2
OTUzMDBhMWVjODllMzAyMDc2NWFiMWVmNWUzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOWEwNmRiZjgzMWYwMTJjNjAxOTIzNzUyN2QyYmYxYWE3YTNhNTQzYSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2
ZXIuY29tPgogRGF0ZTogVHVlLCA5IEp1biAyMDE1IDExOjIyOjAwIC0wNDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGJpbmQ6IGVuc3VyZSBzZWFyY2hpbmcgZm9yIGpzb24gaGVhZGVycyBzZWFyY2hlcyBz
eXNyb290CkBAIC0zMiw3ICszMiw3IEBAIFNpZ25lZC1vZmYtYnk6IFBhdWwgR29ydG1ha2VyIDxw
YXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCi1pbmRleCA4NjViNGQwLi5hODBiNmNlIDEwMDY0NAoraW5kZXggMTY4YTc3YS4uMTNm
OWQ3ZiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAt
ODYzLDcgKzg2Myw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJdLApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKaW5kZXggYWEzNjQyYWNlYy4uMTZhYzUx
MGNmYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29u
Zi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBh
dGNoCkBAIC0xLDEyICsxLDQzIEBACitGcm9tIDI3ZDExMTNhNGMzNzg1ODNlMGZjZmY5MWQ3MDI1
NmJkY2Q3OGRlMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBRaW5nIEhlIDxxaW5n
LmhlQGludGVsLmNvbT4KK0RhdGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKK1N1
YmplY3Q6IFtQQVRDSF0gYmluZDogYWRkIG5ldyByZWNpcGUKKwogVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogCiB0aGUgcGF0Y2ggaXMgaW1wb3J0ZWQgZnJv
bSBvcGVuZW1iZWRkZWQgcHJvamVjdAogCiAxMS8zMC8yMDEwIC0gUWluZyBIZSA8cWluZy5oZUBp
bnRlbC5jb20+CistLS0KKyBjb25mL2RiLjAgICAgICAgICAgICAgICB8IDEyICsrKysrKysKKyBj
b25mL2RiLjEyNyAgICAgICAgICAgICB8IDEzICsrKysrKysrCisgY29uZi9kYi4yNTUgICAgICAg
ICAgICAgfCAxMiArKysrKysrCisgY29uZi9kYi5lbXB0eSAgICAgICAgICAgfCAxNCArKysrKysr
KysKKyBjb25mL2RiLmxvY2FsICAgICAgICAgICB8IDEzICsrKysrKysrCisgY29uZi9kYi5yb290
ICAgICAgICAgICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKworIGNvbmYvbmFtZWQu
Y29uZiAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKKyBjb25mL25h
bWVkLmNvbmYubG9jYWwgICB8ICA4ICsrKysrCisgY29uZi9uYW1lZC5jb25mLm9wdGlvbnMgfCAy
NCArKysrKysrKysrKysrKworIGNvbmYvem9uZXMucmZjMTkxOCAgICAgIHwgMjAgKysrKysrKysr
KysrCisgaW5pdC5kICAgICAgICAgICAgICAgICAgfCA3MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKworIDExIGZpbGVzIGNoYW5nZWQsIDI4MCBpbnNlcnRpb25zKCsp
CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIuMAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25m
L2RiLjEyNworIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLjI1NQorIGNyZWF0ZSBtb2RlIDEw
MDY0NCBjb25mL2RiLmVtcHR5CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvZGIubG9jYWwKKyBj
cmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi5yb290CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYv
bmFtZWQuY29uZgorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL25hbWVkLmNvbmYubG9jYWwKKyBj
cmVhdGUgbW9kZSAxMDA2NDQgY29uZi9uYW1lZC5jb25mLm9wdGlvbnMKKyBjcmVhdGUgbW9kZSAx
MDA2NDQgY29uZi96b25lcy5yZmMxOTE4CisgY3JlYXRlIG1vZGUgMTAwNjQ0IGluaXQuZAogCi1k
aWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMCBiaW5kLTkuMy4xL2NvbmYvZGIuMAot
LS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjAJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAw
MDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIuMAkyMDA1LTA3LTEwIDIyOjE0OjAwLjAw
MDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvZGIuMCBiL2NvbmYvZGIuMAorbmV3IGZp
bGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLmUzYWFiZGIKKy0tLSAvZGV2L251bGwKKysr
KyBiL2NvbmYvZGIuMAogQEAgLTAsMCArMSwxMiBAQAogKzsKICs7IEJJTkQgcmV2ZXJzZSBkYXRh
IGZpbGUgZm9yIGJyb2FkY2FzdCB6b25lCkBAIC0yMCw5ICs1MSwxMSBAQCBkaWZmIC11ck4gYmlu
ZC05LjMuMS5vcmlnL2NvbmYvZGIuMCBiaW5kLTkuMy4xL2NvbmYvZGIuMAogKwkJCSA2MDQ4MDAg
KQk7IE5lZ2F0aXZlIENhY2hlIFRUTAogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4KLWRpZmYgLXVy
TiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4xMjcgYmluZC05LjMuMS9jb25mL2RiLjEyNwotLS0t
IGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjEyNwkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAw
MCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi4xMjcJMjAwNS0wNy0xMCAyMjoxNDowMC4w
MDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL2RiLjEyNyBiL2NvbmYvZGIuMTI3Citu
ZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uY2QwNWJlZgorLS0tIC9kZXYvbnVs
bAorKysrIGIvY29uZi9kYi4xMjcKIEBAIC0wLDAgKzEsMTMgQEAKICs7CiArOyBCSU5EIHJldmVy
c2UgZGF0YSBmaWxlIGZvciBsb2NhbCBsb29wYmFjayBpbnRlcmZhY2UKQEAgLTM3LDQzICs3MCw0
OSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIuMTI3IGJpbmQtOS4zLjEvY29u
Zi9kYi4xMjcKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCiArMS4wLjAJSU4JUFRSCWxvY2FsaG9z
dC4KLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5lbXB0eSBiaW5kLTkuMy4xL2Nv
bmYvZGIuZW1wdHkKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5lbXB0eQkxOTcwLTAxLTAx
IDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi5lbXB0eQky
MDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAotQEAgLTAsMCArMSwxNCBAQAotKzsg
QklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgZW1wdHkgcmZjMTkxOCB6b25lCitkaWZmIC0tZ2l0
IGEvY29uZi9kYi4yNTUgYi9jb25mL2RiLjI1NQorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4
IDAwMDAwMDAuLjE2Y2Q4MTkKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIuMjU1CitAQCAt
MCwwICsxLDEyIEBACiArOwotKzsgRE8gTk9UIEVESVQgVEhJUyBGSUxFIC0gaXQgaXMgdXNlZCBm
b3IgbXVsdGlwbGUgem9uZXMuCi0rOyBJbnN0ZWFkLCBjb3B5IGl0LCBlZGl0IG5hbWVkLmNvbmYs
IGFuZCB1c2UgdGhhdCBjb3B5LgorKzsgQklORCByZXNlcnZlIGRhdGEgZmlsZSBmb3IgYnJvYWRj
YXN0IHpvbmUKICs7Ci0rJFRUTAk4NjQwMAorKyRUVEwJNjA0ODAwCiArQAlJTglTT0EJbG9jYWxo
b3N0LiByb290LmxvY2FsaG9zdC4gKAogKwkJCSAgICAgIDEJCTsgU2VyaWFsCiArCQkJIDYwNDgw
MAkJOyBSZWZyZXNoCiArCQkJICA4NjQwMAkJOyBSZXRyeQogKwkJCTI0MTkyMDAJCTsgRXhwaXJl
Ci0rCQkJICA4NjQwMCApCTsgTmVnYXRpdmUgQ2FjaGUgVFRMCisrCQkJIDYwNDgwMCApCTsgTmVn
YXRpdmUgQ2FjaGUgVFRMCiArOwogK0AJSU4JTlMJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQt
OS4zLjEub3JpZy9jb25mL2RiLjI1NSBiaW5kLTkuMy4xL2NvbmYvZGIuMjU1Ci0tLS0gYmluZC05
LjMuMS5vcmlnL2NvbmYvZGIuMjU1CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAw
Ci0rKysgYmluZC05LjMuMS9jb25mL2RiLjI1NQkyMDA1LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAw
MCArMDIwMAotQEAgLTAsMCArMSwxMiBAQAorZGlmZiAtLWdpdCBhL2NvbmYvZGIuZW1wdHkgYi9j
b25mL2RiLmVtcHR5CituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uOGExMjg1
OAorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi5lbXB0eQorQEAgLTAsMCArMSwxNCBAQAor
KzsgQklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgZW1wdHkgcmZjMTkxOCB6b25lCiArOwotKzsg
QklORCByZXNlcnZlIGRhdGEgZmlsZSBmb3IgYnJvYWRjYXN0IHpvbmUKKys7IERPIE5PVCBFRElU
IFRISVMgRklMRSAtIGl0IGlzIHVzZWQgZm9yIG11bHRpcGxlIHpvbmVzLgorKzsgSW5zdGVhZCwg
Y29weSBpdCwgZWRpdCBuYW1lZC5jb25mLCBhbmQgdXNlIHRoYXQgY29weS4KICs7Ci0rJFRUTAk2
MDQ4MDAKKyskVFRMCTg2NDAwCiArQAlJTglTT0EJbG9jYWxob3N0LiByb290LmxvY2FsaG9zdC4g
KAogKwkJCSAgICAgIDEJCTsgU2VyaWFsCiArCQkJIDYwNDgwMAkJOyBSZWZyZXNoCiArCQkJICA4
NjQwMAkJOyBSZXRyeQogKwkJCTI0MTkyMDAJCTsgRXhwaXJlCi0rCQkJIDYwNDgwMCApCTsgTmVn
YXRpdmUgQ2FjaGUgVFRMCisrCQkJICA4NjQwMCApCTsgTmVnYXRpdmUgQ2FjaGUgVFRMCiArOwog
K0AJSU4JTlMJbG9jYWxob3N0LgotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLmxv
Y2FsIGJpbmQtOS4zLjEvY29uZi9kYi5sb2NhbAotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2Ri
LmxvY2FsCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMu
MS9jb25mL2RiLmxvY2FsCTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCitkaWZm
IC0tZ2l0IGEvY29uZi9kYi5sb2NhbCBiL2NvbmYvZGIubG9jYWwKK25ldyBmaWxlIG1vZGUgMTAw
NjQ0CitpbmRleCAwMDAwMDAwLi42NmI0ODkyCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL2Ri
LmxvY2FsCiBAQCAtMCwwICsxLDEzIEBACiArOwogKzsgQklORCBkYXRhIGZpbGUgZm9yIGxvY2Fs
IGxvb3BiYWNrIGludGVyZmFjZQpAQCAtODgsOSArMTI3LDExIEBAIGRpZmYgLXVyTiBiaW5kLTku
My4xLm9yaWcvY29uZi9kYi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvZGIubG9jYWwKICs7CiArQAlJ
TglOUwlsb2NhbGhvc3QuCiArQAlJTglBCTEyNy4wLjAuMQotZGlmZiAtdXJOIGJpbmQtOS4zLjEu
b3JpZy9jb25mL2RiLnJvb3QgYmluZC05LjMuMS9jb25mL2RiLnJvb3QKLS0tLSBiaW5kLTkuMy4x
Lm9yaWcvY29uZi9kYi5yb290CTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0r
KysgYmluZC05LjMuMS9jb25mL2RiLnJvb3QJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAg
KzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL2RiLnJvb3QgYi9jb25mL2RiLnJvb3QKK25ldyBmaWxl
IG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4wMWMyMGYwCistLS0gL2Rldi9udWxsCisrKysg
Yi9jb25mL2RiLnJvb3QKIEBAIC0wLDAgKzEsNDUgQEAKICsKICs7IDw8Pj4gRGlHIDkuMi4zIDw8
Pj4gbnMgLiBAYS5yb290LXNlcnZlcnMubmV0LgpAQCAtMTM3LDkgKzE3OCwxMSBAQCBkaWZmIC11
ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIucm9vdCBiaW5kLTkuMy4xL2NvbmYvZGIucm9vdAog
Kzs7IFdIRU46IFN1biBGZWIgIDEgMTE6Mjc6MTQgMjAwNAogKzs7IE1TRyBTSVpFICByY3ZkOiA0
MzYKICsKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mIGJpbmQtOS4z
LjEvY29uZi9uYW1lZC5jb25mCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZgkx
OTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9u
YW1lZC5jb25mCTIwMDUtMDctMTAgMjI6MzM6NDYuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0
IGEvY29uZi9uYW1lZC5jb25mIGIvY29uZi9uYW1lZC5jb25mCituZXcgZmlsZSBtb2RlIDEwMDY0
NAoraW5kZXggMDAwMDAwMC4uOTU4MjljZgorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9uYW1l
ZC5jb25mCiBAQCAtMCwwICsxLDQ5IEBACiArLy8gVGhpcyBpcyB0aGUgcHJpbWFyeSBjb25maWd1
cmF0aW9uIGZpbGUgZm9yIHRoZSBCSU5EIEROUyBzZXJ2ZXIgbmFtZWQuCiArLy8KQEAgLTE5MCw5
ICsyMzMsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYgYmlu
ZC05LjMuMS9jb25mL25hbWVkLmNvbmYKICsvLyByb290LWRlbGVnYXRpb24tb25seSBleGNsdWRl
IHsgIkRFIjsgIk1VU0VVTSI7IH07CiArCiAraW5jbHVkZSAiL2V0Yy9iaW5kL25hbWVkLmNvbmYu
bG9jYWwiOwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYubG9jYWwg
YmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYubG9jYWwKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29u
Zi9uYW1lZC5jb25mLmxvY2FsCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0r
KysgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYubG9jYWwJMjAwNS0wNy0xMCAyMjoxNDowNi4w
MDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25mL25hbWVkLmNvbmYubG9jYWwgYi9jb25m
L25hbWVkLmNvbmYubG9jYWwKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi43
YTU3YjEwCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL25hbWVkLmNvbmYubG9jYWwKIEBAIC0w
LDAgKzEsOCBAQAogKy8vCiArLy8gRG8gYW55IGxvY2FsIGNvbmZpZ3VyYXRpb24gaGVyZQpAQCAt
MjAyLDkgKzI0NywxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29u
Zi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZi5sb2NhbAogKy8vIG9yZ2FuaXphdGlv
bgogKy8vaW5jbHVkZSAiL2V0Yy9iaW5kL3pvbmVzLnJmYzE5MTgiOwogKwotZGlmZiAtdXJOIGJp
bmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYub3B0aW9ucyBiaW5kLTkuMy4xL2NvbmYvbmFt
ZWQuY29uZi5vcHRpb25zCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5vcHRp
b25zCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9j
b25mL25hbWVkLmNvbmYub3B0aW9ucwkyMDA1LTA3LTEwIDIyOjE0OjA2LjAwMDAwMDAwMCArMDIw
MAorZGlmZiAtLWdpdCBhL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zIGIvY29uZi9uYW1lZC5jb25m
Lm9wdGlvbnMKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi44MTMxOTNkCist
LS0gL2Rldi9udWxsCisrKysgYi9jb25mL25hbWVkLmNvbmYub3B0aW9ucwogQEAgLTAsMCArMSwy
NCBAQAogK29wdGlvbnMgewogKwlkaXJlY3RvcnkgIi92YXIvY2FjaGUvYmluZCI7CkBAIC0yMzAs
OSArMjc3LDExIEBAIGRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLm9w
dGlvbnMgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYub3B0CiArCiArfTsKICsKLWRpZmYgLXVy
TiBiaW5kLTkuMy4xLm9yaWcvY29uZi96b25lcy5yZmMxOTE4IGJpbmQtOS4zLjEvY29uZi96b25l
cy5yZmMxOTE4Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvem9uZXMucmZjMTkxOAkxOTcwLTAx
LTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi96b25lcy5y
ZmMxOTE4CTIwMDUtMDctMTAgMjI6MTQ6MTAuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEv
Y29uZi96b25lcy5yZmMxOTE4IGIvY29uZi96b25lcy5yZmMxOTE4CituZXcgZmlsZSBtb2RlIDEw
MDY0NAoraW5kZXggMDAwMDAwMC4uMDNiNTU0NgorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi96
b25lcy5yZmMxOTE4CiBAQCAtMCwwICsxLDIwIEBACiArem9uZSAiMTAuaW4tYWRkci5hcnBhIiAg
ICAgIHsgdHlwZSBtYXN0ZXI7IGZpbGUgIi9ldGMvYmluZC9kYi5lbXB0eSI7IH07CiArIApAQCAt
MjU0LDkgKzMwMywxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvem9uZXMucmZj
MTkxOCBiaW5kLTkuMy4xL2NvbmYvem9uZXMucmZjMTkxOAogK3pvbmUgIjMxLjE3Mi5pbi1hZGRy
LmFycGEiICB7IHR5cGUgbWFzdGVyOyBmaWxlICIvZXRjL2JpbmQvZGIuZW1wdHkiOyB9OwogKwog
K3pvbmUgIjE2OC4xOTIuaW4tYWRkci5hcnBhIiB7IHR5cGUgbWFzdGVyOyBmaWxlICIvZXRjL2Jp
bmQvZGIuZW1wdHkiOyB9OwotZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9pbml0LmQgYmluZC05
LjMuMS9pbml0LmQKLS0tLSBiaW5kLTkuMy4xLm9yaWcvaW5pdC5kCTE5NzAtMDEtMDEgMDE6MDA6
MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05LjMuMS9pbml0LmQJMjAwNS0wNy0xMCAyMzow
OTo1OC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9pbml0LmQgYi9pbml0LmQKK25ldyBm
aWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4yZWYyMjc3CistLS0gL2Rldi9udWxsCisr
KysgYi9pbml0LmQKIEBAIC0wLDAgKzEsNzAgQEAKICsjIS9iaW4vc2gKICsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1m
b3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRl
eCAxMWRiOTVlZGUxLi5iYWVlYWZlMzNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCkBAIC0xLDE0ICsxLDE3IEBACi1T
dWJqZWN0OiBpbml0LmQ6IGFkZCBzdXBwb3J0IGZvciByZWFkLW9ubHkgcm9vdGZzCitGcm9tIDFm
YTRkMGViOTYzMTc3MWJkNzUxZjA0Y2U4OTg0MzM1ODA5OTZlNWUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CitEYXRlOiBUaHUs
IDI3IE1hciAyMDE0IDAyOjM0OjQxICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIGluaXQuZDogYWRk
IHN1cHBvcnQgZm9yIHJlYWQtb25seSByb290ZnMKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJv
cHJpYXRlIFtvZSBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPgogLS0tCi0gaW5pdC5kIHwgICA0MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCisgaW5pdC5kIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCiAKIGRp
ZmYgLS1naXQgYS9pbml0LmQgYi9pbml0LmQKLWluZGV4IDAxMTFlZDQuLjI0Njc3YzggMTAwNjQ0
CitpbmRleCAyZWYyMjc3Li45NWU4OTA5IDEwMDY0NAogLS0tIGEvaW5pdC5kCiArKysgYi9pbml0
LmQKIEBAIC02LDggKzYsNDggQEAgUEFUSD0vc2JpbjovYmluOi91c3Ivc2JpbjovdXNyL2JpbgpA
QCAtNjAsNiArNjMsMyBAQCBpbmRleCAwMTExZWQ0Li4yNDY3N2M4IDEwMDY0NAogIHRlc3QgLXgg
L3Vzci9zYmluL3JuZGMgfHwgZXhpdCAwCiAgCiAgY2FzZSAiJDEiIGluCi0tLSAKLTEuNy45LjUK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1l
dGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaAppbmRleCAxNDZm
M2UzNWRiLi45M2FhMzA0MTI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3At
d29yay5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLWJpbmQ6IG1ha2UgIi9ldGMvaW5pdC5kL2JpbmQg
c3RvcCIgd29yaworRnJvbSAyZWEyZTRlNTAyZTU4NDBkNTJlNzY0NjFlMDcxODgyY2M2NWYxNzY2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5k
cml2ZXIuY29tPgorRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAorU3ViamVj
dDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKIAogVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogCkBAIC03LDEzICsx
MCwxMyBAQCB0aGUgbmFtZWQgZGFlbW9uLgogCiBTaWduZWQtb2ZmLWJ5OiBSb3kgTGkgPHJvbmdx
aW5nLmxpQHdpbmRyaXZlci5jb20+CiAtLS0KLSBjb25mL25hbWVkLmNvbmYgfCAgICA1ICsrKysr
Ci0gY29uZi9ybmRjLmNvbmYgIHwgICAgNSArKysrKwotIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKKyBjb25mL25hbWVkLmNvbmYgfCA1ICsrKysrCisg
Y29uZi9ybmRjLmNvbmYgIHwgNSArKysrKworIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQogIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL3JuZGMuY29uZgogCiBkaWZmIC0tZ2l0IGEv
Y29uZi9uYW1lZC5jb25mIGIvY29uZi9uYW1lZC5jb25mCi1pbmRleCA5NTgyOWNmLi5jODg5OWU3
IDEwMDY0NAoraW5kZXggOTU4MjljZi4uMDIxZGJjYSAxMDA2NDQKIC0tLSBhL2NvbmYvbmFtZWQu
Y29uZgogKysrIGIvY29uZi9uYW1lZC5jb25mCiBAQCAtNDcsMyArNDcsOCBAQCB6b25lICIyNTUu
aW4tYWRkci5hcnBhIiB7CkBAIC0yNyw3ICszMCw3IEBAIGluZGV4IDk1ODI5Y2YuLmM4ODk5ZTcg
MTAwNjQ0CiArfTsKIGRpZmYgLS1naXQgYS9jb25mL3JuZGMuY29uZiBiL2NvbmYvcm5kYy5jb25m
CiBuZXcgZmlsZSBtb2RlIDEwMDY0NAotaW5kZXggMDAwMDAwMC4uYTBiNDgxZAoraW5kZXggMDAw
MDAwMC4uNGI0M2EzZAogLS0tIC9kZXYvbnVsbAogKysrIGIvY29uZi9ybmRjLmNvbmYKIEBAIC0w
LDAgKzEsNSBAQApAQCAtMzYsNyArMzksMyBAQCBpbmRleCAwMDAwMDAwLi5hMGI0ODFkCiArCWRl
ZmF1bHQtc2VydmVyICBsb2NhbGhvc3Q7CiArCWRlZmF1bHQta2V5ICAgICBybmRjLWtleTsKICt9
OwotCi0tLSAKLTEuNy41LjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmRfOS4yMC40LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmRfOS4yMC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC41LmJiCmluZGV4IGQ5ZWE0NDBmYmQuLmFiZDJk
YTUyNDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzku
MjAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjUu
YmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9i
aW5kOS8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
YXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBcCiAgICAgICAgICAgICIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhOGUxYTA1ZTAwZTNlOWJjMDJiZGZmZGVkNzg2MmZh
Zjc3MjZiYTc2YmE5OTdmNDJhYjQ4Nzc3N2JkODIxMGIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MTkyNzRmZDczOWMwMjM3NzJiNDIxMmEwYjZjMjAxY2Y0MzY0ODU1ZmE3ZTZhN2QzZGI0OTY5M2Y1
NWRiMWFiOCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNj
L2JpbmQ5LyIKICMgZm9sbG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIu
NDQuMQoK

--===============3270431218959796654==--

