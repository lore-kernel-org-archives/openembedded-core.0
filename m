Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 41E0C77F58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 19:17:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2017 12:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,365,1491289200"; 
	d="asc'?scan'208";a="1132652534"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.138])
	([10.219.128.138])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2017 12:17:47 -0700
To: OE-core <openembedded-core@lists.openembedded.org>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-3-git-send-email-jose.a.lamego@linux.intel.com>
	<CAJTo0LZEF_O3Evumo1+YQ8kpjt=FpTqszfg0704B45GXFHNYVA@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <a2fd37e9-cc6d-b323-09d4-267dbdd0e5f5@linux.intel.com>
Date: Fri, 19 May 2017 14:17:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZEF_O3Evumo1+YQ8kpjt=FpTqszfg0704B45GXFHNYVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] bc: upgrade 1.06 to 1.07.1
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
X-List-Received-Date: Fri, 19 May 2017 19:17:48 -0000
X-Groupsio-MsgNum: 97536
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ttHpL0E7DHc79lcxbQMw7XOpWQ4DACvEW"

--ttHpL0E7DHc79lcxbQMw7XOpWQ4DACvEW
Content-Type: multipart/mixed; boundary="eQpU9NQODM4CR8l1dK3ehhespRX59fcUk";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <a2fd37e9-cc6d-b323-09d4-267dbdd0e5f5@linux.intel.com>
Subject: Re: [OE-core] [PATCH 2/2] bc: upgrade 1.06 to 1.07.1
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1495146527-32073-3-git-send-email-jose.a.lamego@linux.intel.com>
 <CAJTo0LZEF_O3Evumo1+YQ8kpjt=FpTqszfg0704B45GXFHNYVA@mail.gmail.com>
In-Reply-To: <CAJTo0LZEF_O3Evumo1+YQ8kpjt=FpTqszfg0704B45GXFHNYVA@mail.gmail.com>

--eQpU9NQODM4CR8l1dK3ehhespRX59fcUk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 05/19/2017 10:25 AM, Burton, Ross wrote:
>=20
> On 18 May 2017 at 23:28, Jose Lamego <jose.a.lamego@linux.intel.com
> <mailto:jose.a.lamego@linux.intel.com>> wrote:
>=20
>     bc recipe must be upgraded to latest version in upstream.
>=20
>     bc license changed from "GPLv2+ & LGPLv2.1" to "GPLv3+ & LGPLv3"
>     The new version exhibits a Parallel Make Race that required
>     unsetting PARALLEL_MAKE variable.
>     This change was tested with core-image-minimal in qemux86.
>=20
>=20
> It would be appreciated if you could spend a few minutes looking at wha=
t
> the build race is and pushing a fix upstream.  Or at least include a
> comment showing the failure.
>=20
> I chased the sed thing as previous releases didn't need it: my build
> machine doesn't even have ed installed so HOSTTOOLS won't help.  This
> appears to be a regression as 1.06 shipped the file that needs ed to
> build.  The makefile now always builds a binary to generate a file that=

> it then runs through ed, and it doesn't build this tool correctly in a
> cross environment either:
>=20
> | /bin/bash: ./fbc: cannot execute binary file: Exec format error
>=20
> (it's trying to run an arm binary on x86)
>=20
> I'd suggest that we approach the upstream maintainer and discuss:
> 1) should the tarballs ship libmath.h instead of requiring it to be
> generated
> 2) using CC_FOR_BUILD etc from autoconf-archive to build fbc with the
> host compiler in cross-compile environments
> 3) can sed be used instead of ed to reduce the host requirements
>=20
> Ross

Agree. I will contact the bc maintainer and work on the build race. I'll
get back to you with the findings. Thanks for the suggestions!

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--eQpU9NQODM4CR8l1dK3ehhespRX59fcUk--

--ttHpL0E7DHc79lcxbQMw7XOpWQ4DACvEW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZH0ThAAoJEFJAtowlSEbnYGQH/2MHEAf5+x+AMieSXjQZ0b/Y
6gO6Vdt1qG6ibj3gF3mMRxMoZp3/96FtxaEsO4w3LI+Q6P6QyU30ghLRj0Npox3B
nTU4nPZmcHCeCG/JNV/bTDaqcPlbeiSnGlq312BTc+O18i35aWCJWozFwpPGFkbd
fkqRk9/zrxKH9IwcSSS5Rmulp0e3wHF/wmUwjAScKZfgYCN3azpr/J6DtJ77NbCw
3YuekgkZ5cqHe7S1JUuJ7bjion43e/BScDCM1ChlQ4Rif+2F3SM3Xhdg6b+UrJFU
DzFIyGbp/9TluhNjaC171Nl1qSsQ8doI9zQxdM8+1tggffkg/7L9LsftmvxeAro=
=fBpX
-----END PGP SIGNATURE-----

--ttHpL0E7DHc79lcxbQMw7XOpWQ4DACvEW--
