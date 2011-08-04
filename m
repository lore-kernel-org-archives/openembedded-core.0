Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/F3yasGHPYP0xMN/DfO3+Fg1lLSUU8ctA=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qp2Hy-00086u-De
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 20:04:58 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p74I0X94032625
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 13:00:33 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312474412.14274.15.camel@rex>
Date: Thu, 4 Aug 2011 13:00:34 -0500
Message-Id: <94288E5A-4AC4-4A6A-9C1A-915905CD34AF@kernel.crashing.org>
References: <1255C164-37B1-4DE1-B95D-7BA7D0E20A39@kernel.crashing.org>
	<1312474412.14274.15.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: do_rootfs failure for core-image-sato on mpc8315e-rdb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 18:04:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 4, 2011, at 11:13 AM, Richard Purdie wrote:

> On Thu, 2011-08-04 at 10:58 -0500, Kumar Gala wrote:
>> | error: Failed dependencies:
>> |       hicolor-icon-theme is needed by tasks-0.19-r0.ppc603e
>> |       hicolor-icon-theme is needed by connman-gnome-0.5-r6.ppc603e
>> | error: LOOP:
>> | error: removing busybox-1.18.4-r7.ppc603e "Requires(hint): =
busybox-udhcpc" from tsort relations.
>> | error: removing busybox-udhcpc-1.18.4-r7.ppc603e "Requires(post): =
/bin/sh" from tsort relations.
>> | error: LOOP:
>> | error: removing augeas-0.8.1-r0.ppc603e "Requires: libaugeas0 >=3D =
0.8.1" from tsort relations.
>> | error: removing libaugeas0-0.8.1-r0.ppc603e "Requires(hint): =
augeas" from tsort relations.
>> | error: LOOP:
>> | error: removing busybox-1.18.4-r7.ppc603e "Requires(hint): =
busybox-syslog" from tsort relations.
>> | error: removing busybox-syslog-1.18.4-r7.ppc603e "Requires(post): =
/bin/sh" from tsort relations.
>> | error: LOOP:
>> | error: removing libudev0-164-r4.ppc603e "Requires: udev =3D 164-r4" =
from tsort relations.
>> | error: removing udev-164-r4.ppc603e "Requires: libudev0 >=3D 164" =
from tsort relations.
>> | error: LOOP:
>> | error: removing libdbus-1-3-1.4.12-r0.ppc603eERROR: Function =
'do_rootfs' failed (see =
/local/home/galak/git/poky/build/tmp/work/mpc8315e_rdb-poky-linux/core-ima=
ge-sato-1.0-r0/temp/log.do_rootfs.9312 for further information)
>> |  "Requires(hint): dbus-1" from tsort relations.
>> | error: removing dbus-1-1.4.12-r0.ppc603e "Requires: libdbus-1-3 >=3D =
1.4.12" from tsort relations.
>> | error: LOOP:
>> | error: removing bash-dev-4.1-r2.ppc603e "Requires(hint): =
ncurses-dev" from tsort relations.
>> | error: removing ncurses-dev-5.9-r1.1.ppc603e "Requires(hint): =
libc6-dev" from tsort relations.
>> | error: removing libc6-dev-2.13-r11+svnr14157.ppc603e =
"Requires(hint): bash-dev" from tsort relations.
>> | error: LOOP:
>> | error: removing bash-dbg-4.1-r2.ppc603e "Requires(hint): =
eglibc-dbg" from tsort relations.
>> | error: removing eglibc-dbg-2.13-r11+svnr14157.ppc603e =
"Requires(hint): bash-dbg" from tsort relations.
>> | error: LOOP:
>> | error: removing =
libecal-1.2-7-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc603=
e "Requires(hint): libedata-cal-1.2-7" from tsort relations.
>> | error: removing =
libedata-cal-1.2-7-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.p=
pc603e "Requires: libecal-1.2-7 >=3D =
2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f" from tsort =
relations.
>> | error: LOOP:
>> | error: removing =
libebook-1.2-9-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc60=
3e "Requires(hint): libedata-book-1.2-2" from tsort relations.
>> | error: removing =
libedata-book-1.2-2-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.=
ppc603e "Requires: libebook-1.2-9 >=3D =
2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f" from tsort =
relations.
>> NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
>> ERROR: Task 8 =
(/local/home/galak/git/poky/meta/recipes-sato/images/core-image-sato.bb, =
do_rootfs) failed with exit code '1'
>> ERROR: =
'/local/home/galak/git/poky/meta/recipes-sato/images/core-image-sato.bb' =
failed
>>=20
>> thoughts?
>=20
> Was this a recent build from scratch? I suspect Koen's recent icon
> bbclass change and we probably need to ensure hicolor-icon-theme is
> added do DEPENDS (instead of RDEPENDS like it used to be).

Yes, recent as of this morning.

- k=


