Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18JMKxQ/gdISXP+jTRwxsk/BZ7Z8ndR4wk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qrtco-0006e4-TL
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 17:26:19 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7CFLhkk027548;
	Fri, 12 Aug 2011 10:21:44 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
Date: Fri, 12 Aug 2011 10:21:46 -0500
Message-Id: <AE257E65-83DE-4D59-BF8F-21DDBE4BE953@kernel.crashing.org>
References: <cover.1313134270.git.sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/25] Meta-RT reorg and other fixes
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
X-List-Received-Date: Fri, 12 Aug 2011 15:26:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 12, 2011, at 2:49 AM, Saul Wold wrote:

> Richard,
>=20
> This set of changes fixes some current master build failures for
> RPM rootfs (from Mark) and has the Realtime update from Darren and
> Bruce.
>=20
> In addition there are some updates from Chris Larson and Kumar =
cleaning
> up various tune and multi-lib issues.
>=20
> They past my review and initial testing.
>=20
> Sau!
>=20
> The following changes since commit =
a92d56058b21913570bb17ae416c3b00afce055e:
>=20
>  gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 =
19:13:38 +0100)
>=20
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Ds=
gw/stage
>=20
> Bruce Ashfield (1):
>  linux-yocto: update SRCREVs for preempt-rt support + build fixes
>=20
> Chris Larson (7):
>  busybox: don't strip the main binary
>  insane: add linux-gnu to the platform data
>  nativesdk: inherit relocatable
>  sanity: shift the required utils into a variable
>  package: include SECTION in the pkgdata
>  package: allow setting a section for locale packages
>  cross: also empty PACKAGES_DYNAMIC
>=20
> Darren Hart (10):
>  meta-rt: refresh linux-yocto-rt recipe
>  meta-rt: rt-tests v0.73 instead of AUTOREV
>  meta-rt: canonicalize directory structure
>  meta-rt: add linux-yocto-rt_3.0 recipe
>  meta-rt: remove atom-pc support from the main layer
>  meta-rt: rename minimal-rt images to -rt, drop live image
>  meta-rt: add an -rt-sdk image
>  meta-rt: default KMACHINE and SRCREV_machine to avoid parsing errors
>  Move meta-rt recipes to oe-core (meta)
>  recipes-rt: add a README documenting the contents of recipes-rt
>=20
> Kumar Gala (3):
>  automake: Update for python.m4 to respect libdir
>  xcb-proto: update based on changes to python.m4 in automake
>  tune-ppce5500: Add a set of tune files for PowerPC e5500 core

Mind pickup up:

tune-ppc: Update to pass glibc configure option to get cpu specific =
support

(hopefully v4 applies)

- k=


