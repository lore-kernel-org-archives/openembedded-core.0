Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E10B977EA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 12:54:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2017 05:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,364,1491289200"; 
	d="asc'?scan'208";a="1132547348"
Received: from unknown (HELO [10.219.128.138]) ([10.219.128.138])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2017 05:54:10 -0700
To: openembedded-core@lists.openembedded.org
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
	<1495149157.27342.142.camel@linuxfoundation.org>
	<CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
	<20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <f327a215-04da-26fa-37b7-3081121385cc@linux.intel.com>
Date: Fri, 19 May 2017 07:54:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
Subject: Re: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Fri, 19 May 2017 12:54:10 -0000
X-Groupsio-MsgNum: 97512
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="rEh9gbUx2dsu1W1BAN8HHEOquhQaExDFF"

--rEh9gbUx2dsu1W1BAN8HHEOquhQaExDFF
Content-Type: multipart/mixed; boundary="ba0hwnhPr7QHOHBWWa7XRcesRvnCdpOcH";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <f327a215-04da-26fa-37b7-3081121385cc@linux.intel.com>
Subject: Re: [OE-core] [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
 <1495149157.27342.142.camel@linuxfoundation.org>
 <CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
 <20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
In-Reply-To: <20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>

--ba0hwnhPr7QHOHBWWa7XRcesRvnCdpOcH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 05/19/2017 04:02 AM, Anders Darander wrote:
> * Khem Raj <raj.khem@gmail.com> [170519 01:17]:
>=20
>> On Thu, May 18, 2017 at 4:12 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Thu, 2017-05-18 at 17:28 -0500, Jose Lamego wrote:
>>>> Some recipes build fail due to missing ed command.
>=20
>>>> This change includes ed to the hosttools required to
>>>> run builds with oe-core.
>=20
>>>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>>>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.i=
n
>>>> tel.com>
>=20
>>> We really don't want to add ed here. Which recipes are failing and wh=
y
>>> do we need ed to build them?

This patch is a requisite for the bc recipe update from 1.06 to 1.07.1,
which fails due to ed command not found during building.

>=20
>> we also need whoami which kernel uses to identify the build user id
>=20
>=20
> No, we don't want to add whoami...
>=20
> As fas as I can (in a recent kernel), whoami is only used in
> scripts/mkcompile_h. And there, it's only used if $KBUILD_BUILD_USER is=

> empty. I'd rather see that we set $KBUILD_BUILD_USER to something
> deterministic in our kernel.bbclass.
>=20
> Cheers,
> Anders
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--ba0hwnhPr7QHOHBWWa7XRcesRvnCdpOcH--

--rEh9gbUx2dsu1W1BAN8HHEOquhQaExDFF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZHur3AAoJEFJAtowlSEbnRYAH+gNuPGUV5IijBBkyrkrHsCVH
fkjv3Ar9dwmSwiFj8ym7c2EKDUBMWbnl7DEGJBYwCDd3rDHQLElmn7wBY9n2H4wW
eUlRhA4fUEPYC+kNgJfdZrIx+ueRkK3j8ByI39Q/Hawa9NxDFeWNZbq7dCUj0tvo
4Tgg0l3Jl6lPtSSi3lrKeSGntGwVmT4KH7PWXI4E0vVh46igmAfiWoS4cbuWAKRO
R/1AnhIxFI8jULxPTGZKMZCSn/BhWF/gVgnfAIVgENLyomF+EEdFZzuzWecSV6Z4
KuVPnjQ9d6KVUW7r901uZTsIGi+EZzYKbnMLKJJLfxcehz8icXdyQlGEzWq427w=
=vh4S
-----END PGP SIGNATURE-----

--rEh9gbUx2dsu1W1BAN8HHEOquhQaExDFF--
