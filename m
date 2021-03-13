Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.3.1615677605606146811
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 15:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=lvKkkLsw;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from fringe.fritz.box (unknown [83.135.212.121])
	by linux.microsoft.com (Postfix) with ESMTPSA id D993D209B6F1;
	Sat, 13 Mar 2021 15:20:03 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D993D209B6F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1615677604;
	bh=ketlKVWCcQ3VtxbPukjfqObA2vzZMnftpLqzJt4N+PI=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=lvKkkLsw5wLxVQla0DiwVLs+d/YqA9A8HroBi1ISfZN25hVhqEiUtrB17koa/sffR
	 wLyuKPcL16qELXPkNAOYA10iyqn0rGK5PdJZYGn9YpuE3KaOOl1AzIPj53FSHAFYul
	 BEpBllSmNdwZJQR17XpbdUYxu3ta0UfZYeXq+EP8=
Message-ID: <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Reply-To: anbelski@linux.microsoft.com
To: "Jamaluddin, Khairul Rohaizzat"
 <khairul.rohaizzat.jamaluddin@intel.com>,  Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Mar 2021 00:20:00 +0100
In-Reply-To: <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
	 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
	 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
	 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

looking at the state of the upstream glibc 2.31, pulling the latest
upstream might be more suitable than cherry-picking patches. Depending
on the recipe maintainers opinion, it might be a good time time to do
so as some other CVE issues are fixed there, too.

Thanks

Anatol

On Fri, 2021-03-12 at 23:15 +0000, Jamaluddin, Khairul Rohaizzat wrote:
> Just did some checking for versions glibc-2.31 and glibc-2.32 (used
> in dunfell and gatesgarth respectively), both of these versions
> cannot use this patch as these versions doesn't have the file
> involved, netgroupcache.c
>=20
>=20
> Thank you & Kind regards,
> Khairul
>=20
> -----Original Message-----
> From: Jamaluddin, Khairul Rohaizzat=20
> Sent: Saturday, March 13, 2021 3:34 AM
> To: Khem Raj <raj.khem@gmail.com>
> Cc: Patches and discussions about the oe-core layer
> <openembedded-core@lists.openembedded.org>
> Subject: RE: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
>=20
> Yes, seems to be in the list as well..
> The version for both branch is within the versions mentioned in the
> CVE too.
>=20
>=20
> Thank you & Kind regards,
> Khairul
>=20
> -----Original Message-----
> From:
> openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@lists.o=
penembedded.org
> > On Behalf Of Khem Raj
> Sent: Friday, March 12, 2021 7:56 AM
> To: Jamaluddin, Khairul Rohaizzat
> <khairul.rohaizzat.jamaluddin@intel.com>
> Cc: Patches and discussions about the oe-core layer
> <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
>=20
> On Thu, Mar 11, 2021 at 7:21 AM Jamaluddin, Khairul Rohaizzat
> <khairul.rohaizzat.jamaluddin@intel.com> wrote:
> >=20
> > From: Khairul Rohaizzat Jamaluddin
> > <khairul.rohaizzat.jamaluddin@intel.com>
> >=20
> > CVE:
> > CVE-2021-27645
> >=20
>=20
> lgtm. Do we need it for dunfell and gatesgarth as well ?
>=20
> > Signed-off-by: Khairul Rohaizzat Jamaluddin=20
> > <khairul.rohaizzat.jamaluddin@intel.com>
> > ---
> > =C2=A0.../glibc/glibc/CVE-2021-27645.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 51
> > +++++++++++++++++++
> > =C2=A0meta/recipes-core/glibc/glibc_2.33.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 52 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-
> > 27645.patch
> >=20
> > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> > b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> > new file mode 100644
> > index 0000000000..26c5c0d2a9
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
> > @@ -0,0 +1,51 @@
> > +From dca565886b5e8bd7966e15f0ca42ee5cff686673 Mon Sep 17 00:00:00
> > +2001
> > +From: DJ Delorie <dj@redhat.com>
> > +Date: Thu, 25 Feb 2021 16:08:21 -0500
> > +Subject: [PATCH] nscd: Fix double free in netgroupcache [BZ
> > #27462]
> > +
> > +In commit 745664bd798ec8fd50438605948eea594179fba1 a use-after-
> > free=20
> > +was fixed, but this led to an occasional double-free.=C2=A0 This patc=
h=20
> > +tracks the "live" allocation better.
> > +
> > +Tested manually by a third party.
> > +
> > +Related: RHBZ 1927877
> > +
> > +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> > +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> > +
> > +Upstream-Status: Backport
> > +[https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Ddca565886b5=
e8bd79
> > +66e15f0ca42ee5cff686673]
> > +
> > +CVE: CVE-2021-27645
> > +
> > +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> > +Signed-off-by: Khairul Rohaizzat Jamaluddin=20
> > +<khairul.rohaizzat.jamaluddin@intel.com>
> > +---
> > + nscd/netgroupcache.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/nscd/netgroupcache.c b/nscd/netgroupcache.c index=20
> > +dba6ceec1b..ad2daddafd 100644
> > +--- a/nscd/netgroupcache.c
> > ++++ b/nscd/netgroupcache.c
> > +@@ -248,7 +248,7 @@ addgetnetgrentX (struct database_dyn *db, int
> > fd, request_header *req,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : NULL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ndomain =
=3D (ndomain ? newbuf +
> > ndomaindiff
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : NULL);
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buffer =3D ne=
wbuf;
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *tofreep =3D =
buffer =3D newbuf;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nhost =3D memcpy (buffer + bufused=
,
> > @@
> > +-319,7 +319,7 @@ addgetnetgrentX (struct database_dyn *db, int fd,
> > request_header *req,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (status =3D=3D NSS_STATUS_=
TRYAGAIN && e =3D=3D
> > ERANGE)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buflen *=
=3D 2;
> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buffer =3D xr=
ealloc (buffer, buflen);
> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *tofreep =3D =
buffer =3D xrealloc (buffer,
> > buflen);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (status =3D=3D NSS_STATUS_=
RETURN
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 || status =3D=3D NSS_STATUS_NOTFOUND
> > +--
> > +2.27.0
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb
> > b/meta/recipes-core/glibc/glibc_2.33.bb
> > index c47826a51e..d0a290822b 100644
> > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > @@ -45,6 +45,7 @@ SRC_URI =3D=C2=A0
> > "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
> > =C2=A0
> > \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://C=
VE-2021-27645.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > =C2=A0S =3D "${WORKDIR}/git"
> > =C2=A0B =3D "${WORKDIR}/build-${TARGET_SYS}"
> > --
> > 2.29.0
> >=20
> >=20
> >=20
> >=20
>=20
>=20
>=20


