Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 992E5731DD;
	Mon, 22 Aug 2016 14:20:38 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i138so13683698wmf.3;
	Mon, 22 Aug 2016 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1E0PVU+2Uij5piq0RGVABhLqw/1n9XXn4k0mFV+b5dY=;
	b=HXYazAjJGD1FG0m3AwLbztzVomlcZBpsvoiXW1qzRVQYU4vEvcj9KJWMh/lTNN+m1H
	W2bnmIVRO7qONXwlkj7bG50yBFw390iFrXAn4UIbm2zhzfn/QFXI5KoDtvJBjWMAYk/S
	RBFGdCt8FJ7irI6syBeXooM7J+O7ydRuFYn8SGzu+O5VIiHzgQf0/bj5ykuIK7bwD4Ca
	y3sS614hIsHcmgibya1oIC2cMY7Hz47d41Rq/MOqhsPMqo2xtVSL7252R1l0RrUyWnpx
	MJdS9hZqcUVskxTDZtnK/4frnglhnYRhyLQrbYKw1RKRxAHhEkcr2c32LpZByxHtifEI
	si8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1E0PVU+2Uij5piq0RGVABhLqw/1n9XXn4k0mFV+b5dY=;
	b=jKoYhXY3ilnv32R1/RSe5+YaAEv1bu2aRUYizXtW6l+6PXd2eh/7OaMc9ipo4jKMyL
	dHNs19/9gLqmk/ChbJS0viGnqNgFd3nmxZH1qDAvdvPD5DlKH2Uk/YcIEA5Uxg8uRcpf
	/FPmCuI4Y3cdWZH01jNEheW5yuicWQ91Ggib8Tuw5s3hJdNW8wy3QltGmHyM9NJFYeC6
	LS/ouzYdcaOSUftg1AUSunwrCYWCuAAMnIILtx1tlTkuyLizcoOMiN0iUOQnyyGx1Dfu
	yCvt6BJGDcSugKVwQKYncYF465tcXTmpM4vR83wj7vDB21PfsJME20jBDUsvk8jHnUgI
	8kXg==
X-Gm-Message-State: AEkoouuZ1KMs3sVmtZBHU7YQTkEV2VxXPp0o0SF4JtwZyhT+RX7BVUoKPO8rNzhEvyvIkQ==
X-Received: by 10.28.88.144 with SMTP id m138mr14696460wmb.79.1471875639028;
	Mon, 22 Aug 2016 07:20:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	v203sm21724590wmv.2.2016.08.22.07.20.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Aug 2016 07:20:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Aug 2016 16:20:37 +0200
To: openembedded-core@lists.openembedded.org,
	Joe Slater <jslater@windriver.com>
Message-ID: <20160822142037.mreue353yrb6kvgs@jama>
References: <20160818155231.26598.41172@opal.openembedded.org>
	<20160818155232.98F9250386@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160818155232.98F9250386@opal.openembedded.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/02: systemd-compat-units: pkg_postinst() does not work
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
X-List-Received-Date: Mon, 22 Aug 2016 14:20:40 -0000
X-Groupsio-MsgNum: 86094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dvjn3fd5axawaive"
Content-Disposition: inline

--dvjn3fd5axawaive
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 03:52:33PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 8183309080aee45746daaff46b0506b09b5bd269
> Author: Joe Slater <jslater@windriver.com>
> AuthorDate: Mon Aug 15 16:04:53 2016 -0700
>=20
>     systemd-compat-units: pkg_postinst() does not work
>    =20
>     The test for various files is wrong and will always be
>     true, even if init.d does not exist.
>    =20
>     Exit if init.d does not exist, and correctly test for
>     file existence otherwise.
>    =20
>     Signed-off-by: Joe Slater <jslater@windriver.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd-compat-units.bb | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/rec=
ipes-core/systemd/systemd-compat-units.bb
> index 0b8ff09..90811da 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -23,21 +23,24 @@ SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
>  "
> =20
>  pkg_postinst_${PN} () {
> -	cd $D${sysconfdir}/init.d
> =20
> -	echo "Disabling the following sysv scripts: "
> +	cd $D${sysconfdir}/init.d  ||  exit 0
> =20
> -	OPTS=3D""
> +	echo "Disabling the following sysv scripts: "
> =20
>  	if [ -n "$D" ]; then
>  		OPTS=3D"--root=3D$D"
> +	else
> +		OPTS=3D""
>  	fi
> =20
>  	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> -		if [ \( -e $i -o $i.sh \) -a ! \( -e $D${sysconfdir}/systemd/system/$i=
=2Eservice -o  -e $D${systemd_unitdir}/system/$i.service \) ] ; then
> -			echo -n "$i: " ; systemctl ${OPTS} mask $i.service
> +		if [ -e $i -o -e $i.sh ]  &&   ! [ -e $D${sysconfdir}/systemd/system/$=
i.service -o -e $D${systemd_unitdir}/system/$i.service ] ; then
> +			echo -n "$i: "
> +			systemctl $OPTS mask $i.service
>  		fi
> -	done ; echo
> +	done
> +	echo
>  }
> =20
> -RDPEPENDS_${PN} =3D "systemd"
> +RDEPENDS_${PN} =3D "systemd"

This is good typo fix, but also causes allarch systemd-compat-units to
RDEPENDS on TUNE_PKGARCH systemd as reported in:
http://lists.openembedded.org/pipermail/openembedded-core/2016-August/12548=
3.html

So either please exclude it in layer.conf for drop this runtime
dependency completely.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dvjn3fd5axawaive
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAle7CjQACgkQN1Ujt2V2gBxuFQCfQyjVdZJHtFz4lruUCT5Ye2gn
39YAnRSdyyKhOV6vf1HFVBEdeV3YtMge
=Ia0e
-----END PGP SIGNATURE-----

--dvjn3fd5axawaive--
