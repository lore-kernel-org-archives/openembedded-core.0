Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.80.1615844171070676387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 14:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4074240BFF;
	Mon, 15 Mar 2021 21:36:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyyh8f6TSyfe; Mon, 15 Mar 2021 21:36:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F308A40BE6;
	Mon, 15 Mar 2021 21:36:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 51651174543; Mon, 15 Mar 2021 17:36:06 -0400 (EDT)
Date: Mon, 15 Mar 2021 17:36:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>,
	Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Message-ID: <20210315213606.GP4892@denix.org>
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
 <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FLTS_Pa=
tch_Acceptance_Policies

Stable/LTS Patch Acceptance Policies

Potentially Acceptable:
* Bug fix only version upgrades for upstreams with a good stable process

Unacceptable:
* General version upgrades


So, unless there's a bugfix-only minor release of glibc, e.g. 2.31.1,=20
upgrading to 2.32 or 2.33 in stable branches is highly unlikely, as both=20
2.32 and 2.33 have long lists of major changes:

https://sourceware.org/pipermail/libc-announce/2020/000029.html
https://sourceware.org/pipermail/libc-announce/2021/000030.html

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964


On Sun, Mar 14, 2021 at 12:20:00AM +0100, Anatol Belski wrote:
> Hi,
>=20
> looking at the state of the upstream glibc 2.31, pulling the latest
> upstream might be more suitable than cherry-picking patches. Depending
> on the recipe maintainers opinion, it might be a good time time to do
> so as some other CVE issues are fixed there, too.
>=20
> Thanks
>=20
> Anatol
>=20
> On Fri, 2021-03-12 at 23:15 +0000, Jamaluddin, Khairul Rohaizzat wrote:
> > Just did some checking for versions glibc-2.31 and glibc-2.32 (used
> > in dunfell and gatesgarth respectively), both of these versions
> > cannot use this patch as these versions doesn't have the file
> > involved, netgroupcache.c
> >=20
> >=20
> > Thank you & Kind regards,
> > Khairul
> >=20
> > -----Original Message-----
> > From: Jamaluddin, Khairul Rohaizzat=20
> > Sent: Saturday, March 13, 2021 3:34 AM
> > To: Khem Raj <raj.khem@gmail.com>
> > Cc: Patches and discussions about the oe-core layer
> > <openembedded-core@lists.openembedded.org>
> > Subject: RE: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
> >=20
> > Yes, seems to be in the list as well..
> > The version for both branch is within the versions mentioned in the
> > CVE too.
> >=20
> >=20
> > Thank you & Kind regards,
> > Khairul
> >=20
> > -----Original Message-----
> > From:
> > openembedded-core@lists.openembedded.org=A0<openembedded-core@lists.o=
penembedded.org
> > > On Behalf Of Khem Raj
> > Sent: Friday, March 12, 2021 7:56 AM
> > To: Jamaluddin, Khairul Rohaizzat
> > <khairul.rohaizzat.jamaluddin@intel.com>
> > Cc: Patches and discussions about the oe-core layer
> > <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
> >=20
> > On Thu, Mar 11, 2021 at 7:21 AM Jamaluddin, Khairul Rohaizzat
> > <khairul.rohaizzat.jamaluddin@intel.com> wrote:
> > >=20
> > > From: Khairul Rohaizzat Jamaluddin
> > > <khairul.rohaizzat.jamaluddin@intel.com>
> > >=20
> > > CVE:
> > > CVE-2021-27645
> > >=20
> >=20
> > lgtm. Do we need it for dunfell and gatesgarth as well ?
> >=20
> > > Signed-off-by: Khairul Rohaizzat Jamaluddin=20
> > > <khairul.rohaizzat.jamaluddin@intel.com>
> > > ---
> > > =A0.../glibc/glibc/CVE-2021-27645.patch=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
| 51
> > > +++++++++++++++++++
> > > =A0meta/recipes-core/glibc/glibc_2.33.bb=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 1 +
> > > =A02 files changed, 52 insertions(+)
> > > =A0create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-
> > > 27645.patch
> > >=20
> > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> > > b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> > > new file mode 100644
> > > index 0000000000..26c5c0d2a9
> > > --- /dev/null
> > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> > > @@ -0,0 +1,51 @@
> > > +From dca565886b5e8bd7966e15f0ca42ee5cff686673 Mon Sep 17 00:00:00
> > > +2001
> > > +From: DJ Delorie <dj@redhat.com>
> > > +Date: Thu, 25 Feb 2021 16:08:21 -0500
> > > +Subject: [PATCH] nscd: Fix double free in netgroupcache [BZ
> > > #27462]
> > > +
> > > +In commit 745664bd798ec8fd50438605948eea594179fba1 a use-after-
> > > free=20
> > > +was fixed, but this led to an occasional double-free.=A0 This patc=
h=20
> > > +tracks the "live" allocation better.
> > > +
> > > +Tested manually by a third party.
> > > +
> > > +Related: RHBZ 1927877
> > > +
> > > +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> > > +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> > > +
> > > +Upstream-Status: Backport
> > > +[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Ddca56588=
6b5e8bd79
> > > +66e15f0ca42ee5cff686673]
> > > +
> > > +CVE: CVE-2021-27645
> > > +
> > > +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> > > +Signed-off-by: Khairul Rohaizzat Jamaluddin=20
> > > +<khairul.rohaizzat.jamaluddin@intel.com>
> > > +---
> > > + nscd/netgroupcache.c | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/nscd/netgroupcache.c b/nscd/netgroupcache.c index=20
> > > +dba6ceec1b..ad2daddafd 100644
> > > +--- a/nscd/netgroupcache.c
> > > ++++ b/nscd/netgroupcache.c
> > > +@@ -248,7 +248,7 @@ addgetnetgrentX (struct database_dyn *db, int
> > > fd, request_header *req,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : NULL);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ndomain =3D (ndomain ? newbuf +
> > > ndomaindiff
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : N=
ULL);
> > > +-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 buffer =3D newbuf;
> > > ++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *tofreep =3D buffer =3D newbuf;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 nhost =3D memcpy (buffer + bufused,
> > > @@
> > > +-319,7 +319,7 @@ addgetnetgrentX (struct database_dyn *db, int fd,
> > > request_header *req,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (st=
atus =3D=3D NSS_STATUS_TRYAGAIN && e =3D=3D
> > > ERANGE)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 buflen *=3D 2;
> > > +-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b=
uffer =3D xrealloc (buffer, buflen);
> > > ++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *=
tofreep =3D buffer =3D xrealloc (buffer,
> > > buflen);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (st=
atus =3D=3D NSS_STATUS_RETURN
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 || status =3D=3D NSS_STATUS_NOTFOUND
> > > +--
> > > +2.27.0
> > > +
> > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb
> > > b/meta/recipes-core/glibc/glibc_2.33.bb
> > > index c47826a51e..d0a290822b 100644
> > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > > @@ -45,6 +45,7 @@ SRC_URI =3D=A0
> > > "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> > > file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch=A0\
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> > > file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.pa=
tch
> > > =A0
> > > \
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> > > file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch=A0\
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://CVE-2021-27645.patch=A0\
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> > > =A0S =3D "${WORKDIR}/git"
> > > =A0B =3D "${WORKDIR}/build-${TARGET_SYS}"
> > > --
> > > 2.29.0
> > >=20
> > >=20
> > >=20
> > >=20
> >=20
> >=20
> >=20

