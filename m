Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1821B73170
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:05:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2016 01:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="899929288"
Received: from klim22-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.126])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 01:05:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 22:05:52 +1300
Message-ID: <2564154.XB0jvojI47@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <201602091856.09909.marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<DAAB901F-8B5F-4D66-A0EE-5961DE7C6FA4@gmail.com>
	<201602091856.09909.marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 6/7] liburcu: Add nios2 support
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
X-List-Received-Date: Wed, 10 Feb 2016 09:06:00 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tue, 09 Feb 2016 18:56:09 Marek Vasut wrote:
> On Tuesday, February 09, 2016 at 06:52:12 PM, Khem Raj wrote:
> > > On Feb 9, 2016, at 4:07 AM, Marek Vasut <marex@denx.de> wrote:
> > >=20
> > > On Tuesday, February 09, 2016 at 12:53:01 PM, Burton, Ross wrote:=

> > >> On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:
> > >>> -LIC_FILES_CHKSUM =3D
> > >>> "file://LICENSE;md5=3D0f060c30a27922ce9c0d557a639b4fa3 \
> > >>> +LIC_FILES_CHKSUM =3D
> > >>> "file://LICENSE;md5=3De548d28737289d75a8f1e01ba2fd7825 \
> > >>=20
> > >> Why did the license checksum change?
> > >=20
> > > Because the LICENSE file now contains one more entry for nios2, w=
hich
> > > changed the checksum of the whole file. Maybe we should trim the
> > > checksum to use only the header in the LICENSE file and not the w=
hole
> > > file to prevent this ?
> > >=20
> > > This is the change which triggered the change of the checksum:
> > >=20
> > > +diff --git a/LICENSE b/LICENSE
> > > +index 3147094..a06fdcc 100644
> > > +--- a/LICENSE
> > > ++++ b/LICENSE
> > > +@@ -45,6 +45,7 @@ compiler.h
> > > + arch/s390.h
> > > + uatomic/alpha.h
> > > + uatomic/mips.h
> > > ++uatomic/nios2.h
> >=20
> > I don=E2=80=99t know how the LICENSE file looks like but including =
file names in
> > license file is probably worth ignoring in checksums.
>=20
> See below:
>=20
> Userspace RCU library licensing
> Mathieu Desnoyers
> September 3, 2012
>=20
>=20
> * LGPLv2.1
>=20
> The library part is distributed under LGPLv2.1 or later. See lgpl-2.1=
.txt
> for license details. Refer to the individual file headers for details=
.
>=20
> LGPL-compatible source code can statically use the library header usi=
ng :
>=20
> #define _LGPL_SOURCE
> #include <urcu.h>
>=20
> Dynamic-only linking with the LGPL library is used if _LGPL_SOURCE is=
 not
> defined. It permits relinking with newer versions of the library, whi=
ch is
> required by the LGPL license.
>=20
> See lgpl-relicensing.txt for details.
>=20
>=20
> * MIT-style license :
>=20
> xchg() primitive has been rewritten from scratch starting from atomic=
_ops
> 1.2 which has a MIT-style license that is intended to allow use in bo=
th
> free and proprietary software:
>         http://www.hpl.hp.com/research/linux/atomic_ops/LICENSING.txt=

>         http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/
>=20
> This MIT-style license (BSD like) apply to:
>=20
> uatomic/gcc.h
> uatomic/unknown.h
> uatomic/generic.h
> uatomic/sparc64.h
> uatomic/arm.h
> uatomic/ppc.h
> uatomic/x86.h
> uatomic.h
>=20
> MIT/X11 (BSD like) license apply to:
>=20
> compiler.h
> arch/s390.h
> uatomic/alpha.h
> uatomic/mips.h
> uatomic/nios2.h
> uatomic/s390.h
> system.h
>=20
>=20
> * GPLv2
>=20
> Library test code is distributed under the GPLv2 license. See gpl-2.0=
.txt
> for license details. See headers of individual files under tests/ for=

> details.
>=20
>=20
> * GPLv3 (or later)
>=20
> The following build-related macro is under GPLv3 (or later):
>=20
> m4/ax_tls.m4

If you only point to part of this file you are risking missing the addi=
tion of=20
just about any license to the end of the list on a future upgrade. That=
=20
doesn't sound like a good idea to me.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

