Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+435THBngZPyQOv631HSyAB+q0agyaRSk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qqmh6-0007SL-Ja
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 15:50:09 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79Dja5F011844
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 08:45:37 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 9 Aug 2011 08:45:36 -0500
Message-Id: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: meta-toolchain-sdk failure
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
X-List-Received-Date: Tue, 09 Aug 2011 13:50:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Seeing the following when trying to do a meta-toolchain-sdk build =
w/latest git.  Guessing we're missing a depend of some sort:

| error: Failed dependencies:
| 	telepathy-python is needed by =
task-core-standalone-gmae-sdk-target-1.0-r13.ppc64e5500

I think the reset of this is noise:

| error: LOOP:
| error: removing dbus-lib-1.4.12-r0.ppc64e5500 "Requires(hint): dbus" =
from tsort relations.
| error: removing dbus-1.4.12-r0.ppc64e5500 "Requires: dbus-lib >=3D =
1.4.12" from tsort relations.
| error: LOOP:
| error: removing =
libcamel-dev-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc64e5=
500 "Requires(hint): eds-dbus-dev" from tsort relations.
| error: removing =
eds-dbus-dev-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc64e5=
500 "Requires(hint): libebook-dev" from tsort relations.
| error: removing =
libebook-dev-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc64e5=
500 "Requires(hint): libcamel-dev" fromERROR: Function 'do_populate_sdk' =
failed (see =
/local/home/galak/git/poky/build-p5020/tmp/work/ppc64e5500-poky-linux/meta=
-toolchain-gmae-1.0-r5/temp/log.do_populate_sdk.23223 for further =
information)
|  tsort relations.
| error: LOOP:
| error: removing libc6-dev-2.13-r12+svnr14157.ppc64e5500 =
"Requires(hint): bash-dev" from tsort relations.
| error: removing bash-dev-4.1-r2.ppc64e5500 "Requires(hint): libc6-dev" =
from tsort relations.
| error: LOOP:
| error: removing eglibc-dbg-2.13-r12+svnr14157.ppc64e5500 =
"Requires(hint): bash-dbg" from tsort relations.
| error: removing bash-dbg-4.1-r2.ppc64e5500 "Requires(hint): =
eglibc-dbg" from tsort relations.
| error: LOOP:
| error: removing libudev-164-r3.ppc64e5500 "Requires: udev =3D 164-r3" =
from tsort relations.
| error: removing udev-164-r3.ppc64e5500 "Requires: libudev >=3D 164" =
from tsort relations.
| error: LOOP:
| error: removing bluez4-dbg-4.82-r0.ppc64e5500 "Requires(hint): =
bluez-hcidump-dbg" from tsort relations.
| error: removing bluez-hcidump-dbg-2.0-r0.ppc64e5500 "Requires(hint): =
bluez4-dbg" from tsort relations.
| error: LOOP:
| error: removing bluez-hcidump-dev-2.0-r0.ppc64e5500 "Requires(hint): =
bluez4-dev" from tsort relations.
| error: removing bluez4-dev-4.82-r0.ppc64e5500 "Requires(hint): =
bluez-hcidump-dev" from tsort relations.
| error: LOOP:
| error: removing libcap-dev-2.22-r0.ppc64e5500 "Requires(hint): =
libpam-dev" from tsort relations.
| error: removing libpam-dev-1.1.4-r1.ppc64e5500 "Requires(hint): =
coreutils-dev" from tsort relations.
| error: removing coreutils-dev-8.12-r3.ppc64e5500 "Requires(hint): =
libcap-dev" from tsort relations.
| error: LOOP:
| error: removing =
libedata-book-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc64e=
5500 "Requires: libebook >=3D =
2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f" from tsort =
relations.
| error: removing =
libebook-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc64e5500 =
"Requires(hint): libedata-book" from tsort relations.
| error: LOOP:
| error: removing udev-dbg-164-r3.ppc64e5500 "Requires(hint): =
libudev-dbg" from tsort relations.
| error: removing libudev-dbg-164-r3.ppc64e5500 "Requires(hint): =
udev-dbg" from tsort relations.
| error: LOOP:
| error: removing =
libecal-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc64e5500 =
"Requires(hint): libedata-cal" from tsort relations.
| error: removing =
libedata-cal-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc64e5=
500 "Requires: libecal >=3D =
2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f" from tsort =
relations.

- k=


