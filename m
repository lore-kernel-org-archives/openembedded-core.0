Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShycW-0000fr-4z
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 09:49:32 +0200
Received: by werg55 with SMTP id g55so936729wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w34zmv0ERVRUuwGS4LoPh3RVbaJWIh5ZVOmHrYOxwqw=;
	b=GJ+Lhe5SZALcE1L9pdoIsQVnyZQIRZGRO/tOeZtCOc303wPeykduANvhHDRqucbuK2
	M9volYaUaB2wWlY5RLzSlk3HreT+NZlfD6daQX1Qcvm1WPrYc+9YimZY/d+niu6uDt4U
	fqxClAEPw49wrxVglp0qERBmRDNNm5DtRVbuolOKJL4G8lyucbWb1agJ6jY0g3o4qvmC
	Vbf8c1TmOKmaVQEGyvg0RVy03Ty5uMez8skjbxeUfh5iaZXzYR3jN2PPwIvSzWhrT/xZ
	XtEz/T/MUgz/nT1GzYl4Jngs+pOqeaZSgjRrfqsyU9Adlp/4Xf0Dh5iijPLivmvJT0Dc
	qHig==
Received: by 10.180.102.136 with SMTP id fo8mr2486345wib.19.1340350719858;
	Fri, 22 Jun 2012 00:38:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u8sm2372048wiy.5.2012.06.22.00.38.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 00:38:38 -0700 (PDT)
Date: Fri, 22 Jun 2012 09:38:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120622073838.GL9352@jama.jama.net>
References: <cover.1340205163.git.raj.khem@gmail.com>
	<a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
	<20120622063756.GK9352@jama.jama.net>
	<CAMKF1spK9RwuhfGoTSPCEGvnKRcYfYPHGo0EdktwXdthP6uncA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spK9RwuhfGoTSPCEGvnKRcYfYPHGo0EdktwXdthP6uncA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/5] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Fri, 22 Jun 2012 07:49:32 -0000
X-Groupsio-MsgNum: 23976
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAzLNm1y1mIRgolD"
Content-Disposition: inline

--iAzLNm1y1mIRgolD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 12:20:31AM -0700, Khem Raj wrote:
> On Thu, Jun 21, 2012 at 11:37 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Wed, Jun 20, 2012 at 08:18:37AM -0700, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> =A0meta/recipes-devtools/gcc/gcc-4.7.inc | =A0 12 ++++++------
> >> =A01 files changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devt=
ools/gcc/gcc-4.7.inc
> >> index 34a73b1..25a1088 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> >> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> >> @@ -3,12 +3,12 @@ require gcc-common.inc
> >> =A0PR =3D "r2"
> >>
> >> =A0# Third digit in PV should be incremented after a minor release
> >> -# happens from this branch on gcc e.g. currently its 4.7.0
> >> -# when 4.7.1 is releases and we bump SRCREV beyond the release
> >> -# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
> >> +# happens from this branch on gcc e.g. currently its 4.7.1
> >> +# when 4.7.2 is releases and we bump SRCREV beyond the release
> >> +# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
> >> =A0# to reflect that change
> >>
> >> -PV =3D "4.7.0+svnr${SRCPV}"
> >> +PV =3D "4.7.1+svnr${SRCPV}"
> >>
> >> =A0# BINV should be incremented after updating to a revision
> >> =A0# after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
> >> @@ -16,9 +16,9 @@ PV =3D "4.7.0+svnr${SRCPV}"
> >> =A0# 4.7.1 then the value below will have 2 which will mean 4.7.2
> >> =A0# which will be next minor release and so on.
> >>
> >> -BINV =3D "4.7.1"
> >> +BINV =3D "4.7.2"
> >>
> >> -SRCREV =3D "186651"
> >> +SRCREV =3D "188658"
> >> =A0BRANCH =3D "gcc-4_7-branch"
> >> =A0FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ],=
 d)}"
> >
> > I'm not sure if this one is new, but libgcc now reports unpackaged
> > file:
> >
> > NOTE: package libgcc-4.7.1+svnr188658-r2: task do_package: Started
> > WARNING: For recipe libgcc, the following files/directories were
> > installed but not shipped in any package:
> > WARNING: =A0 /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
> > WARNING: =A0 /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h
>=20
> can you see couple of things 1. if this file is being generated and
> installed during libgcc build or if its coming from the bits that are
> stashed away from gcc-cross build
>=20
> this file should not be packaged with libgcc so right solution will be
> to delete this file
> >
> > And the problem with (sometimes) missing or corrupt header file is stil=
l there:
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-b=
ranch/gcc/dwarf2out.c:8383:6: warning: format not a string literal and no f=
ormat arguments [-Wformat-security]
> > | gcc -c =A0 -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE =A0-W -Wall -Wwrite-=
strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-form=
at-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-=
strings -Wold-style-definition -Wc++-compat =A0 -DHAVE_CONFIG_H -I. -I. -I/=
OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/g=
cc -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-br=
anch/gcc/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gc=
c-4_7-branch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1=
+svnr188658-r2/gcc-4_7-branch/gcc/../libcpp/include =A0-I/OE/shr-core/tmp-e=
glibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libdecnumbe=
r -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-bra=
nch/gcc/../libdecnumber/dpd -I../libdecnumber =A0 =A0/OE/shr-core/tmp-eglib=
c/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/emit-rtl.c -o emit=
-rtl.o
> > | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-b=
ranch/gcc/emit-rtl.c:42:17: fatal error: rtl.h: No such file or directory
> > | compilation terminated.
> > Restarting build helps again..
> >
>=20
> this is intriguing we should look into it can you explain (once again
> how can I reproduce it)

I still don't have any steps how to reproduce it reliably, just doing a
lot of gcc builds and I see about once from 5 builds.. So with every gcc
upgrade (even with just PR bump) I get usually at least 1 build failure
for 1 architecture/machine on one buildhost (sometimes it's on fast one,
sometimes on slow one with just 2 threads - so speed is not so important
to reproduce it).

Usually it's from gcc-cross-initial, but sometimes from intermediate or
gcc-cross itself too.

The error is different from time to time, but always some constant
missing or whole header file like in today's error. Probably most
popular one is
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/=
gcc/calls.c:1204:9:
error: 'STACK_CHECK_MAX_VAR_SIZE' undeclared (first use in this
function)

whole log in=20
http://build.shr-project.org/tests/jama/gcc-issue/gcc-race-new/

even more samples:
http://build.shr-project.org/tests/jama/gcc-upgrade-issue/

I'm sorry I cannot provide better info.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iAzLNm1y1mIRgolD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/kIP4ACgkQN1Ujt2V2gBw1rACgkRz8BU5o0BSXo66jYs3S+oG9
tR8AnjZe/0zj/ISvmgZCwFJMAqTKFnuW
=pIqk
-----END PGP SIGNATURE-----

--iAzLNm1y1mIRgolD--
