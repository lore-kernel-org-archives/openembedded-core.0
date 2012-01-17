Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RnHKS-0003Nl-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 23:16:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 14:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97581437"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 14:08:53 -0800
Received: from orsmsx103.amr.corp.intel.com (10.22.225.130) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 17 Jan 2012 14:08:53 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.35]) by
	ORSMSX103.amr.corp.intel.com ([169.254.2.168]) with mapi id
	14.01.0355.002; Tue, 17 Jan 2012 14:08:53 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/5] grub-efi-native: fix errors with
	automake 1.11.2
Thread-Index: AQHM1WFRNYGAzIOfW0mzVpfzJ6R1DpYRHj+g
Date: Tue, 17 Jan 2012 22:08:52 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C04360B@ORSMSX106.amr.corp.intel.com>
References: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<18ffbd8884132baf127ac1104cf8aa393b59e3ff.1326831402.git.nitin.a.kamble@intel.com>
	<4F15EBF2.3070909@linux.intel.com>
In-Reply-To: <4F15EBF2.3070909@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] grub-efi-native: fix errors with automake 1.11.2
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
X-List-Received-Date: Tue, 17 Jan 2012 22:16:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, January 17, 2012 1:45 PM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH 5/5] grub-efi-native: fix errors with
> automake 1.11.2
>=20
> On 01/17/2012 12:30 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > This commit replaces earlier patch
> > (grub-1.99_fix_for_automake_1.11.2.patch) which did not work on all
> distros.
> >
> > Fixes these errors observed with automake 1.11.2
> > The useof pkglibhas become more strict compared to the earlier
> release
> > of
> > automake resulting in these failures.
> > Fixed the files related to automake to avoid the issue.
> >
> > | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> > for `DATA'
> > | grub-core/Makefile.am:5:   `conf/Makefile.common' included from
> here
> > | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> > for `DATA'
> > | Makefile.am:6:   `conf/Makefile.common' included from here
> > | autoreconf: automake failed with exit status: 1
> > | ERROR: autoreconf execution failed.
> >
> > | conf/Makefile.common:150: `pkglibdir' is not a legitimate directory
> > for `SCRIPTS'
> > | grub-core/Makefile.am:5:   `conf/Makefile.common' included from
> here
> > | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> > for `DATA'
> > | grub-core/Makefile.am:5:   `conf/Makefile.common' included from
> here
> > | conf/Makefile.common:150: `pkglibdir' is not a legitimate directory
> > for `SCRIPTS'
> > | Makefile.am:6:   `conf/Makefile.common' included from here
> > | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> > for `DATA'
> > | Makefile.am:6:   `conf/Makefile.common' included from here
> > | autoreconf: automake failed with exit status: 1
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   .../files/grub-1.99_fix_for_automake_1.11.2.patch  | 5808 ---------
> -----------
> >   meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    4 +-
> >   2 files changed, 2 insertions(+), 5810 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/grub/files/grub-
> 1.99_fix_for_automake_1.11.2.patch b/meta/recipes-bsp/grub/files/grub-
> 1.99_fix_for_automake_1.11.2.patch
> > index 1c70e4a..4d729e5 100644
> > --- a/meta/recipes-bsp/grub/files/grub-
> 1.99_fix_for_automake_1.11.2.patch
> > +++ b/meta/recipes-bsp/grub/files/grub-
> 1.99_fix_for_automake_1.11.2.patch
> > @@ -65,5612 +65,6 @@ Index: grub-1.99/Makefile.am
> >
> >
> Missing Patch header with Upstream-Status: and Signed-off-by:
>=20
> Sau!
Saul,
  It is not missing: http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib=
/tree/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch?h=
=3Dnitin/misc&id=3Dc81dac1964de6f926fce11c00f2a90a7ed76d577

Nitin

>=20
> >    if COND_i386_coreboot
> > -Index: grub-1.99/Makefile.tpl
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- grub-1.99.orig/Makefile.tpl
> > -+++ grub-1.99/Makefile.tpl
>=20
> <SNIP>
>=20
> > - CLEANFILES +=3D genmod.sh
> > diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> > index b976d1e..dfa4725 100644
> > --- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> > +++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> > @@ -14,9 +14,9 @@ LICENSE =3D "GPLv3"
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >
> >   # FIXME: We should be able to optionally drop freetype as a
> dependency
> > -DEPENDS =3D "help2man-native"
> > +DEPENDS =3D "help2man-native autogen-native"
> >   RDEPENDS_${PN} =3D "diffutils freetype"
> > -PR =3D "r3"
> > +PR =3D "r4"
> >
> >   # Native packages do not normally rebuild when the target changes.
> >   # Ensure this is built once per HOST-TARGET pair.


