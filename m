Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAFB73D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 18:15:09 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so127104069wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lazG9dLRT59KWec9WSibBa9qxv7XzbkoBQ+Am/07Bos=;
	b=vmpR2Akk3Rwy6EtllzQ6eXeNMJrJmsw+s/oElpSRLE5DPMeFZEkETxN3nzpMbZKJsT
	5Va4Bq2B4NOocVxUdSrGyWQEhNern55ZyA7NgPrwfZe8G8NGQcUz1DYPRweY+iNVomWs
	LZ0Xf6AbBZAdXTvZ+gXBIxNDiJxiT0s/YFMW3KBgkeyOQtX06KMde8XJAOtpr+bxYgOI
	bwZvyzntxt2mOCt/PFhCVLMEtx8qkrVEiy5tcDEYAiEhPYQBCQjKvGTkuO9ib1qZ/iTR
	J3NS4facQY6smQ6SvhSfhY9kjKDJeuVdOJeYVqkr7XsNjUaRIrk2Ot+NR27TvAEOXORD
	FpKw==
X-Received: by 10.28.10.142 with SMTP id 136mr2440563wmk.84.1445883309853;
	Mon, 26 Oct 2015 11:15:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jh4sm35866674wjb.33.2015.10.26.11.15.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 11:15:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Oct 2015 19:15:21 +0100
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20151026181521.GF2554@jama>
References: <1445873454-108723-1-git-send-email-mark.hatle@windriver.com>
	<1445873454-108723-2-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1445873454-108723-2-git-send-email-mark.hatle@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [jethro/master][PATCH 1/1] local.conf.sample: Disable image-prelink by default
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
X-List-Received-Date: Mon, 26 Oct 2015 18:15:10 -0000
X-Groupsio-MsgNum: 72646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Content-Disposition: inline

--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2015 at 10:30:54AM -0500, Mark Hatle wrote:
> Due to problems with the prelinker itself, we need to disable the
> image-prelink by default.  This will hopefully be re-enabled in the near
> future.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

We had to disable it in our builds back in Dylan days.

Regards,

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/local.conf.sample | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 3ae24ab..9d1480e 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -128,7 +128,9 @@ EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
>  #   - 'image-swab' to perform host system intrusion detection
>  # NOTE: if listing mklibs & prelink both, then make sure mklibs is befor=
e prelink
>  # NOTE: mklibs also needs to be explicitly enabled for a given image, se=
e local.conf.extended
> -USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> +# NOTE: image-prelink is currently broken due to problems with the preli=
nker.  It is advised
> +# that you do NOT run the prelinker at this time.=20
> +USER_CLASSES ?=3D "buildstats image-mklibs"
> =20
> =20
>  #
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYubbcACgkQN1Ujt2V2gByz7wCgu0W7cVP4uPBIMTY6boGCPbka
EowAn2SlE/OBgpE/4EJ8LrGdVjrRVxG5
=6hcv
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
