Return-Path: <prvs=9974216f9=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 177207D967
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1554998097; x=1586534097;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=yTJj/BdeYg5wQqhoNefLI77nsDNI4+SXxQk6MtYW9SY=;
	b=I/yYnaN/6Itrc4NDhtUbrYp2VfVGUojVdLM+3vQGxzibkz8HZfEDzPpZ
	wAzN5ea3eohE8iZd5THUmdFEeFzu3vV/+XaDzQ4jnfntHNbIBU36wZxMu
	6xTIl/WL7vsgYXrc5TgdW8SsxX9vhCw3YDO3qcLB2EbtJ6sepqUm/NrWL Q=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 11 Apr 2019 17:54:55 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw3.muc with ESMTP/TLS;
	11 Apr 2019 17:54:54 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb3.muc with ESMTP/TLS; 11 Apr 2019 17:54:53 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 11 Apr 2019 17:54:54 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.003;
	Thu, 11 Apr 2019 17:54:54 +0200
From: <Mikko.Rapeli@bmw.de>
To: <mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH v3] elfutils: remove Elfutils-Exception and
	include GPLv2 for shared libraries
Thread-Index: AQHU8GxWY5+eD2aSD0OwhXow2++tb6Y2+MSAgAACqwA=
Date: Thu, 11 Apr 2019 15:54:54 +0000
Message-ID: <20190411155454.GK20077@hiutale>
References: <1554990109-13038-1-git-send-email-mikko.rapeli@bmw.de>
	<910c4894-d0d5-2994-c4f1-331556db9ed4@windriver.com>
In-Reply-To: <910c4894-d0d5-2994-c4f1-331556db9ed4@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.45]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] elfutils: remove Elfutils-Exception and include GPLv2 for shared libraries
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
X-List-Received-Date: Thu, 11 Apr 2019 15:54:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA11BA4FC2481E458AFAF5CF5FA55941@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:45:21AM -0500, Mark Hatle wrote:
> On 4/11/19 8:41 AM, Mikko Rapeli wrote:
> > Elfutils-Exception no longer exists after upstream release 0.154
> > and commit:
> >=20
> > commit de2ed97f33139af5c7a0811e4ec66fc896a13cf2
> > Author: Mark Wielaard <mjw@redhat.com>
> > Date:   Tue Jun 5 17:15:16 2012 +0200
> >=20
> > NEWS file in the sources says this about switch from GPLv2 to
> > GPLv3 license:
> >=20
> > https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob;f=3DNEWS;h=3D5a06=
047f255e3c9a63828953759fd18a4ba9a3f3;hb=3DHEAD#l362
> >=20
> >  362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for =
stand-alone
> >  363 programs. There is now also a formal CONTRIBUTING document describ=
ing how to
> >  364 submit patches.
> >=20
> > libasm, libdw and libelf are thus covered optionally by GPLv2 license.
> >=20
> > See also Debian copyright summary for elfutils:
> >=20
> > https://tracker.debian.org/media/packages/e/elfutils/copyright-0.175-1
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta/conf/licenses.conf                          |  2 +-
> >  meta/files/common-licenses/Elfutils-Exception    | 12 ------------
> >  meta/recipes-devtools/elfutils/elfutils_0.176.bb | 14 +++++++++++++-
> >  3 files changed, 14 insertions(+), 14 deletions(-)
> >  delete mode 100644 meta/files/common-licenses/Elfutils-Exception
> >=20
> > v1: http://lists.openembedded.org/pipermail/openembedded-core/2019-Apri=
l/281124.html
> >=20
> > v2: http://lists.openembedded.org/pipermail/openembedded-core/2019-Apri=
l/281127.html
> >  * removed Elfutils-Exception
> >=20
> > v3:
> >  * rebase to latest master branch with elfutils 0.176
> >=20
> > diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> > index 1058084..7b01c57 100644
> > --- a/meta/conf/licenses.conf
> > +++ b/meta/conf/licenses.conf
> > @@ -16,7 +16,7 @@ SRC_DISTRIBUTE_LICENSES +=3D "CC-BY-SA-1.0 CC-BY-SA-2=
.0 CC-BY-SA-2.5 CC-BY-SA-3.0
> >  SRC_DISTRIBUTE_LICENSES +=3D "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B =
CECILL-C"
> >  SRC_DISTRIBUTE_LICENSES +=3D "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 =
DSSSL"
> >  SRC_DISTRIBUTE_LICENSES +=3D "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0=
 EFL-2.0"
> > -SRC_DISTRIBUTE_LICENSES +=3D "Elfutils-Exception Entessa EPL-1.0 EPL-2=
.0 ErlPL-1.1"
> > +SRC_DISTRIBUTE_LICENSES +=3D "Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
> >  SRC_DISTRIBUTE_LICENSES +=3D "EUDatagrid EUPL-1.0 EUPL-1.1 Fair Framew=
orx-1.0"
> >  SRC_DISTRIBUTE_LICENSES +=3D "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-=
1.0"
> >  SRC_DISTRIBUTE_LICENSES +=3D "GPL-2.0 GPL-2.0-with-autoconf-exception"
> > diff --git a/meta/files/common-licenses/Elfutils-Exception b/meta/files=
/common-licenses/Elfutils-Exception
> > deleted file mode 100644
> > index 627d769..0000000
> > --- a/meta/files/common-licenses/Elfutils-Exception
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -   This file describes the limits of the Exception under which you are=
 allowed
> > -   to distribute Non-GPL Code in linked combination with Red Hat elfut=
ils.
> > -   For the full text of the license, please see one of the header file=
s
> > -   included with the source distribution or the file COPYING found in =
the
> > -   top level directory of the source.
> > -
> > -   The Approved Interfaces are the functions declared in the files:
> > -
> > -   libelf.h
> > -   libdw.h
> > -   libdwfl.h
> > -
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/re=
cipes-devtools/elfutils/elfutils_0.176.bb
> > index fd901c9..cd824e2 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY =3D "Utilities and libraries for handling compiled object file=
s"
> >  HOMEPAGE =3D "https://sourceware.org/elfutils"
> >  SECTION =3D "base"
> > -LICENSE =3D "(GPLv3 & Elfutils-Exception)"
> > +LICENSE =3D "GPLv2 & LGPLv3+ & GPLv3+"'
>=20
> I realize we don't have a choice but to conform to the licensing when we
> rebase... but has anyone looked at what links to elfutils to see if this =
could
> end up introducing any licensing issues?
>=20
> The previous exception specifically allowed Non-GPL code to use interface=
s, I'm
> not sure if there is actually any non-GPL code using these interfaces wit=
hout
> OE, but it may be worth a quick look.

At least poky and meta-openembedded users have GPLv2 licenses:

$ grep LICENSE $( egrep -l "DEPENDS.*elfutils" poky/meta* meta-openembedded=
 -rn )
poky/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:LICENSE =3D "GPLv=
2+"
poky/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb:LICENSE =3D "GPL-2.0"
poky/meta/recipes-devtools/prelink/prelink_git.bb:LICENSE =3D "GPLv2"
poky/meta/recipes-connectivity/iproute2/iproute2.inc:LICENSE =3D "GPLv2+"
poky/meta/recipes-kernel/perf/perf.bb:LICENSE =3D "GPLv2"
poky/meta/recipes-kernel/linux/kernel-devsrc.bb:LICENSE =3D "GPLv2"
meta-openembedded/meta-oe/recipes-devtools/ltrace/ltrace_git.bb:LICENSE =3D=
 "GPLv2"
meta-openembedded/meta-oe/recipes-devtools/uftrace/uftrace_0.9.2.bb:LICENSE=
 =3D "GPLv2"
meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.=
1.bb:LICENSE =3D " LGPLv2.1 & BSD-2-Clause"
meta-openembedded/meta-oe/recipes-kernel/kpatch/kpatch.inc:LICENSE =3D "GPL=
v2 & LGPLv2"
meta-openembedded/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.5.bb=
:LICENSE =3D "GPLv2.0"
meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:LICENSE =3D "GP=
Lv2"
meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:LIC_FILES_CHKSU=
M =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80980d171dd6425610833=
a22dbe6"

> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> >  DEPENDS =3D "libtool bzip2 zlib virtual/libintl"
> >  DEPENDS_append_libc-musl =3D " argp-standalone fts "
> > @@ -53,6 +53,18 @@ BBCLASSEXTEND =3D "native nativesdk"
> > =20
> >  # Package utilities separately
> >  PACKAGES =3D+ "${PN}-binutils libelf libasm libdw"
> > +
> > +# shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+
>=20
> Don't you mean LGPLv3+ above for the shared libraries?

Yes, will fix and send another version.

-Mikko=

