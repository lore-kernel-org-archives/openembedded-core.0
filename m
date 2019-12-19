Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id AC6E87FDA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 17:23:02 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b79so4246168vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 09:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kaY8oOdUyQZCAvBizlpcs86t2BLTkRSADebOrdYJDqw=;
	b=ll2Dy6/4L3P+cHrS/z7taU3bnGgSRS3gwAM0G0Bw5//YUPhNVV4hfoYVyxHzs1lGRT
	0V8XZnXn6XRAkfpOmID03wPpQh05QnKEoTcUZQBV59ce82vedvJCrEzPSxq/DddkYMwI
	bGRcs5CVjGD6E6KF+GBIdRTgHpaiOs7ARqCvH/WJwvnbMNwkx2RoOonK9tqACPKVKwJQ
	01VKXoKLC/F5J0h1RNwcvr3yphb7lULj3uLpWfB+WYPJTSuGFlbG+tXwztu+eKuFE+uf
	Kpw1X0VZCi+yCcKdFKQNyX4h2DlXb9tVcrndOw6mo4hqCI9jiFWHlMcQX+puLiJVhSb1
	IIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kaY8oOdUyQZCAvBizlpcs86t2BLTkRSADebOrdYJDqw=;
	b=lCLLpMkmaLTDN1aaJPoVrfSOvlrPEl4BuZ2NiEQ7WyDV0elHb01eFZ/fwV1h/o+Jrq
	dkCTH9NaHlb38pEDTC776yhRvlAoZigg1TKpw0KiVLNU1166EUVLZzcTh9xe+g31yV37
	OpQJMJQHcWwoxT6PDE6XHwA3BtnLCWt78F8gFTf6MBcVdZJAn6LTFQz9zyrWYaAigZO0
	j+Nw7WkwhQV2RUYqmEbHH4bd7tWXVuXc1ZG1GqMmOoE32iHvWwo0s7/BQ8RUBOnzebS2
	NPqUv55XAUaViXpSRlu3h/JOLA+VsC7a8J8CKxPU4KC7UKOpWDd6T5n/kbzQUeMI/FYA
	U9tA==
X-Gm-Message-State: APjAAAU41SqAdsoHQTw8PHAuQkgn8ZHDGBZEp9cChaN9WUJn7I3ZM1wt
	nPq0k2EledEZ6iOSjkxKWMsO7YK8+eDidU2CtpE=
X-Google-Smtp-Source: APXvYqxQFwUeOA3DyhnDvkESOxXkvDWlkxhy8OtuB4mvz792kltDjO0a7UggfRs4zRwoAUVoR4rKgaVJmvUcxDRqxB0=
X-Received: by 2002:a67:314e:: with SMTP id x75mr226860vsx.35.1576776183349;
	Thu, 19 Dec 2019 09:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
	<20191219132301.80034-2-alex.kanavin@gmail.com>
	<5ed01ef566cd4e3a54f13757b666a9d4a9cfe11a.camel@gmail.com>
	<CANNYZj-HmW3a6XBbLUQCwhjDvfyPp8RoPCQaTpD7U7Sd=+J_jA@mail.gmail.com>
	<3b5e2258adb3916d7ee1cdce869296364ffda668.camel@gmail.com>
In-Reply-To: <3b5e2258adb3916d7ee1cdce869296364ffda668.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2019 18:22:52 +0100
Message-ID: <CANNYZj-oEUtTXgNF4xy_pqPZWoyrUGuptN=JrgADwN0sGdBx0Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Dec 2019 17:23:03 -0000
Content-Type: multipart/alternative; boundary="0000000000004c88a6059a11d0fa"

--0000000000004c88a6059a11d0fa
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2019 at 18:18, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, 2019-12-19 at 18:12 +0100, Alexander Kanavin wrote:
> > Sure, added them.
> >
> > I booted a system without the patch, and the network did go up
> > without errors.
> >
> > If the patch is still relevant, I would suggest that an effort is
> > made to get it upstream. It will continue to be difficult to rebase.
> >
>
> I dont disagree. Until then I also worry that we might regress on what
> we have provided to end user. So it will help in getting more info
> either way.
>

Sure, although I also tend to think that if something is not covered by the
AB testing, then there are no promises about that something. If AB doesn't
fail, then it's fine to remove.

Alex


>
> > Alex
> >
> > On Thu, 19 Dec 2019 at 18:03, Khem Raj <raj.khem@gmail.com> wrote:
> > > On Thu, 2019-12-19 at 14:22 +0100, Alexander Kanavin wrote:
> > > > Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch as
> > > > it is difficult to rebase and not clear if still necessary.
> > > >
> > >
> > > perhaps Cc the patch authors and get an opinion ?
> > >
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  ...efn-fix-inverted-checks-for-loopback.patch | 403 ------------
> > > ----
> > > > --
> > > >  ...{ifupdown_0.8.22.bb => ifupdown_0.8.35.bb} |  11 +-
> > > >  2 files changed, 5 insertions(+), 409 deletions(-)
> > > >  delete mode 100644 meta/recipes-core/ifupdown/files/inet-6-
> > > .defn-
> > > > fix-inverted-checks-for-loopback.patch
> > > >  rename meta/recipes-core/ifupdown/{ifupdown_0.8.22.bb =>
> > > > ifupdown_0.8.35.bb} (83%)
> > > >
> > > > diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-
> > > > inverted-checks-for-loopback.patch b/meta/recipes-
> > > > core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-
> > > > loopback.patch
> > > > deleted file mode 100644
> > > > index 5b0d51d736f..00000000000
> > > > --- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-
> > > > checks-for-loopback.patch
> > > > +++ /dev/null
> > > > @@ -1,403 +0,0 @@
> > > > -From 6fce99c9e42cbacde1855473b745ca1fded3fbf7 Mon Sep 17
> > > 00:00:00
> > > > 2001
> > > > -From: "Maxin B. John" <maxin.john@intel.com>
> > > > -Date: Wed, 21 Dec 2016 15:32:07 +0200
> > > > -Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for
> > > loopback
> > > > -
> > > > -Compared to the hurd link.defn for loopback, we see these
> > > > -are inverted, meaning that you would only be able to configure
> > > > -a loopback device that was _not_ named "lo" (unlikely to exist).
> > > > -
> > > > -The result was that we'd update /run/network/ifstate for "lo"
> > > > -but never actually do anything for up/down, as shown below:
> > > > -
> > > > -root@localhost:~# ifconfig -s
> > > > -Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR  TX-OK TX-ERR TX-
> > > DRP
> > > > TX-OVR Flg
> > > > -eth0       1500 0   7736329      0   2016 0
> > > > 5289422      0      0      0 BMRU
> > > > -lo        65536 0        18      0      0
> > > > 0      18      0      0      0 LRU
> > > > -root@localhost:~# ifdown lo
> > > > -root@localhost:~# echo $?
> > > > -0
> > > > -root@localhost:~# ifconfig -s
> > > > -Iface   MTU Met   RX-OK RX-ERR RX-DRP  RX-OVR    TX-OK TX-ERR
> > > TX-DRP
> > > > TX-OVR Flg
> > > > -eth0       1500 0   7736406      0  2016
> > > > 0   5289455      0      0      0 BMRU
> > > > -lo        65536 0        18      0   0
> > > > 0            18    0    0    0     LRU
> > > > -root@localhost:~# ifconfig lo down
> > > > -root@localhost:~# ifconfig -s
> > > > -Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-
> > > DRP
> > > > TX-OVR Flg
> > > > -eth0       1500 0   7736474 0   2016
> > > > 0       5289481      0     0      0 BMRU
> > > > -root@localhost:~#
> > > > -
> > > > -Also reverted the commit:
> > > > -commit 80b878497663dae08f70b4d3cffe127b57a3cfc
> > > > -which uses absolute paths to binaries called by ifup/ifdown.
> > > > -
> > > > -Upstream-Status: Inappropriate [OE specific]
> > > > -
> > > > -Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > > -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > > > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > > ----
> > > > - inet.defn | 134 +++++++++++++++++++++++++++------------------
> > > ----
> > > > -----
> > > > - 1 file changed, 67 insertions(+), 67 deletions(-)
> > > > -
> > > > -diff --git a/inet.defn b/inet.defn
> > > > -index 182b56b..31067bc 100644
> > > > ---- a/inet.defn
> > > > -+++ b/inet.defn
> > > > -@@ -6,10 +6,10 @@ method loopback
> > > > -     This method may be used to define the IPv4 loopback
> > > interface.
> > > > -
> > > > -   up
> > > > --    /bin/ip link set dev %iface% up if (!iface_is_lo())
> > > > -+    ip link set dev %iface% up if (!iface_is_lo())
> > > > -
> > > > -   down
> > > > --    /bin/ip link set dev %iface% down if (!iface_is_lo())
> > > > -+    ip link set dev %iface% down if (!iface_is_lo())
> > > > -
> > > > - method static
> > > > -   description
> > > > -@@ -36,17 +36,17 @@ method static
> > > > -     broadcast compute_v4_broadcast
> > > > -
> > > > -   up
> > > > --    /bin/ip addr add %address%[[/%netmask%]] [[broadcast
> > > > %broadcast%]] \
> > > > -+    ip addr add %address%[[/%netmask%]] [[broadcast
> > > %broadcast%]] \
> > > > -     [[peer %pointopoint%]] [[scope %scope%]] dev %iface% label
> > > > %iface%
> > > > --    /bin/ip link set dev %iface% [[mtu %mtu%]] [[address
> > > > %hwaddress%]] up
> > > > -+    ip link set dev %iface% [[mtu %mtu%]] [[address
> > > %hwaddress%]]
> > > > up
> > > > -
> > > > --    [[ /bin/ip route add default via %gateway% [[metric
> > > %metric%]]
> > > > dev %iface% onlink ]]
> > > > -+    [[ ip route add default via %gateway% [[metric %metric%]]
> > > dev
> > > > %iface% onlink ]]
> > > > -
> > > > -   down
> > > > --    [[ /bin/ip route del default via %gateway% [[metric
> > > %metric%]]
> > > > dev %iface% 2>&1 1>/dev/null || true ]]
> > > > --    /bin/ip addr del %address%[[/%netmask%]] [[broadcast
> > > > %broadcast%]] \
> > > > -+    [[ ip route del default via %gateway% [[metric %metric%]]
> > > dev
> > > > %iface% 2>&1 1>/dev/null || true ]]
> > > > -+    ip addr del %address%[[/%netmask%]] [[broadcast
> > > %broadcast%]] \
> > > > -     [[peer %pointopoint%]] [[scope %scope%]] dev %iface% label
> > > > %iface%
> > > > --    /bin/ip link set dev %iface% down \
> > > > -+    ip link set dev %iface% down \
> > > > -             if (iface_is_link())
> > > > -
> > > > - method manual
> > > > -@@ -63,12 +63,12 @@ method manual
> > > > -     hwaddress cleanup_hwaddress
> > > > -
> > > > -   up
> > > > --    [[/bin/ip link set dev %iface% mtu %mtu%]]
> > > > --    [[/bin/ip link set dev %iface% address %hwaddress%]]
> > > > --    /bin/ip link set dev %iface% up 2>/dev/null || true
> > > > -+    [[ip link set dev %iface% mtu %mtu%]]
> > > > -+    [[ip link set dev %iface% address %hwaddress%]]
> > > > -+    ip link set dev %iface% up 2>/dev/null || true
> > > > -
> > > > -   down
> > > > --    /bin/ip link set dev %iface% down 2>/dev/null || true \
> > > > -+    ip link set dev %iface% down 2>/dev/null || true \
> > > > -         if (iface_is_link() && !do_all)
> > > > -
> > > > - method dhcp
> > > > -@@ -93,33 +93,33 @@ method dhcp
> > > > -     hwaddress cleanup_hwaddress
> > > > -
> > > > -   up
> > > > --    [[/bin/ip link set dev %iface% address %hwaddress%]]
> > > > --    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -+    [[ip link set dev %iface% address %hwaddress%]]
> > > > -+    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -     [[-e IF_METRIC=%metric%]] \
> > > > -         if (execable("/sbin/dhclient"))
> > > > --    /sbin/pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]]
> > > \
> > > > -+    pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
> > > > -         elsif (execable("/sbin/pump"))
> > > > --    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x
> > > > hostname:%hostname%]] \
> > > > -+    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x
> > > > hostname:%hostname%]] \
> > > > -         elsif (execable("/sbin/udhcpc"))
> > > > --    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I
> > > %client%]]
> > > > \
> > > > -+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
> > > > -            [[-l %leasetime%]] [[-m %metric%]] %iface% \
> > > > -         elsif (execable("/sbin/dhcpcd"))
> > > > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > > > -         elsif (1)
> > > > -
> > > > -   down
> > > > --    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -+    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -         if (execable("/sbin/dhclient"))
> > > > --    /sbin/pump -i %iface% -r \
> > > > -+    pump -i %iface% -r \
> > > > -         elsif (execable("/sbin/pump"))
> > > > -     if test -f /run/udhcpc.%iface%.pid; then kill -USR2
> > > $(/bin/cat
> > > > /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat
> > > > /run/udhcpc.%iface%.pid); fi \
> > > > -         elsif (execable("/sbin/udhcpc"))
> > > > --    /sbin/dhcpcd -k %iface% \
> > > > -+    dhcpcd -k %iface% \
> > > > -         elsif (execable("/sbin/dhcpcd"))
> > > > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > > > -         elsif (1)
> > > > -
> > > > --    /bin/ip link set dev %iface% down \
> > > > -+    ip link set dev %iface% down \
> > > > -             if (iface_is_link())
> > > > -
> > > > - method bootp
> > > > -@@ -134,11 +134,11 @@ method bootp
> > > > -                       whatever it really is.
> > > > -
> > > > -   up
> > > > --    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[
> > > --server
> > > > %server%]] \
> > > > -+    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server
> > > > %server%]] \
> > > > -            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
> > > > -
> > > > -   down
> > > > --    /bin/ip link set dev %iface% down \
> > > > -+    ip link set dev %iface% down \
> > > > -         if (iface_is_link())
> > > > -
> > > > - method tunnel
> > > > -@@ -158,13 +158,13 @@ method tunnel
> > > > -     ttl time              -- TTL setting
> > > > -     mtu size              -- MTU size
> > > > -   up
> > > > --    /bin/ip tunnel add %iface% mode %mode% remote %endpoint%
> > > > [[local %local%]] \
> > > > -+    ip tunnel add %iface% mode %mode% remote %endpoint% [[local
> > > > %local%]] \
> > > > -        [[ttl %ttl%]]
> > > > --    /bin/ip link set %iface% up [[mtu %mtu%]]
> > > > --    /bin/ip addr add %address%/%netmask% dev %iface% [[peer
> > > > %dstaddr%]]
> > > > --    [[ /bin/ip route add default via %gateway% [[metric
> > > %metric%]]
> > > > dev %iface% onlink ]]
> > > > -+    ip link set %iface% up [[mtu %mtu%]]
> > > > -+    ip addr add %address%/%netmask% dev %iface% [[peer
> > > %dstaddr%]]
> > > > -+    [[ ip route add default via %gateway% [[metric %metric%]]
> > > dev
> > > > %iface% onlink ]]
> > > > -   down
> > > > --    /bin/ip tunnel del %iface%
> > > > -+    ip tunnel del %iface%
> > > > -
> > > > - method ppp
> > > > -   description
> > > > -@@ -175,9 +175,9 @@ method ppp
> > > > -     unit number    -- Use /number/ as the ppp unit number.
> > > > -     options string -- Pass /string/ as additional options to
> > > pon.
> > > > -   up
> > > > --    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > > > -+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > > > -   down
> > > > --    /usr/bin/poff [[%provider%]]
> > > > -+    poff [[%provider%]]
> > > > -
> > > > - method wvdial
> > > > -   description
> > > > -@@ -186,10 +186,10 @@ method wvdial
> > > > -   options
> > > > -     provider name  -- Use /name/ as the provider (from
> > > > /etc/wvdial.conf).
> > > > -   up
> > > > --    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
> > > > -+    start-stop-daemon --start -x /usr/bin/wvdial \
> > > > -                       -p /run/wvdial.%iface%.pid -b -m -- [[
> > > > %provider% ]]
> > > > -   down
> > > > --    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
> > > > -+    start-stop-daemon --stop -x /usr/bin/wvdial \
> > > > -                       -p /run/wvdial.%iface%.pid -s 2
> > > > -
> > > > -
> > > > -@@ -200,9 +200,9 @@ method ipv4ll
> > > > -     known as APIPA or IPAC, and often colloquially referred to
> > > > -     as "Zeroconf address".
> > > > -   up
> > > > --    /usr/sbin/avahi-autoipd -D %iface%
> > > > -+    avahi-autoipd -D %iface%
> > > > -   down
> > > > --    /usr/sbin/avahi-autoipd --kill %iface%
> > > > -+    avahi-autoipd --kill %iface%
> > > > -
> > > > - architecture kfreebsd
> > > > -
> > > > -@@ -211,11 +211,11 @@ method loopback
> > > > -     This method may be used to define the IPv4 loopback
> > > interface.
> > > > -
> > > > -   up
> > > > --    /sbin/ifconfig %iface% 127.0.0.1 up \
> > > > -+    ifconfig %iface% 127.0.0.1 up \
> > > > -     if (!iface_is_lo())
> > > > -
> > > > -   down
> > > > --    /sbin/ifconfig %iface% down \
> > > > -+    ifconfig %iface% down \
> > > > -     if (!iface_is_lo())
> > > > -
> > > > - method static
> > > > -@@ -238,15 +238,15 @@ method static
> > > > -     hwaddress cleanup_hwaddress
> > > > -
> > > > -   up
> > > > --    [[ /sbin/ifconfig %iface% link %hwaddress%]]
> > > > --    /sbin/ifconfig %iface% %address% [[netmask %netmask%]]
> > > > [[broadcast %broadcast%]] \
> > > > -+    [[ ifconfig %iface% link %hwaddress%]]
> > > > -+    ifconfig %iface% %address% [[netmask %netmask%]]
> > > [[broadcast
> > > > %broadcast%]] \
> > > > -     [[pointopoint %pointopoint%]] [[media %media%]] [[mtu
> > > %mtu%]] \
> > > > -     up
> > > > --    [[ /sbin/route add default %gateway% ]]
> > > > -+    [[ route add default %gateway% ]]
> > > > -
> > > > -   down
> > > > --    [[ /sbin/route del default %gateway% 2>&1 1>/dev/null ||
> > > true
> > > > ]]
> > > > --    /sbin/ifconfig %iface% down
> > > > -+    [[ route del default %gateway% 2>&1 1>/dev/null || true ]]
> > > > -+    ifconfig %iface% down
> > > > -
> > > > - method manual
> > > > -   description
> > > > -@@ -279,30 +279,30 @@ method dhcp
> > > > -     hwaddress cleanup_hwaddress
> > > > -
> > > > -   up
> > > > --    [[/sbin/ifconfig %iface% link %hwaddress%]]
> > > > --    /sbin/dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -+    [[ifconfig %iface% link %hwaddress%]]
> > > > -+    dhclient -4 -v -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -     [[-e IF_METRIC=%metric%]] \
> > > > -         if (execable("/sbin/dhclient"))
> > > > --    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H
> > > > %hostname%]] \
> > > > -+    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H
> > > > %hostname%]] \
> > > > -            [[-c %client%]] \
> > > > -         elsif (execable("/sbin/udhcpc"))
> > > > --    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I
> > > %client%]]
> > > > \
> > > > -+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
> > > > -            [[-l %leasetime%]] %iface% \
> > > > -         elsif (execable("/sbin/dhcpcd"))
> > > > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > > > -         elsif (1)
> > > > -
> > > > -   down
> > > > --    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -+    dhclient -4 -v -r -pf /run/dhclient.%iface%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
> > > > -         if (execable("/sbin/dhclient"))
> > > > -     if test -f /run/udhcpc.%iface%.pid; then kill -USR2
> > > $(/bin/cat
> > > > /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat
> > > > /run/udhcpc.%iface%.pid); fi \
> > > > -         elsif (execable("/sbin/udhcpc"))
> > > > --    /sbin/dhcpcd -k %iface% \
> > > > -+    dhcpcd -k %iface% \
> > > > -         elsif (execable("/sbin/dhcpcd"))
> > > > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > > > -         elsif (1)
> > > > -
> > > > --    /sbin/ifconfig %iface% down
> > > > -+    ifconfig %iface% down
> > > > -
> > > > - method bootp
> > > > -   description
> > > > -@@ -316,11 +316,11 @@ method bootp
> > > > -                       whatever it really is.
> > > > -
> > > > -   up
> > > > --    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[
> > > --server
> > > > %server%]] \
> > > > -+    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server
> > > > %server%]] \
> > > > -            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
> > > > -
> > > > -   down
> > > > --    /sbin/ifconfig %iface% down
> > > > -+    ifconfig %iface% down
> > > > -
> > > > - method ppp
> > > > -   description
> > > > -@@ -331,9 +331,9 @@ method ppp
> > > > -     unit number    -- Use /number/ as the ppp unit number.
> > > > -     options string -- Pass /string/ as additional options to
> > > pon.
> > > > -   up
> > > > --    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > > > -+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > > > -   down
> > > > --    /usr/bin/poff [[%provider%]]
> > > > -+    poff [[%provider%]]
> > > > -
> > > > - method wvdial
> > > > -   description
> > > > -@@ -342,10 +342,10 @@ method wvdial
> > > > -   options
> > > > -     provider name  -- Use /name/ as the provider (from
> > > > /etc/wvdial.conf).
> > > > -   up
> > > > --    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
> > > > -+    start-stop-daemon --start -x /usr/bin/wvdial \
> > > > -                       -p /run/wvdial.%iface%.pid -b -m -- [[
> > > > %provider% ]]
> > > > -   down
> > > > --    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
> > > > -+    start-stop-daemon --stop -x /usr/bin/wvdial \
> > > > -                       -p /run/wvdial.%iface%.pid -s 2
> > > > -
> > > > -
> > > > -@@ -356,9 +356,9 @@ method ipv4ll
> > > > -     known as APIPA or IPAC, and often colloquially referred to
> > > > -     as "Zeroconf address".
> > > > -   up
> > > > --    /usr/sbin/avahi-autoipd -D %iface%
> > > > -+    avahi-autoipd -D %iface%
> > > > -   down
> > > > --    /usr/sbin/avahi-autoipd --kill %iface%
> > > > -+    avahi-autoipd --kill %iface%
> > > > - architecture hurd
> > > > -
> > > > - method loopback
> > > > -@@ -432,23 +432,23 @@ method dhcp
> > > > -
> > > > -   up
> > > > -     [[Warning: Option hwaddress: %hwaddress% not yet
> > > supported]]
> > > > --    /sbin/dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > > > -+    dhclient -4 -v -pf /run/dhclient.%iface///.%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > > > -         if (execable("/sbin/dhclient"))
> > > > --    /sbin/udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface%
> > > [[-H
> > > > %hostname%]] \
> > > > -+    udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H
> > > > %hostname%]] \
> > > > -            [[-c %client%]] \
> > > > -         elsif (execable("/sbin/udhcpc"))
> > > > --    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I
> > > %client%]]
> > > > \
> > > > -+    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
> > > > -            [[-l %leasetime%]] %iface% \
> > > > -         elsif (execable("/sbin/dhcpcd"))
> > > > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > > > -         elsif (1)
> > > > -
> > > > -   down
> > > > --    /sbin/dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid
> > > -lf
> > > > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > > > -+    dhclient -4 -v -r -pf /run/dhclient.%iface///.%.pid -lf
> > > > /var/lib/dhcp/dhclient.%iface///.%.leases -I -df
> > > > /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
> > > > -         if (execable("/sbin/dhclient"))
> > > > -     if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2
> > > > $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/cat
> > > > /run/udhcpc.%iface///.%.pid); fi \
> > > > -         elsif (execable("/sbin/udhcpc"))
> > > > --    /sbin/dhcpcd -k %iface% \
> > > > -+    dhcpcd -k %iface% \
> > > > -         elsif (execable("/sbin/dhcpcd"))
> > > > -     echo 'No DHCP client software found!' >/dev/stderr; false \
> > > > -         elsif (1)
> > > > -@@ -482,9 +482,9 @@ method ppp
> > > > -     unit number    -- Use /number/ as the ppp unit number.
> > > > -     options string -- Pass /string/ as additional options to
> > > pon.
> > > > -   up
> > > > --    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > > > -+    pon [[%provider%]] [[unit %unit%]] [[%options%]]
> > > > -   down
> > > > --    /usr/bin/poff [[%provider%]]
> > > > -+    poff [[%provider%]]
> > > > -
> > > > - method wvdial
> > > > -   description
> > > > -@@ -493,10 +493,10 @@ method wvdial
> > > > -   options
> > > > -     provider name  -- Use /name/ as the provider (from
> > > > /etc/wvdial.conf).
> > > > -   up
> > > > --    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
> > > > -+    start-stop-daemon --start -x /usr/bin/wvdial \
> > > > -                       -p /run/wvdial.%iface///.%.pid -b -m --
> > > [[
> > > > %provider% ]]
> > > > -   down
> > > > --    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
> > > > -+    start-stop-daemon --stop -x /usr/bin/wvdial \
> > > > -                       -p /run/wvdial.%iface///.%.pid -s 2
> > > > -
> > > > -
> > > > -@@ -507,6 +507,6 @@ method ipv4ll
> > > > -     known as APIPA or IPAC, and often colloquially referred to
> > > > -     as "Zeroconf address".
> > > > -   up
> > > > --    /usr/sbin/avahi-autoipd -D %iface%
> > > > -+    avahi-autoipd -D %iface%
> > > > -   down
> > > > --    /usr/sbin/avahi-autoipd --kill %iface%
> > > > -+    avahi-autoipd --kill %iface%
> > > > ---
> > > > -2.17.1
> > > > -
> > > > diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
> > > > b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> > > > similarity index 83%
> > > > rename from meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
> > > > rename to meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> > > > index bd0989e8855..de8e1cf66ba 100644
> > > > --- a/meta/recipes-core/ifupdown/ifupdown_0.8.22.bb
> > > > +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> > > > @@ -7,12 +7,11 @@ LICENSE = "GPLv2"
> > > >  LIC_FILES_CHKSUM =
> > > > "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> > > >
> > > >  SRC_URI =
> > > "git://salsa.debian.org/debian/ifupdown.git;protocol=https
> > > > \
> > > > -        file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-
> > > set-
> > > > a.patch \
> > > > -        file://inet-6-.defn-fix-inverted-checks-for-
> > > loopback.patch \
> > > > -        file://99_network \
> > > > -        file://0001-Define-FNM_EXTMATCH-for-musl.patch \
> > > > -       "
> > > > -SRCREV = "ab5a0f464e53e172316a5ca8b5dcdc49e8848999"
> > > > +           file://defn2-c-man-don-t-rely-on-dpkg-architecture-
> > > to-
> > > > set-a.patch \
> > > > +           file://99_network \
> > > > +           file://0001-Define-FNM_EXTMATCH-for-musl.patch \
> > > > +           "
> > > > +SRCREV = "4af76318cfc57f8e4a44d357104188666213bd4b"
> > > >
> > > >  S = "${WORKDIR}/git"
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > >
>
>

--0000000000004c88a6059a11d0fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 19 Dec 2019 at 18:18, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, 2019-12-19 at 18:12 +0100, Alexander Kanavin wrote:<br>
&gt; Sure, added them.<br>
&gt; <br>
&gt; I booted a system without the patch, and the network did go up<br>
&gt; without errors.<br>
&gt; <br>
&gt; If the patch is still relevant, I would suggest that an effort is<br>
&gt; made to get it upstream. It will continue to be difficult to rebase.<b=
r>
&gt; <br>
<br>
I dont disagree. Until then I also worry that we might regress on what<br>
we have provided to end user. So it will help in getting more info<br>
either way.<br></blockquote><div><br></div><div>Sure, although I also tend =
to think that if something is not covered by the AB testing, then there are=
 no promises about that something. If AB doesn&#39;t fail, then it&#39;s fi=
ne to remove.</div><div><br></div><div>Alex<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Thu, 19 Dec 2019 at 18:03, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2019-12-19 at 14:22 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; &gt; Remove inet-6-.defn-fix-inverted-checks-for-loopback.patch a=
s<br>
&gt; &gt; &gt; it is difficult to rebase and not clear if still necessary.<=
br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; perhaps Cc the patch authors and get an opinion ?<br>
&gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 ...efn-fix-inverted-checks-for-loopback.patch | 403 --=
----------<br>
&gt; &gt; ----<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt;=C2=A0 ...{<a href=3D"http://ifupdown_0.8.22.bb" rel=3D"noref=
errer" target=3D"_blank">ifupdown_0.8.22.bb</a> =3D&gt; <a href=3D"http://i=
fupdown_0.8.35.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb<=
/a>} |=C2=A0 11 +-<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 5 insertions(+), 409 deletions(-)<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/ifupdown/files/in=
et-6-<br>
&gt; &gt; .defn-<br>
&gt; &gt; &gt; fix-inverted-checks-for-loopback.patch<br>
&gt; &gt; &gt;=C2=A0 rename meta/recipes-core/ifupdown/{<a href=3D"http://i=
fupdown_0.8.22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb<=
/a> =3D&gt;<br>
&gt; &gt; &gt; <a href=3D"http://ifupdown_0.8.35.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ifupdown_0.8.35.bb</a>} (83%)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-f=
ix-<br>
&gt; &gt; &gt; inverted-checks-for-loopback.patch b/meta/recipes-<br>
&gt; &gt; &gt; core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-<br=
>
&gt; &gt; &gt; loopback.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index 5b0d51d736f..00000000000<br>
&gt; &gt; &gt; --- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inve=
rted-<br>
&gt; &gt; &gt; checks-for-loopback.patch<br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,403 +0,0 @@<br>
&gt; &gt; &gt; -From 6fce99c9e42cbacde1855473b745ca1fded3fbf7 Mon Sep 17<br=
>
&gt; &gt; 00:00:00<br>
&gt; &gt; &gt; 2001<br>
&gt; &gt; &gt; -From: &quot;Maxin B. John&quot; &lt;<a href=3D"mailto:maxin=
.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
&gt; &gt; &gt; -Date: Wed, 21 Dec 2016 15:32:07 +0200<br>
&gt; &gt; &gt; -Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for<=
br>
&gt; &gt; loopback<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Compared to the hurd link.defn for loopback, we see these<b=
r>
&gt; &gt; &gt; -are inverted, meaning that you would only be able to config=
ure<br>
&gt; &gt; &gt; -a loopback device that was _not_ named &quot;lo&quot; (unli=
kely to exist).<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -The result was that we&#39;d update /run/network/ifstate fo=
r &quot;lo&quot;<br>
&gt; &gt; &gt; -but never actually do anything for up/down, as shown below:=
<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -root@localhost:~# ifconfig -s<br>
&gt; &gt; &gt; -Iface=C2=A0 =C2=A0MTU Met=C2=A0 =C2=A0RX-OK RX-ERR RX-DRP R=
X-OVR=C2=A0 TX-OK TX-ERR TX-<br>
&gt; &gt; DRP<br>
&gt; &gt; &gt; TX-OVR Flg<br>
&gt; &gt; &gt; -eth0=C2=A0 =C2=A0 =C2=A0 =C2=A01500 0=C2=A0 =C2=A07736329=
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A02016 0<br>
&gt; &gt; &gt; 5289422=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =
=C2=A0 =C2=A0 0 BMRU<br>
&gt; &gt; &gt; -lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 65536 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 18=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; &gt; &gt; 0=C2=A0 =C2=A0 =C2=A0 18=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 0=C2=A0 =C2=A0 =C2=A0 0 LRU<br>
&gt; &gt; &gt; -root@localhost:~# ifdown lo<br>
&gt; &gt; &gt; -root@localhost:~# echo $?<br>
&gt; &gt; &gt; -0<br>
&gt; &gt; &gt; -root@localhost:~# ifconfig -s<br>
&gt; &gt; &gt; -Iface=C2=A0 =C2=A0MTU Met=C2=A0 =C2=A0RX-OK RX-ERR RX-DRP=
=C2=A0 RX-OVR=C2=A0 =C2=A0 TX-OK TX-ERR<br>
&gt; &gt; TX-DRP <br>
&gt; &gt; &gt; TX-OVR Flg<br>
&gt; &gt; &gt; -eth0=C2=A0 =C2=A0 =C2=A0 =C2=A01500 0=C2=A0 =C2=A07736406=
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 2016<br>
&gt; &gt; &gt; 0=C2=A0 =C2=A05289455=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 0=C2=A0 =C2=A0 =C2=A0 0 BMRU<br>
&gt; &gt; &gt; -lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 65536 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 18=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A00<br>
&gt; &gt; &gt; 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18=C2=A0 =C2=A0 0=
=C2=A0 =C2=A0 0=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0LRU<br>
&gt; &gt; &gt; -root@localhost:~# ifconfig lo down<br>
&gt; &gt; &gt; -root@localhost:~# ifconfig -s<br>
&gt; &gt; &gt; -Iface=C2=A0 =C2=A0MTU Met=C2=A0 =C2=A0RX-OK RX-ERR RX-DRP R=
X-OVR=C2=A0 =C2=A0 TX-OK TX-ERR TX-<br>
&gt; &gt; DRP<br>
&gt; &gt; &gt; TX-OVR Flg<br>
&gt; &gt; &gt; -eth0=C2=A0 =C2=A0 =C2=A0 =C2=A01500 0=C2=A0 =C2=A07736474 0=
=C2=A0 =C2=A02016<br>
&gt; &gt; &gt; 0=C2=A0 =C2=A0 =C2=A0 =C2=A05289481=C2=A0 =C2=A0 =C2=A0 0=C2=
=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 0 BMRU<br>
&gt; &gt; &gt; -root@localhost:~#<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Also reverted the commit:<br>
&gt; &gt; &gt; -commit 80b878497663dae08f70b4d3cffe127b57a3cfc<br>
&gt; &gt; &gt; -which uses absolute paths to binaries called by ifup/ifdown=
.<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Upstream-Status: Inappropriate [OE specific]<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Signed-off-by: Paul Gortmaker &lt;<a href=3D"mailto:paul.go=
rtmaker@windriver.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&g=
t;<br>
&gt; &gt; &gt; -Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.jo=
hn@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
&gt; &gt; &gt; -Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windri=
ver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - inet.defn | 134 +++++++++++++++++++++++++++---------------=
---<br>
&gt; &gt; ----<br>
&gt; &gt; &gt; -----<br>
&gt; &gt; &gt; - 1 file changed, 67 insertions(+), 67 deletions(-)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -diff --git a/inet.defn b/inet.defn<br>
&gt; &gt; &gt; -index 182b56b..31067bc 100644<br>
&gt; &gt; &gt; ---- a/inet.defn<br>
&gt; &gt; &gt; -+++ b/inet.defn<br>
&gt; &gt; &gt; -@@ -6,10 +6,10 @@ method loopback<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0This method may be used to define the I=
Pv4 loopback<br>
&gt; &gt; interface.<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% up if (!iface_i=
s_lo())<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% up if (!iface_is_lo(=
))<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down if (!iface=
_is_lo())<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down if (!iface_is_l=
o())<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method static<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -36,17 +36,17 @@ method static<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0broadcast compute_v4_broadcast<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip addr add %address%[[/%netmask%]] [[b=
roadcast<br>
&gt; &gt; &gt; %broadcast%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip addr add %address%[[/%netmask%]] [[broadc=
ast<br>
&gt; &gt; %broadcast%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0[[peer %pointopoint%]] [[scope %scope%]=
] dev %iface% label<br>
&gt; &gt; &gt; %iface%<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% [[mtu %mtu%]] [=
[address<br>
&gt; &gt; &gt; %hwaddress%]] up<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% [[mtu %mtu%]] [[addr=
ess<br>
&gt; &gt; %hwaddress%]]<br>
&gt; &gt; &gt; up<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[ /bin/ip route add default via %gateway% [=
[metric<br>
&gt; &gt; %metric%]]<br>
&gt; &gt; &gt; dev %iface% onlink ]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ ip route add default via %gateway% [[metr=
ic %metric%]]<br>
&gt; &gt; dev<br>
&gt; &gt; &gt; %iface% onlink ]]<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[ /bin/ip route del default via %gateway% [=
[metric<br>
&gt; &gt; %metric%]]<br>
&gt; &gt; &gt; dev %iface% 2&gt;&amp;1 1&gt;/dev/null || true ]]<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip addr del %address%[[/%netmask%]] [[b=
roadcast<br>
&gt; &gt; &gt; %broadcast%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ ip route del default via %gateway% [[metr=
ic %metric%]]<br>
&gt; &gt; dev<br>
&gt; &gt; &gt; %iface% 2&gt;&amp;1 1&gt;/dev/null || true ]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip addr del %address%[[/%netmask%]] [[broadc=
ast<br>
&gt; &gt; %broadcast%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0[[peer %pointopoint%]] [[scope %scope%]=
] dev %iface% label<br>
&gt; &gt; &gt; %iface%<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_i=
s_link())<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method manual<br>
&gt; &gt; &gt; -@@ -63,12 +63,12 @@ method manual<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[/bin/ip link set dev %iface% mtu %mtu%]]<b=
r>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[/bin/ip link set dev %iface% address %hwad=
dress%]]<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% up 2&gt;/dev/nu=
ll || true<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ip link set dev %iface% mtu %mtu%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ip link set dev %iface% address %hwaddress=
%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% up 2&gt;/dev/null ||=
 true<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down 2&gt;/dev/=
null || true \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down 2&gt;/dev/null =
|| true \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_is_link() &amp;=
&amp; !do_all)<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method dhcp<br>
&gt; &gt; &gt; -@@ -93,33 +93,33 @@ method dhcp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[/bin/ip link set dev %iface% address %hwad=
dress%]]<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -pf /run/dhclient.%ifac=
e%.pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ip link set dev %iface% address %hwaddress=
%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhclient -4 -v -pf /run/dhclient.%iface%.pid=
 -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0[[-e IF_METRIC=3D%metric%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/=
dhclient&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/pump -i %iface% [[-h %hostname%]] [[-l=
 %leasehours%]]<br>
&gt; &gt; \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 pump -i %iface% [[-h %hostname%]] [[-l %leas=
ehours%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/pump&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -=
i %iface% [[-x<br>
&gt; &gt; &gt; hostname:%hostname%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 udhcpc -n -p /run/udhcpc.%iface%.pid -i %ifa=
ce% [[-x<br>
&gt; &gt; &gt; hostname:%hostname%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/udhcpc&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%=
]] [[-I<br>
&gt; &gt; %client%]]<br>
&gt; &gt; &gt; \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-=
I %client%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-l %leasetime%]=
] [[-m %metric%]] %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/dhcpcd&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found=
!&#39; &gt;/dev/stderr; false \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -r -pf /run/dhclient.%i=
face%.pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhclient -4 -v -r -pf /run/dhclient.%iface%.=
pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/=
dhclient&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/pump -i %iface% -r \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 pump -i %iface% -r \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/pump&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if test -f /run/udhcpc.%iface%.pid; the=
n kill -USR2<br>
&gt; &gt; $(/bin/cat<br>
&gt; &gt; &gt; /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat<br>
&gt; &gt; &gt; /run/udhcpc.%iface%.pid); fi \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/udhcpc&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhcpcd -k %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhcpcd -k %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/dhcpcd&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found=
!&#39; &gt;/dev/stderr; false \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_i=
s_link())<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method bootp<br>
&gt; &gt; &gt; -@@ -134,11 +134,11 @@ method bootp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0whatever it really is.<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/bootpc [[--bootfile %bootfile%]] --dev=
 %iface% [[<br>
&gt; &gt; --server<br>
&gt; &gt; &gt; %server%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 bootpc [[--bootfile %bootfile%]] --dev %ifac=
e% [[--server<br>
&gt; &gt; &gt; %server%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[--hwaddr %hwadd=
r%]] --returniffail --serverbcast<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set dev %iface% down \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set dev %iface% down \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iface_is_link())<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method tunnel<br>
&gt; &gt; &gt; -@@ -158,13 +158,13 @@ method tunnel<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0ttl time=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -- TTL setting<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0mtu size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -- MTU size<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip tunnel add %iface% mode %mode% remot=
e %endpoint%<br>
&gt; &gt; &gt; [[local %local%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip tunnel add %iface% mode %mode% remote %en=
dpoint% [[local<br>
&gt; &gt; &gt; %local%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [[ttl %ttl%]]<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip link set %iface% up [[mtu %mtu%]]<br=
>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip addr add %address%/%netmask% dev %if=
ace% [[peer<br>
&gt; &gt; &gt; %dstaddr%]]<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[ /bin/ip route add default via %gateway% [=
[metric<br>
&gt; &gt; %metric%]]<br>
&gt; &gt; &gt; dev %iface% onlink ]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip link set %iface% up [[mtu %mtu%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip addr add %address%/%netmask% dev %iface% =
[[peer<br>
&gt; &gt; %dstaddr%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ ip route add default via %gateway% [[metr=
ic %metric%]]<br>
&gt; &gt; dev<br>
&gt; &gt; &gt; %iface% onlink ]]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /bin/ip tunnel del %iface%<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ip tunnel del %iface%<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method ppp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -175,9 +175,9 @@ method ppp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0unit number=C2=A0 =C2=A0 -- Use /number=
/ as the ppp unit number.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0options string -- Pass /string/ as addi=
tional options to<br>
&gt; &gt; pon.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/bin/pon [[%provider%]] [[unit %unit%]] =
[[%options%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 pon [[%provider%]] [[unit %unit%]] [[%option=
s%]]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/bin/poff [[%provider%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 poff [[%provider%]]<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method wvdial<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -186,10 +186,10 @@ method wvdial<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0options<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0provider name=C2=A0 -- Use /name/ as th=
e provider (from<br>
&gt; &gt; &gt; /etc/wvdial.conf).<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --start -x /usr/bin/=
wvdial \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 start-stop-daemon --start -x /usr/bin/wvdial=
 \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -b -m -- [[<br>
&gt; &gt; &gt; %provider% ]]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --stop -x /usr/bin/w=
vdial \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 start-stop-daemon --stop -x /usr/bin/wvdial =
\<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -s 2<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -@@ -200,9 +200,9 @@ method ipv4ll<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0known as APIPA or IPAC, and often collo=
quially referred to<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0as &quot;Zeroconf address&quot;.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd -D %iface%<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 avahi-autoipd -D %iface%<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd --kill %iface%<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 avahi-autoipd --kill %iface%<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - architecture kfreebsd<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -@@ -211,11 +211,11 @@ method loopback<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0This method may be used to define the I=
Pv4 loopback<br>
&gt; &gt; interface.<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% 127.0.0.1 up \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ifconfig %iface% 127.0.0.1 up \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!iface_is_lo())<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ifconfig %iface% down \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!iface_is_lo())<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method static<br>
&gt; &gt; &gt; -@@ -238,15 +238,15 @@ method static<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[ /sbin/ifconfig %iface% link %hwaddress%]]=
<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% %address% [[netmask %=
netmask%]]<br>
&gt; &gt; &gt; [[broadcast %broadcast%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ ifconfig %iface% link %hwaddress%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ifconfig %iface% %address% [[netmask %netmas=
k%]]<br>
&gt; &gt; [[broadcast<br>
&gt; &gt; &gt; %broadcast%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0[[pointopoint %pointopoint%]] [[media %=
media%]] [[mtu<br>
&gt; &gt; %mtu%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[ /sbin/route add default %gateway% ]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ route add default %gateway% ]]<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[ /sbin/route del default %gateway% 2&gt;&a=
mp;1 1&gt;/dev/null ||<br>
&gt; &gt; true<br>
&gt; &gt; &gt; ]]<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ route del default %gateway% 2&gt;&amp;1 1=
&gt;/dev/null || true ]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ifconfig %iface% down<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method manual<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -279,30 +279,30 @@ method dhcp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0hwaddress cleanup_hwaddress<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 [[/sbin/ifconfig %iface% link %hwaddress%]]<=
br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -pf /run/dhclient.%ifac=
e%.pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 [[ifconfig %iface% link %hwaddress%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhclient -4 -v -pf /run/dhclient.%iface%.pid=
 -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0[[-e IF_METRIC=3D%metric%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/=
dhclient&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -=
i %iface% [[-H<br>
&gt; &gt; &gt; %hostname%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 udhcpc -n -p /run/udhcpc.%iface%.pid -i %ifa=
ce% [[-H<br>
&gt; &gt; &gt; %hostname%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-c %client%]] \=
<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/udhcpc&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%=
]] [[-I<br>
&gt; &gt; %client%]]<br>
&gt; &gt; &gt; \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-=
I %client%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-l %leasetime%]=
] %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/dhcpcd&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found=
!&#39; &gt;/dev/stderr; false \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -r -pf /run/dhclient.%i=
face%.pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhclient -4 -v -r -pf /run/dhclient.%iface%.=
pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface%.leases %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/=
dhclient&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if test -f /run/udhcpc.%iface%.pid; the=
n kill -USR2<br>
&gt; &gt; $(/bin/cat<br>
&gt; &gt; &gt; /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat<br>
&gt; &gt; &gt; /run/udhcpc.%iface%.pid); fi \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/udhcpc&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhcpcd -k %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhcpcd -k %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/dhcpcd&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found=
!&#39; &gt;/dev/stderr; false \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ifconfig %iface% down<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method bootp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -316,11 +316,11 @@ method bootp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0whatever it really is.<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/bootpc [[--bootfile %bootfile%]] --dev=
 %iface% [[<br>
&gt; &gt; --server<br>
&gt; &gt; &gt; %server%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 bootpc [[--bootfile %bootfile%]] --dev %ifac=
e% [[--server<br>
&gt; &gt; &gt; %server%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[--hwaddr %hwadd=
r%]] --returniffail --serverbcast<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/ifconfig %iface% down<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 ifconfig %iface% down<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method ppp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -331,9 +331,9 @@ method ppp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0unit number=C2=A0 =C2=A0 -- Use /number=
/ as the ppp unit number.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0options string -- Pass /string/ as addi=
tional options to<br>
&gt; &gt; pon.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/bin/pon [[%provider%]] [[unit %unit%]] =
[[%options%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 pon [[%provider%]] [[unit %unit%]] [[%option=
s%]]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/bin/poff [[%provider%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 poff [[%provider%]]<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method wvdial<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -342,10 +342,10 @@ method wvdial<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0options<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0provider name=C2=A0 -- Use /name/ as th=
e provider (from<br>
&gt; &gt; &gt; /etc/wvdial.conf).<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --start -x /usr/bin/=
wvdial \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 start-stop-daemon --start -x /usr/bin/wvdial=
 \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -b -m -- [[<br>
&gt; &gt; &gt; %provider% ]]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --stop -x /usr/bin/w=
vdial \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 start-stop-daemon --stop -x /usr/bin/wvdial =
\<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-p /run/wvdial.%iface%.pid -s 2<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -@@ -356,9 +356,9 @@ method ipv4ll<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0known as APIPA or IPAC, and often collo=
quially referred to<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0as &quot;Zeroconf address&quot;.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd -D %iface%<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 avahi-autoipd -D %iface%<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd --kill %iface%<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 avahi-autoipd --kill %iface%<br>
&gt; &gt; &gt; - architecture hurd<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method loopback<br>
&gt; &gt; &gt; -@@ -432,23 +432,23 @@ method dhcp<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0[[Warning: Option hwaddress: %hwaddress=
% not yet<br>
&gt; &gt; supported]]<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -pf /run/dhclient.%ifac=
e///.%.pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhclient -4 -v -pf /run/dhclient.%iface///.%=
.pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/=
dhclient&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/udhcpc -n -p /run/udhcpc.%iface///.%.p=
id -i %iface%<br>
&gt; &gt; [[-H<br>
&gt; &gt; &gt; %hostname%]] \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 udhcpc -n -p /run/udhcpc.%iface///.%.pid -i =
%iface% [[-H<br>
&gt; &gt; &gt; %hostname%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-c %client%]] \=
<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/udhcpc&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%=
]] [[-I<br>
&gt; &gt; %client%]]<br>
&gt; &gt; &gt; \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-=
I %client%]] \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [[-l %leasetime%]=
] %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/dhcpcd&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found=
!&#39; &gt;/dev/stderr; false \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhclient -4 -v -r -pf /run/dhclient.%i=
face///.%.pid<br>
&gt; &gt; -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhclient -4 -v -r -pf /run/dhclient.%iface//=
/.%.pid -lf<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient.%iface///.%.leases -I -df<br>
&gt; &gt; &gt; /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execable(&quot;/sbin/=
dhclient&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if test -f /run/udhcpc.%iface///.%.pid;=
 then kill -USR2<br>
&gt; &gt; &gt; $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/c=
at<br>
&gt; &gt; &gt; /run/udhcpc.%iface///.%.pid); fi \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/udhcpc&quot;))<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/dhcpcd -k %iface% \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 dhcpcd -k %iface% \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (execable(&quot;/sb=
in/dhcpcd&quot;))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0echo &#39;No DHCP client software found=
!&#39; &gt;/dev/stderr; false \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif (1)<br>
&gt; &gt; &gt; -@@ -482,9 +482,9 @@ method ppp<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0unit number=C2=A0 =C2=A0 -- Use /number=
/ as the ppp unit number.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0options string -- Pass /string/ as addi=
tional options to<br>
&gt; &gt; pon.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/bin/pon [[%provider%]] [[unit %unit%]] =
[[%options%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 pon [[%provider%]] [[unit %unit%]] [[%option=
s%]]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/bin/poff [[%provider%]]<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 poff [[%provider%]]<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - method wvdial<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0description<br>
&gt; &gt; &gt; -@@ -493,10 +493,10 @@ method wvdial<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0options<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0provider name=C2=A0 -- Use /name/ as th=
e provider (from<br>
&gt; &gt; &gt; /etc/wvdial.conf).<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --start -x /usr/bin/=
wvdial \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 start-stop-daemon --start -x /usr/bin/wvdial=
 \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-p /run/wvdial.%iface///.%.pid -b -m --<br>
&gt; &gt; [[<br>
&gt; &gt; &gt; %provider% ]]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /sbin/start-stop-daemon --stop -x /usr/bin/w=
vdial \<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 start-stop-daemon --stop -x /usr/bin/wvdial =
\<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-p /run/wvdial.%iface///.%.pid -s 2<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -@@ -507,6 +507,6 @@ method ipv4ll<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0known as APIPA or IPAC, and often collo=
quially referred to<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0as &quot;Zeroconf address&quot;.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0up<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd -D %iface%<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 avahi-autoipd -D %iface%<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0down<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 /usr/sbin/avahi-autoipd --kill %iface%<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 avahi-autoipd --kill %iface%<br>
&gt; &gt; &gt; --- <br>
&gt; &gt; &gt; -2.17.1<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; diff --git a/meta/recipes-core/ifupdown/<a href=3D"http://if=
updown_0.8.22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</=
a><br>
&gt; &gt; &gt; b/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_0.8.=
35.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt; &gt; &gt; similarity index 83%<br>
&gt; &gt; &gt; rename from meta/recipes-core/ifupdown/<a href=3D"http://ifu=
pdown_0.8.22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</a=
><br>
&gt; &gt; &gt; rename to meta/recipes-core/ifupdown/<a href=3D"http://ifupd=
own_0.8.35.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><=
br>
&gt; &gt; &gt; index bd0989e8855..de8e1cf66ba 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_=
0.8.22.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.22.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-core/ifupdown/<a href=3D"http://ifupdown_=
0.8.35.bb" rel=3D"noreferrer" target=3D"_blank">ifupdown_0.8.35.bb</a><br>
&gt; &gt; &gt; @@ -7,12 +7,11 @@ LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f&=
quot;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 SRC_URI =3D<br>
&gt; &gt; &quot;git://<a href=3D"http://salsa.debian.org/debian/ifupdown.gi=
t;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">salsa.debian.org/d=
ebian/ifupdown.git;protocol=3Dhttps</a><br>
&gt; &gt; &gt; \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://defn2-c-man-don-t-rely-o=
n-dpkg-architecture-to-<br>
&gt; &gt; set-<br>
&gt; &gt; &gt; a.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://inet-6-.defn-fix-inverte=
d-checks-for-<br>
&gt; &gt; loopback.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://99_network \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Define-FNM_EXTMATCH=
-for-musl.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; &gt; -SRCREV =3D &quot;ab5a0f464e53e172316a5ca8b5dcdc49e8848999&q=
uot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defn2-c-man=
-don-t-rely-on-dpkg-architecture-<br>
&gt; &gt; to-<br>
&gt; &gt; &gt; set-a.patch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://99_network =
\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Define=
-FNM_EXTMATCH-for-musl.patch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; &gt; +SRCREV =3D &quot;4af76318cfc57f8e4a44d357104188666213bd4b&q=
uot;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; -- <br>
&gt; &gt; &gt; 2.17.1<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
<br>
</blockquote></div></div>

--0000000000004c88a6059a11d0fa--
