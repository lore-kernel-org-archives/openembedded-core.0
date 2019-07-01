Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id F17537E687
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 18:52:31 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k18so14279509ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 11:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=N3jAFmjWvEEGOUjJNpfVPrXOGvcRmad7QubN5mapC0U=;
	b=lS34GEJQyWBj2RVzogII0e49O6jS1pxeyVuhwCYFW0f4b33r9YtYbYI+gsJ7IQxyUu
	wOaXdwM62o9V1VWp9SPFBMQQg8/TJn7Yk38Bw6OtW5Ko9gEU3mj4rcGBJ++8QHQRgrB+
	pjzwzRCxAgR0vbyx4x5gbAeCup93zK1uh51Wt5KGjPCrVsxmOKesPFy8t9SxWAnUiGJK
	0S5JJjO9F//0QFuNM7kFB6aaaSIAADKJkwcwvTGaKYTOEBAbwFIWgHFzydhonDDRrbxE
	0Kiooj3mJh15S+yjq4g+1rcDyRFulQHke0RMG56UUqh1JmsWXrfoP1aKwbJldXJjC2e3
	vyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N3jAFmjWvEEGOUjJNpfVPrXOGvcRmad7QubN5mapC0U=;
	b=qN5z0JY8MRt+M/ieOPj2eRdyHj/t8LLyUNP0YAhyeqO7rE/bGgG+I2d4AoB9AhGuGQ
	rN4vBjZdtfmH8G/0D9xewAWoJ18nfnBoeRWdIvIWqjJ33m7EWtoE7qpeSvBYf6Qg1leG
	uWe8nOluDi29YOjiSaiJiY1o4B5HBzMNw9FaZSTL2pMKE9T+fGB55/gxVhTAESQgMsQw
	owpIZcMGDm9SFmjpRJXGFWAV1+IsUnh+Q16x10DjMVVMHDg446lwwAdrlvBxe++AhANB
	CqpxQsprRYpvfu3MMbWpo/6eEnJlPIYWJt40uAP/xhvb/MX7GQpTsyZMo6Rb1R0KfA/O
	Fu9g==
X-Gm-Message-State: APjAAAWc1zO1QlwasQP6qXkPyEEZpn806mRF7pp4dQbuxlQNyqvAzOof
	6aFUbXR4BPPzbNGAaDyoNT1vRgie9P4=
X-Google-Smtp-Source: APXvYqyY0rSAhyW6PJuXLOiywwTQOYXkryMbIYMxKXgo5g8kzv+7iSpkgDycuYron4pyxThPjE4Osg==
X-Received: by 2002:a2e:98d7:: with SMTP id s23mr3906940ljj.179.1562007151719; 
	Mon, 01 Jul 2019 11:52:31 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z85sm3353471ljb.101.2019.07.01.11.52.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 11:52:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 20:52:27 +0200
Message-Id: <20190701185227.26040-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ifupdown: update to 0.8.22
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
X-List-Received-Date: Mon, 01 Jul 2019 18:52:32 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...t-rely-on-dpkg-architecture-to-set-a.patch |  8 ++--
 ...efn-fix-inverted-checks-for-loopback.patch | 45 +++++++++----------
 ...{ifupdown_0.8.16.bb => ifupdown_0.8.22.bb} |  2 +-
 3 files changed, 26 insertions(+), 29 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.16.bb => ifupdown_0.8.22.bb} (96%)

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
similarity index 96%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
index e9f3a2aee9..12d5423cfe 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
 	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
 	   file://99_network \
 	  "
-SRCREV = "11b9f99f7ecc7052497e6786156cfed531f11823"
+SRCREV = "ab5a0f464e53e172316a5ca8b5dcdc49e8848999"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


