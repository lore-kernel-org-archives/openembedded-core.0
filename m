Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8255F731D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 13:40:48 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f206so23491399wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 05:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m7Zb3jRhdOAJ06Lv6alq8vWEeNtXkHYEwJQlWegupQk=;
	b=LCwYHgAqlK81CZWpejeS/DsevVwTN0V9t9i2v5aAT6R9eR1gdImMieCBeNbSF54jsS
	1tdTC8xvCEuJv3vZGBMhLmya/iKb7kDKtVMYXpC9BpKDv6VwqMFuLTSg5c3bEucMCTGm
	4ORNu/7pMG53zm7D/IPh5nxb9YIQ0IcTsELKNLg0wnYCfPoWxrKkZG9Gk6iD3UNZBRoU
	3o3OyS7fQRvowIhi8KEqyp8OVsGzuEtIpG3YQ4GBopf4Hw5A8QJwP1eKBqyk2k2NdmrN
	ztndgfFMvHt8ALKw5OOx+AeY2kSnz/PTKAvhpxAg8MkG8XTBW0HVfB9OMxGa1xtHSU4D
	kcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=m7Zb3jRhdOAJ06Lv6alq8vWEeNtXkHYEwJQlWegupQk=;
	b=Zuz2BEBmd1HnRTDQpWUxQVpuzWvrBTfpJ9hrpGr8zMx6lz8fhNSPQ1JXd7+N//w1s/
	76MjtqYrlb01uGCPQdMSq0wA5tvBZ9j3kn8I1Y1/KSJb4ya0iL0Tb6jZ9rZEnKPjNax1
	Mozd3C9uK3K0m8rAlHbHzfHp7blbGqdw/JCaET9o/oll7wPQNoZHTbZhwWzheiaxX3mg
	+dFqCdSGQaCZUbC9eJKOPLHwTMm59ktPN+XQG7kI9WP2fYMVzjyJ86g70WZto52ZifJp
	hKsktpJ8u9NirfLzY1EyGMV1filg+8IlD0cSL1hLmS3unZiZaMA/L/vE/sjiLTy84n8+
	SiVw==
X-Gm-Message-State: ALoCoQlr+jMyVgRfx2siaQAiuDMOQ+0OcOf3OeoIXD1ZOSw7JOsONeGKZF0xiSKQYEP+46acKhb/wfGhgKnNvri0vEbW4eIJ9w==
X-Received: by 10.194.206.41 with SMTP id ll9mr11469424wjc.10.1452865248747;
	Fri, 15 Jan 2016 05:40:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e9sm10651069wja.25.2016.01.15.05.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jan 2016 05:40:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Jan 2016 14:41:44 +0100
To: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Message-ID: <20160115134144.GD2607@jama>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
	<7e6b70331d609496c4e21884682c2e93af0347a7.1449754339.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7e6b70331d609496c4e21884682c2e93af0347a7.1449754339.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][fido][RESEND 4/5] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Fri, 15 Jan 2016 13:40:51 -0000
X-Groupsio-MsgNum: 76153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline

--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 02:48:20PM +0100, Martin Jansa wrote:
> * we don't want the do_package signature depending on INHERIT variable
> * e.g. just adding the own-mirrors causes texinfo to rebuild:
>   # bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_package.sig*
>   basehash changed from 015df2fd8e396cc1e15622dbac843301 to 9f1d06c4f238c=
70a99ccb6d8da348b6a
>   Variable INHERIT value changed from
>   ' rm_work blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CL=
ASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
>   to
>   ' rm_work own-mirrors blacklist blacklist report-error ${PACKAGE_CLASSE=
S} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'

Joshua,

why this one didn't make it to your fido update?

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/texinfo/texinfo_5.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-=
extended/texinfo/texinfo_5.2.bb
> index 8dbcaa1..c9ac182 100644
> --- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504"
>  PROVIDES_append_class-native =3D " texinfo-replacement-native"
> =20
>  def compress_pkg(d):
> -    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
> +    if bb.data.inherits_class('compress_doc', d):
>           compress =3D d.getVar("DOC_COMPRESS", True)
>           if compress =3D=3D "gz":
>               return "gzip"
> --=20
> 2.6.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaY9xYACgkQN1Ujt2V2gBxtOACgi51vdvTRQNuwiJGRTduV4Kqo
ZeEAn1/7yZRvz1yWuXloE7PHSE0hLXyx
=ltTi
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
