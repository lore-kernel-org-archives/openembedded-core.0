Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 350BA71A32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 12:33:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u138so2719594wmu.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LC8tfu4R+GMWd1McGunTCCREVkKkLulMKm857meXhpo=;
	b=E9xMUAPHbJ4lVNKztrQ2IZtf+7cFsKfzA/96+ZewfW7wfpfuOcs/cjn964DOAQ/vUr
	PSSUc3Q48C3FDGuzQHgNappP30NYCbdGykmLSwRqufI/zOoF55ZxygSCjGwPfunYz7Oc
	bcpcAVtVO4X44bQIrnuISSglzeOAXT87PS0aZ8yOXX9Orn10OZhrswm56AXTLU597wrf
	uiLWJ1GDOea1hoS5kGy4bIe33DNp9ZjfRje4zQFHsz34+ghMzUoGDozyaPI729ZkNaJw
	xhlZIC+d9/4G6PCVgWgIDk42S7eHQ+JHK63WiGTH6DD287OkSlkefCkthAo8aBmwsh8V
	g37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LC8tfu4R+GMWd1McGunTCCREVkKkLulMKm857meXhpo=;
	b=XFa3OwKrmRVXAt5168+cVeotgmaRPdZYLK3iUSVX3wj74PdT2dUnXshHFY7vo1/2fU
	TDUw9JkJlPyPhCoV16mw0rVhL3mDk/bS0P5IoRoT5Qcc9vLiQ7rRmYRG3gYFkoZs6VsF
	FOHaXXhNHUTqDCba1zjlhpbt6cu08iJiaoawkoRLAnG5lsvevu1xBa9baQUfgj0NRUPj
	tdZ9Fugk2/+Pi20xmCJbXSA/X5fb9v3ebZzgAh2wiy29pqvDte9JbKTPnMWztg8IIIBK
	fHO76eplZ27LIDH3g8QFW51iY0YFmjwiOqB6wyiM9LQawauq3GPe64K0Uw81762IFbNB
	kPUA==
X-Gm-Message-State: AMCzsaU9bOKmvV3AzwCA9/X4FKv2tNl9s4mxhL8harKMy6gaNqsncHwL
	OaKbjUQeL+/QpZiS8i/rPiCuIg==
X-Google-Smtp-Source: ABhQp+Syf3R6U5zOuBZ2XWzaduihv4yTKA6p6FmdFqy9FezMwsfF6E4QQWc/tLTjfMfmphnMYT9nJw==
X-Received: by 10.223.132.6 with SMTP id 6mr429489wrf.93.1508157225039;
	Mon, 16 Oct 2017 05:33:45 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q3sm5530358wrd.78.2017.10.16.05.33.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 16 Oct 2017 05:33:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Oct 2017 14:36:51 +0200
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20171016123651.GA4041@jama>
References: <cover.1508120203.git.Qi.Chen@windriver.com>
	<0f59f8954cb7e5f1a6709e236249ba60df80aa1d.1508120203.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0f59f8954cb7e5f1a6709e236249ba60df80aa1d.1508120203.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bitbake.conf: add ssh to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Mon, 16 Oct 2017 12:33:44 -0000
X-Groupsio-MsgNum: 103978
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 10:20:41AM +0800, Chen Qi wrote:
> We changed to make tools required by testimage to be included conditional=
ly.
> This resulted in users who use ssh for git fetching having failures.
>=20
> Add ssh to HOSTTOOLS_NONFATAL to make things work for the above situation.
>=20
> [YOCTO #12227]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0eefb86..2351c66 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -487,7 +487,7 @@ HOSTTOOLS +=3D " \
>  HOSTTOOLS +=3D "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_clas=
s('testimage', d)]}"
> =20
>  # Link to these if present
> -HOSTTOOLS_NONFATAL +=3D "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp so=
cat sudo"
> +HOSTTOOLS_NONFATAL +=3D "ssh aws ccache gcc-ar gpg ld.bfd ld.gold nc sft=
p socat sudo"

Maybe keep the alphabetical order as it was intentionally sorted in:

commit 23dd96a3a175cecde258dc6d8263fbe7b308b58e
Author: Andre McCurdy <armccurdy@gmail.com>
Date:   Mon Mar 27 20:51:23 2017 -0700

    bitbake.conf: sort HOSTTOOLS and remove duplicates

other than that I'm fine with this.

> =20
>  # Temporary add few more detected in bitbake world
>  HOSTTOOLS_NONFATAL +=3D "join nl size yes zcat"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWeSn4wAKCRA3VSO3ZXaA
HLUgAKCT/LhFzLeZSEFeeQjSnqm2nF8WeACgsN59DRMiN/G+M8juS339Q5WCBlQ=
=bqsY
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
