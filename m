Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0B946C1F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 03046183BD;
	Fri,  3 May 2019 17:02:41 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id wLK4n6oIFkIg; Fri,  3 May 2019 17:02:39 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E65B41816A;
	Fri,  3 May 2019 17:02:38 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5EB81A072;
	Fri,  3 May 2019 17:02:38 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C12EF1A062;
	Fri,  3 May 2019 17:02:38 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri,  3 May 2019 17:02:38 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id B4BC11A56;
	Fri,  3 May 2019 17:02:38 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 3 May 2019 17:02:38 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 3 May 2019 17:02:38 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 3 May 2019 17:02:38 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jonas Bonn <jonas@norrbonn.se>, Alex Kiernan <alex.kiernan@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [OE-Core][PATCH v6 0/6] systemd stateless configuration
Thread-Index: AQHVAYuQFMSrh2wB+Eq9ScgQ+8WW+6ZZOh6AgAA/89A=
Date: Fri, 3 May 2019 15:02:37 +0000
Message-ID: <1c3b53e18c0f41268f24a72ac7fc85d0@XBOX04.axis.com>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
	<CAO5Uq5RVB77ZMRvAwneGQ5KYSyPL_m-vhSf3YuQz4oN0VYqW3w@mail.gmail.com>
	<34d317a2-7fc4-fddd-f0c4-0d8f6b25e9df@norrbonn.se>
In-Reply-To: <34d317a2-7fc4-fddd-f0c4-0d8f6b25e9df@norrbonn.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v6 0/6] systemd stateless	configuration
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
X-List-Received-Date: Fri, 03 May 2019 15:02:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Jonas Bonn
> Sent: den 3 maj 2019 14:55
> To: Alex Kiernan <alex.kiernan@gmail.com>; OE-core <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [OE-Core][PATCH v6 0/6] systemd stateless
> configuration
>=20
> Hi Alex,
>=20
> On 03/05/2019 10:37, Alex Kiernan wrote:
> > On Thu, May 2, 2019 at 10:10 PM Alex Kiernan <alex.kiernan@gmail.com>
> > wrote:
> >>
> >> This patch set is largely Jonas Bonn's to move towards a "stateless"
> >> configuration:
> >>
> >>    These patches make some modifications to systemd with the long-
> >>    term goal of being able to run OE in systemd's "stateless"=20
> >>    configuration.  "Stateless" boils down to building an image=20
> >>    with empty /etc and /var directories so that volatile (tmpfs)=20
> >>    filesystems can be mounted there; this requires that the=20
> >>    system subsequently be able to populate these directories=20
> >>    dynamically, which systemd mostly takes care of if things are
> >>    done right.
> >>
> >>    In these patches:
> >>    i)   Don't include machine-id in writable images so that=20
> >>         systemd can run its first-boot machinery
> >>    ii)  Move systemd configuration files out of /etc
> >>    iii) Allow systemd to dynamically enable services and=20
> >>         populate /etc/systemd/system via the presets mechanism
> >>
> >>    There's a long way to go to get to a working "stateless"
> >>    configuration.  Getting to a "volatile" system (just empty=20
> >>    /var) should be easier and I'll post patches moving things in=20
> >>    that direction shortly.
> >>
> >> However as a result of the systemd 242 upgrade, which includes
> >> 01d2041e41f4 ("meson: stop creating enablement symlinks in /etc=20
> >> during installation"), services such as systemd-networkd are no=20
> >> longer enabled in images.
> >>
> >> This patch set fixes this problem in addition to satisfying the=20
> >> goal of moving towards "stateless" configurations.
> >>
> >> The issue with respect to image testing during CI was caused by
> >> systemd-time-wait-sync.service being enabled due to the lack of
> >> a default preset policy:
> >>
> >> https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> >>
> >> Changes in v6:
> >> - switch configuration to simple overrides in /usr/lib/systemd/*.conf.=
d
> >> - make systemd RRECOMMENDS rather than RDEPENDS on systemd-conf
> >> - don't exit in postinst as when that executes we're actually a
> >>    concatenation of all fragments
> >> - validate SYSTEMD_AUTO_ENABLE is `enable` or `disable`
> >> - rewrite systemctl-native in Python
> >> - moved systemctl preset-all to IMAGE_PREPROCESS so it runs after ROOT=
FS,
> >>    run for all images, not just read-only
> >>
> >> Changes in v5:
> >> - rebased for systemd 242
> >> - install default preset distribution policy of "enable nothing"
> >>
> >> Alex Kiernan (3):
> >>    systemd-conf: simplify creation of machine-specific configuration
> >>    systemctl-native: Rewrite in Python supporting preset-all and mask
> >>    image: call systemctl preset-all for images
> >>
> >> Jonas Bonn (3):
> >>    systemd: don't build firstboot by default
> >>    systemd: do not create machine-id
> >>    systemd: create preset files instead of installing in image
> >>
> >>   meta/classes/image.bbclass                    |   9 +-
> >>   meta/classes/rootfs-postcommands.bbclass      |   6 +
> >>   meta/classes/systemd.bbclass                  |  41 +-
> >>   .../systemd/systemd-conf/journald.conf        |   3 +
> >>   .../systemd/systemd-conf/logind.conf          |   2 +
> >>   .../systemd/systemd-conf/system.conf          |   2 +
> >>   .../systemd/systemd-conf/system.conf-qemuall  |   3 +
> >>   meta/recipes-core/systemd/systemd-conf_242.bb |  61 +--
> >>   .../systemd/systemd-systemctl/systemctl       | 476 ++++++++++------=
--
> >>   .../systemd/systemd/99-default.preset         |   1 +
> >>   meta/recipes-core/systemd/systemd_242.bb      |  26 +-
> >>   11 files changed, 360 insertions(+), 270 deletions(-)
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/journald.c=
onf
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/logind.con=
f
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/system.con=
f
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/system.con=
f-qemuall
> >>   create mode 100644 meta/recipes-core/systemd/systemd/99-default.pres=
et
> >
> > Sigh...
> >
> > this still has issues - if you boot with `ro` on the kernel command
> > line and without an initramfs, then / is read-only when systemd
> > starts and it basically refuses to do anything:
> >
> > [    7.222134] systemd[1]: No hostname configured.
> > [    7.227266] systemd[1]: Set hostname to <localhost>.
> > [    7.232622] systemd[1]: System cannot boot: Missing /etc/machine-id =
and /etc is mounted read-only.
> > [    7.241750] systemd[1]: Booting up is supported only when:
> > [    7.247362] systemd[1]: 1) /etc/machine-id exists and is populated.
> > [    7.253752] systemd[1]: 2) /etc/machine-id exists and is empty.
> > [    7.259757] systemd[1]: 3) /etc/machine-id is missing and /etc is wr=
itable.
> >
> > Note this has nothing to do with read-only-rootfs, this is just a
> > regular boot... that said a bunch of things that were broken now
> > work, so it's progress!
> >
> > I'm leaning towards having systemctl-native touch /etc/machine-id
> > when it runs, unless you explicitly ask for stateless in
> > DISTRO_FEATURES... patches to follow.
>=20
> The paradigm that systemd follows is that /etc is _always_ writable.
> The read-only rootfs that OE produces with a read-only /etc is
> pathological from systemd's point of view (as is your 'ro' kernel
> parameter example).  The way to handle this is to:
>=20
> i) mount a tmpfs over /etc
> ii) move the contents of /etc to /usr/share/factory/etc at buildtime
> and
> have tmpfiles.d snippets that take care of populating /etc at runtime

That is probably the way to handle it for a stateless system.=20
However, even without stateless, having /etc being writable is=20
almost a necessity when using systemd. In our case, we mount=20
an overlayfs on top of /etc to make it writable (before=20
systemd is started). As I do not see us switching to a stateless=20
system any time soon, I believe it would be good to be able to=20
differentiate between the tree variants for how /etc is used:=20
read-only, writable and stateless. Today the only DISTRO_FEATURE=20
is read-only-rootfs, which is not really relevant for /etc.

> I have a set of patches that does this, but it's all pretty fragile at
> this point in time.  It scans /etc at buildtime, moves files and links
> to factory/{var,etc}, sets up tmpfiles.d snippets for files and
> directories.  Doing this, however, somewhat requires for things that
> _can_ be set up at runtime to be so; what remains in /etc should only
> be
> stuff that doesn't set itself up at runtime _yet_.  For this reason,
> I'm
> inclined to say that you _don't_ want to leave the /etc/systemd/system
> nor /etc/machine-id files in the image.
>=20
> /Jonas
>=20
> > Alex Kiernan

//Peter

