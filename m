Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD3B61FE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 09:22:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2013 02:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,718,1367996400"; d="scan'208";a="374030033"
Received: from unknown (HELO helios.localnet) ([10.252.122.69])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2013 02:22:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 10:22:23 +0100
Message-ID: <1790143.ZLrHWRrgzY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1374470774.git.sgw@linux.intel.com>
References: <cover.1374470774.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/36] Please review and ACK
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
X-List-Received-Date: Mon, 22 Jul 2013 09:22:25 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Sunday 21 July 2013 22:28:08 Saul Wold wrote:
> Paul, Ross:
>=20
> Please review this set, I know Ross might be travelling today,
> so this may be delayed until the end of the day or tomorrow.
>=20
> **** NOTE TO BSP Maintainers: This will require a mesa bbappend sync =
when
> pulled ***** **** I will send email when that happens, so please prep=
are
> your branches        *****
>=20
> I verified that Ema's changes do not cause any backward revs.
>=20
> I tested this set twice on the AB, the first set failed with the util=
-linux
> patch, then I built master again, and rebuilt this set without the
> util-linux change and it built great (execpt for the missing Mesa upd=
ates
> to BSP).
>=20
> There appears to be one testimage failure with Mips and SMART, I will=

> forward that to Stephan as it might be a test case issue.
>=20
>=20
> Thanks
>         Sau!
>=20
> The following changes since commit 8fc6904fe97438478119db6cd23b7b4eb3=
3b50aa:
>=20
>   curl: add upstream status to patch (2013-07-18 12:21:13 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
> =20
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dsgw/
> stage
>=20
> Andr=E9 Draszik (1):
>   directfb: don't patch pkg-config files
>=20
> Beth Flanagan (1):
>   adt_installer_internal: fix spelling error
>=20
> Chen Qi (2):
>   useradd.bbclass: add a new base class and code refactor
>   extrausers.bbclass: add a new bbclass
>=20
> Daniel Nilsson (1):
>   glew: Update GLEW version number in autotools patch
>=20
> Emilia Ciobanu (11):
>   rt-tests: add GIT revision to PV variable
>   kmod:add GIT revision to PV variable
>   hwlatdetect: add GIT revision to PV variable
>   lttng-ust:add GIT revision to PV variable
>   connman-gnome: add GIT revision to PV variable
>   mtd-utils: add GIT revision to PV variable
>   update-rc.d: add GIT revision to PV variable
>   build-appliance-image: add GIT revision to PV variable
>   lttng-modules: Append _git to recipe name and add GIT revision to P=
V
>       variable
>   chkconfig-alternatives-native: add GIT revision to PV variable
>   docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe

I'm concerned about inconsistencies with this set - e.g. lttng-modules =
has=20
been renamed to _git, lttng-ust hasn't; similarly for build-appliance-i=
mage=20
and a few of the others.

> Jesse Zhang (1):
>   tremor: add a patch to build with arm thumb
>=20
> Jonathan Liu (5):
>   systemd: remove unneeded modprobe.rules
>   mesa: upgrade to 9.1.5
>   wget: backport fixes for documentation build errors
>   mesa: use LLVM 3.3 by default
>   boot-directdisk: use awk instead of echo -ne for dash compatibility=

>=20
> Martin Jansa (7):
>   gst-plugins-good: add PACKAGECONFIG for jack
>   gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
>   pulseaudio: add PACKAGECONFIG for jack
>   subversion: add PACKAGECONFIG for sasl
>   gst-plugins-bad: add few more PACKAGECONFIGs
>   cups: add PACKAGECONFIG for avahi
>   mesa: add Upstream-Status
>=20
> Ming Liu (1):
>   libpam: add a new 'nullok_secure' option support to pam_unix
>=20
> Muhammad Shakeel (1):
>   systemd: Remove systemd_unitdir if systemd is not in distro feature=
s
>=20
> Petter Mab=E4cker (1):
>   remake: fix insufficient gettext dependency
>=20
> Ross Burton (1):
>   initrdscripts: mount / as read-only when live-booting
>=20
> Saul Wold (1):
>   pigz: Fix typo in ALTERNATIVES line
>=20
> Tudor Florea (2):
>   python: Add ptest
>   kmod: Add ptest

All the rest of the changes look OK.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

