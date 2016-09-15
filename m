Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id E930C7318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 02:21:29 +0000 (UTC)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
	[76.250.84.236]) by mx.zohomail.com
	with SMTPS id 1473906086714566.9931583400294;
	Wed, 14 Sep 2016 19:21:26 -0700 (PDT)
Date: Wed, 14 Sep 2016 21:21:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160915022125.GB25351@heinlein.lan>
References: <20160914171252.17773-1-patrick@stwcx.xyz>
	<CAJTo0LbF7JoT-K3dg0U8=TZLkMM8bhSSqkBL0UtF7GGUqGxNdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbF7JoT-K3dg0U8=TZLkMM8bhSSqkBL0UtF7GGUqGxNdg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split {mkfs, fsck}.minix into packages
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
X-List-Received-Date: Thu, 15 Sep 2016 02:21:30 -0000
X-Groupsio-MsgNum: 87135
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline

--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2016 at 10:01:01PM +0100, Burton, Ross wrote:
> On 14 September 2016 at 18:12, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> > mkfs.minix and fsck.minix are likely rarely used, so split
> > them into their own packages to reduce the footprint of
> > util-linux.  This follows the pattern of cramfs support
> > within util-linux.
> >
>=20
> Minix is so unlikely to be used, why don't we just disable it entirely?
> (--disable-minix).
>=20
> Ross

Sure, prefer I submit that instead?

--=20
Patrick Williams

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX2gWlAAoJEKsDR8wtAMEZMDkQAIDmGw5I4vwHyyaVz3R0tND8
P+qGvD6Pdb8L5bdxuV79UyU5o8irYTsa0hr+JiiYl4CgdsF1TIAB96U5KGPAnIMp
VE04FgLRux3u0zng5rMtqGnOqpPysHNOpzdOH28BomLbBHgmYWbg6EgF3GvuwsiO
lRqVP5WUi38MBxFWt/s6Cv70NjKWky/algmsXdjH/SHbdixlX22yPHnHx69B+qrs
VD7orm/sKhQqYrB2wpK4dUq+T0kLFMD2hjb33Wp1Jdv6Fax+TKUTce/ri9DdWBvI
JXC37CqYVhSNoVEHbI8mo5UnbA4XeTBuOKfujD05ALcxrmdm7BMjDhBg2KSjj8eC
c60YT9K2HsZ2p1ValcU6ohq9E3hn5bw209iZzlHuD5ZX9OozJcbSnGyTKU0RuJgK
e9pVWXf3GRSw82SyMasKGM9huSNaV/VFBNF2VDaeLdohefafG8fAW3uJtheH+Ay6
AB3iR86rlm7acpiyoDpClVXYM9gQJxSs2hHrxHu+Lvpvgbbc5ULs9WKtXf4MDLwg
bFemux59BMscaH53XHnpfUiTrbVOtMiQqLvPkSJgwKM8OqVSHfHSgmMVOdQ8JN/1
Lp6ynJ3Y13c4e+0PcVmZ5bmIhQHMNMktZcEnq3Hgmp5Qmf/XUPXOuRPzZWaIzRJJ
FPpfQ5V+Kyh1qNSyhHg+
=ltuX
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
