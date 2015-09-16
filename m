Return-Path: <prvs=694d4cdb9=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0CE60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 06:01:11 +0000 (UTC)
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 16 Sep 2015 08:01:11 +0200
Received: from unknown (HELO esabb4.muc) ([160.50.100.33]) by esagw5.muc with
	ESMTP/TLS; 16 Sep 2015 08:01:11 +0200
Received: from smuch52b.muc (HELO SMUCH52B.europe.bmw.corp) ([160.46.137.114])
	by esabb4.muc with ESMTP/TLS; 16 Sep 2015 08:01:09 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH52B.europe.bmw.corp ([160.46.137.114]) with mapi id 14.03.0248.002;
	Wed, 16 Sep 2015 08:01:09 +0200
From: <Mikko.Rapeli@bmw.de>
To: <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 02/12] hostap-utils: Use C99 stddefs in
	defining local typedefs
Thread-Index: AQHQ74B1azg272f4V0WUnPO2a1TLOJ49kZsAgAD25QA=
Date: Wed, 16 Sep 2015 06:01:08 +0000
Message-ID: <20150916055705.GX9460@loska>
References: <cover.1442248108.git.raj.khem@gmail.com>
	<2e8b33d5ff6928987dde0b059cd7403fc32a2e0b.1442248108.git.raj.khem@gmail.com>
	<20150915062937.GN9460@loska>
	<CAMKF1soOSzDNCTtCk-piCt0LHbrP6p6eZZCE6EuWaf5WHkK2BQ@mail.gmail.com>
In-Reply-To: <CAMKF1soOSzDNCTtCk-piCt0LHbrP6p6eZZCE6EuWaf5WHkK2BQ@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/12] hostap-utils: Use C99 stddefs in defining local typedefs
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
X-List-Received-Date: Wed, 16 Sep 2015 06:01:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27FFBA3AF147D544ADF0C7FEA9583382@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 08:13:26AM -0700, Khem Raj wrote:
> On Mon, Sep 14, 2015 at 11:33 PM,  <Mikko.Rapeli@bmw.de> wrote:
> > On Mon, Sep 14, 2015 at 04:31:17PM +0000, Khem Raj wrote:
> >> The code is creating more abstract types which is nice however it shou=
ld
> >> be using standard defines from stdint.h and not random defines to base
> >> its own type system
> >
> > These types are not random. They are standard Linux kernel types used b=
y headers
> > exported to userspace and their definitions come from <linux/types.h>.
> > These headers should not depend on libc headers like stdint.h.
>=20
> Right they are not random in general but they are randomly being
> redefined by the application,
> if it should be using linux/types.h those are different types than
> what is being defined here. I have just
> made the semantics of existing logic to be more c99 compliant.
>=20
> >
> > Also, this file is actually a convenience copy of <linux/wireless.h> wh=
ich should
> > be used directly instead.
>=20
> There must be a reason to make own copy. May be hostap-utils want to
> be portable to more than linux

A private copy of <linux/wireless.h> is only usefull with Linux kernel. Sin=
ce
mid 2000's Linux kernel has a way to properly export these headers to
userspace. Thus the private copies should not be needed anymore.

-Mikko=

