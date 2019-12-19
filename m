Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E249F7FC2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q10so5946463wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GsqGAhSlru9oYJ1qq3InSUv5cVsOy4Pj8qhTrOLAhwc=;
	b=ETW18/t1shSZ/lQEjRn96h7wemnuMZtnqu+7mHYsjVNEZx1hCXjdB09fdc2pyuzOCQ
	54yOLIaPKA8lKy8PJ4GGUfcNyIupXDRHyBkCxgVb9DVNjsq/ioU/mxUeyd8/vzDR9GKj
	L2ZgoUoMrRTZ2GkyYs/4Ept0UX840j/qPyWFNNK5YljWhRdE5IWAAjV1vuLJTEGKkTTH
	yX+5r5Qev+4ur8+WeoSuwbFJ2lR3qEOmLE+M0UthRLh17lITo0+UDVqvgOLOe7SE9Vay
	d2+zPaArDShJShB9KCws4uM4PpsPWvGH6ZFS2XUsOGXiR6IVnLOUjbzxA8ZsOKL9PrK2
	Gfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GsqGAhSlru9oYJ1qq3InSUv5cVsOy4Pj8qhTrOLAhwc=;
	b=hxHN6SBjV76numuPX6looL4zg5947tgDoQ0taorpTtWs/+ib5QpNzR5qZsWjGh14Oy
	1xPRiggkbRtxx6tr3JBihMfV/LK+4RhLHKjFl63beZ8bfCWpFta6xBQkvSprF2yCUo5a
	F1pGUD0cPRefXiFCDtfgJ2hHzpZgdZKW8i7XoiAx9fsqdDSOin8SquFKn24WLMpb3poS
	j6rW8zbl5Z6Za3V+Lrk66fMiCryJde74TMvv6ciC1b/V5w7rXW+v6bu1SZiUPQ3kf1WM
	Mc7uJyoMI3EjiLdYUvbpzl3v1p/FnFTDiHjIMYmLB1/LSGWOUSf0km3gs4K436aBPzzA
	oNqA==
X-Gm-Message-State: APjAAAWrcjlfKBkFtOIfJDTB0dFCqF4XIZsXSTcPlsLxWpUizrysbdqe
	5Kbgn7DZDQeeonhxV9gzSQAG2Cu2SJ4=
X-Google-Smtp-Source: APXvYqwZjSQkWaJ3iuHUmGSdXWECneexFGrGJIOVs9+7ZSfJV8W18lrssCja4kqcwyOJCMoI0/ZhHw==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr9294189wru.230.1576761789457; 
	Thu, 19 Dec 2019 05:23:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:47 +0100
Message-Id: <20191219132301.80034-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/16] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:10 -0000

Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch as
it is difficult to rebase and not clear if still necessary.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...efn-fix-inverted-checks-for-loopback.patch | 403 ------------------
 ...{ifupdown_0.8.22.bb => ifupdown_0.8.35.bb} |  11 +-
 2 files changed, 5 insertions(+), 409 deletions(-)
 delete mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.22.bb => ifupdown_0.8.35.bb} (83%)

diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
deleted file mode 100644
index 5b0d51d736f..00000000000
--- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
+++ /dev/null
@@ -1,403 +0,0 @@
-From 6fce99c9e42cbacde1855473b745ca1fded3fbf7 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 21 Dec 2016 15:32:07 +0200
-Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for loopback
-
-Compared to the hurd link.defn for loopback, we see these
-are inverted, meaning that you would only be able to configure
-a loopback device that was _not_ named "lo" (unlikely to exist).
-
-The result was that we'd update /run/network/ifstate for "lo"
-but never actually do anything for up/down, as shown below:
-
-root@localhost:~# ifconfig -s
-Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR  TX-OK TX-ERR TX-DRP TX-OVR Flg
-eth0       1500 0   7736329      0   2016 0 5289422      0      0      0 BMRU
-lo        65536 0        18      0      0 0      18      0      0      0 LRU
-root@localhost:~# ifdown lo
-root@localhost:~# echo $?
-0
-root@localhost:~# ifconfig -s
-Iface   MTU Met   RX-OK RX-ERR RX-DRP  RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
-eth0       1500 0   7736406      0  2016 0   5289455      0      0      0 BMRU
-lo        65536 0        18      0   0 0            18    0    0    0     LRU
-root@localhost:~# ifconfig lo down
-root@localhost:~# ifconfig -s
-Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
-eth0       1500 0   7736474 0   2016 0       5289481      0     0      0 BMRU
-root@localhost:~#
-
-Also reverted the commit:
-commit 80b878497663dae08f70b4d3cffe127b57a3cfc
-which uses absolute paths to binaries called by ifup/ifdown.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- inet.defn | 134 +++++++++++++++++++++++++++---------------------------
- 1 file changed, 67 insertions(+), 67 deletions(-)
-
-diff --git a/inet.defn b/inet.defn
-index 182b56b..31067bc 100644
---- a/inet.defn
-+++ b/inet.defn
-@@ -6,10 +6,10 @@ method loopback
-     This method may be used to define the IPv4 loopback interface.
- 
-   up
--    /bin/ip link set dev %iface% up if (!iface_is_lo())
-+    ip link set dev %iface% up if (!iface_is_lo())
- 
-   down
--    /bin/ip link set dev %iface% down if (!iface_is_lo())
-+    ip link set dev %iface% down if (!iface_is_lo())
- 
- method static
-   description
-@@ -36,17 +36,17 @@ method static
-     broadcast compute_v4_broadcast
- 
-   up
--    /bin/ip addr add %address%[[/%netmask%]] [[broadcast %broadcast%]] \
-+    ip addr add %address%[[/%netmask%]] [[broadcast %broadcast%]] \
- 	[[peer %pointopoint%]] [[scope %scope%]] dev %iface% label %iface%
--    /bin/ip link set dev %iface% [[mtu %mtu%]] [[address %hwaddress%]] up
-+    ip link set dev %iface% [[mtu %mtu%]] [[address %hwaddress%]] up
- 
--    [[ /bin/ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
-+    [[ ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
- 
-   down
--    [[ /bin/ip route del default via %gateway% [[metric %metric%]] dev %iface% 2>&1 1>/dev/null || true ]]
--    /bin/ip addr del %address%[[/%netmask%]] [[broadcast %broadcast%]] \
-+    [[ ip route del default via %gateway% [[metric %metric%]] dev %iface% 2>&1 1>/dev/null || true ]]
-+    ip addr del %address%[[/%netmask%]] [[broadcast %broadcast%]] \
- 	[[peer %pointopoint%]] [[scope %scope%]] dev %iface% label %iface%
--    /bin/ip link set dev %iface% down \
-+    ip link set dev %iface% down \
- 		if (iface_is_link())
- 
- method manual
-@@ -63,12 +63,12 @@ method manual
-     hwaddress cleanup_hwaddress
- 
-   up
--    [[/bin/ip link set dev %iface% mtu %mtu%]]
--    [[/bin/ip link set dev %iface% address %hwaddress%]]
--    /bin/ip link set dev %iface% up 2>/dev/null || true
-+    [[ip link set dev %iface% mtu %mtu%]]
-+    [[ip link set dev %iface% address %hwaddress%]]
-+    ip link set dev %iface% up 2>/dev/null || true
- 
-   down
--    /bin/ip link set dev %iface% down 2>/dev/null || true \
-+    ip link set dev %iface% down 2>/dev/null || true \
-         if (iface_is_link() && !do_all)
- 
- method dhcp
-@@ -93,33 +93,33 @@ method dhcp
-     hwaddress cleanup_hwaddress
- 
-   up
--    [[/bin/ip link set dev %iface% address %hwaddress%]]
--    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-+    [[ip link set dev %iface% address %hwaddress%]]
-+    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
- 	[[-e IF_METRIC=%metric%]] \
-         if (execable("/sbin/dhclient"))
--    /sbin/pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
-+    pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
-         elsif (execable("/sbin/pump"))
--    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x hostname:%hostname%]] \
-+    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x hostname:%hostname%]] \
-         elsif (execable("/sbin/udhcpc"))
--    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
-+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
-            [[-l %leasetime%]] [[-m %metric%]] %iface% \
-         elsif (execable("/sbin/dhcpcd"))
-     echo 'No DHCP client software found!' >/dev/stderr; false \
-         elsif (1)
- 
-   down
--    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-+    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-         if (execable("/sbin/dhclient"))
--    /sbin/pump -i %iface% -r \
-+    pump -i %iface% -r \
-         elsif (execable("/sbin/pump"))
-     if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
-         elsif (execable("/sbin/udhcpc"))
--    /sbin/dhcpcd -k %iface% \
-+    dhcpcd -k %iface% \
-         elsif (execable("/sbin/dhcpcd"))
-     echo 'No DHCP client software found!' >/dev/stderr; false \
-         elsif (1)
- 
--    /bin/ip link set dev %iface% down \
-+    ip link set dev %iface% down \
- 		if (iface_is_link())
- 
- method bootp
-@@ -134,11 +134,11 @@ method bootp
-                       whatever it really is.
- 
-   up
--    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
-+    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
-            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
- 
-   down
--    /bin/ip link set dev %iface% down \
-+    ip link set dev %iface% down \
-         if (iface_is_link())
- 
- method tunnel
-@@ -158,13 +158,13 @@ method tunnel
-     ttl time              -- TTL setting
-     mtu size              -- MTU size
-   up
--    /bin/ip tunnel add %iface% mode %mode% remote %endpoint% [[local %local%]] \
-+    ip tunnel add %iface% mode %mode% remote %endpoint% [[local %local%]] \
-        [[ttl %ttl%]]
--    /bin/ip link set %iface% up [[mtu %mtu%]]
--    /bin/ip addr add %address%/%netmask% dev %iface% [[peer %dstaddr%]]
--    [[ /bin/ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
-+    ip link set %iface% up [[mtu %mtu%]]
-+    ip addr add %address%/%netmask% dev %iface% [[peer %dstaddr%]]
-+    [[ ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
-   down
--    /bin/ip tunnel del %iface%
-+    ip tunnel del %iface%
- 
- method ppp
-   description
-@@ -175,9 +175,9 @@ method ppp
-     unit number    -- Use /number/ as the ppp unit number.
-     options string -- Pass /string/ as additional options to pon.
-   up
--    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
-+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
-   down
--    /usr/bin/poff [[%provider%]]
-+    poff [[%provider%]]
- 
- method wvdial
-   description
-@@ -186,10 +186,10 @@ method wvdial
-   options
-     provider name  -- Use /name/ as the provider (from /etc/wvdial.conf).
-   up
--    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
-+    start-stop-daemon --start -x /usr/bin/wvdial \
-                       -p /run/wvdial.%iface%.pid -b -m -- [[ %provider% ]]
-   down
--    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
-+    start-stop-daemon --stop -x /usr/bin/wvdial \
-                       -p /run/wvdial.%iface%.pid -s 2
- 
- 
-@@ -200,9 +200,9 @@ method ipv4ll
-     known as APIPA or IPAC, and often colloquially referred to
-     as "Zeroconf address".
-   up
--    /usr/sbin/avahi-autoipd -D %iface%
-+    avahi-autoipd -D %iface%
-   down
--    /usr/sbin/avahi-autoipd --kill %iface%
-+    avahi-autoipd --kill %iface%
- 
- architecture kfreebsd
- 
-@@ -211,11 +211,11 @@ method loopback
-     This method may be used to define the IPv4 loopback interface.
- 
-   up
--    /sbin/ifconfig %iface% 127.0.0.1 up \
-+    ifconfig %iface% 127.0.0.1 up \
- 	if (!iface_is_lo())
- 
-   down
--    /sbin/ifconfig %iface% down \
-+    ifconfig %iface% down \
- 	if (!iface_is_lo())
- 
- method static
-@@ -238,15 +238,15 @@ method static
-     hwaddress cleanup_hwaddress
- 
-   up
--    [[ /sbin/ifconfig %iface% link %hwaddress%]]
--    /sbin/ifconfig %iface% %address% [[netmask %netmask%]] [[broadcast %broadcast%]] \
-+    [[ ifconfig %iface% link %hwaddress%]]
-+    ifconfig %iface% %address% [[netmask %netmask%]] [[broadcast %broadcast%]] \
- 	[[pointopoint %pointopoint%]] [[media %media%]] [[mtu %mtu%]] \
- 	up
--    [[ /sbin/route add default %gateway% ]]
-+    [[ route add default %gateway% ]]
- 
-   down
--    [[ /sbin/route del default %gateway% 2>&1 1>/dev/null || true ]]
--    /sbin/ifconfig %iface% down
-+    [[ route del default %gateway% 2>&1 1>/dev/null || true ]]
-+    ifconfig %iface% down
- 
- method manual
-   description
-@@ -279,30 +279,30 @@ method dhcp
-     hwaddress cleanup_hwaddress
- 
-   up
--    [[/sbin/ifconfig %iface% link %hwaddress%]]
--    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-+    [[ifconfig %iface% link %hwaddress%]]
-+    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
- 	[[-e IF_METRIC=%metric%]] \
-         if (execable("/sbin/dhclient"))
--    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H %hostname%]] \
-+    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H %hostname%]] \
-            [[-c %client%]] \
-         elsif (execable("/sbin/udhcpc"))
--    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
-+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
-            [[-l %leasetime%]] %iface% \
-         elsif (execable("/sbin/dhcpcd"))
-     echo 'No DHCP client software found!' >/dev/stderr; false \
-         elsif (1)
- 
-   down
--    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-+    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
-         if (execable("/sbin/dhclient"))
-     if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
-         elsif (execable("/sbin/udhcpc"))
--    /sbin/dhcpcd -k %iface% \
-+    dhcpcd -k %iface% \
-         elsif (execable("/sbin/dhcpcd"))
-     echo 'No DHCP client software found!' >/dev/stderr; false \
-         elsif (1)
- 
--    /sbin/ifconfig %iface% down
-+    ifconfig %iface% down
- 
- method bootp
-   description
-@@ -316,11 +316,11 @@ method bootp
-                       whatever it really is.
- 
-   up
--    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
-+    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
-            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
- 
-   down
--    /sbin/ifconfig %iface% down
-+    ifconfig %iface% down
- 
- method ppp
-   description
-@@ -331,9 +331,9 @@ method ppp
-     unit number    -- Use /number/ as the ppp unit number.
-     options string -- Pass /string/ as additional options to pon.
-   up
--    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
-+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
-   down
--    /usr/bin/poff [[%provider%]]
-+    poff [[%provider%]]
- 
- method wvdial
-   description
-@@ -342,10 +342,10 @@ method wvdial
-   options
-     provider name  -- Use /name/ as the provider (from /etc/wvdial.conf).
-   up
--    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
-+    start-stop-daemon --start -x /usr/bin/wvdial \
-                       -p /run/wvdial.%iface%.pid -b -m -- [[ %provider% ]]
-   down
--    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
-+    start-stop-daemon --stop -x /usr/bin/wvdial \
-                       -p /run/wvdial.%iface%.pid -s 2
- 
- 
-@@ -356,9 +356,9 @@ method ipv4ll
-     known as APIPA or IPAC, and often colloquially referred to
-     as "Zeroconf address".
-   up
--    /usr/sbin/avahi-autoipd -D %iface%
-+    avahi-autoipd -D %iface%
-   down
--    /usr/sbin/avahi-autoipd --kill %iface%
-+    avahi-autoipd --kill %iface%
- architecture hurd
- 
- method loopback
-@@ -432,23 +432,23 @@ method dhcp
- 
-   up
-     [[Warning: Option hwaddress: %hwaddress% not yet supported]]
--    /sbin/dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
-+    dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
-         if (execable("/sbin/dhclient"))
--    /sbin/udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H %hostname%]] \
-+    udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H %hostname%]] \
-            [[-c %client%]] \
-         elsif (execable("/sbin/udhcpc"))
--    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
-+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
-            [[-l %leasetime%]] %iface% \
-         elsif (execable("/sbin/dhcpcd"))
-     echo 'No DHCP client software found!' >/dev/stderr; false \
-         elsif (1)
- 
-   down
--    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
-+    dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
-         if (execable("/sbin/dhclient"))
-     if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface///.%.pid); fi \
-         elsif (execable("/sbin/udhcpc"))
--    /sbin/dhcpcd -k %iface% \
-+    dhcpcd -k %iface% \
-         elsif (execable("/sbin/dhcpcd"))
-     echo 'No DHCP client software found!' >/dev/stderr; false \
-         elsif (1)
-@@ -482,9 +482,9 @@ method ppp
-     unit number    -- Use /number/ as the ppp unit number.
-     options string -- Pass /string/ as additional options to pon.
-   up
--    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
-+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
-   down
--    /usr/bin/poff [[%provider%]]
-+    poff [[%provider%]]
- 
- method wvdial
-   description
-@@ -493,10 +493,10 @@ method wvdial
-   options
-     provider name  -- Use /name/ as the provider (from /etc/wvdial.conf).
-   up
--    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
-+    start-stop-daemon --start -x /usr/bin/wvdial \
-                       -p /run/wvdial.%iface///.%.pid -b -m -- [[ %provider% ]]
-   down
--    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
-+    start-stop-daemon --stop -x /usr/bin/wvdial \
-                       -p /run/wvdial.%iface///.%.pid -s 2
- 
- 
-@@ -507,6 +507,6 @@ method ipv4ll
-     known as APIPA or IPAC, and often colloquially referred to
-     as "Zeroconf address".
-   up
--    /usr/sbin/avahi-autoipd -D %iface%
-+    avahi-autoipd -D %iface%
-   down
--    /usr/sbin/avahi-autoipd --kill %iface%
-+    avahi-autoipd --kill %iface%
--- 
-2.17.1
-
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
similarity index 83%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
index bd0989e8855..de8e1cf66ba 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -7,12 +7,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
-	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
-	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
-	   file://99_network \
-	   file://0001-Define-FNM_EXTMATCH-for-musl.patch \
-	  "
-SRCREV = "ab5a0f464e53e172316a5ca8b5dcdc49e8848999"
+           file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
+           file://99_network \
+           file://0001-Define-FNM_EXTMATCH-for-musl.patch \
+           "
+SRCREV = "4af76318cfc57f8e4a44d357104188666213bd4b"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


