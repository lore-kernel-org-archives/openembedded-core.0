Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 948F065CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 23:09:39 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 56F2E5C0FE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 00:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=agner.ch; s=dkim;
	t=1426806554; bh=i+sRkr3MvXrcTGVyV4TRPVbUQCz4pDmrYeuBi30FGJU=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=KEZ0otTpGNlTTJFdoRR06hP1q3svLL7QEKMvHq2IOGEQpYzNm0oLO5VgT9e1SCMW0
	ipWO4y3TOzLK41Qhr31CkEt87PM4Lz+f4vklIUXdMT6impfnuYCkBU5DfEXPsoHIRs
	qoMj75nVfSYoitXhHKxEzJ2xvBDWt6pKw3tIqU9E=
MIME-Version: 1.0
Date: Fri, 20 Mar 2015 00:09:16 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <a5c3b1a00286d1418413f73e9bc99fca@agner.ch>
References: <a5c3b1a00286d1418413f73e9bc99fca@agner.ch>
Message-ID: <e318605e6c49855aa1dc2191550fcb48@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.0
Subject: Re: BAD_RECOMMENDATIONS with opkg and multiple architectures
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
X-List-Received-Date: Thu, 19 Mar 2015 23:09:41 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Just verified the issue again, building a machine with architecture
armv7at2hf-vfp and one with armv7at2hf-vfp-neon in a row. The second
machine gets  the package installed despite the correct status file:

=> /var/lib/opkg/status just after handle_bad_recommendations
Package: busybox-syslog
Version: 1.22.1-r0
Depends: update-alternatives-opkg
Provides: busybox-syslog-systemd
Replaces: busybox-syslog-systemd
Conflicts: busybox-syslog-systemd
Status: deinstall hold not-installed
Section: base
Architecture: armv7at2hf-vfp
Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
MD5Sum: be66fec1a91a3c658022f3c1a5fad72a
Size: 2580
Filename: busybox-syslog_1.22.1-r0_armv7at2hf-vfp.ipk
Source:
http://www.busybox.net/downloads/busybox-1.22.1.tar.bz2;name=tarball
file://get_header_tar.patch file://busybox-appletlib-dependency.patch
file://busybox-udhcpc-no_deconfig.patch file://find-touchscreen.sh
file://busybox-cron file://busybox-httpd file://busybox-udhcpd
file://default.script file://simple.script file://hwclock.sh
file://mount.busybox file://syslog file://syslog-startup.conf
file://syslog.conf file://busybox-syslog.default file://mdev
file://mdev.conf file://umount.busybox file://defconfig
file://busybox-syslog.service.in file://busybox-klogd.service.in
file://fail_on_no_media.patch file://run-ptest file://inetd.conf
file://inetd file://login-utilities.cfg
file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
file://busybox-syslog.service.in file://busybox-klogd.service.in
Description: Tiny versions of many common UNIX utilities in a single
small executable
 BusyBox combines tiny versions of many common UNIX utilities into a
 single small executable. It provides minimalist replacements for most
of
 the utilities you usually find in GNU fileutils, shellutils, etc. The
 utilities in BusyBox generally have fewer options than their full-
 featured GNU cousins; however, the options that are included provide
the
 expected functionality and behave very much like their GNU
counterparts.
 BusyBox provides a fairly complete POSIX environment for any small or
 embedded system.

Package: busybox-syslog
Version: 1.22.1-r0
Depends: update-alternatives-opkg
Provides: busybox-syslog-systemd
Replaces: busybox-syslog-systemd
Conflicts: busybox-syslog-systemd
Status: deinstall hold not-installed
Section: base
Architecture: armv7at2hf-vfp-neon
Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
MD5Sum: 2f8312da8f8557a25770852c0708aa8b
Size: 2584
Filename: busybox-syslog_1.22.1-r0_armv7at2hf-vfp-neon.ipk
Source:
http://www.busybox.net/downloads/busybox-1.22.1.tar.bz2;name=tarball
file://get_header_tar.patch file://busybox-appletlib-dependency.patch
file://busybox-udhcpc-no_deconfig.patch file://find-touchscreen.sh
file://busybox-cron file://busybox-httpd file://busybox-udhcpd
file://default.script file://simple.script file://hwclock.sh
file://mount.busybox file://syslog file://syslog-startup.conf
file://syslog.conf file://busybox-syslog.default file://mdev
file://mdev.conf file://umount.busybox file://defconfig
file://busybox-syslog.service.in file://busybox-klogd.service.in
file://fail_on_no_media.patch file://run-ptest file://inetd.conf
file://inetd file://login-utilities.cfg
file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
file://busybox-syslog.service.in file://busybox-klogd.service.in
Description: Tiny versions of many common UNIX utilities in a single
small executable
 BusyBox combines tiny versions of many common UNIX utilities into a
 single small executable. It provides minimalist replacements for most
of
 the utilities you usually find in GNU fileutils, shellutils, etc. The
 utilities in BusyBox generally have fewer options than their full-
 featured GNU cousins; however, the options that are included provide
the
 expected functionality and behave very much like their GNU
counterparts.
 BusyBox provides a fairly complete POSIX environment for any small or
 embedded system.


=> /var/lib/opkg/status file at end
...
Package: busybox-syslog
Version: 1.22.1-r0
Depends: update-alternatives-opkg
Provides: busybox-syslog-systemd
Replaces: busybox-syslog-systemd
Conflicts: busybox-syslog-systemd
Status: deinstall hold not-installed
Architecture: armv7at2hf-vfp-neon

Package: busybox-syslog
Version: 1.22.1-r0
Depends: update-alternatives-opkg
Provides: busybox-syslog-systemd
Replaces: busybox-syslog-systemd
Conflicts: busybox-syslog-systemd
Status: install ok installed
Architecture: armv7at2hf-vfp-neon
Installed-Time: 1426805964
Auto-Installed: yes
...

Interesting though, that the status file in the end contains the package
with the right architecture and status ("Status: deinstall hold
not-installed")... 

But opkg installs the package happily:

=> log.do_rootfs
...
Installing busybox (1.22.1-r0) to root...
Downloading
file:/build/ags/oe-core/build/out-eglibc/deploy/ipk/armv7at2hf-vfp-neon/busybox_1.22.1-r0_armv7at2hf-vfp-neon.ipk.
Installing update-alternatives-opkg (0.1.8+git0+c33b217016-r0) to
root...
Downloading
file:/build/ags/oe-core/build/out-eglibc/deploy/ipk/armv7at2hf-vfp-neon/update-alternatives-opkg_0.1.8+git0+c33b217016-r0_armv7at2hf-vfp-neon.ipk.
Installing update-rc.d (0.7-r6) to root...
Downloading
file:/build/ags/oe-core/build/out-eglibc/deploy/ipk/all/update-rc.d_0.7-r6_all.ipk.
Installing busybox-syslog (1.22.1-r0) to root...
Downloading
file:/build/ags/oe-core/build/out-eglibc/deploy/ipk/armv7at2hf-vfp-neon/busybox-syslog_1.22.1-r0_armv7at2hf-vfp-neon.ipk.

...

--
Stefan




