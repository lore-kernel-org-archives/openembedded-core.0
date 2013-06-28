Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E3C4D6AEEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:58:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 02:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="357171517"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2013 02:54:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Kang Kai <Kai.Kang@windriver.com>
Date: Fri, 28 Jun 2013 10:53:44 +0100
Message-ID: <6864785.i8K3q4aBBb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1372412549.9930.248.camel@ted>
References: <cover.1372403777.git.kai.kang@windriver.com>
	<51CD5880.7000102@windriver.com> <1372412549.9930.248.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Disable build qt related packagegroups on mips64 with 64 bits userspace
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
X-List-Received-Date: Fri, 28 Jun 2013 09:58:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 28 June 2013 10:42:29 Richard Purdie wrote:
> On Fri, 2013-06-28 at 17:33 +0800, Kang Kai wrote:
> > On 2013=E5=B9=B406=E6=9C=8828=E6=97=A5 17:00, Paul Eggleton wrote:
> > > Hi Kai,
> > >=20
> > > On Friday 28 June 2013 15:48:47 Kai Kang wrote:
> > >> Because qt could not be built on mips64 with 64 bits userspace, =
set
> > >> COMPATIBLE_HOST for qt related packagegroups to disable them on =
mips64
> > >> with 64 bit userspace too.
> > >>=20
> > >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > >> ---
> > >>=20
> > >>   .../packagegroups/packagegroup-core-qt.bb          |    3 +++
> > >>   .../packagegroups/packagegroup-core-qt4e.bb        |    3 +++
> > >>   .../packagegroup-qt-toolchain-target.inc           |    3 +++
> > >>   3 files changed, 9 insertions(+), 0 deletions(-)
> > >>=20
> > >> diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.=
bb
> > >> b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb index
> > >> 315df33..c993242 100644
> > >> --- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> > >> +++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> > >> @@ -6,6 +6,9 @@ DESCRIPTION =3D "Qt package groups"
> > >>=20
> > >>   LICENSE =3D "MIT"
> > >>   PR =3D "r4"
> > >>=20
> > >> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> > >> +COMPATIBLE_HOST_mips64 =3D "mips64.*-linux-gnun32"
> > >> +
> > >>=20
> > >>   inherit packagegroup
> > >>  =20
> > >>   PACKAGES =3D "${PN}-demoapps"
> > >>=20
> > >> diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4=
e.bb
> > >> b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb index
> > >> 9263828..6ef844f 100644
> > >> --- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> > >> +++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> > >> @@ -2,6 +2,9 @@ SUMMARY =3D "Qt for Embedded Linux (Qt without X=
11)"
> > >>=20
> > >>   PR =3D "r2"
> > >>   LICENSE =3D "MIT"
> > >>=20
> > >> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> > >> +COMPATIBLE_HOST_mips64 =3D "mips64.*-linux-gnun32"
> > >> +
> > >>=20
> > >>   inherit packagegroup
> > >>  =20
> > >>   # For backwards compatibility after rename
> > >>=20
> > >> diff --git
> > >> a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target=
.inc
> > >> b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target=
.inc
> > >> index
> > >> 8413eec..fc1ccba 100644
> > >> ---
> > >> a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target=
.inc
> > >> +++
> > >> b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target=
.inc
> > >> @@ -1,5 +1,8 @@
> > >>=20
> > >>   LICENSE =3D "MIT"
> > >>=20
> > >> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> > >> +COMPATIBLE_HOST_mips64 =3D "mips64.*-linux-gnun32"
> > >> +
> > >>=20
> > >>   inherit packagegroup
> > >>  =20
> > >>   PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
> > >=20
> > > I'm fine with the other change; the question is is this one neede=
d in
> > > addition? Since the packagegroup-*qt* recipes reference packages =
from
> > > Qt which itself inherits qt4x11/qt4e bbclasses, surely trying to =
build
> > > these will immediately fail for mips64 anyway?
> >=20
> > Yes, it will fail immediately. What I want to do is to underline th=
ese
> > packagegroups' build platform.
> > If you believe that they are redundant, I retrieve the patch 2/2.
>=20
> At a guess the one advantage of this is to clean up what "bitbake wor=
ld"
> would show?

OK, I don't have any strong objections if it does help in some way.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

