Return-Path: <Jef.Driesen@niko.eu>
Received: from relay04.secure-mail.be (relay04.secure-mail.be [195.13.7.7])
	by mail.openembedded.org (Postfix) with ESMTP id 548B477C31
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 11:56:17 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2A1BwD8edNZ/7lOx1RcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgmZMVBCBFQeddIF2eZdFCh+FHAKETEIVAQEBAQEBAQEBAQFqKII?=
	=?us-ascii?q?zIoJDAQEBAQIBJxM/BQsCAQgiFBAyJQIEDg2KIAkDAactOosyAQEBAQEBAQMBA?=
	=?us-ascii?q?QEBAQEBAQEfCQGDI4ExUYM7gnM1hG4Yg0CCMgEEoTKHXoNgBYs2hW+LBooTi0G?=
	=?us-ascii?q?BOTUigQ57W4UaBReBZ3aIRIEQAQEB?=
X-IPAS-Result: =?us-ascii?q?A2A1BwD8edNZ/7lOx1RcHAEBBAEBCgEBFwEBBAEBCgEBgmZ?=
	=?us-ascii?q?MVBCBFQeddIF2eZdFCh+FHAKETEIVAQEBAQEBAQEBAQFqKIIzIoJDAQEBAQIBJ?=
	=?us-ascii?q?xM/BQsCAQgiFBAyJQIEDg2KIAkDAactOosyAQEBAQEBAQMBAQEBAQEBAQEfCQG?=
	=?us-ascii?q?DI4ExUYM7gnM1hG4Yg0CCMgEEoTKHXoNgBYs2hW+LBooTi0GBOTUigQ57W4UaB?=
	=?us-ascii?q?ReBZ3aIRIEQAQEB?=
Received: from edge.nikogroup.be ([84.199.78.185])
	by relay04.secure-mail.be with ESMTP; 03 Oct 2017 13:56:17 +0200
Received: from HUB.NIKO.LAN (172.22.10.201) by EDGE.nikogroup.be
	(192.168.22.31) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 3 Oct 2017 13:56:16 +0200
Received: from MBX.NIKO.LAN ([::1]) by HUB.NIKO.LAN ([::1]) with mapi id
	14.03.0224.002; Tue, 3 Oct 2017 11:49:31 +0200
From: <Jef.Driesen@niko.eu>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] Small improvement for the initscripts package
Thread-Index: AQHTOPkyug4RbXCTlkS3EIoEWRxT86LLnS2AgAA1t86AABmqgIAF+Z0i
Date: Tue, 3 Oct 2017 09:49:30 +0000
Message-ID: <FAB9E48578194042BE5C63B8BE4761033969174E@MBX.NIKO.LAN>
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
	<d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
	<FAB9E48578194042BE5C63B8BE47610339682926@MBX.NIKO.LAN>,
	<CAJTo0LbM9JenyrSNhyGztA9A2JU5uHY5HJcsTNt6fH885F4M8w@mail.gmail.com>
In-Reply-To: <CAJTo0LbM9JenyrSNhyGztA9A2JU5uHY5HJcsTNt6fH885F4M8w@mail.gmail.com>
Accept-Language: en-US, nl-BE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.10.222]
x-exclaimer-md-config: ea9a6d46-d5fe-4ddc-9ba9-49fab8e88ad4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Small improvement for the initscripts package
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
X-List-Received-Date: Tue, 03 Oct 2017 11:56:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> I'd definitely be curious as to where initscripts is coming from in the S=
DK.  You can use bitbake -g <target> to generate dependency charts.

There are quite some packages which depend on initscripts:

$ bitbake -g image-sdk-niko -c populate_sdk
NOTE: Started PRServer with DBfile: /home/jdi/develop/yocto/build/cache/prs=
erv.sqlite3, IP: 127.0.0.1, PORT: 42323, PID: 3577
Loading cache: 100% |######################################################=
###########################################################################=
#######################################################################| ET=
A:  00:00:00
Loaded 2701 entries from dependency cache.
Parsing recipes: 100% |####################################################=
###########################################################################=
#######################################################################| Ti=
me: 00:00:06
Parsing of 2167 .bb files complete (2138 cached, 29 parsed). 2729 targets, =
350 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing RunQueue
NOTE: PN build list saved to 'pn-buildlist'
NOTE: PN dependencies saved to 'pn-depends.dot'
NOTE: Package dependencies saved to 'package-depends.dot'
NOTE: Task dependencies saved to 'task-depends.dot'

$ grep initscripts package-depends.dot
"dnsmasq-staticdev" -> "initscripts"
"eudev-dbg" -> "initscripts"
"avahi" -> "initscripts"
"run-postinsts-staticdev" -> "initscripts"
"avahi-doc" -> "initscripts"
"openssh-dev" -> "initscripts"
"syslog-ng-libs-dbg" -> "initscripts"
"ofono-staticdev" -> "initscripts"
"ntp-doc" -> "initscripts"
"syslog-ng-staticdev" -> "initscripts"
"ntp" -> "initscripts"
"eudev" -> "initscripts"
"openssh" -> "initscripts"
"initscripts-functions" [label=3D"initscripts-functions(initscripts) :1.0-r=
155\n/home/jdi/develop/yocto/meta/recipes-core/initscripts/initscripts_1.0.=
bb"]
"initscripts-functions" -> "update-rc.d-native"
"initscripts-functions" -> "virtual/update-alternatives"
"ntpdate" -> "initscripts"
"dbus-lib" -> "initscripts"
"openssh-locale" -> "initscripts"
"busybox-staticdev" -> "initscripts"
"cronie" -> "initscripts"
"ofono" -> "initscripts"
"ntp-dbg" -> "initscripts"
"openssh-dbg" -> "initscripts"
"busybox-mdev" -> "initscripts"
"ofono-tests" -> "initscripts"
"watchdog-dbg" -> "initscripts"
"hostapd" -> "initscripts"
"libavahi-common" -> "initscripts"
"dnsmasq-dev" -> "initscripts"
"cronie-doc" -> "initscripts"
"eudev-hwdb" -> "initscripts"
"dbus-locale" -> "initscripts"
"busybox-doc" -> "initscripts"
"initscripts-locale" [label=3D"initscripts-locale(initscripts) :1.0-r155\n/=
home/jdi/develop/yocto/meta/recipes-core/initscripts/initscripts_1.0.bb"]
"initscripts-locale" -> "update-rc.d-native"
"initscripts-locale" -> "virtual/update-alternatives"
"busybox-locale" -> "initscripts"
"avahi-staticdev" -> "initscripts"
"connman-tools" -> "initscripts"
"avahi-daemon" -> "initscripts"
"openssh-sshd" -> "initscripts"
"libavahi-glib" -> "initscripts"
"ofono-doc" -> "initscripts"
"ntp-utils" -> "initscripts"
"hostapd-dbg" -> "initscripts"
"libavahi-client" -> "initscripts"
"syslog-ng-dbg" -> "initscripts"
"connman-locale" -> "initscripts"
"hostapd-staticdev" -> "initscripts"
"busybox-hwclock" -> "initscripts"
"openssh-sftp" -> "initscripts"
"libavahi-ui" -> "initscripts"
"hostapd-locale" -> "initscripts"
"eudev-doc" -> "initscripts"
"initscripts-staticdev" [label=3D"initscripts-staticdev(initscripts) :1.0-r=
155\n/home/jdi/develop/yocto/meta/recipes-core/initscripts/initscripts_1.0.=
bb"]
"initscripts-staticdev" -> "update-rc.d-native"
"initscripts-staticdev" -> "virtual/update-alternatives"
"avahi-dnsconfd" -> "initscripts"
"dbus-doc" -> "initscripts"
"busybox-syslog" -> "initscripts"
"syslog-ng-locale" -> "initscripts"
"syslog-ng-libs-dev" -> "initscripts"
"run-postinsts-dev" -> "initscripts"
"connman-dev" -> "initscripts"
"dnsmasq" -> "initscripts"
"busybox-httpd" -> "initscripts"
"watchdog" -> "initscripts"
"connman-dbg" -> "initscripts"
"eudev-locale" -> "initscripts"
"avahi-dev" -> "initscripts"
"avahi-autoipd" -> "initscripts"
"libavahi-gobject" -> "initscripts"
"connman-tests" -> "initscripts"
"ofono-locale" -> "initscripts"
"openssh-ssh" -> "initscripts"
"busybox" -> "initscripts"
"ofono-dbg" -> "initscripts"
"openssh-keygen" -> "initscripts"
"hostapd-doc" -> "initscripts"
"connman-client" -> "initscripts"
"busybox-dbg" -> "initscripts"
"syslog-ng" -> "initscripts"
"libavahi-core" -> "initscripts"
"initscripts-dev" [label=3D"initscripts-dev(initscripts) :1.0-r155\n/home/j=
di/develop/yocto/meta/recipes-core/initscripts/initscripts_1.0.bb"]
"initscripts-dev" -> "update-rc.d-native"
"initscripts-dev" -> "virtual/update-alternatives"
"syslog-ng-dev" -> "initscripts"
"connman" -> "initscripts"
"initscripts-dbg" [label=3D"initscripts-dbg(initscripts) :1.0-r155\n/home/j=
di/develop/yocto/meta/recipes-core/initscripts/initscripts_1.0.bb"]
"initscripts-dbg" -> "update-rc.d-native"
"initscripts-dbg" -> "virtual/update-alternatives"
"openssh-sftp-server" -> "initscripts"
"sntp" -> "initscripts"
"ntp-dev" -> "initscripts"
"cronie-locale" -> "initscripts"
"dbus-dbg" -> "initscripts"
"run-postinsts-dbg" -> "initscripts"
"ntp-staticdev" -> "initscripts"
"cronie-staticdev" -> "initscripts"
"openssh-scp" -> "initscripts"
"connman-staticdev" -> "initscripts"
"watchdog-dev" -> "initscripts"
"udev-cache" -> "initscripts"
"eudev-dev" -> "initscripts"
"syslog-ng-doc" -> "initscripts"
"avahi-locale" -> "initscripts"
"ntp-locale" -> "initscripts"
"ofono-dev" -> "initscripts"
"connman-doc" -> "initscripts"
"watchdog-staticdev" -> "initscripts"
"connman-vpn" -> "initscripts"
"cronie-dev" -> "initscripts"
"dnsmasq-doc" -> "initscripts"
"run-postinsts-locale" -> "initscripts"
"run-postinsts" -> "initscripts"
"watchdog-locale" -> "initscripts"
"syslog-ng-libs" -> "initscripts"
"avahi-dbg" -> "initscripts"
"dbus" -> "initscripts"
"run-postinsts-doc" -> "initscripts"
"openssh-staticdev" -> "initscripts"
"eudev-staticdev" -> "initscripts"
"busybox-dev" -> "initscripts"
"libudev" -> "initscripts"
"openssh-doc" -> "initscripts"
"dnsmasq-locale" -> "initscripts"
"hostapd-dev" -> "initscripts"
"watchdog-doc" -> "initscripts"
"avahi-utils" -> "initscripts"
"cronie-dbg" -> "initscripts"
"initscripts" [label=3D"initscripts :1.0-r155\n/home/jdi/develop/yocto/meta=
/recipes-core/initscripts/initscripts_1.0.bb"]
"initscripts" -> "update-rc.d-native"
"initscripts" -> "virtual/update-alternatives"
"dnsmasq-dbg" -> "initscripts"
"busybox-udhcpc" -> "initscripts"
"busybox-udhcpd" -> "initscripts"
"openssh-misc" -> "initscripts"
"dbus-staticdev" -> "initscripts"
"dbus-dev" -> "initscripts"
"initscripts-doc" [label=3D"initscripts-doc(initscripts) :1.0-r155\n/home/j=
di/develop/yocto/meta/recipes-core/initscripts/initscripts_1.0.bb"]
"initscripts-doc" -> "update-rc.d-native"
"initscripts-doc" -> "virtual/update-alternatives"
"ntp-tickadj" -> "initscripts"
"initscripts-staticdev" -> "initscripts-dev" [style=3Ddashed]
"initscripts-dev" -> "initscripts" [style=3Ddashed]
"initscripts" -> "initscripts-functions" [style=3Ddashed]

Jef
Disclaimer

This e-mail and its attachments is intended only for the person(s) or entit=
y to which it is addressed. If you receive this e-mail by mistake, please d=
elete this e-mail from your system and destroy all copies of it. It may con=
tain confidential and/or privileged information. You should not copy it or =
use it for any purpose nor disclose its contents to any person unless allow=
ed by a written document between the sender and the addressee.

