Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E9EBC77201
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 17:15:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z194so2235000wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qiy8Jl0nDGw+BMVI4CC2/thquerDU3JS2hy2wanrC3M=;
	b=eJxQVukspFBpWkoHqGo8gWDhyq9lqXTEyXrDcbKxnsn+1aKOZK0FydEGd7zC9Xj3E+
	nuom7JC0DImJAvz7Kc2rvv3nvs+W5fWtChWwhL9nqYjvzlLA6cfiO6gZduA3601qfQHr
	nlCU0OLpN5Ju8TK1SsDdbsml+5JzR90CE4KiwKqXcTAyRnLwajJKj2BP3i4aUfJg+4Q3
	TLMeiHShN34cWBxvWwSZ/njjbOpk3PWoZzOggcLiGu0WaY3i5uoRpDZeDFRB1EtGYk2B
	87LLif2DcSJ+RqBf20N2edVxep6fR487rhWQx53V+RKjv1WrWDBZPgg/lfcMdnJfT6NU
	e52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qiy8Jl0nDGw+BMVI4CC2/thquerDU3JS2hy2wanrC3M=;
	b=Qle0vT6KTHKKTbJvbDHL/j2azxGTpuB3OXnRLPVp4IFik38gSycNG8Iak3/cA7+WcW
	eJwBmeiOczTuIe/7sZ5VIOOHf8HRAgYlFj4c88WuR+ZuX+g/7g2cdV8fEwlHE8TVIiHQ
	6sMvZjasJ9nmrBp38pBD84eFUfaioSsPPDBOphisj2gUmaJbwt3UkT+3X9fEZgTH+pQY
	ih6PkJyq47D1/qYfGIx0oCkjEbvuPZOrJbokBFZp8N2EkqIMMjUxGxC83tibGumMmjjr
	LG7vlFJ/h7+YtQ0IqFcSsqVLScBN4i8Lq4ObSFLJUlnL8lCZ+7wMP8ktVxj0US9XpJhG
	r2nw==
X-Gm-Message-State: AE9vXwOVVO5OdvAM6t9ZQ8dZt3grAN7Yvo3akgRh81z+07Dv9yEAcmgtbxZpMCZSJgjczQ==
X-Received: by 10.194.140.201 with SMTP id ri9mr15286986wjb.195.1473700551148; 
	Mon, 12 Sep 2016 10:15:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	s6sm18773004wjm.25.2016.09.12.10.15.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Sep 2016 10:15:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Sep 2016 19:15:52 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20160912171552.GB2653@jama>
References: <20160912170546.14212-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160912170546.14212-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: Martin Jansa <martin.jansa@lge.com>
Subject: Re: [meta-oe][meta-networking][PATCH] cmake-native: add dependency on openssl-native libidn-native
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
X-List-Received-Date: Mon, 12 Sep 2016 17:15:52 -0000
X-Groupsio-MsgNum: 87031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2016 at 07:05:46PM +0200, Martin Jansa wrote:
> From: Martin Jansa <martin.jansa@lge.com>

Sent by accident (as subject tags suggests), but fixes
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9639
as well.

>=20
> Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/rec=
ipes-devtools/cmake/cmake-native_3.6.1.bb
> index 33930fb..c4d22d8 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
> @@ -2,7 +2,7 @@ require cmake.inc
>  inherit native
> =20
>  # Using cmake's internal libarchive, so some dependencies are needed
> -DEPENDS +=3D "bzip2-native zlib-native"
> +DEPENDS +=3D "bzip2-native zlib-native openssl-native libidn-native"
> =20
>  SRC_URI +=3D "\
>      file://cmlibarchive-disable-ext2fs.patch \
> --=20
> 2.10.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfW4sgACgkQN1Ujt2V2gBw96QCbB3T9SE/fug0MhOW5Lnd8odLB
vYoAn2bSKiBNCTxetvKqAeIItQfIFx0I
=zGKo
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
