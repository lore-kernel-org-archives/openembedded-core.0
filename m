Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id A16A971633;
	Fri, 28 Aug 2015 18:22:32 +0000 (UTC)
Received: by wibcx1 with SMTP id cx1so3963462wib.1;
	Fri, 28 Aug 2015 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CVbnvmmeGHfz5kCr/2U+nPSBCyczyF+KMdecBQ5aSGE=;
	b=ws9hvGuCqapxEkKUbInYomrdIa3WxaJyQQQP2TiNOdPTZEAaqk8ScUHj7s2r+kAB9P
	XA8TkFsu10zhJf09JfwdPQYEL/ZRODFYw5w45K7jN4ebFgw2mNxkJfnu7fjkefv4UUU9
	r3qsSwLcX7F4s6Rfl2Xs5ZLr5OOvtMdegk++m1Wft/J5kLg0lDUz2KwUkpUYQAaMLF8S
	AZMoreMuavyqFoxbbCc2vfsqBro43w4zqJ+crFL/eDl0101T9F0cNGN2lCCg9N9/cJuk
	/iS4BYSG/DpUu2Q7zEPCFiWEIpwADpCDa5/Soor+vgBHYOKkN3d3LQivMsfGs7VYW05e
	XhVw==
X-Received: by 10.194.171.200 with SMTP id aw8mr12454426wjc.62.1440786151936; 
	Fri, 28 Aug 2015 11:22:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lk16sm4914063wic.6.2015.08.28.11.22.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 11:22:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 28 Aug 2015 20:22:56 +0200
To: openembedded-core@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Message-ID: <20150828182256.GA2488@jama>
References: <20150814073122.1BDDE5042E@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150814073122.1BDDE5042E@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Armin Kuster : tzdata: update to 2015f
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
X-List-Received-Date: Fri, 28 Aug 2015 18:22:35 -0000
X-Groupsio-MsgNum: 70257
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2015 at 07:31:22AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 4e0fb630d3bb0250ece6e2071ae49b2601ae3e57
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D4e0fb630d3bb0250ece6e2071ae49b2601ae3e57
>=20
> Author: Armin Kuster <akuster808@gmail.com>
> Date:   Tue Aug 11 11:29:04 2015 +0530
>=20
> tzdata: update to 2015f
>=20
> Changes affecting future time stamps
>=20
> North Korea switches to +0830 on 2015-08-15.  (Thanks to Steffen Thorsen.)
> The abbreviation remains "KST".  (Thanks to Robert Elz.)
>=20
> Uruguay no longer observes DST.  (Thanks to Steffen Thorsen
> and Pablo Camargo.)
>=20
> Changes affecting past and future time stamps
>=20
> Moldova starts and ends DST at 00:00 UTC, not at 01:00 UTC.
> (Thanks to Roman Tudos.)
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-extended/tzdata/{tzdata_2015e.bb =3D> tzdata_2015f.bb} | 4 =
++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Hi Armin,

Is it intentional that upgrades like this usually remove old version,
e.g. 2015d upgrade in master:
http://git.openembedded.org/openembedded-core/commit/?id=3Db9f366ab4e0a9cad=
69b631f402b9afa02d40f667

but the same upgrade in dizzy:
http://git.openembedded.org/openembedded-core/commit/?h=3Ddizzy&id=3Dff1547=
cccd840068500193d4aec772988a1f2023
kept older 2015b version, which cause me issues, because we had
2015b.bbappend I've forgot to rename to 2015d.bbappend and bitbake
didn't complain, because 2015b was still there.

What's even worse, this upgrade to 2015d is still missing in fido
branch:
http://git.openembedded.org/openembedded-core/log/?h=3Dfido&qt=3Dgrep&q=3Dt=
zdata

http://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/tz=
data/?h=3Dmaster
tzdata_2015f.bb

http://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/tz=
data/?h=3Dfido
tzdata_2015b.bb

http://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/tz=
data/?h=3Ddizzy
tzdata_2014h.bb
tzdata_2015b.bb
tzdata_2015d.bb

>=20
> diff --git a/meta/recipes-extended/tzdata/tzdata_2015e.bb b/meta/recipes-=
extended/tzdata/tzdata_2015f.bb
> similarity index 98%
> rename from meta/recipes-extended/tzdata/tzdata_2015e.bb
> rename to meta/recipes-extended/tzdata/tzdata_2015f.bb
> index 92389a9..7cda40d 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2015e.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2015f.bb
> @@ -7,8 +7,8 @@ DEPENDS =3D "tzcode-native"
> =20
>  SRC_URI =3D "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=3Dtz=
data"
> =20
> -SRC_URI[tzdata.md5sum] =3D "36f9056efb432ca945c73397acfce0d4"
> -SRC_URI[tzdata.sha256sum] =3D "ffc9b5d38abda8277aa479e3f75aa7668819d0977=
cd1a0c8ef3b09128334ba6f"
> +SRC_URI[tzdata.md5sum] =3D "e3b82732d20e973e48af1c6f13df9a1d"
> +SRC_URI[tzdata.sha256sum] =3D "959f81b541e042ecb13c50097d264ae92ff03a579=
79c478dbcf24d5da242531d"
> =20
>  inherit allarch
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXgpvsACgkQN1Ujt2V2gByYCgCePr3UcghRGXtWp+qFtU82bYHB
rvQAn0v/vHw+HuoCJLh4nJZrjXD0jTUf
=10Hg
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
