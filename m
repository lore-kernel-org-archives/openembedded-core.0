Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453A8E77184
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.33380.1734254981617000965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GyDHBKUT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ty+C6Wn0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010193c9a6ef91-af572c8e-c1bc-438e-a4b7-818689acc48c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QHhYNCWbapc0qtuKMukt7Q5CesY9EgMhUSC9JQIQ2U8=;
	b=GyDHBKUTQIZ/P53Kt8rbQ4hG0Q8LS8hdJxwkaLlxCka7z7fAQVl1+atS6RyX7Gvg
	NzBGSfnHgYLNavxXVTR/jwFNj6V47AyzGD+kD0bA8idFMn7DPYilM7pTCZ+QKZGhXuJ
	AnLr2NGWc/gaEMdnx1ToQdwGECm9bejExUU/fq8k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QHhYNCWbapc0qtuKMukt7Q5CesY9EgMhUSC9JQIQ2U8=;
	b=ty+C6Wn0bzM0K5MKGWRfBrHM39CTwhuLTnGIXwd+TC605BFk+/6jQrWqf8YINB7F
	aksoMt/J83GlAe9kVf5+NUtoq8qn55FECAJCTKkZB4hyqgAZZwM9HKrs6p/BY3qV9vC
	3Zavvpoj/to7YReqzxWtuM0WYFtN2XiWNE09z7us=
Content-Type: multipart/mixed; boundary="===============2517075984393114875=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] bind: upgrading to 9.20.4 SUCCEEDED
Message-ID: <01010193c9a6ef91-af572c8e-c1bc-438e-a4b7-818689acc48c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208709

--===============2517075984393114875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.3-9.20.4.patch
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
From 4b33239b850edcb083ff09a91f3b0ef8e45e71cd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 06:52:22 +0000
Subject: [PATCH] bind: upgrade 9.20.3 -> 9.20.4

---
 ...1-avoid-start-failure-with-bind-user.patch |   7 +-
 ...d-V-and-start-log-hide-build-options.patch |   5 +-
 ...ching-for-json-headers-searches-sysr.patch |   7 +-
 .../recipes-connectivity/bind/bind/conf.patch | 137 ++++++++++++------
 ...t.d-add-support-for-read-only-rootfs.patch |  12 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  19 ++-
 .../bind/{bind_9.20.3.bb => bind_9.20.4.bb}   |   2 +-
 7 files changed, 117 insertions(+), 72 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.3.bb => bind_9.20.4.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index ec1bc7b567..62b22d0a20 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From 4da3f3b261bd5ba1c1cb1e7d8b22f9df95b7f529 Mon Sep 17 00:00:00 2001
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
index 4c10f33f04..0eb367ed97 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4e83392e840fa7b05e778710b8c202d102477a13 Mon Sep 17 00:00:00 2001
+From 0efda0a3c8710760375e3b045f62f84671783200 Mon Sep 17 00:00:00 2001
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
+index a80b6ce..3f648a7 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d07cae39..11c19db8ed 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
+From 830dd0ecc862cbaa190033e662694863ec84e99b Mon Sep 17 00:00:00 2001
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
+index 865b4d0..a80b6ce 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
+@@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index aa3642acec..4dcc03219d 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,12 +1,43 @@
+From 1c66378254187680174c610b26dc9b0dee6e111f Mon Sep 17 00:00:00 2001
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
index 11db95ede1..7dade1239f 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,14 +1,17 @@
-Subject: init.d: add support for read-only rootfs
+From 4aac4c6a22e0aa8e3ace4191caa981f1e46b2fba Mon Sep 17 00:00:00 2001
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
index 146f3e35db..31b63a8934 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,7 @@
-bind: make "/etc/init.d/bind stop" work
+From 484296804777f333ae2bc0033147b9ed71b5174f Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-connectivity/bind/bind_9.20.3.bb b/meta/recipes-connectivity/bind/bind_9.20.4.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.3.bb
rename to meta/recipes-connectivity/bind/bind_9.20.4.bb
index a77b030427..d9ea440fbd 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "f90c2da1621299f56a2e6585a6fe459ec3efd6f2fdf84a8fbf31b40be7698a73"
+SRC_URI[sha256sum] = "3a8e1a05e00e3e9bc02bdffded7862faf7726ba76ba997f42ab487777bd8210b"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.44.1


--===============2517075984393114875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bind/bind-dbg: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-dbg: PKGSIZE changed from 15254256 to 15277304 (+0%)
packages/core2-64-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccc-9.20.3.so /usr/lib/.debug/libisccfg-9.20.3.so /usr/lib/.debug/libisc-9.20.3.so /usr/lib/.debug/libdns-9.20.3.so /usr/lib/.debug/libns-9.20.3.so", added "/usr/lib/.debug/libisccc-9.20.4.so /usr/lib/.debug/libisccfg-9.20.4.so /usr/lib/.debug/libns-9.20.4.so /usr/lib/.debug/libdns-9.20.4.so /usr/lib/.debug/libisc-9.20.4.so"
packages/core2-64-poky-linux/bind/bind-dbg: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind-dev: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-dev: PKGSIZE changed from 1581274 to 1582032 (+0%)
packages/core2-64-poky-linux/bind/bind-dev: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind-doc: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-doc: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind-libs: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.3.so", added "/usr/lib/*-9.20.4.so"
packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.3.so /usr/lib/libns-9.20.3.so /usr/lib/libisccc-9.20.3.so /usr/lib/libdns-9.20.3.so /usr/lib/libisc-9.20.3.so", added "/usr/lib/libns-9.20.4.so /usr/lib/libisccc-9.20.4.so /usr/lib/libisc-9.20.4.so /usr/lib/libdns-9.20.4.so /usr/lib/libisccfg-9.20.4.so"
packages/core2-64-poky-linux/bind/bind-libs: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind-locale: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-locale: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind-src: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-src: PKGSIZE changed from 9972934 to 9966529 (-0%)
packages/core2-64-poky-linux/bind/bind-src: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind-staticdev: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind-utils: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind-utils: PKGSIZE changed from 483656 to 479560 (-1%)
packages/core2-64-poky-linux/bind/bind-utils: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind/bind: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind/bind: PKGSIZE changed from 1307785 to 1312937 (+0%)
packages/core2-64-poky-linux/bind/bind: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind: PKGV changed from 9.20.3 [default] to 9.20.4 [default]
packages/core2-64-poky-linux/bind: PV changed from "9.20.3" to "9.20.4"
packages/core2-64-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.3/bind-9.20.3.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.20.4/bind-9.20.4.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.3.so to libdns-9.20.4.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.3.so to libisccc-9.20.4.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.3.so to libisccfg-9.20.4.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.3.so to libisc-9.20.4.so
  /usr/lib/libns.so changed symlink target from libns-9.20.3.so to libns-9.20.4.so
  /usr/lib/libdns-9.20.3.so moved to /usr/lib/libdns-9.20.4.so
  /usr/lib/libisc-9.20.3.so moved to /usr/lib/libisc-9.20.4.so
  /usr/lib/libisccc-9.20.3.so moved to /usr/lib/libisccc-9.20.4.so
  /usr/lib/libisccfg-9.20.3.so moved to /usr/lib/libisccfg-9.20.4.so
  /usr/lib/libns-9.20.3.so moved to /usr/lib/libns-9.20.4.so

--===============2517075984393114875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.3.so /usr/lib/libisc-9.20.3.so /usr/lib/libisccc-9.20.3.so /usr/lib/libisccfg-9.20.3.so /usr/lib/libns-9.20.3.so", added "/usr/lib/libns-9.20.4.so /usr/lib/libdns-9.20.4.so /usr/lib/libisc-9.20.4.so /usr/lib/libisccc-9.20.4.so /usr/lib/libisccfg-9.20.4.so"
Changes to packages/core2-64-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.3.so to libdns-9.20.4.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.3.so to libisccc-9.20.4.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.3.so to libisccfg-9.20.4.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.3.so to libisc-9.20.4.so
  /usr/lib/libns.so changed symlink target from libns-9.20.3.so to libns-9.20.4.so
  /usr/lib/libdns-9.20.3.so moved to /usr/lib/libdns-9.20.4.so
  /usr/lib/libisc-9.20.3.so moved to /usr/lib/libisc-9.20.4.so
  /usr/lib/libisccc-9.20.3.so moved to /usr/lib/libisccc-9.20.4.so
  /usr/lib/libisccfg-9.20.3.so moved to /usr/lib/libisccfg-9.20.4.so
  /usr/lib/libns-9.20.3.so moved to /usr/lib/libns-9.20.4.so

--===============2517075984393114875==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.3-9.20.4.patch"

RnJvbSA0YjMzMjM5Yjg1MGVkY2IwODNmZjA5YTkxZjNiMGVmOGU0NWU3MWNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDY6NTI6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMyAtPiA5LjIwLjQKCi0tLQogLi4uMS1hdm9pZC1zdGFydC1mYWls
dXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIHwgICA3ICstCiAuLi5kLVYtYW5kLXN0YXJ0LWxvZy1o
aWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2ggfCAgIDUgKy0KIC4uLmNoaW5nLWZvci1qc29uLWhlYWRl
cnMtc2VhcmNoZXMtc3lzci5wYXRjaCB8ICAgNyArLQogLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9jb25mLnBhdGNoIHwgMTM3ICsrKysrKysrKysrKy0tLS0tLQogLi4udC5kLWFk
ZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoIHwgIDEyICstCiAuLi4vYmluZC9t
YWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgfCAgMTkgKystCiAuLi4vYmluZC97
YmluZF85LjIwLjMuYmIgPT4gYmluZF85LjIwLjQuYmJ9ICAgfCAgIDIgKy0KIDcgZmlsZXMgY2hh
bmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjIwLjMuYmIgPT4gYmluZF85LjIwLjQuYmJ9
ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
MDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgt
YmluZC11c2VyLnBhdGNoCmluZGV4IGVjMWJjN2I1NjcuLjYyYjIyZDBhMjAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFp
bHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDMxZGRlMzU2MmYyODc0MjllZWE5NGI3NzI1MGQxODQ4MThi
NDkwNjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRkYTNmM2IyNjFiZDViYTFjMWNi
MWU3ZDhiMjJmOWRmOTViN2Y1MjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVu
IFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDE1IE9jdCAyMDE4IDE2OjU1
OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIHN0YXJ0IGZhaWx1cmUgd2l0aCBiaW5k
IHVzZXIKQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0t
Z2l0IGEvaW5pdC5kIGIvaW5pdC5kCi1pbmRleCBiMmVlYzYwLi42ZTAzOTM2IDEwMDY0NAoraW5k
ZXggOTVlODkwOS4uNzcxZDM0OSAxMDA2NDQKIC0tLSBhL2luaXQuZAogKysrIGIvaW5pdC5kCiBA
QCAtNTcsNiArNTcsNyBAQCBjYXNlICIkMSIgaW4KQEAgLTIyLDYgKzIyLDMgQEAgaW5kZXggYjJl
ZWM2MC4uNmUwMzkzNiAxMDA2NDQKICAJICAgIGNobW9kIDA2NDAgL2V0Yy9iaW5kL3JuZGMua2V5
CiAgCWZpCiAgCWlmIFsgLWYgL3Zhci9ydW4vbmFtZWQvbmFtZWQucGlkIF07IHRoZW4KLS0tIAot
Mi43LjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
MDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNk
LVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKaW5kZXggNGMxMGYzM2Yw
NC4uMGViMzY3ZWQ5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9u
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5h
bWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA0ZTgzMzkyZTg0MGZhN2IwNWU3Nzg3MTBiOGMyMDJkMTAyNDc3YTEz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZWZkYTBhM2M4NzEwNzYwMzc1ZTNiMDQ1
ZjYyZjg0NjcxNzgzMjAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAyNyBBdWcgMjAxOCAyMToy
NDoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBgbmFtZWQvbHdyZXNkIC1WJyBhbmQgc3RhcnQg
bG9nIGhpZGUgYnVpbGQgb3B0aW9ucwpAQCAtMTUsMTMgKzE1LDEyIEBAIFNpZ25lZC1vZmYtYnk6
IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIAogUmVmcmVzaGVkIGZvciA5
LjE2LjAKIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1c3RlckBtdmlzdGEuY29tPgot
CiAtLS0KICBjb25maWd1cmUuYWMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1
cmUuYWMKLWluZGV4IGJmMjA2OTAuLmM1ZDMzMGYgMTAwNjQ0CitpbmRleCBhODBiNmNlLi4zZjY0
OGE3IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0z
NSw3ICszNSw3IEBAIEFDX0RFRklORShbUEFDS0FHRV9WRVJTSU9OX0VYVFJBXSwgWyJdW2JpbmRf
VkVSU0lPTl9FWFRSQV1bIl0sIFtCSU5EIDkgRXh0cmEgcGFyCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpz
b24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNo
ZXMtc3lzci5wYXRjaAppbmRleCAzOGQwN2NhZTM5Li4xMWMxOWRiOGVkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmct
Zm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFk
ZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhZTMwMzI5ZjE2
OGMxZThkMmUwYzM4MzE5ODhhNGYzZTkwOTZlMzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDgzMGRkMGVjYzg2MmNiYWExOTAwMzNlNjYyNjk0ODYzZWM4NGU5OWIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJp
dmVyLmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAxNSAxMToyMjowMCAtMDQwMAogU3ViamVjdDog
W1BBVENIXSBiaW5kOiBlbnN1cmUgc2VhcmNoaW5nIGZvciBqc29uIGhlYWRlcnMgc2VhcmNoZXMg
c3lzcm9vdApAQCAtMjcsMTYgKzI3LDE1IEBAIHRvIG1ha2UgdXNlIG9mIHRoZSBjb21iaW5hdGlv
biBzb21lIGRheS4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBTcGVjaWZp
Y10KIFNpZ25lZC1vZmYtYnk6IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2
ZXIuY29tPgotCiAtLS0KICBjb25maWd1cmUuYWMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMg
Yi9jb25maWd1cmUuYWMKLWluZGV4IDJhYjhkZGQuLjkyZmU5ODMgMTAwNjQ0CitpbmRleCA4NjVi
NGQwLi5hODBiNmNlIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUu
YWMKLUBAIC03NjEsNyArNzYxLDcgQEAgQVNfQ0FTRShbJHdpdGhfbG1kYl0sCitAQCAtODYzLDcg
Kzg2Myw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJdLAogIAlbbm9dLFtdLAogIAlbYXV0b3x5ZXNd
LCBbUEtHX0NIRUNLX01PRFVMRVMoW0xNREJdLCBbbG1kYl0sCiAgCQkJCSAgICAgICBbYWNfbGli
X2xtZGJfZm91bmQ9eWVzXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kL2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9jb25mLnBhdGNoCmluZGV4IGFhMzY0MmFjZWMuLjRkY2MwMzIxOWQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaApAQCAtMSwxMiArMSw0MyBA
QAorRnJvbSAxYzY2Mzc4MjU0MTg3NjgwMTc0YzYxMGIyNmRjOWIwZGVlNmUxMTFmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUWluZyBIZSA8cWluZy5oZUBpbnRlbC5jb20+CitEYXRl
OiBUdWUsIDMwIE5vdiAyMDEwIDEzOjM1OjQyICswODAwCitTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6
IGFkZCBuZXcgcmVjaXBlCisKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmln
dXJhdGlvbl0KIAogdGhlIHBhdGNoIGlzIGltcG9ydGVkIGZyb20gb3BlbmVtYmVkZGVkIHByb2pl
Y3QKIAogMTEvMzAvMjAxMCAtIFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgorLS0tCisgY29u
Zi9kYi4wICAgICAgICAgICAgICAgfCAxMiArKysrKysrCisgY29uZi9kYi4xMjcgICAgICAgICAg
ICAgfCAxMyArKysrKysrKworIGNvbmYvZGIuMjU1ICAgICAgICAgICAgIHwgMTIgKysrKysrKwor
IGNvbmYvZGIuZW1wdHkgICAgICAgICAgIHwgMTQgKysrKysrKysrCisgY29uZi9kYi5sb2NhbCAg
ICAgICAgICAgfCAxMyArKysrKysrKworIGNvbmYvZGIucm9vdCAgICAgICAgICAgIHwgNDUgKysr
KysrKysrKysrKysrKysrKysrKysrKysKKyBjb25mL25hbWVkLmNvbmYgICAgICAgICB8IDQ5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCisgY29uZi9uYW1lZC5jb25mLmxvY2FsICAgfCAg
OCArKysrKworIGNvbmYvbmFtZWQuY29uZi5vcHRpb25zIHwgMjQgKysrKysrKysrKysrKysKKyBj
b25mL3pvbmVzLnJmYzE5MTggICAgICB8IDIwICsrKysrKysrKysrKworIGluaXQuZCAgICAgICAg
ICAgICAgICAgIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
KyAxMSBmaWxlcyBjaGFuZ2VkLCAyODAgaW5zZXJ0aW9ucygrKQorIGNyZWF0ZSBtb2RlIDEwMDY0
NCBjb25mL2RiLjAKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi4xMjcKKyBjcmVhdGUgbW9k
ZSAxMDA2NDQgY29uZi9kYi4yNTUKKyBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9kYi5lbXB0eQor
IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2RiLmxvY2FsCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNv
bmYvZGIucm9vdAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25mL25hbWVkLmNvbmYKKyBjcmVhdGUg
bW9kZSAxMDA2NDQgY29uZi9uYW1lZC5jb25mLmxvY2FsCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNv
bmYvbmFtZWQuY29uZi5vcHRpb25zCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmYvem9uZXMucmZj
MTkxOAorIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbml0LmQKIAotZGlmZiAtdXJOIGJpbmQtOS4zLjEu
b3JpZy9jb25mL2RiLjAgYmluZC05LjMuMS9jb25mL2RiLjAKLS0tLSBiaW5kLTkuMy4xLm9yaWcv
Y29uZi9kYi4wCTE5NzAtMDEtMDEgMDE6MDA6MDAuMDAwMDAwMDAwICswMTAwCi0rKysgYmluZC05
LjMuMS9jb25mL2RiLjAJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKK2RpZmYg
LS1naXQgYS9jb25mL2RiLjAgYi9jb25mL2RiLjAKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRl
eCAwMDAwMDAwLi5lM2FhYmRiCistLS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLjAKIEBAIC0w
LDAgKzEsMTIgQEAKICs7CiArOyBCSU5EIHJldmVyc2UgZGF0YSBmaWxlIGZvciBicm9hZGNhc3Qg
em9uZQpAQCAtMjAsOSArNTEsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL2Ri
LjAgYmluZC05LjMuMS9jb25mL2RiLjAKICsJCQkgNjA0ODAwICkJOyBOZWdhdGl2ZSBDYWNoZSBU
VEwKICs7CiArQAlJTglOUwlsb2NhbGhvc3QuCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2Nv
bmYvZGIuMTI3IGJpbmQtOS4zLjEvY29uZi9kYi4xMjcKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29u
Zi9kYi4xMjcJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTku
My4xL2NvbmYvZGIuMTI3CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCitkaWZm
IC0tZ2l0IGEvY29uZi9kYi4xMjcgYi9jb25mL2RiLjEyNworbmV3IGZpbGUgbW9kZSAxMDA2NDQK
K2luZGV4IDAwMDAwMDAuLmNkMDViZWYKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvZGIuMTI3
CiBAQCAtMCwwICsxLDEzIEBACiArOwogKzsgQklORCByZXZlcnNlIGRhdGEgZmlsZSBmb3IgbG9j
YWwgbG9vcGJhY2sgaW50ZXJmYWNlCkBAIC0zNyw0MyArNzAsNDkgQEAgZGlmZiAtdXJOIGJpbmQt
OS4zLjEub3JpZy9jb25mL2RiLjEyNyBiaW5kLTkuMy4xL2NvbmYvZGIuMTI3CiArOwogK0AJSU4J
TlMJbG9jYWxob3N0LgogKzEuMC4wCUlOCVBUUglsb2NhbGhvc3QuCi1kaWZmIC11ck4gYmluZC05
LjMuMS5vcmlnL2NvbmYvZGIuZW1wdHkgYmluZC05LjMuMS9jb25mL2RiLmVtcHR5Ci0tLS0gYmlu
ZC05LjMuMS5vcmlnL2NvbmYvZGIuZW1wdHkJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAg
KzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvZGIuZW1wdHkJMjAwNS0wNy0xMCAyMjoxNDowMC4w
MDAwMDAwMDAgKzAyMDAKLUBAIC0wLDAgKzEsMTQgQEAKLSs7IEJJTkQgcmV2ZXJzZSBkYXRhIGZp
bGUgZm9yIGVtcHR5IHJmYzE5MTggem9uZQorZGlmZiAtLWdpdCBhL2NvbmYvZGIuMjU1IGIvY29u
Zi9kYi4yNTUKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi4xNmNkODE5Cist
LS0gL2Rldi9udWxsCisrKysgYi9jb25mL2RiLjI1NQorQEAgLTAsMCArMSwxMiBAQAogKzsKLSs7
IERPIE5PVCBFRElUIFRISVMgRklMRSAtIGl0IGlzIHVzZWQgZm9yIG11bHRpcGxlIHpvbmVzLgot
KzsgSW5zdGVhZCwgY29weSBpdCwgZWRpdCBuYW1lZC5jb25mLCBhbmQgdXNlIHRoYXQgY29weS4K
Kys7IEJJTkQgcmVzZXJ2ZSBkYXRhIGZpbGUgZm9yIGJyb2FkY2FzdCB6b25lCiArOwotKyRUVEwJ
ODY0MDAKKyskVFRMCTYwNDgwMAogK0AJSU4JU09BCWxvY2FsaG9zdC4gcm9vdC5sb2NhbGhvc3Qu
ICgKICsJCQkgICAgICAxCQk7IFNlcmlhbAogKwkJCSA2MDQ4MDAJCTsgUmVmcmVzaAogKwkJCSAg
ODY0MDAJCTsgUmV0cnkKICsJCQkyNDE5MjAwCQk7IEV4cGlyZQotKwkJCSAgODY0MDAgKQk7IE5l
Z2F0aXZlIENhY2hlIFRUTAorKwkJCSA2MDQ4MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAogKzsK
ICtACUlOCU5TCWxvY2FsaG9zdC4KLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi4y
NTUgYmluZC05LjMuMS9jb25mL2RiLjI1NQotLS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL2RiLjI1
NQkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29u
Zi9kYi4yNTUJMjAwNS0wNy0xMCAyMjoxNDowMC4wMDAwMDAwMDAgKzAyMDAKLUBAIC0wLDAgKzEs
MTIgQEAKK2RpZmYgLS1naXQgYS9jb25mL2RiLmVtcHR5IGIvY29uZi9kYi5lbXB0eQorbmV3IGZp
bGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjhhMTI4NTgKKy0tLSAvZGV2L251bGwKKysr
KyBiL2NvbmYvZGIuZW1wdHkKK0BAIC0wLDAgKzEsMTQgQEAKKys7IEJJTkQgcmV2ZXJzZSBkYXRh
IGZpbGUgZm9yIGVtcHR5IHJmYzE5MTggem9uZQogKzsKLSs7IEJJTkQgcmVzZXJ2ZSBkYXRhIGZp
bGUgZm9yIGJyb2FkY2FzdCB6b25lCisrOyBETyBOT1QgRURJVCBUSElTIEZJTEUgLSBpdCBpcyB1
c2VkIGZvciBtdWx0aXBsZSB6b25lcy4KKys7IEluc3RlYWQsIGNvcHkgaXQsIGVkaXQgbmFtZWQu
Y29uZiwgYW5kIHVzZSB0aGF0IGNvcHkuCiArOwotKyRUVEwJNjA0ODAwCisrJFRUTAk4NjQwMAog
K0AJSU4JU09BCWxvY2FsaG9zdC4gcm9vdC5sb2NhbGhvc3QuICgKICsJCQkgICAgICAxCQk7IFNl
cmlhbAogKwkJCSA2MDQ4MDAJCTsgUmVmcmVzaAogKwkJCSAgODY0MDAJCTsgUmV0cnkKICsJCQky
NDE5MjAwCQk7IEV4cGlyZQotKwkJCSA2MDQ4MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAorKwkJ
CSAgODY0MDAgKQk7IE5lZ2F0aXZlIENhY2hlIFRUTAogKzsKICtACUlOCU5TCWxvY2FsaG9zdC4K
LWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5sb2NhbCBiaW5kLTkuMy4xL2NvbmYv
ZGIubG9jYWwKLS0tLSBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5sb2NhbAkxOTcwLTAxLTAxIDAx
OjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9kYi5sb2NhbAkyMDA1
LTA3LTEwIDIyOjE0OjAwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvZGIubG9j
YWwgYi9jb25mL2RiLmxvY2FsCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4u
NjZiNDg5MgorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi5sb2NhbAogQEAgLTAsMCArMSwx
MyBAQAogKzsKICs7IEJJTkQgZGF0YSBmaWxlIGZvciBsb2NhbCBsb29wYmFjayBpbnRlcmZhY2UK
QEAgLTg4LDkgKzEyNywxMSBAQCBkaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIubG9j
YWwgYmluZC05LjMuMS9jb25mL2RiLmxvY2FsCiArOwogK0AJSU4JTlMJbG9jYWxob3N0LgogK0AJ
SU4JQQkxMjcuMC4wLjEKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9kYi5yb290IGJp
bmQtOS4zLjEvY29uZi9kYi5yb290Ci0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvZGIucm9vdAkx
OTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9k
Yi5yb290CTIwMDUtMDctMTAgMjI6MTQ6MDAuMDAwMDAwMDAwICswMjAwCitkaWZmIC0tZ2l0IGEv
Y29uZi9kYi5yb290IGIvY29uZi9kYi5yb290CituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXgg
MDAwMDAwMC4uMDFjMjBmMAorLS0tIC9kZXYvbnVsbAorKysrIGIvY29uZi9kYi5yb290CiBAQCAt
MCwwICsxLDQ1IEBACiArCiArOyA8PD4+IERpRyA5LjIuMyA8PD4+IG5zIC4gQGEucm9vdC1zZXJ2
ZXJzLm5ldC4KQEAgLTEzNyw5ICsxNzgsMTEgQEAgZGlmZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9j
b25mL2RiLnJvb3QgYmluZC05LjMuMS9jb25mL2RiLnJvb3QKICs7OyBXSEVOOiBTdW4gRmViICAx
IDExOjI3OjE0IDIwMDQKICs7OyBNU0cgU0laRSAgcmN2ZDogNDM2CiArCi1kaWZmIC11ck4gYmlu
ZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZiBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZgot
LS0tIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYJMTk3MC0wMS0wMSAwMTowMDowMC4w
MDAwMDAwMDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvbmFtZWQuY29uZgkyMDA1LTA3LTEw
IDIyOjMzOjQ2LjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvbmFtZWQuY29uZiBi
L2NvbmYvbmFtZWQuY29uZgorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjk1
ODI5Y2YKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvbmFtZWQuY29uZgogQEAgLTAsMCArMSw0
OSBAQAogKy8vIFRoaXMgaXMgdGhlIHByaW1hcnkgY29uZmlndXJhdGlvbiBmaWxlIGZvciB0aGUg
QklORCBETlMgc2VydmVyIG5hbWVkLgogKy8vCkBAIC0xOTAsOSArMjMzLDExIEBAIGRpZmYgLXVy
TiBiaW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5j
b25mCiArLy8gcm9vdC1kZWxlZ2F0aW9uLW9ubHkgZXhjbHVkZSB7ICJERSI7ICJNVVNFVU0iOyB9
OwogKwogK2luY2x1ZGUgIi9ldGMvYmluZC9uYW1lZC5jb25mLmxvY2FsIjsKLWRpZmYgLXVyTiBi
aW5kLTkuMy4xLm9yaWcvY29uZi9uYW1lZC5jb25mLmxvY2FsIGJpbmQtOS4zLjEvY29uZi9uYW1l
ZC5jb25mLmxvY2FsCi0tLS0gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5sb2NhbAkx
OTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9u
YW1lZC5jb25mLmxvY2FsCTIwMDUtMDctMTAgMjI6MTQ6MDYuMDAwMDAwMDAwICswMjAwCitkaWZm
IC0tZ2l0IGEvY29uZi9uYW1lZC5jb25mLmxvY2FsIGIvY29uZi9uYW1lZC5jb25mLmxvY2FsCitu
ZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uN2E1N2IxMAorLS0tIC9kZXYvbnVs
bAorKysrIGIvY29uZi9uYW1lZC5jb25mLmxvY2FsCiBAQCAtMCwwICsxLDggQEAKICsvLwogKy8v
IERvIGFueSBsb2NhbCBjb25maWd1cmF0aW9uIGhlcmUKQEAgLTIwMiw5ICsyNDcsMTEgQEAgZGlm
ZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYubG9jYWwgYmluZC05LjMuMS9j
b25mL25hbWVkLmNvbmYubG9jYWwKICsvLyBvcmdhbml6YXRpb24KICsvL2luY2x1ZGUgIi9ldGMv
YmluZC96b25lcy5yZmMxOTE4IjsKICsKLWRpZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvY29uZi9u
YW1lZC5jb25mLm9wdGlvbnMgYmluZC05LjMuMS9jb25mL25hbWVkLmNvbmYub3B0aW9ucwotLS0t
IGJpbmQtOS4zLjEub3JpZy9jb25mL25hbWVkLmNvbmYub3B0aW9ucwkxOTcwLTAxLTAxIDAxOjAw
OjAwLjAwMDAwMDAwMCArMDEwMAotKysrIGJpbmQtOS4zLjEvY29uZi9uYW1lZC5jb25mLm9wdGlv
bnMJMjAwNS0wNy0xMCAyMjoxNDowNi4wMDAwMDAwMDAgKzAyMDAKK2RpZmYgLS1naXQgYS9jb25m
L25hbWVkLmNvbmYub3B0aW9ucyBiL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zCituZXcgZmlsZSBt
b2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uODEzMTkzZAorLS0tIC9kZXYvbnVsbAorKysrIGIv
Y29uZi9uYW1lZC5jb25mLm9wdGlvbnMKIEBAIC0wLDAgKzEsMjQgQEAKICtvcHRpb25zIHsKICsJ
ZGlyZWN0b3J5ICIvdmFyL2NhY2hlL2JpbmQiOwpAQCAtMjMwLDkgKzI3NywxMSBAQCBkaWZmIC11
ck4gYmluZC05LjMuMS5vcmlnL2NvbmYvbmFtZWQuY29uZi5vcHRpb25zIGJpbmQtOS4zLjEvY29u
Zi9uYW1lZC5jb25mLm9wdAogKwogK307CiArCi1kaWZmIC11ck4gYmluZC05LjMuMS5vcmlnL2Nv
bmYvem9uZXMucmZjMTkxOCBiaW5kLTkuMy4xL2NvbmYvem9uZXMucmZjMTkxOAotLS0tIGJpbmQt
OS4zLjEub3JpZy9jb25mL3pvbmVzLnJmYzE5MTgJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAw
MDAgKzAxMDAKLSsrKyBiaW5kLTkuMy4xL2NvbmYvem9uZXMucmZjMTkxOAkyMDA1LTA3LTEwIDIy
OjE0OjEwLjAwMDAwMDAwMCArMDIwMAorZGlmZiAtLWdpdCBhL2NvbmYvem9uZXMucmZjMTkxOCBi
L2NvbmYvem9uZXMucmZjMTkxOAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAu
LjAzYjU1NDYKKy0tLSAvZGV2L251bGwKKysrKyBiL2NvbmYvem9uZXMucmZjMTkxOAogQEAgLTAs
MCArMSwyMCBAQAogK3pvbmUgIjEwLmluLWFkZHIuYXJwYSIgICAgICB7IHR5cGUgbWFzdGVyOyBm
aWxlICIvZXRjL2JpbmQvZGIuZW1wdHkiOyB9OwogKyAKQEAgLTI1NCw5ICszMDMsMTEgQEAgZGlm
ZiAtdXJOIGJpbmQtOS4zLjEub3JpZy9jb25mL3pvbmVzLnJmYzE5MTggYmluZC05LjMuMS9jb25m
L3pvbmVzLnJmYzE5MTgKICt6b25lICIzMS4xNzIuaW4tYWRkci5hcnBhIiAgeyB0eXBlIG1hc3Rl
cjsgZmlsZSAiL2V0Yy9iaW5kL2RiLmVtcHR5IjsgfTsKICsKICt6b25lICIxNjguMTkyLmluLWFk
ZHIuYXJwYSIgeyB0eXBlIG1hc3RlcjsgZmlsZSAiL2V0Yy9iaW5kL2RiLmVtcHR5IjsgfTsKLWRp
ZmYgLXVyTiBiaW5kLTkuMy4xLm9yaWcvaW5pdC5kIGJpbmQtOS4zLjEvaW5pdC5kCi0tLS0gYmlu
ZC05LjMuMS5vcmlnL2luaXQuZAkxOTcwLTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAot
KysrIGJpbmQtOS4zLjEvaW5pdC5kCTIwMDUtMDctMTAgMjM6MDk6NTguMDAwMDAwMDAwICswMjAw
CitkaWZmIC0tZ2l0IGEvaW5pdC5kIGIvaW5pdC5kCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5k
ZXggMDAwMDAwMC4uMmVmMjI3NworLS0tIC9kZXYvbnVsbAorKysrIGIvaW5pdC5kCiBAQCAtMCww
ICsxLDcwIEBACiArIyEvYmluL3NoCiArCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1
cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKaW5kZXggMTFkYjk1ZWRlMS4uN2RhZGUx
MjM5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1v
bmx5LXJvb3Rmcy5wYXRjaApAQCAtMSwxNCArMSwxNyBAQAotU3ViamVjdDogaW5pdC5kOiBhZGQg
c3VwcG9ydCBmb3IgcmVhZC1vbmx5IHJvb3RmcworRnJvbSA0YWFjNGM2YTIyZTBhYThlM2FjZTQx
OTFjYWE5ODFmMWU0NmIyZmJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQ2hlbiBR
aSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgorRGF0ZTogVGh1LCAyNyBNYXIgMjAxNCAwMjozNDo0
MSArMDAwMAorU3ViamVjdDogW1BBVENIXSBpbml0LmQ6IGFkZCBzdXBwb3J0IGZvciByZWFkLW9u
bHkgcm9vdGZzCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNd
CiAKIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIC0tLQot
IGluaXQuZCB8ICAgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwor
IGluaXQuZCB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKICAx
IGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvaW5pdC5kIGIv
aW5pdC5kCi1pbmRleCAwMTExZWQ0Li4yNDY3N2M4IDEwMDY0NAoraW5kZXggMmVmMjI3Ny4uOTVl
ODkwOSAxMDA2NDQKIC0tLSBhL2luaXQuZAogKysrIGIvaW5pdC5kCiBAQCAtNiw4ICs2LDQ4IEBA
IFBBVEg9L3NiaW46L2JpbjovdXNyL3NiaW46L3Vzci9iaW4KQEAgLTYwLDYgKzYzLDMgQEAgaW5k
ZXggMDExMWVkNC4uMjQ2NzdjOCAxMDA2NDQKICB0ZXN0IC14IC91c3Ivc2Jpbi9ybmRjIHx8IGV4
aXQgMAogIAogIGNhc2UgIiQxIiBpbgotLS0gCi0xLjcuOS41Ci0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13
b3JrLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMt
aW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKaW5kZXggMTQ2ZjNlMzVkYi4uMzFiNjNhODkzNCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvbWFrZS1ldGMt
aW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKQEAgLTEsNCAr
MSw3IEBACi1iaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsKK0Zyb20gNDg0
Mjk2ODA0Nzc3ZjMzM2FlMmJjMDAzMzE0N2I5ZWQ3MWI1MTc0ZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KK0RhdGU6IFRo
dSwgMTUgTm92IDIwMTIgMDI6Mjc6NTQgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gYmluZDogbWFr
ZSAiL2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbY29uZmlndXJhdGlvbl0KIApAQCAtNywxMyArMTAsMTMgQEAgdGhlIG5hbWVkIGRh
ZW1vbi4KIAogU2lnbmVkLW9mZi1ieTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIuY29t
PgogLS0tCi0gY29uZi9uYW1lZC5jb25mIHwgICAgNSArKysrKwotIGNvbmYvcm5kYy5jb25mICB8
ICAgIDUgKysrKysKLSAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDAgZGVsZXRp
b25zKC0pCisgY29uZi9uYW1lZC5jb25mIHwgNSArKysrKworIGNvbmYvcm5kYy5jb25mICB8IDUg
KysrKysKKyAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKICBjcmVhdGUgbW9kZSAx
MDA2NDQgY29uZi9ybmRjLmNvbmYKIAogZGlmZiAtLWdpdCBhL2NvbmYvbmFtZWQuY29uZiBiL2Nv
bmYvbmFtZWQuY29uZgotaW5kZXggOTU4MjljZi4uYzg4OTllNyAxMDA2NDQKK2luZGV4IDk1ODI5
Y2YuLjAyMWRiY2EgMTAwNjQ0CiAtLS0gYS9jb25mL25hbWVkLmNvbmYKICsrKyBiL2NvbmYvbmFt
ZWQuY29uZgogQEAgLTQ3LDMgKzQ3LDggQEAgem9uZSAiMjU1LmluLWFkZHIuYXJwYSIgewpAQCAt
MjcsNyArMzAsNyBAQCBpbmRleCA5NTgyOWNmLi5jODg5OWU3IDEwMDY0NAogK307CiBkaWZmIC0t
Z2l0IGEvY29uZi9ybmRjLmNvbmYgYi9jb25mL3JuZGMuY29uZgogbmV3IGZpbGUgbW9kZSAxMDA2
NDQKLWluZGV4IDAwMDAwMDAuLmEwYjQ4MWQKK2luZGV4IDAwMDAwMDAuLjRiNDNhM2QKIC0tLSAv
ZGV2L251bGwKICsrKyBiL2NvbmYvcm5kYy5jb25mCiBAQCAtMCwwICsxLDUgQEAKQEAgLTM2LDcg
KzM5LDMgQEAgaW5kZXggMDAwMDAwMC4uYTBiNDgxZAogKwlkZWZhdWx0LXNlcnZlciAgbG9jYWxo
b3N0OwogKwlkZWZhdWx0LWtleSAgICAgcm5kYy1rZXk7CiArfTsKLQotLS0gCi0xLjcuNS40Ci0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMy5i
YiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuNC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZF85LjIwLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kXzkuMjAuNC5iYgppbmRleCBhNzdiMDMwNDI3Li5kOWVhNDQwZmJkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC40LmJiCkBAIC0yMCw3ICsyMCw3IEBA
IFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtCUE59LSR7
UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUt
d2l0aC1iaW5kLXVzZXIucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmOTBjMmRhMTYyMTI5OWY1NmEyZTY1ODVhNmZlNDU5ZWMzZWZkNmYyZmRmODRhOGZiZjMx
YjQwYmU3Njk4YTczIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhOGUxYTA1ZTAwZTNlOWJjMDJi
ZGZmZGVkNzg2MmZhZjc3MjZiYTc2YmE5OTdmNDJhYjQ4Nzc3N2JkODIxMGIiCiAKIFVQU1RSRUFN
X0NIRUNLX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8iCiAjIGZvbGxvdyB0
aGUgRVNWIHZlcnNpb25zIGRpdmlzaWJsZSBieSAyCi0tIAoyLjQ0LjEKCg==

--===============2517075984393114875==--

