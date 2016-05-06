Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E1A81612E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:39:01 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id e201so54305621wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 04:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TCCv/D1mDw46d4Sa0VAshqggQ9P7Jgc930XQEl+SHho=;
	b=yvGkKplY51IOHsA6Ml4pe+ml7sgixJGwnVI7Z/70MktI5X2E8saS/st+kwu2zqmbQk
	xS7V8YlPiUOq0cdjrCKhonPYlq0e8Lri5ANAWFhkXDUVJJXxr9apAJwH8nAnKskYJb2L
	EyhrDo+tfinrqSKtktBC88qGZX9fKNIuHbacsHn508kjXPn+pABr3Aqh14Bbqx0BrDoC
	GNYvBp3elHzSmv00W2inyeZm5eb10yQw1Jn5VHFfLgo0lVQulHOZKolq3dTdUkFGGjV0
	UXR1ZKFE3P/pSCJa2hJkcHq848mZjZL4DBgJ5mfIEgcrIK5OEEivfZoPQvGeOcsZUZi3
	OLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TCCv/D1mDw46d4Sa0VAshqggQ9P7Jgc930XQEl+SHho=;
	b=EpswTvs3TQsZ7n13WqolTDkMngc645ZVAvminRNHr97HbwhDocM33BP124yL8aFJNu
	xZR857OSJj7aUn4iV8YwyX6zu2Lp42jEsZzdep9tNHKl+C7k/39hVSyspfhZPRWi5Exd
	uBhZIa+0FvS+ogcOHIL3y1nEnexcrU/s7wOvX+uSm4tZ/W6ZCC54YgdXxiN6OX6s2SMd
	h/0hU1KllOxNnUD/lu75LOD7j83QzBsTOiYErKCFYUZ+o72ew8XMos5dw6BrA+ibTSDJ
	ragC/ou9iprwRZgGFUI58QqdKG9RWa/7AEpwC1t0pRsw3SPtwtw4Yf7Zzd6XSvhR7niG
	/j8Q==
X-Gm-Message-State: AOPr4FXOOTV7rzA9vs01JYhLA78SiwRcHb4PD5FuJQRILNSfKeStrE9JR8fyKjEWx50jYQ==
X-Received: by 10.28.140.12 with SMTP id o12mr8840710wmd.19.1462534742316;
	Fri, 06 May 2016 04:39:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m140sm7974378wma.24.2016.05.06.04.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 04:39:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 May 2016 13:40:32 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20160506114032.GC2544@jama>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 06 May 2016 11:39:04 -0000
X-Groupsio-MsgNum: 81667
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline

--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2016 at 12:26:40PM +0100, Ross Burton wrote:
> If debug filesystem generation is enabled but this isn't assigned then the
> generation code throws exceptions.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1c4175f..8e02e91 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -713,6 +713,7 @@ require conf/sanity.conf
>  DL_DIR ?=3D "${TOPDIR}/downloads"
>  SSTATE_DIR ?=3D "${TOPDIR}/sstate-cache"
>  IMAGE_FSTYPES ?=3D "tar.gz"
> +IMAGE_FSTYPES_DEBUGFS ?=3D "${IMAGE_FSTYPES}"
> =20
>  INITRAMFS_FSTYPES ?=3D "cpio.gz"
>  # The maximum size in Kbytes for the generated initramfs image size.
> --=20
> 2.8.0.rc3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcsgq8ACgkQN1Ujt2V2gBxwHgCgl0MxvNXj6hVVQ1YZ7dADW746
oV8An3+xIjbXUZ7lAL1OTptbrMWJLY0p
=9Acf
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
