Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 534E17FD6C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 17:13:10 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id 73so2223287uac.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 09:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mAcwL5TkhhvOEx4dsCBuTJ/WPSuaxwz/PCM1Wiwpywc=;
	b=lgAa8uUpFGFkh3/CKI/sPby9+H5KJMkJKGg9O9TLwLhyVyQyVpD8nj9bpnR4BgJOIF
	PcjsqlCyoHueBsKVDaIB/p68k7z0jWlpEjeXCsR91ifpXs4TD6hb7171PxEvkZW3srZb
	1cWG+hYGXfICe3GJL+82n6/WUceN0rZNtFm9RYKASwa5k3X5p0I8lbhfXjP+ckvdj+em
	fztY7NOQ1E5Icl26SNi87TlNmPcaQrW7CsFkmmj4o+zxYATgIjLj7AfJ58NIGf7WAyP1
	rRQfVEq/Yb9KuN8DX+heoQ2LM/WPHUW8mEH9SGEJPs8qQiz3prEIJ0ZMKePitbKxsXo7
	6nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mAcwL5TkhhvOEx4dsCBuTJ/WPSuaxwz/PCM1Wiwpywc=;
	b=Hi9yas6HG63K6A7ZsmXUT7dgUyV5JEA00SfQfclhrbIJtcMG+YNwu7nnPsHUz/5UdY
	zFak3aDT+1tY+QVB7QhBRwSxP8LmMAVHB1+08wmQc/7zQBt3skNYt2Hx7TCZk3vcuASe
	qhWkhQFLYHul0qszgYJ4KUSJr/NvNSsa/GLlXFnfBb1ttyAWFS8SPtg6flSojmdPWDfn
	gpuMWg+uIF0Zxg19Mq6r3uou2Xkx7jbSkhJkPqLb5PYX8gU/3rFGWP0DZ19VqIvin908
	MYjXjbDjCEpQH+aYxI1jnuGanP0+2gGG5HLi8n+hFkCR9w2aeHNMtNYZM08b4lleU/EF
	srIg==
X-Gm-Message-State: APjAAAX7QpHZtq5YcYHTOB+iGIwBXwC85joirE5kvg1lQ1x6ApQg5qmy
	PoCRbLIg52HmTbLlS1/xJcOeohWhWy0o06294o4=
X-Google-Smtp-Source: APXvYqzQ6tnoBTjGHPS2usz9fBp4ohJ0JkPpaAXOvwzvn0Qi+nP8MVfID5wT2KUiRO0eO4osZPRhUUSz6GYZUj0w8s4=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr6234588uar.100.1576775590959; 
	Thu, 19 Dec 2019 09:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
	<20191219132301.80034-2-alex.kanavin@gmail.com>
	<5ed01ef566cd4e3a54f13757b666a9d4a9cfe11a.camel@gmail.com>
In-Reply-To: <5ed01ef566cd4e3a54f13757b666a9d4a9cfe11a.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2019 18:12:59 +0100
Message-ID: <CANNYZj-HmW3a6XBbLUQCwhjDvfyPp8RoPCQaTpD7U7Sd=+J_jA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/16] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 19 Dec 2019 17:13:10 -0000
Content-Type: multipart/alternative; boundary="000000000000fd5f14059a11acde"

--000000000000fd5f14059a11acde
Content-Type: text/plain; charset="UTF-8"

Sure, added them.

I booted a system without the patch, and the network did go up without
errors.

If the patch is still relevant, I would suggest that an effort is made to
get it upstream. It will continue to be difficult to rebase.

Alex

On Thu, 19 Dec 2019 at 18:03, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, 2019-12-19 at 14:22 +0100, Alexander Kanavin wrote:
> > Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch as
> > it is difficult to rebase and not clear if still necessary.
> >
>
> perhaps Cc the patch authors and get an opinion ?
>
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...efn-fix-inverted-checks-for-loopback.patch | 403 ----------------
> > --
> >  ...{ifupdown_0.8.22.bb => ifupdown_0.8.35.bb} |  11 +-
> >  2 files changed, 5 insertions(+), 409 deletions(-)
> >  delete mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn-
> > fix-inverted-checks-for-loopback.patch
> >  rename meta/recipes-core/ifupdown/{ifupdown_0.8.22.bb =>
> > ifupdown_0.8.35.bb} (83%)
> >
> > diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-
> > inverted-checks-for-loopback.patch b/meta/recipes-
> > core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-
> > loopback.patch
> > deleted file mode 100644
> > index 5b0d51d736f..00000000000
> > --- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-
> > checks-for-loopback.patch
> > +++ /dev/null
> > @@ -1,403 +0,0 @@
> > -From 6fce99c9e42cbacde1855473b745ca1fded3fbf7 Mon Sep 17 00:00:00
> > 2001
> > -From: "Maxin B. John" <maxin.john@intel.com>
> > -Date: Wed, 21 Dec 2016 15:32:07 +0200
> > -Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for loopback
> > -
> > -Compared to the hurd link.defn for loopback, we see these
> > -are inverted, meaning that you would only be able to configure
> > -a loopback device that was _not_ named "lo" (unlikely to exist).
> > -
> > -The result was that we'd update /run/network/ifstate for "lo"
> > -but never actually do anything for up/down, as shown below:
> > -
> > -root@localhost:~# ifconfig -s
> > -Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR  TX-OK TX-ERR TX-DRP
> > TX-OVR Flg
> > -eth0       1500 0   7736329      0   2016 0
> > 5289422      0      0      0 BMRU
> > -lo        65536 0        18      0      0
> > 0      18      0      0      0 LRU
> > -root@localhost:~# ifdown lo
> > -root@localhost:~# echo $?
> > -0
> > -root@localhost:~# ifconfig -s
> > -Iface   MTU Met   RX-OK RX-ERR RX-DRP  RX-OVR    TX-OK TX-ERR TX-DRP
> > TX-OVR Flg
> > -eth0       1500 0   7736406      0  2016
> > 0   5289455      0      0      0 BMRU
> > -lo        65536 0        18      0   0
> > 0            18    0    0    0     LRU
> > -root@localhost:~# ifconfig lo down
> > -root@localhost:~# ifconfig -s
> > -Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP
> > TX-OVR Flg
> > -eth0       1500 0   7736474 0   2016
> > 0       5289481      0     0      0 BMRU
> > -root@localhost:~#
> > -
> > -Also reverted the commit:
> > -commit 80b878497663dae08f70b4d3cffe127b57a3cfc
> > -which uses absolute paths to binaries called by ifup/ifdown.
> > -
> > -Upstream-Status: Inappropriate [OE specific]
> > -
> > -Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ----
> > - inet.defn | 134 +++++++++++++++++++++++++++----------------------
> > -----
> > - 1 file changed, 67 insertions(+), 67 deletions(-)
> > -
> > -diff --git a/inet.defn b/inet.defn
> > -index 182b56b..31067bc 100644
> > ---- a/inet.defn
> > -+++ b/inet.defn
> > -@@ -6,10 +6,10 @@ method loopback
> > -     This method may be used to define the IPv4 loopback interface.
> > -
> > -   up
> > --    /bin/ip link set dev %iface% up if (!iface_is_lo())
> > -+    ip link set dev %iface% up if (!iface_is_lo())
> > -
> > -   down
> > --    /bin/ip link set dev %iface% down if (!iface_is_lo())
> > -+    ip link set dev %iface% down if (!iface_is_lo())
> > -
> > - method static
> > -   description
> > -@@ -36,17 +36,17 @@ method static
> > -     broadcast compute_v4_broadcast
> > -
> > -   up
> > --    /bin/ip addr add %address%[[/%netmask%]] [[broadcast
> > %broadcast%]] \
> > -+    ip addr add %address%[[/%netmask%]] [[broadcast %broadcast%]] \
> > -     [[peer %pointopoint%]] [[scope %scope%]] dev %iface% label
> > %iface%
> > --    /bin/ip link set dev %iface% [[mtu %mtu%]] [[address
> > %hwaddress%]] up
> > -+    ip link set dev %iface% [[mtu %mtu%]] [[address %hwaddress%]]
> > up
> > -
> > --    [[ /bin/ip route add default via %gateway% [[metric %metric%]]
> > dev %iface% onlink ]]
> > -+    [[ ip route add default via %gateway% [[metric %metric%]] dev
> > %iface% onlink ]]
> > -
> > -   down
> > --    [[ /bin/ip route del default via %gateway% [[metric %metric%]]
> > dev %iface% 2>&1 1>/dev/null || true ]]
> > --    /bin/ip addr del %address%[[/%netmask%]] [[broadcast
> > %broadcast%]] \
> > -+    [[ ip route del default via %gateway% [[metric %metric%]] dev
> > %iface% 2>&1 1>/dev/null || true ]]
> > -+    ip addr del %address%[[/%netmask%]] [[broadcast %broadcast%]] \
> > -     [[peer %pointopoint%]] [[scope %scope%]] dev %iface% label
> > %iface%
> > --    /bin/ip link set dev %iface% down \
> > -+    ip link set dev %iface% down \
> > -             if (iface_is_link())
> > -
> > - method manual
> > -@@ -63,12 +63,12 @@ method manual
> > -     hwaddress cleanup_hwaddress
> > -
> > -   up
> > --    [[/bin/ip link set dev %iface% mtu %mtu%]]
> > --    [[/bin/ip link set dev %iface% address %hwaddress%]]
> > --    /bin/ip link set dev %iface% up 2>/dev/null || true
> > -+    [[ip link set dev %iface% mtu %mtu%]]
> > -+    [[ip link set dev %iface% address %hwaddress%]]
> > -+    ip link set dev %iface% up 2>/dev/null || true
> > -
> > -   down
> > --    /bin/ip link set dev %iface% down 2>/dev/null || true \
> > -+    ip link set dev %iface% down 2>/dev/null || true \
> > -         if (iface_is_link() && !do_all)
> > -
> > - method dhcp
> > -@@ -93,33 +93,33 @@ method dhcp
> > -     hwaddress cleanup_hwaddress
> > -
> > -   up
> > --    [[/bin/ip link set dev %iface% address %hwaddress%]]
> > --    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -+    [[ip link set dev %iface% address %hwaddress%]]
> > -+    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -     [[-e IF_METRIC=%metric%]] \
> > -         if (execable("/sbin/dhclient"))
> > --    /sbin/pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
> > -+    pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
> > -         elsif (execable("/sbin/pump"))
> > --    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x
> > hostname:%hostname%]] \
> > -+    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x
> > hostname:%hostname%]] \
> > -         elsif (execable("/sbin/udhcpc"))
> > --    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]]
> > \
> > -+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
> > -            [[-l %leasetime%]] [[-m %metric%]] %iface% \
> > -         elsif (execable("/sbin/dhcpcd"))
> > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > -         elsif (1)
> > -
> > -   down
> > --    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -+    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -         if (execable("/sbin/dhclient"))
> > --    /sbin/pump -i %iface% -r \
> > -+    pump -i %iface% -r \
> > -         elsif (execable("/sbin/pump"))
> > -     if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat
> > /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat
> > /run/udhcpc.%iface%.pid); fi \
> > -         elsif (execable("/sbin/udhcpc"))
> > --    /sbin/dhcpcd -k %iface% \
> > -+    dhcpcd -k %iface% \
> > -         elsif (execable("/sbin/dhcpcd"))
> > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > -         elsif (1)
> > -
> > --    /bin/ip link set dev %iface% down \
> > -+    ip link set dev %iface% down \
> > -             if (iface_is_link())
> > -
> > - method bootp
> > -@@ -134,11 +134,11 @@ method bootp
> > -                       whatever it really is.
> > -
> > -   up
> > --    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server
> > %server%]] \
> > -+    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server
> > %server%]] \
> > -            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
> > -
> > -   down
> > --    /bin/ip link set dev %iface% down \
> > -+    ip link set dev %iface% down \
> > -         if (iface_is_link())
> > -
> > - method tunnel
> > -@@ -158,13 +158,13 @@ method tunnel
> > -     ttl time              -- TTL setting
> > -     mtu size              -- MTU size
> > -   up
> > --    /bin/ip tunnel add %iface% mode %mode% remote %endpoint%
> > [[local %local%]] \
> > -+    ip tunnel add %iface% mode %mode% remote %endpoint% [[local
> > %local%]] \
> > -        [[ttl %ttl%]]
> > --    /bin/ip link set %iface% up [[mtu %mtu%]]
> > --    /bin/ip addr add %address%/%netmask% dev %iface% [[peer
> > %dstaddr%]]
> > --    [[ /bin/ip route add default via %gateway% [[metric %metric%]]
> > dev %iface% onlink ]]
> > -+    ip link set %iface% up [[mtu %mtu%]]
> > -+    ip addr add %address%/%netmask% dev %iface% [[peer %dstaddr%]]
> > -+    [[ ip route add default via %gateway% [[metric %metric%]] dev
> > %iface% onlink ]]
> > -   down
> > --    /bin/ip tunnel del %iface%
> > -+    ip tunnel del %iface%
> > -
> > - method ppp
> > -   description
> > -@@ -175,9 +175,9 @@ method ppp
> > -     unit number    -- Use /number/ as the ppp unit number.
> > -     options string -- Pass /string/ as additional options to pon.
> > -   up
> > --    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > -+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > -   down
> > --    /usr/bin/poff [[%provider%]]
> > -+    poff [[%provider%]]
> > -
> > - method wvdial
> > -   description
> > -@@ -186,10 +186,10 @@ method wvdial
> > -   options
> > -     provider name  -- Use /name/ as the provider (from
> > /etc/wvdial.conf).
> > -   up
> > --    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
> > -+    start-stop-daemon --start -x /usr/bin/wvdial \
> > -                       -p /run/wvdial.%iface%.pid -b -m -- [[
> > %provider% ]]
> > -   down
> > --    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
> > -+    start-stop-daemon --stop -x /usr/bin/wvdial \
> > -                       -p /run/wvdial.%iface%.pid -s 2
> > -
> > -
> > -@@ -200,9 +200,9 @@ method ipv4ll
> > -     known as APIPA or IPAC, and often colloquially referred to
> > -     as "Zeroconf address".
> > -   up
> > --    /usr/sbin/avahi-autoipd -D %iface%
> > -+    avahi-autoipd -D %iface%
> > -   down
> > --    /usr/sbin/avahi-autoipd --kill %iface%
> > -+    avahi-autoipd --kill %iface%
> > -
> > - architecture kfreebsd
> > -
> > -@@ -211,11 +211,11 @@ method loopback
> > -     This method may be used to define the IPv4 loopback interface.
> > -
> > -   up
> > --    /sbin/ifconfig %iface% 127.0.0.1 up \
> > -+    ifconfig %iface% 127.0.0.1 up \
> > -     if (!iface_is_lo())
> > -
> > -   down
> > --    /sbin/ifconfig %iface% down \
> > -+    ifconfig %iface% down \
> > -     if (!iface_is_lo())
> > -
> > - method static
> > -@@ -238,15 +238,15 @@ method static
> > -     hwaddress cleanup_hwaddress
> > -
> > -   up
> > --    [[ /sbin/ifconfig %iface% link %hwaddress%]]
> > --    /sbin/ifconfig %iface% %address% [[netmask %netmask%]]
> > [[broadcast %broadcast%]] \
> > -+    [[ ifconfig %iface% link %hwaddress%]]
> > -+    ifconfig %iface% %address% [[netmask %netmask%]] [[broadcast
> > %broadcast%]] \
> > -     [[pointopoint %pointopoint%]] [[media %media%]] [[mtu %mtu%]] \
> > -     up
> > --    [[ /sbin/route add default %gateway% ]]
> > -+    [[ route add default %gateway% ]]
> > -
> > -   down
> > --    [[ /sbin/route del default %gateway% 2>&1 1>/dev/null || true
> > ]]
> > --    /sbin/ifconfig %iface% down
> > -+    [[ route del default %gateway% 2>&1 1>/dev/null || true ]]
> > -+    ifconfig %iface% down
> > -
> > - method manual
> > -   description
> > -@@ -279,30 +279,30 @@ method dhcp
> > -     hwaddress cleanup_hwaddress
> > -
> > -   up
> > --    [[/sbin/ifconfig %iface% link %hwaddress%]]
> > --    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -+    [[ifconfig %iface% link %hwaddress%]]
> > -+    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -     [[-e IF_METRIC=%metric%]] \
> > -         if (execable("/sbin/dhclient"))
> > --    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H
> > %hostname%]] \
> > -+    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H
> > %hostname%]] \
> > -            [[-c %client%]] \
> > -         elsif (execable("/sbin/udhcpc"))
> > --    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]]
> > \
> > -+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
> > -            [[-l %leasetime%]] %iface% \
> > -         elsif (execable("/sbin/dhcpcd"))
> > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > -         elsif (1)
> > -
> > -   down
> > --    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -+    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > -         if (execable("/sbin/dhclient"))
> > -     if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat
> > /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat
> > /run/udhcpc.%iface%.pid); fi \
> > -         elsif (execable("/sbin/udhcpc"))
> > --    /sbin/dhcpcd -k %iface% \
> > -+    dhcpcd -k %iface% \
> > -         elsif (execable("/sbin/dhcpcd"))
> > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > -         elsif (1)
> > -
> > --    /sbin/ifconfig %iface% down
> > -+    ifconfig %iface% down
> > -
> > - method bootp
> > -   description
> > -@@ -316,11 +316,11 @@ method bootp
> > -                       whatever it really is.
> > -
> > -   up
> > --    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server
> > %server%]] \
> > -+    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server
> > %server%]] \
> > -            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
> > -
> > -   down
> > --    /sbin/ifconfig %iface% down
> > -+    ifconfig %iface% down
> > -
> > - method ppp
> > -   description
> > -@@ -331,9 +331,9 @@ method ppp
> > -     unit number    -- Use /number/ as the ppp unit number.
> > -     options string -- Pass /string/ as additional options to pon.
> > -   up
> > --    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > -+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > -   down
> > --    /usr/bin/poff [[%provider%]]
> > -+    poff [[%provider%]]
> > -
> > - method wvdial
> > -   description
> > -@@ -342,10 +342,10 @@ method wvdial
> > -   options
> > -     provider name  -- Use /name/ as the provider (from
> > /etc/wvdial.conf).
> > -   up
> > --    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
> > -+    start-stop-daemon --start -x /usr/bin/wvdial \
> > -                       -p /run/wvdial.%iface%.pid -b -m -- [[
> > %provider% ]]
> > -   down
> > --    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
> > -+    start-stop-daemon --stop -x /usr/bin/wvdial \
> > -                       -p /run/wvdial.%iface%.pid -s 2
> > -
> > -
> > -@@ -356,9 +356,9 @@ method ipv4ll
> > -     known as APIPA or IPAC, and often colloquially referred to
> > -     as "Zeroconf address".
> > -   up
> > --    /usr/sbin/avahi-autoipd -D %iface%
> > -+    avahi-autoipd -D %iface%
> > -   down
> > --    /usr/sbin/avahi-autoipd --kill %iface%
> > -+    avahi-autoipd --kill %iface%
> > - architecture hurd
> > -
> > - method loopback
> > -@@ -432,23 +432,23 @@ method dhcp
> > -
> > -   up
> > -     [[Warning: Option hwaddress: %hwaddress% not yet supported]]
> > --    /sbin/dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf
> > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > -+    dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf
> > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > -         if (execable("/sbin/dhclient"))
> > --    /sbin/udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H
> > %hostname%]] \
> > -+    udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H
> > %hostname%]] \
> > -            [[-c %client%]] \
> > -         elsif (execable("/sbin/udhcpc"))
> > --    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]]
> > \
> > -+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
> > -            [[-l %leasetime%]] %iface% \
> > -         elsif (execable("/sbin/dhcpcd"))
> > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > -         elsif (1)
> > -
> > -   down
> > --    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -lf
> > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > -+    dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -lf
> > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > -         if (execable("/sbin/dhclient"))
> > -     if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2
> > $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/cat
> > /run/udhcpc.%iface///.%.pid); fi \
> > -         elsif (execable("/sbin/udhcpc"))
> > --    /sbin/dhcpcd -k %iface% \
> > -+    dhcpcd -k %iface% \
> > -         elsif (execable("/sbin/dhcpcd"))
> > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > -         elsif (1)
> > -@@ -482,9 +482,9 @@ method ppp
> > -     unit number    -- Use /number/ as the ppp unit number.
> > -     options string -- Pass /string/ as additional options to pon.
> > -   up
> > --    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > -+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > -   down
> > --    /usr/bin/poff [[%provider%]]
> > -+    poff [[%provider%]]
> > -
> > - method wvdial
> > -   description
> > -@@ -493,10 +493,10 @@ method wvdial
> > -   options
> > -     provider name  -- Use /name/ as the provider (from
> > /etc/wvdial.conf).
> > -   up
> > --    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
> > -+    start-stop-daemon --start -x /usr/bin/wvdial \
> > -                       -p /run/wvdial.%iface///.%.pid -b -m -- [[
> > %provider% ]]
> > -   down
> > --    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
> > -+    start-stop-daemon --stop -x /usr/bin/wvdial \
> > -                       -p /run/wvdial.%iface///.%.pid -s 2
> > -
> > -
> > -@@ -507,6 +507,6 @@ method ipv4ll
> > -     known as APIPA or IPAC, and often colloquially referred to
> > -     as "Zeroconf address".
> > -   up
> > --    /usr/sbin/avahi-autoipd -D %iface%
> > -+    avahi-autoipd -D %iface%
> > -   down
> > --    /usr/sbin/avahi-autoipd --kill %iface%
> > -+    avahi-autoipd --kill %iface%
> > ---
> > -2.17.1
> > -
> > diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
> > b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> > similarity index 83%
> > rename from meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
> > rename to meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> > index bd0989e8855..de8e1cf66ba 100644
> > --- a/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
> > +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> > @@ -7,12 +7,11 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> >
> >  SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https
> > \
> > -        file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-
> > a.patch \
> > -        file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
> > -        file://99_network \
> > -        file://0001-Define-FNM_EXTMATCH-for-musl.patch \
> > -       "
> > -SRCREV = "ab5a0f464e53e172316a5ca8b5dcdc49e8848999"
> > +           file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-
> > set-a.patch \
> > +           file://99_network \
> > +           file://0001-Define-FNM_EXTMATCH-for-musl.patch \
> > +           "
> > +SRCREV = "4af76318cfc57f8e4a44d357104188666213bd4b"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 2.17.1
> >
>
>

--000000000000fd5f14059a11acde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sure, added them.<br></div><div><br></div><div>I boot=
ed a system without the patch, and the network did go up without errors.<br=
></div><div><br></div><div>If the patch is still relevant, I would suggest =
that an effort is made to get it upstream. It will continue to be difficult=
 to rebase.<br></div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 19 Dec 2019 =
at 18:03, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Thu, 2019-12-19 at 14:22 +0100, Alexander Kanavin wrote:<br>
&gt; Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch as<br>
&gt; it is difficult to rebase and not clear if still necessary.<br>
&gt; <br>
<br>
perhaps Cc the patch authors and get an opinion ?<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...efn-fix-inverted-checks-for-loopback.patch | 403 ------------=
----<br>
&gt; --<br>
&gt;=C2=A0 ...{<a href=3D"http://ifupdown_0.8.22.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ifupdown_0.8.22.bb</a> =3D&gt; <a href=3D"http://ifupdown_0.=
8.35.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a>} |=C2=
=A0 11 +-<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 409 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn=
-<br>
&gt; fix-inverted-checks-for-loopback.patch<br>
&gt;=C2=A0 rename meta/recipes-core/ifupdown/{<a href=3D"http://ifupdown_0.=
8.22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</a> =3D&gt=
;<br>
&gt; <a href=3D"http://ifupdown_0.8.35.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ifupdown_0.8.35.bb</a>} (83%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-<br>
&gt; inverted-checks-for-loopback.patch b/meta/recipes-<br>
&gt; core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-<br>
&gt; loopback.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 5b0d51d736f..00000000000<br>
&gt; --- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-<br>
&gt; checks-for-loopback.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,403 +0,0 @@<br>
&gt; -From 6fce99c9e42cbacde1855473b745ca1fded3fbf7 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; -From: &quot;Maxin B. John&quot; &lt;<a href=3D"mailto:maxin.john@inte=
l.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
&gt; -Date: Wed, 21 Dec 2016 15:32:07 +0200<br>
&gt; -Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for loopback<b=
r>
&gt; -<br>
&gt; -Compared to the hurd link.defn for loopback, we see these<br>
&gt; -are inverted, meaning that you would only be able to configure<br>
&gt; -a loopback device that was _not_ named &quot;lo&quot; (unlikely to ex=
ist).<br>
&gt; -<br>
&gt; -The result was that we&#39;d update /run/network/ifstate for &quot;lo=
&quot;<br>
&gt; -but never actually do anything for up/down, as shown below:<br>
&gt; -<br>
&gt; -root@localhost:~# ifconfig -s<br>
&gt; -Iface=C2=A0 =C2=A0MTU Met=C2=A0 =C2=A0RX-OK RX-ERR RX-DRP RX-OVR=C2=
=A0 TX-OK TX-ERR TX-DRP<br>
&gt; TX-OVR Flg<br>
&gt; -eth0=C2=A0 =C2=A0 =C2=A0 =C2=A01500 0=C2=A0 =C2=A07736329=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A02016 0<br>
&gt; 5289422=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 0 BMRU<br>
&gt; -lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 65536 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 18=
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; 0=C2=A0 =C2=A0 =C2=A0 18=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=
=C2=A0 =C2=A0 =C2=A0 0 LRU<br>
&gt; -root@localhost:~# ifdown lo<br>
&gt; -root@localhost:~# echo $?<br>
&gt; -0<br>
&gt; -root@localhost:~# ifconfig -s<br>
&gt; -Iface=C2=A0 =C2=A0MTU Met=C2=A0 =C2=A0RX-OK RX-ERR RX-DRP=C2=A0 RX-OV=
R=C2=A0 =C2=A0 TX-OK TX-ERR TX-DRP <br>
&gt; TX-OVR Flg<br>
&gt; -eth0=C2=A0 =C2=A0 =C2=A0 =C2=A01500 0=C2=A0 =C2=A07736406=C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 2016<br>
&gt; 0=C2=A0 =C2=A05289455=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=C2=
=A0 =C2=A0 =C2=A0 0 BMRU<br>
&gt; -lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 65536 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 18=
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A00<br>
&gt; 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18=C2=A0 =C2=A0 0=C2=A0 =C2=
=A0 0=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0LRU<br>
&gt; -root@localhost:~# ifconfig lo down<br>
&gt; -root@localhost:~# ifconfig -s<br>
&gt; -Iface=C2=A0 =C2=A0MTU Met=C2=A0 =C2=A0RX-OK RX-ERR RX-DRP RX-OVR=C2=
=A0 =C2=A0 TX-OK TX-ERR TX-DRP<br>
&gt; TX-OVR Flg<br>
&gt; -eth0=C2=A0 =C2=A0 =C2=A0 =C2=A01500 0=C2=A0 =C2=A07736474 0=C2=A0 =C2=
=A02016<br>
&gt; 0=C2=A0 =C2=A0 =C2=A0 =C2=A05289481=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A00=C2=A0 =C2=A0 =C2=A0 0 BMRU<br>
&gt; -root@localhost:~#<br>
&gt; -<br>
&gt; -Also reverted the commit:<br>
&gt; -commit 80b878497663dae08f70b4d3cffe127b57a3cfc<br>
&gt; -which uses absolute paths to binaries called by ifup/ifdown.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [OE specific]<br>
&gt; -<br>
&gt; -Signed-off-by: Paul Gortmaker &lt;<a href=3D"mailto:paul.gortmaker@wi=
ndriver.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;<br>
&gt; -Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.c=
om" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
&gt; -Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - inet.defn | 134 +++++++++++++++++++++++++++----------------------<br=
>
&gt; -----<br>
&gt; - 1 file changed, 67 insertions(+), 67 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/inet.defn b/inet.defn<br>
&gt; -index 182b56b..31067bc 100644<br>
&gt; ---- a/inet.defn<br>
&gt; -+++ b/inet.defn<br>
&gt; -@@ -6,10 +6,10 @@ method loopback<br>
&gt; -=C2=A0 =C2=A0 =C2=A0This method may be used to define the IPv4 loopba=
ck interface.<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% up if (!iface_is_lo())<br=
>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% up if (!iface_is_lo())<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down if (!iface_is_lo())<=
br>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down if (!iface_is_lo())<br>
&gt; - <br>
&gt; - method static<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -36,17 +36,17 @@ method static<br>
&gt; -=C2=A0 =C2=A0 =C2=A0broadcast compute_v4_broadcast<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /bin/ip addr add %address%[[/%netmask%]] [[broadcast<b=
r>
&gt; %broadcast%]] \<br>
&gt; -+=C2=A0 =C2=A0 ip addr add %address%[[/%netmask%]] [[broadcast %broad=
cast%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[[peer %pointopoint%]] [[scope %scope%]] dev %ifa=
ce% label<br>
&gt; %iface%<br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% [[mtu %mtu%]] [[address<b=
r>
&gt; %hwaddress%]] up<br>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% [[mtu %mtu%]] [[address %hwadd=
ress%]]<br>
&gt; up<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 [[ /bin/ip route add default via %gateway% [[metric %m=
etric%]]<br>
&gt; dev %iface% onlink ]]<br>
&gt; -+=C2=A0 =C2=A0 [[ ip route add default via %gateway% [[metric %metric=
%]] dev<br>
&gt; %iface% onlink ]]<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 [[ /bin/ip route del default via %gateway% [[metric %m=
etric%]]<br>
&gt; dev %iface% 2&gt;&amp;1 1&gt;/dev/null || true ]]<br>
&gt; --=C2=A0 =C2=A0 /bin/ip addr del %address%[[/%netmask%]] [[broadcast<b=
r>
&gt; %broadcast%]] \<br>
&gt; -+=C2=A0 =C2=A0 [[ ip route del default via %gateway% [[metric %metric=
%]] dev<br>
&gt; %iface% 2&gt;&amp;1 1&gt;/dev/null || true ]]<br>
&gt; -+=C2=A0 =C2=A0 ip addr del %address%[[/%netmask%]] [[broadcast %broad=
cast%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[[peer %pointopoint%]] [[scope %scope%]] dev %ifa=
ce% label<br>
&gt; %iface%<br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down \<br>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_is_link())<=
br>
&gt; - <br>
&gt; - method manual<br>
&gt; -@@ -63,12 +63,12 @@ method manual<br>
&gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 [[/bin/ip link set dev %iface% mtu %mtu%]]<br>
&gt; --=C2=A0 =C2=A0 [[/bin/ip link set dev %iface% address %hwaddress%]]<b=
r>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% up 2&gt;/dev/null || true=
<br>
&gt; -+=C2=A0 =C2=A0 [[ip link set dev %iface% mtu %mtu%]]<br>
&gt; -+=C2=A0 =C2=A0 [[ip link set dev %iface% address %hwaddress%]]<br>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% up 2&gt;/dev/null || true<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down 2&gt;/dev/null || tr=
ue \<br>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down 2&gt;/dev/null || true \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_is_link() &amp;&amp; !do_=
all)<br>
&gt; - <br>
&gt; - method dhcp<br>
&gt; -@@ -93,33 +93,33 @@ method dhcp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 [[/bin/ip link set dev %iface% address %hwaddress%]]<b=
r>
&gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf=
<br>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -+=C2=A0 =C2=A0 [[ip link set dev %iface% address %hwaddress%]]<br>
&gt; -+=C2=A0 =C2=A0 dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf<br>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[[-e IF_METRIC=3D%metric%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/dhclient&q=
uot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/pump -i %iface% [[-h %hostname%]] [[-l %leasehou=
rs%]] \<br>
&gt; -+=C2=A0 =C2=A0 pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/pump&qu=
ot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% =
[[-x<br>
&gt; hostname:%hostname%]] \<br>
&gt; -+=C2=A0 =C2=A0 udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x<b=
r>
&gt; hostname:%hostname%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/udhcpc&=
quot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %c=
lient%]]<br>
&gt; \<br>
&gt; -+=C2=A0 =C2=A0 dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%=
]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-l %leasetime%]] [[-m %me=
tric%]] %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/dhcpcd&=
quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found!&#39; &gt=
;/dev/stderr; false \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid =
-lf<br>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -+=C2=A0 =C2=A0 dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf<br=
>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/dhclient&q=
uot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/pump -i %iface% -r \<br>
&gt; -+=C2=A0 =C2=A0 pump -i %iface% -r \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/pump&qu=
ot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if test -f /run/udhcpc.%iface%.pid; then kill -US=
R2 $(/bin/cat<br>
&gt; /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat<br>
&gt; /run/udhcpc.%iface%.pid); fi \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/udhcpc&=
quot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhcpcd -k %iface% \<br>
&gt; -+=C2=A0 =C2=A0 dhcpcd -k %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/dhcpcd&=
quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found!&#39; &gt=
;/dev/stderr; false \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down \<br>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_is_link())<=
br>
&gt; - <br>
&gt; - method bootp<br>
&gt; -@@ -134,11 +134,11 @@ method bootp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0whatever it really is.<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [=
[--server<br>
&gt; %server%]] \<br>
&gt; -+=C2=A0 =C2=A0 bootpc [[--bootfile %bootfile%]] --dev %iface% [[--ser=
ver<br>
&gt; %server%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[--hwaddr %hwaddr%]] --ret=
urniffail --serverbcast<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down \<br>
&gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_is_link())<br>
&gt; - <br>
&gt; - method tunnel<br>
&gt; -@@ -158,13 +158,13 @@ method tunnel<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ttl time=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -- TTL setting<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mtu size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -- MTU size<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /bin/ip tunnel add %iface% mode %mode% remote %endpoin=
t%<br>
&gt; [[local %local%]] \<br>
&gt; -+=C2=A0 =C2=A0 ip tunnel add %iface% mode %mode% remote %endpoint% [[=
local<br>
&gt; %local%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [[ttl %ttl%]]<br>
&gt; --=C2=A0 =C2=A0 /bin/ip link set %iface% up [[mtu %mtu%]]<br>
&gt; --=C2=A0 =C2=A0 /bin/ip addr add %address%/%netmask% dev %iface% [[pee=
r<br>
&gt; %dstaddr%]]<br>
&gt; --=C2=A0 =C2=A0 [[ /bin/ip route add default via %gateway% [[metric %m=
etric%]]<br>
&gt; dev %iface% onlink ]]<br>
&gt; -+=C2=A0 =C2=A0 ip link set %iface% up [[mtu %mtu%]]<br>
&gt; -+=C2=A0 =C2=A0 ip addr add %address%/%netmask% dev %iface% [[peer %ds=
taddr%]]<br>
&gt; -+=C2=A0 =C2=A0 [[ ip route add default via %gateway% [[metric %metric=
%]] dev<br>
&gt; %iface% onlink ]]<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /bin/ip tunnel del %iface%<br>
&gt; -+=C2=A0 =C2=A0 ip tunnel del %iface%<br>
&gt; - <br>
&gt; - method ppp<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -175,9 +175,9 @@ method ppp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unit number=C2=A0 =C2=A0 -- Use /number/ as the p=
pp unit number.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0options string -- Pass /string/ as additional opt=
ions to pon.<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options=
%]]<br>
&gt; -+=C2=A0 =C2=A0 pon [[%provider%]] [[unit %unit%]] [[%options%]]<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /usr/bin/poff [[%provider%]]<br>
&gt; -+=C2=A0 =C2=A0 poff [[%provider%]]<br>
&gt; - <br>
&gt; - method wvdial<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -186,10 +186,10 @@ method wvdial<br>
&gt; -=C2=A0 =C2=A0options<br>
&gt; -=C2=A0 =C2=A0 =C2=A0provider name=C2=A0 -- Use /name/ as the provider=
 (from<br>
&gt; /etc/wvdial.conf).<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --start -x /usr/bin/wvdial \<b=
r>
&gt; -+=C2=A0 =C2=A0 start-stop-daemon --start -x /usr/bin/wvdial \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -b -m -- [[<br>
&gt; %provider% ]]<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \<br=
>
&gt; -+=C2=A0 =C2=A0 start-stop-daemon --stop -x /usr/bin/wvdial \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -s 2<br>
&gt; - <br>
&gt; - <br>
&gt; -@@ -200,9 +200,9 @@ method ipv4ll<br>
&gt; -=C2=A0 =C2=A0 =C2=A0known as APIPA or IPAC, and often colloquially re=
ferred to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0as &quot;Zeroconf address&quot;.<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd -D %iface%<br>
&gt; -+=C2=A0 =C2=A0 avahi-autoipd -D %iface%<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd --kill %iface%<br>
&gt; -+=C2=A0 =C2=A0 avahi-autoipd --kill %iface%<br>
&gt; - <br>
&gt; - architecture kfreebsd<br>
&gt; - <br>
&gt; -@@ -211,11 +211,11 @@ method loopback<br>
&gt; -=C2=A0 =C2=A0 =C2=A0This method may be used to define the IPv4 loopba=
ck interface.<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% 127.0.0.1 up \<br>
&gt; -+=C2=A0 =C2=A0 ifconfig %iface% 127.0.0.1 up \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!iface_is_lo())<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down \<br>
&gt; -+=C2=A0 =C2=A0 ifconfig %iface% down \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!iface_is_lo())<br>
&gt; - <br>
&gt; - method static<br>
&gt; -@@ -238,15 +238,15 @@ method static<br>
&gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 [[ /sbin/ifconfig %iface% link %hwaddress%]]<br>
&gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% %address% [[netmask %netmask%]]=
<br>
&gt; [[broadcast %broadcast%]] \<br>
&gt; -+=C2=A0 =C2=A0 [[ ifconfig %iface% link %hwaddress%]]<br>
&gt; -+=C2=A0 =C2=A0 ifconfig %iface% %address% [[netmask %netmask%]] [[bro=
adcast<br>
&gt; %broadcast%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[[pointopoint %pointopoint%]] [[media %media%]] [=
[mtu %mtu%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 [[ /sbin/route add default %gateway% ]]<br>
&gt; -+=C2=A0 =C2=A0 [[ route add default %gateway% ]]<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 [[ /sbin/route del default %gateway% 2&gt;&amp;1 1&gt;=
/dev/null || true<br>
&gt; ]]<br>
&gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down<br>
&gt; -+=C2=A0 =C2=A0 [[ route del default %gateway% 2&gt;&amp;1 1&gt;/dev/n=
ull || true ]]<br>
&gt; -+=C2=A0 =C2=A0 ifconfig %iface% down<br>
&gt; - <br>
&gt; - method manual<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -279,30 +279,30 @@ method dhcp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 [[/sbin/ifconfig %iface% link %hwaddress%]]<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf=
<br>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -+=C2=A0 =C2=A0 [[ifconfig %iface% link %hwaddress%]]<br>
&gt; -+=C2=A0 =C2=A0 dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf<br>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[[-e IF_METRIC=3D%metric%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/dhclient&q=
uot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% =
[[-H<br>
&gt; %hostname%]] \<br>
&gt; -+=C2=A0 =C2=A0 udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H<b=
r>
&gt; %hostname%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-c %client%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/udhcpc&=
quot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %c=
lient%]]<br>
&gt; \<br>
&gt; -+=C2=A0 =C2=A0 dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%=
]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-l %leasetime%]] %iface% =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/dhcpcd&=
quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found!&#39; &gt=
;/dev/stderr; false \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid =
-lf<br>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -+=C2=A0 =C2=A0 dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf<br=
>
&gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/dhclient&q=
uot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if test -f /run/udhcpc.%iface%.pid; then kill -US=
R2 $(/bin/cat<br>
&gt; /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat<br>
&gt; /run/udhcpc.%iface%.pid); fi \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/udhcpc&=
quot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhcpcd -k %iface% \<br>
&gt; -+=C2=A0 =C2=A0 dhcpcd -k %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/dhcpcd&=
quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found!&#39; &gt=
;/dev/stderr; false \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down<br>
&gt; -+=C2=A0 =C2=A0 ifconfig %iface% down<br>
&gt; - <br>
&gt; - method bootp<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -316,11 +316,11 @@ method bootp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0whatever it really is.<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [=
[--server<br>
&gt; %server%]] \<br>
&gt; -+=C2=A0 =C2=A0 bootpc [[--bootfile %bootfile%]] --dev %iface% [[--ser=
ver<br>
&gt; %server%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[--hwaddr %hwaddr%]] --ret=
urniffail --serverbcast<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down<br>
&gt; -+=C2=A0 =C2=A0 ifconfig %iface% down<br>
&gt; - <br>
&gt; - method ppp<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -331,9 +331,9 @@ method ppp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unit number=C2=A0 =C2=A0 -- Use /number/ as the p=
pp unit number.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0options string -- Pass /string/ as additional opt=
ions to pon.<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options=
%]]<br>
&gt; -+=C2=A0 =C2=A0 pon [[%provider%]] [[unit %unit%]] [[%options%]]<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /usr/bin/poff [[%provider%]]<br>
&gt; -+=C2=A0 =C2=A0 poff [[%provider%]]<br>
&gt; - <br>
&gt; - method wvdial<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -342,10 +342,10 @@ method wvdial<br>
&gt; -=C2=A0 =C2=A0options<br>
&gt; -=C2=A0 =C2=A0 =C2=A0provider name=C2=A0 -- Use /name/ as the provider=
 (from<br>
&gt; /etc/wvdial.conf).<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --start -x /usr/bin/wvdial \<b=
r>
&gt; -+=C2=A0 =C2=A0 start-stop-daemon --start -x /usr/bin/wvdial \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -b -m -- [[<br>
&gt; %provider% ]]<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \<br=
>
&gt; -+=C2=A0 =C2=A0 start-stop-daemon --stop -x /usr/bin/wvdial \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -s 2<br>
&gt; - <br>
&gt; - <br>
&gt; -@@ -356,9 +356,9 @@ method ipv4ll<br>
&gt; -=C2=A0 =C2=A0 =C2=A0known as APIPA or IPAC, and often colloquially re=
ferred to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0as &quot;Zeroconf address&quot;.<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd -D %iface%<br>
&gt; -+=C2=A0 =C2=A0 avahi-autoipd -D %iface%<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd --kill %iface%<br>
&gt; -+=C2=A0 =C2=A0 avahi-autoipd --kill %iface%<br>
&gt; - architecture hurd<br>
&gt; - <br>
&gt; - method loopback<br>
&gt; -@@ -432,23 +432,23 @@ method dhcp<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[[Warning: Option hwaddress: %hwaddress% not yet =
supported]]<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -pf /run/dhclient.%iface///.%.pid=
 -lf<br>
&gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; -+=C2=A0 =C2=A0 dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf<b=
r>
&gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/dhclient&q=
uot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %ifa=
ce% [[-H<br>
&gt; %hostname%]] \<br>
&gt; -+=C2=A0 =C2=A0 udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[=
-H<br>
&gt; %hostname%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-c %client%]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/udhcpc&=
quot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %c=
lient%]]<br>
&gt; \<br>
&gt; -+=C2=A0 =C2=A0 dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%=
]] \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-l %leasetime%]] %iface% =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/dhcpcd&=
quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found!&#39; &gt=
;/dev/stderr; false \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface///.%.=
pid -lf<br>
&gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; -+=C2=A0 =C2=A0 dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -l=
f<br>
&gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/dhclient&q=
uot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if test -f /run/udhcpc.%iface///.%.pid; then kill=
 -USR2<br>
&gt; $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/cat<br>
&gt; /run/udhcpc.%iface///.%.pid); fi \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/udhcpc&=
quot;))<br>
&gt; --=C2=A0 =C2=A0 /sbin/dhcpcd -k %iface% \<br>
&gt; -+=C2=A0 =C2=A0 dhcpcd -k %iface% \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sbin/dhcpcd&=
quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found!&#39; &gt=
;/dev/stderr; false \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; -@@ -482,9 +482,9 @@ method ppp<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unit number=C2=A0 =C2=A0 -- Use /number/ as the p=
pp unit number.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0options string -- Pass /string/ as additional opt=
ions to pon.<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options=
%]]<br>
&gt; -+=C2=A0 =C2=A0 pon [[%provider%]] [[unit %unit%]] [[%options%]]<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /usr/bin/poff [[%provider%]]<br>
&gt; -+=C2=A0 =C2=A0 poff [[%provider%]]<br>
&gt; - <br>
&gt; - method wvdial<br>
&gt; -=C2=A0 =C2=A0description<br>
&gt; -@@ -493,10 +493,10 @@ method wvdial<br>
&gt; -=C2=A0 =C2=A0options<br>
&gt; -=C2=A0 =C2=A0 =C2=A0provider name=C2=A0 -- Use /name/ as the provider=
 (from<br>
&gt; /etc/wvdial.conf).<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --start -x /usr/bin/wvdial \<b=
r>
&gt; -+=C2=A0 =C2=A0 start-stop-daemon --start -x /usr/bin/wvdial \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-p /run/wvdial.%iface///.%.pid -b -m -- [[<br>
&gt; %provider% ]]<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \<br=
>
&gt; -+=C2=A0 =C2=A0 start-stop-daemon --stop -x /usr/bin/wvdial \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-p /run/wvdial.%iface///.%.pid -s 2<br>
&gt; - <br>
&gt; - <br>
&gt; -@@ -507,6 +507,6 @@ method ipv4ll<br>
&gt; -=C2=A0 =C2=A0 =C2=A0known as APIPA or IPAC, and often colloquially re=
ferred to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0as &quot;Zeroconf address&quot;.<br>
&gt; -=C2=A0 =C2=A0up<br>
&gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd -D %iface%<br>
&gt; -+=C2=A0 =C2=A0 avahi-autoipd -D %iface%<br>
&gt; -=C2=A0 =C2=A0down<br>
&gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd --kill %iface%<br>
&gt; -+=C2=A0 =C2=A0 avahi-autoipd --kill %iface%<br>
&gt; --- <br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8=
.22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</a><br>
&gt; b/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.35.bb" rel=
=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.=
22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</a><br>
&gt; rename to meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.35=
.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt; index bd0989e8855..de8e1cf66ba 100644<br>
&gt; --- a/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.22.bb"=
 rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</a><br>
&gt; +++ b/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.35.bb"=
 rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt; @@ -7,12 +7,11 @@ LICENSE =3D &quot;GPLv2&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://salsa.debian.org/debia=
n/ifupdown.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">salsa=
.debian.org/debian/ifupdown.git;protocol=3Dhttps</a><br>
&gt; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://defn2-c-man-don-t-rely-on-dpkg-arc=
hitecture-to-set-<br>
&gt; a.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://inet-6-.defn-fix-inverted-checks-f=
or-loopback.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://99_network \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Define-FNM_EXTMATCH-for-musl.=
patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRCREV =3D &quot;ab5a0f464e53e172316a5ca8b5dcdc49e8848999&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defn2-c-man-don-t-rel=
y-on-dpkg-architecture-to-<br>
&gt; set-a.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://99_network \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Define-FNM_EXTMA=
TCH-for-musl.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRCREV =3D &quot;4af76318cfc57f8e4a44d357104188666213bd4b&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000fd5f14059a11acde--
