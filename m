Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D0ABF6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 12:02:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 139so4057834wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=heb2AS0vZfAQW1jkeQ3YIpaiOMN9G2iMTyVCb1Ub9bY=;
	b=AXxyUdVLDg6tJmifeT6REITejD1E1af2/Xy8aTjUqFk6gdZU90Ny9VEF7SuSwJ4c0c
	Pgb9jKnVG+zKm9mTxFl3iOb8MBt3Ast0xp9JpOTJYebz2Kl3XLl+IyDEMDkxIp+dMxFe
	/ToAeELypRP2MdY5GOfQrmXw2Nv9CDn+at5+JhwnD9nHlq3nBjbZQobsV5P+FzHvediv
	752s1Hlw9Xrm6aMvfxwA/XgWtBcQ+uxjTEVVljC8ch1dCE8VweLgfN3B0fdp6s+b2bvz
	wN83qmkg7rMBhZhYY1tgND37BHM8mnaSXsgbyXjCINaIR7rFYshhX4jqYAfw0SjqaYig
	vmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=heb2AS0vZfAQW1jkeQ3YIpaiOMN9G2iMTyVCb1Ub9bY=;
	b=FfVZFN1/M0os1+j9eSI6LiIc2ISyO9xmAKQ2ai3X9D6cLghUHR8lIT+SHYOrhOWnYi
	la5U3kP5Erb1ocTtRoEY4VOVawK37WgPEB5En5zov2S4SEpoJRqEH49EsunM7gyuWHHg
	ngvWvs63wieedWM9sNPP/F8Fgj3+1HKtK4BihR6/6zU7aUhVUr2Hp3CbwkWIEjUB5onL
	oifUt93WWlfaXt8K2b67Z8sp/AwCs/oJgdBD/sZZPNOexJLXfCdDVhaUpUXji0QV7EIl
	JeXQN9+XbpDYGxGCpKINe6a3L1kjNi1ZyVutxp5hKd2mgmZFbLnXSif/EwCOTAnV/0/i
	bGSA==
X-Gm-Message-State: AD7BkJLYW3d96yAQYDbPR701akH2ad75E7eSC4GGKtC/5uCXFPrdFePS8GZnjeZt/0DXDQ==
X-Received: by 10.28.9.71 with SMTP id 68mr3516371wmj.33.1459512171268;
	Fri, 01 Apr 2016 05:02:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n3sm18012wja.6.2016.04.01.05.02.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 05:02:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Apr 2016 14:03:04 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20160401120304.GE2567@jama>
References: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][jethro] glibc-locale: fix QA warning
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
X-List-Received-Date: Fri, 01 Apr 2016 12:02:52 -0000
X-Groupsio-MsgNum: 80390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline

--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2016 at 11:55:30AM -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd-in/usr/lib/l=
ocale/sd_IN/LC_CTYPE is owned by uid 1000, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]

FWIW: my last bitbke world build shows few of these:
glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ka-ge/usr/lib/loc=
ale/ka_GE/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-mr-in/usr/lib/loc=
ale/mr_IN/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ru-ua/usr/lib/loc=
ale/ru_UA/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]

Even with your change already in master.

> fix type
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core=
/glibc/glibc-locale.inc
> index df6d073..2352bd0 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -87,7 +87,7 @@ do_install () {
>  	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
>  		cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
>  	fi
> -	chown root.root -R ${D}
> +	chown root:root -R ${D}
>  	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
>  }
> =20
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb+Y3cACgkQN1Ujt2V2gBzlawCeN3XNYbOLDY0K7Tq+mh/FIxUL
YaIAoIkV6DDxjgw6qEsSfrU2OPCTJB6i
=rFZy
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
