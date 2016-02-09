Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id EBAC96FFCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:56:11 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q0BjQ40w9z3hjjh;
	Tue,  9 Feb 2016 18:56:10 +0100 (CET)
X-Auth-Info: v6tmwLVTOHKHE2JJw1Z/98W/JNng2GtzaBqn9ERZ/U0=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3q0BjQ2qTqzvdWV; 
	Tue,  9 Feb 2016 18:56:10 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Feb 2016 18:56:09 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<201602091307.54737.marex@denx.de>
	<DAAB901F-8B5F-4D66-A0EE-5961DE7C6FA4@gmail.com>
In-Reply-To: <DAAB901F-8B5F-4D66-A0EE-5961DE7C6FA4@gmail.com>
MIME-Version: 1.0
Message-Id: <201602091856.09909.marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 09 Feb 2016 17:56:12 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, February 09, 2016 at 06:52:12 PM, Khem Raj wrote:
> > On Feb 9, 2016, at 4:07 AM, Marek Vasut <marex@denx.de> wrote:
> >=20
> > On Tuesday, February 09, 2016 at 12:53:01 PM, Burton, Ross wrote:
> >> On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:
> >>> -LIC_FILES_CHKSUM =3D
> >>> "file://LICENSE;md5=3D0f060c30a27922ce9c0d557a639b4fa3 \
> >>> +LIC_FILES_CHKSUM =3D
> >>> "file://LICENSE;md5=3De548d28737289d75a8f1e01ba2fd7825 \
> >>=20
> >> Why did the license checksum change?
> >=20
> > Because the LICENSE file now contains one more entry for nios2, which
> > changed the checksum of the whole file. Maybe we should trim the
> > checksum to use only the header in the LICENSE file and not the whole
> > file to prevent this ?
> >=20
> > This is the change which triggered the change of the checksum:
> >=20
> > +diff --git a/LICENSE b/LICENSE
> > +index 3147094..a06fdcc 100644
> > +--- a/LICENSE
> > ++++ b/LICENSE
> > +@@ -45,6 +45,7 @@ compiler.h
> > + arch/s390.h
> > + uatomic/alpha.h
> > + uatomic/mips.h
> > ++uatomic/nios2.h
>=20
> I don=E2=80=99t know how the LICENSE file looks like but including file n=
ames in
> license file is probably worth ignoring in checksums.

See below:

Userspace RCU library licensing
Mathieu Desnoyers
September 3, 2012

                                                                           =
                                                                      =20
* LGPLv2.1                                                                 =
                                                                      =20
                                                                           =
                                                                      =20
The library part is distributed under LGPLv2.1 or later. See lgpl-2.1.txt f=
or                                                                    =20
license details. Refer to the individual file headers for details.         =
                                                                      =20
                                                                           =
                                                                      =20
LGPL-compatible source code can statically use the library header using :  =
                                                                      =20
                                                                           =
                                                                      =20
#define _LGPL_SOURCE
#include <urcu.h>

Dynamic-only linking with the LGPL library is used if _LGPL_SOURCE is not
defined. It permits relinking with newer versions of the library, which is
required by the LGPL license.

See lgpl-relicensing.txt for details.


* MIT-style license :

xchg() primitive has been rewritten from scratch starting from atomic_ops 1=
=2E2
which has a MIT-style license that is intended to allow use in both free and
proprietary software:
        http://www.hpl.hp.com/research/linux/atomic_ops/LICENSING.txt
        http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/

This MIT-style license (BSD like) apply to:

uatomic/gcc.h
uatomic/unknown.h
uatomic/generic.h
uatomic/sparc64.h
uatomic/arm.h
uatomic/ppc.h
uatomic/x86.h
uatomic.h

MIT/X11 (BSD like) license apply to:

compiler.h
arch/s390.h
uatomic/alpha.h
uatomic/mips.h
uatomic/nios2.h
uatomic/s390.h
system.h


* GPLv2

Library test code is distributed under the GPLv2 license. See gpl-2.0.txt f=
or
license details. See headers of individual files under tests/ for details.


* GPLv3 (or later)

The following build-related macro is under GPLv3 (or later):

m4/ax_tls.m4

