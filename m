Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 92C5C6AF1D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 21:39:24 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so2019853eek.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 14:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3a65CbdvMHy89iOul+XeoAO+dcWgWiRqAT3PC/a6w+U=;
	b=zhhqqxyA5QX+nPG+U8AqRoeTjRSnXnKBM72BVhDKMjAYFajiHlXSi65PxFphOUzvqP
	kC1Hd91y43s60njl/xMsuzpJq8WLIAmbgDPhPouFWX1UqTj5+cgKUmGQgSc4wXEnJ4sV
	Nx8+ndTinyrRktAci5Qy0tjbo6F8Ikg/hnsv6K6YdKcYkB6ROE2UpAKrbvr8xYjfP5Jo
	keXTr5wnI1icN5I0GsgUEAayiNblVkBrgidgBj3d253kSWirJ4b8mt/LwFi8aPPue/hY
	JXbLygiQbKR2bLweVBhuMuNr18kb/Uv4Kg/57BaQH06HWqJyxgG5rzsLHOzGYsBR1iEl
	q6tg==
X-Received: by 10.14.3.73 with SMTP id 49mr18076897eeg.72.1373146765052;
	Sat, 06 Jul 2013 14:39:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm27123357eeo.14.2013.07.06.14.39.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 14:39:24 -0700 (PDT)
Date: Sat, 6 Jul 2013 23:39:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130706213931.GD3288@jama>
References: <20130706122934.GC3288@jama>
	<1373145886-26565-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373145886-26565-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][PATCH] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Sat, 06 Jul 2013 21:39:25 -0000
X-Groupsio-MsgNum: 41553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline

--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2013 at 11:24:46PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  scripts/test-dependencies.sh | 250 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 250 insertions(+)
>  create mode 100755 scripts/test-dependencies.sh
>=20
> +build_all() {
> +  echo "=3D=3D=3D=3D=3D 1st build to populate sstate-cache directory and=
 sysroot =3D=3D=3D=3D=3D"
> +  OUTPUT1=3D${OUTPUT_BASE}/${TYPE}_all
> +  mkdir -p ${OUTPUT1}
> +  echo "Logs will be stored in ${OUTPUT1} directory"
> +  bitbake $targets | tee -a ${OUTPUT1}/complete.log
> +}

I've just added "-k" here to bitbake call, more improvements are expected,=
=20
that's why it's only RFC, but I wanted to share it soon in case someone
else also have access to some builder which is idle during weekends..

It would be nice to test and fix oe-core recipes first, but because my
target is to run this in dylan I'm running this with more layers
included already.

I'm sending patches for master + blacklisting broken recipes in dylan,
maybe we should backport them later as missing deps and autodetected
deps are relatively safe fixes.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEUEARECAAYFAlHYjpMACgkQN1Ujt2V2gBxkSwCYvPdCWdgLdqvIliVrvSIvlLU/
JgCcC/5YGM4ZsD+XQL0lbgsSFPT9y2c=
=to7S
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
