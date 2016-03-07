Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id EF45D70034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 12:26:33 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l68so106090424wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 04:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=64c28TCvQzsQZ0AT57fK4/T8J91OqHGoI7o0JGaYg0E=;
	b=Hi9zw6TqRB7qLOFh7Qz8wUx43c92a70ivBT9pP7oYbZLr/myGE8lwd/zbEWC2AqTl+
	d+pdJUD64AFPQ2zwVH29kk7WWbmKmmg/EJg4dchq0Hac4LQWC5TVDr9f4KVklx2uZC6M
	NRBBPoGvxvT06MjlAKXKVmX8p0DAADzWc/lnCC+0cHFzsOkzqS9dtwU37VY69XbCiGW9
	vBwBhR3miCxK9dzmC0pzPb0z/do/LUklPrJ7vpkKc/R86Ae5ha9gHcOx79mAAl3akOTW
	yKgU6y0x6GqI1VAZTU0ShdCbHGWQxvedDItawRpyL8O7DWVgZrFpdGdxkjVvkjZhW6OX
	38ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=64c28TCvQzsQZ0AT57fK4/T8J91OqHGoI7o0JGaYg0E=;
	b=I+4badP7Z090S4mXEMrydJZ/FDMzo2WzfXPMl18NAYm1iTYZnfwY5m/mD4maza223o
	hBH5mSqpt8R3X8271bBXJ2VOMInUpBfO2/zUp6d5yNNbWB+BFC2wQ2ql/AN9DtmfeBoj
	uKBV4r4s19IlC/tqF7o/F3NxHz+FmP7fz5/CfqGz6cbWtCBMGrLRANP2EYpQXOGIHSeT
	W/+e89EPXomxCLM2Fd6Akeumd01LayCgGH+boQZBlZsCDH91i4tVkxnAqNjE3bUVwNHI
	uaiuXaxMo3+gDAXtUyLCCmyS2eVkwBsgKAvW9Z9WssWFLn7KSkQDlAVevkWLvFyz/Pvq
	DeVw==
X-Gm-Message-State: AD7BkJKa/MkhuyFqHmqt51RcuQJehm4+LWStjGoj38eYhYS0UKhmWZ9K5hnds9z4vTMTAw==
X-Received: by 10.28.148.16 with SMTP id w16mr12799221wmd.90.1457353594245;
	Mon, 07 Mar 2016 04:26:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i1sm17600032wjs.45.2016.03.07.04.26.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Mar 2016 04:26:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Mar 2016 13:29:01 +0100
To: Herve Jourdain <herve.jourdain@neuf.fr>,
	openembedded-core@lists.openembedded.org
Message-ID: <20160307122901.GF2549@jama>
References: <004901d1785c$fb27d0f0$f17772d0$@neuf.fr>
	<005801d1785e$07915900$16b40b00$@neuf.fr>
	<20160307114709.GD6004@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20160307114709.GD6004@ad.chargestorm.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [systemd][PATCH] some dependencies in systemd seem not to be taken into account in systemd_229.bb
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
X-List-Received-Date: Mon, 07 Mar 2016 12:26:34 -0000
X-Groupsio-MsgNum: 79186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Content-Disposition: inline

--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2016 at 12:47:09PM +0100, Anders Darander wrote:
> (Resending as it didn't go to the list).
>=20
> Thanks!
>=20
> I've just ran into this myself this morning.
>=20
> A few comments are inlined.
>=20
> * Herve Jourdain <herve.jourdain@neuf.fr> [160307 11:51]:
>=20
> > # Sign the journal for anti-tampering
>=20
> > -PACKAGECONFIG[gcrypt] =3D "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>=20
> Please, keep this line as it is. If gcrypt isn't enabled, we need to
> pass --disable-gcrypt. Tnus, it should be part of this line.
>=20
> > +# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and g=
crypt
> > are NOT part of PACKAGECONFIG - done in EXTRA_OECONF
>=20
> Remove the comment.
>=20
> > +PACKAGECONFIG[gcrypt] =3D "--enable-gcrypt,,libgcrypt"
>=20
> As above, keep the original line.
>=20
>=20
> > -PACKAGECONFIG[resolved] =3D "--enable-resolved,--disable-resolved"
>=20
> > +# RESOLVED depends on GCRYPT, so enable gcrypt any time resolved is in
> > PACKAGECONFIG
>=20
> Either keep this comment, and keep enabling gcrypt.
>=20
> Though, I'd prefer to follow the precedence of importd, and just have
> the comment stating what you need to enable.

I agree, I've updated all layers are care about to enable gcrypt when
enabling resolved.

It's pity that there isn't easy way to declaratively express
dependencies between PACKAGECONFIGs (or even required PACKAGECONFIGs
used in dependencies - or version of dependencies) like e.g. gentoo's
USE flags do, but documenting this is imho better than each recipe
introducing some (usually different) automagic to try to autoenable
right combination.

> > +PACKAGECONFIG[resolved] =3D "--enable-resolved
> > --enable-gcrypt,--disable-resolved,libgcrypt"
>=20
> No, don't add --enable-gcrypt to the resolved PACKAGECONFIG.
>=20
>=20
> > +# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and g=
crypt
> > are NOT part of PACKAGECONFIG
>=20
> > +EXTRA_OECONF +=3D "${@bb.utils.contains_any('PACKAGECONFIG', 'resolved
> > gcrypt', '', '--disable-gcrypt', d)}
> > <mailto:$%7b@bb.utils.contains_any('PACKAGECONFIG',%20'resolved%20gcryp=
t',%2
> > 0'',%20'--disable-gcrypt',%20d)%7d> "
>=20
> Skip this part.
>=20
>=20
> > +             if [ ${@bb.utils.contains('PACKAGECONFIG
> > <mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'resolved', 'true',
> > 'false', d)} -a \
>=20
> > +         ! ${@bb.utils.contains('PACKAGECONFIG
> > <mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'gcrypt', 'true', 'fa=
lse',
> > d)} ]; then
>=20
> > +                           PACKAGECONFIG_append =3D "gcrypt"
>=20
> > +             fi
>=20
> Isn't this too late? (I've not runtime tested this).
>=20
> If you go the route of modifying PACKAGECONFIG automatically, I'd prefer
> an anonymous python funtion doing this at the recipe processing stage.
>=20
>=20
> > -SYSTEMD_PACKAGES =3D "${PN}-binfmt"
>=20
> > -SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"
>=20
> > +#SYSTEMD_PACKAGES =3D "${PN}-binfmt"
>=20
> > +#SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"
>=20
> > +SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
> > '${PN}-binfmt', '', d)}
> > <mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'$%7bPN%7=
d-bin
> > fmt',%20'',%20d)%7d> "
>=20
> > +SYSTEMD_SERVICE_${PN}-binfmt =3D "${@bb.utils.contains('PACKAGECONFIG',
> > 'binfmt', 'systemd-binfmt.service', '', d)}
> > <mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'systemd-=
binfm
> > t.service',%20'',%20d)%7d> "
>=20
> This looks good, but should probably be a separate patch.
>=20
> Cheers,
> Anders
>=20
> --=20
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbddAwACgkQN1Ujt2V2gBwXEgCeM1FWCKrlkJKjj1l86kIOa/sz
Hf0AoKvM51WgQMN2wudepcXvIcJda2Vf
=k8Xr
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
