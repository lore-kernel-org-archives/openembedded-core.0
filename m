Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1F59B60289
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 17:20:26 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Jul 2013 10:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,720,1367996400"; d="scan'208";a="271663501"
Received: from unknown (HELO helios.localnet) ([10.252.122.69])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jul 2013 10:20:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 22 Jul 2013 18:20:13 +0100
Message-ID: <13093382.dI4Ruehyku@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1374511663.git.sgw@linux.intel.com>
References: <cover.1374511663.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, dvhart@linux.intel.com, zhenhua.luo@freescale.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Mon, 22 Jul 2013 17:20:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 22 July 2013 10:12:19 Saul Wold wrote:
> Richard,
>=20
> This has been trimmed and reviewed, please wait for Paul and Ross
> (traveling) final ACKs.
>=20
> ** Reminder to BSP Maintainers - Please update your mesa .bbappends *=
**
> ** I will send email when RP has pulled, please keep me posted on you=
r
> branches **
>=20
> Thanks
> =09Sau!
>=20
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
> Emilia Ciobanu (3):
>   kmod:add GIT revision to PV variable
>   lttng-modules: Append _git to recipe name and add GIT revision to P=
V
>       variable
>   docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe
>=20
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
> Martin Jansa (6):
>   gst-plugins-good: add PACKAGECONFIG for jack
>   gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
>   pulseaudio: add PACKAGECONFIG for jack
>   subversion: add PACKAGECONFIG for sasl
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

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

