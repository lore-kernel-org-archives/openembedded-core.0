Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 129457E958
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 20:29:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r9so18321248ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 13:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Cs8iNhd1+fnVoLW2dCpcH34KLJI2Ng4xUzzMWHsLGKs=;
	b=JHfUXsQvJwCBkwdeCbMBDxc0OjD8BnvYVumcweXUq72+e/XzA9WntSRN5VTdkf3isZ
	5HH7dtw18cYQPz27qhpm1p14Xdf1lL/qCs3Mejxf1TyP33CmRO3p+6V10yqzuFp2bPLy
	/IWPqcAA5OY7Oqfshzh1NRo7cMynnPHJfEu44azTZmgryyu1Dfr0MXNv2x3dc/evWFxw
	VJmr8nk7SQ5zmk6vA5rqupfwt7Fsd1IKA7IX1KjeyPLXJu09h2DzFwWSliqsN/YTziXT
	4a3/O+HC4oR/sOXAAf03lq5V/M7WVnMTEJmCtCNNuqNACmsD+XvMQbF4w2DU9x9oBoqZ
	cuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cs8iNhd1+fnVoLW2dCpcH34KLJI2Ng4xUzzMWHsLGKs=;
	b=hekpbWPamcRwbaBhMWW1mkle3n8LQNj3kNWGiaJjr16xnmpXFT3Xb9IWCJHkhcKlsL
	2QNPDKS+PK0ibw6doZ3tcEm+oHk5dAfeT6Y9SctwLailjc1LyUflsUCCLz/0hgru/PzW
	rThX/CSc2Xy2leIRw6ifDn2mXHrJXJ08iQ4dx5SCFjOakBgApBADiCCnfggKpkBP7663
	B/bLpkN4L8nHMHJnnqixmoeN6Em0TOxplEFpmB2hqhLhZYFDiKqqlxR1A4fuEMR+ENmj
	6EyaizEVKl+fMgcr8CupA1ggg5RuLoDI+YQtJISnHmypGsxs98ILw1mjaKON2RYrrNCO
	lWtg==
X-Gm-Message-State: APjAAAUalxZdSyVDuUFZ2y12lUf3UggQn6n5GG+9FJF87yvFv7OlfHzy
	51YNuVIkhF0ljHQnB1Z3ZZ19QxO7rYU=
X-Google-Smtp-Source: APXvYqzD4L4fLzpdFQfYXkZcHBvB6fr4E/Syg/akycdD/5a0/vBZhXuKVxpIDMkrKH7IiZnMEW3s5w==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr18785116lja.230.1562099353025;
	Tue, 02 Jul 2019 13:29:13 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 24sm5141ljs.63.2019.07.02.13.29.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 13:29:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 22:29:09 +0200
Message-Id: <20190702202909.3501-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v3] ifupdown: update to 0.8.22
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
X-List-Received-Date: Tue, 02 Jul 2019 20:29:13 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-Define-FNM_EXTMATCH-for-musl.patch   | 47 +++++++++++++++++++
 ...t-rely-on-dpkg-architecture-to-set-a.patch |  8 ++--
 ...efn-fix-inverted-checks-for-loopback.patch | 45 +++++++++---------
 ...{ifupdown_0.8.16.bb => ifupdown_0.8.22.bb} |  3 +-
 4 files changed, 74 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.16.bb => ifupdown_0.8.22.bb} (93%)

diff --git a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
new file mode 100644
index 0000000000..7bf02ea536
--- /dev/null
+++ b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
@@ -0,0 +1,47 @@
+From ff714d6461569d69b253089110ec659e4ebec248 Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Date: Tue, 2 Jul 2019 20:10:42 +0200
+Subject: [PATCH] Define FNM_EXTMATCH for musl
+
+Fixes the following compilation errors with musl that does not have
+FNM_EXTMATCH defined:
+
+| main.c: In function 'expand_matches':
+| main.c:700:40: error: 'FNM_EXTMATCH' undeclared (first use in this
+function); did you mean 'FNM_NOMATCH'?
+|   700 |     if(fnmatch(pattern, ifa->ifa_name, FNM_EXTMATCH))
+|       |                                        ^~~~~~~~~~~~
+|       |                                        FNM_NOMATCH
+
+and
+
+| archlinux.c:40:28: error: 'FNM_EXTMATCH' undeclared (first use in this
+function); did you mean 'FNM_NOMATCH'?
+|    40 |   if(fnmatch(pattern, buf, FNM_EXTMATCH) == 0) {
+|       |                            ^~~~~~~~~~~~
+|       |                            FNM_NOMATCH
+
+Upstream-Status: Submitted [https://salsa.debian.org/debian/ifupdown/merge_requests/5]
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+---
+ archcommon.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/archcommon.h b/archcommon.h
+index fe99950..f257f9d 100644
+--- a/archcommon.h
++++ b/archcommon.h
+@@ -1,5 +1,9 @@
+ #include "header.h"
+ 
++#if !defined(FNM_EXTMATCH)
++#define FNM_EXTMATCH 0
++#endif
++
+ bool execable(const char *);
+ 
+ #define iface_is_link() (!_iface_has(ifd->real_iface, ":."))
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
index a24b8cda66..d1c3d260ed 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -1,4 +1,4 @@
-From 7af9db748974cb3a2c6ef8f9e03d7db1f9f8ee16 Mon Sep 17 00:00:00 2001
+From 40257d65b338b6e2ed9d89d6fa7c7b8701a4c311 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Wed, 6 Aug 2014 14:54:12 -0400
 Subject: [PATCH 1/2] defn2[c|man]: don't rely on dpkg-architecture to set arch
@@ -19,7 +19,7 @@ Upstream-Status: Pending
  2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/defn2c.pl b/defn2c.pl
-index c449de2f3d1c..38845e374c76 100755
+index 8798dc2..f2551c7 100755
 --- a/defn2c.pl
 +++ b/defn2c.pl
 @@ -2,9 +2,9 @@
@@ -36,7 +36,7 @@ index c449de2f3d1c..38845e374c76 100755
  # declarations
  my $address_family = "";
 diff --git a/defn2man.pl b/defn2man.pl
-index 6ddcfdd4fe68..c9c4dd046597 100755
+index 6ddcfdd..c9c4dd0 100755
 --- a/defn2man.pl
 +++ b/defn2man.pl
 @@ -2,9 +2,9 @@
@@ -53,5 +53,5 @@ index 6ddcfdd4fe68..c9c4dd046597 100755
  # declarations
  my $line;
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
index 37a61c9bc1..5b0d51d736 100644
--- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
+++ b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
@@ -1,7 +1,7 @@
-From 7efe4676747e4e4a056b9bfb4e9424c8354e9996 Mon Sep 17 00:00:00 2001
+From 6fce99c9e42cbacde1855473b745ca1fded3fbf7 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Wed, 21 Dec 2016 15:32:07 +0200
-Subject: [PATCH] inet[6].defn: fix inverted checks for loopback
+Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for loopback
 
 Compared to the hurd link.defn for loopback, we see these
 are inverted, meaning that you would only be able to configure
@@ -37,11 +37,11 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- inet.defn | 140 +++++++++++++++++++++++++++++++-------------------------------
- 1 file changed, 70 insertions(+), 70 deletions(-)
+ inet.defn | 134 +++++++++++++++++++++++++++---------------------------
+ 1 file changed, 67 insertions(+), 67 deletions(-)
 
 diff --git a/inet.defn b/inet.defn
-index 75e6744..23c7756 100644
+index 182b56b..31067bc 100644
 --- a/inet.defn
 +++ b/inet.defn
 @@ -6,10 +6,10 @@ method loopback
@@ -103,9 +103,9 @@ index 75e6744..23c7756 100644
  
    up
 -    [[/bin/ip link set dev %iface% address %hwaddress%]]
--    /sbin/dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+-    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
 +    [[ip link set dev %iface% address %hwaddress%]]
-+    dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
  	[[-e IF_METRIC=%metric%]] \
          if (execable("/sbin/dhclient"))
 -    /sbin/pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
@@ -122,14 +122,13 @@ index 75e6744..23c7756 100644
          elsif (1)
  
    down
--    /sbin/dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-+    dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+-    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
          if (execable("/sbin/dhclient"))
 -    /sbin/pump -i %iface% -r \
 +    pump -i %iface% -r \
          elsif (execable("/sbin/pump"))
--    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
-+    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(cat /run/udhcpc.%iface%.pid); kill -TERM $(cat /run/udhcpc.%iface%.pid); fi \
+     if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
          elsif (execable("/sbin/udhcpc"))
 -    /sbin/dhcpcd -k %iface% \
 +    dhcpcd -k %iface% \
@@ -252,9 +251,9 @@ index 75e6744..23c7756 100644
  
    up
 -    [[/sbin/ifconfig %iface% link %hwaddress%]]
--    /sbin/dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+-    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
 +    [[ifconfig %iface% link %hwaddress%]]
-+    dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
  	[[-e IF_METRIC=%metric%]] \
          if (execable("/sbin/dhclient"))
 -    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H %hostname%]] \
@@ -269,11 +268,10 @@ index 75e6744..23c7756 100644
          elsif (1)
  
    down
--    /sbin/dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-+    dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+-    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
          if (execable("/sbin/dhclient"))
--    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
-+    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(cat /run/udhcpc.%iface%.pid); kill -TERM $(cat /run/udhcpc.%iface%.pid); fi \
+     if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
          elsif (execable("/sbin/udhcpc"))
 -    /sbin/dhcpcd -k %iface% \
 +    dhcpcd -k %iface% \
@@ -341,8 +339,8 @@ index 75e6744..23c7756 100644
  
    up
      [[Warning: Option hwaddress: %hwaddress% not yet supported]]
--    /sbin/dhclient -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
-+    dhclient -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
+-    /sbin/dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
++    dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
          if (execable("/sbin/dhclient"))
 -    /sbin/udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H %hostname%]] \
 +    udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H %hostname%]] \
@@ -356,11 +354,10 @@ index 75e6744..23c7756 100644
          elsif (1)
  
    down
--    /sbin/dhclient -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
-+    dhclient -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
+-    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
++    dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
          if (execable("/sbin/dhclient"))
--    if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface///.%.pid); fi \
-+    if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2 $(cat /run/udhcpc.%iface///.%.pid); kill -TERM $(cat /run/udhcpc.%iface///.%.pid); fi \
+     if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface///.%.pid); fi \
          elsif (execable("/sbin/udhcpc"))
 -    /sbin/dhcpcd -k %iface% \
 +    dhcpcd -k %iface% \
@@ -402,5 +399,5 @@ index 75e6744..23c7756 100644
 -    /usr/sbin/avahi-autoipd --kill %iface%
 +    avahi-autoipd --kill %iface%
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
similarity index 93%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
index e9f3a2aee9..bd0989e885 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
@@ -10,8 +10,9 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
 	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
 	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
 	   file://99_network \
+	   file://0001-Define-FNM_EXTMATCH-for-musl.patch \
 	  "
-SRCREV = "11b9f99f7ecc7052497e6786156cfed531f11823"
+SRCREV = "ab5a0f464e53e172316a5ca8b5dcdc49e8848999"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


