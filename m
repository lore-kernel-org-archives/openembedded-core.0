Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id C4B94770F8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 18:18:54 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id g184so40031615lfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Apr 2016 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yBo9SzsdrzBAUBncq1ySC5+KIJ+tqKlPdU1f/3fYRkA=;
	b=UD6ioadO41lS4DE2GoRF8yURlY7bCQ84sSSLZLpWanO9Q3O/lMMkg10gyvRB6Ck/j9
	nYJiGg5eSKK1dt8NTtpQrWGZKhJ1voi9g3AuUYCxpO/0S9mXA9lIGdvWxb9ZS2l0Y/ZS
	8Xt+YF9SwsyRgMod6jOLZn+Ii4I73IFqYm1/j9tJPpctRCgF4T7lU3bzIJq1eWkQ9R8E
	cAIP7yGAfMowTFcCdRz68bkARvfTA4HRGAu2g0yOVH1mVHW2Mq0qb7kp/XCsCD7PeimQ
	KslP2gq+m5RnEnLTVu9cxOAesDox4K6YOqqYNQyMf/bd//vdpuXmgToIEcvfLZTGN2/h
	kp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yBo9SzsdrzBAUBncq1ySC5+KIJ+tqKlPdU1f/3fYRkA=;
	b=ksFGOYCGErIZEVDZRBbcpKmtBeZ9/f2qevFBnnqbVv7Cqkz5yABo7R5SBxVgMJg8An
	qRzjsSpGcAZ65bHV/HQ1rJUf4rNnHAlA2Js+USO2mIFjLW25N8Vb3ja3EDrTXp03TnS1
	ecT2YG1hO84+8h+7A4HEBnAMU2spD5X1u/xcjcY/NGkBxvi6facnkyP1FdD4EBZv4pTe
	KZcr3lzwZv27iwynBJG5JGOMBw5L5LQrcMBNjxJ8Wrj+rzY34pqxQt2miztB4pgZt5N3
	muGgNx6iMHPOEACpWINw451i5TTeqTN4wzrdGbGRWnUdj16bbbo2Ae55yC0ltCQ9bWhV
	PnJQ==
X-Gm-Message-State: AD7BkJLNagPrzEoPDr3aAsgSJ9HX7bkinT585Wtbhu2/t36TMzvGEJtU34qiMtaOhJEzWg==
X-Received: by 10.194.22.68 with SMTP id b4mr2937946wjf.158.1459621134804;
	Sat, 02 Apr 2016 11:18:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t3sm19995497wjz.11.2016.04.02.11.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Apr 2016 11:18:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 2 Apr 2016 20:19:09 +0200
To: akuster <akuster@mvista.com>
Message-ID: <20160402181909.GH2567@jama>
References: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
	<20160401120304.GE2567@jama> <56FEA982.5040500@mvista.com>
MIME-Version: 1.0
In-Reply-To: <56FEA982.5040500@mvista.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 02 Apr 2016 18:18:55 -0000
X-Groupsio-MsgNum: 80430
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
Content-Disposition: inline

--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 10:01:54AM -0700, akuster wrote:
>=20
>=20
> On 04/01/2016 05:03 AM, Martin Jansa wrote:
> > On Sun, Jan 31, 2016 at 11:55:30AM -0800, Armin Kuster wrote:
> >> From: Armin Kuster <akuster@mvista.com>
> >>
> >> WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd-in/usr/li=
b/locale/sd_IN/LC_CTYPE is owned by uid 1000, which is the same as the user=
 running bitbake. This may be due to host contamination [host-user-contamin=
ated]
> >=20
> > FWIW: my last bitbke world build shows few of these:
> > glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ka-ge/usr/lib=
/locale/ka_GE/LC_MEASUREMENT is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
> > glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-mr-in/usr/lib=
/locale/mr_IN/LC_MEASUREMENT is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
> > glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ru-ua/usr/lib=
/locale/ru_UA/LC_MEASUREMENT is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
> >=20
>=20
> hmm. I have not seen those.
>=20
> > Even with your change already in master.
> >=20
>=20
> so are you seeing those in master or jethro ?

master

> - armin
>=20
> >> fix type
> >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> ---
> >>  meta/recipes-core/glibc/glibc-locale.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-c=
ore/glibc/glibc-locale.inc
> >> index df6d073..2352bd0 100644
> >> --- a/meta/recipes-core/glibc/glibc-locale.inc
> >> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> >> @@ -87,7 +87,7 @@ do_install () {
> >>  	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> >>  		cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> >>  	fi
> >> -	chown root.root -R ${D}
> >> +	chown root:root -R ${D}
> >>  	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> >>  }
> >> =20
> >> --=20
> >> 2.3.5
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcADR0ACgkQN1Ujt2V2gBzYswCdHJK4DoMzIm+yhJ0xDmKXxhkd
uIYAoK0EkMrCsKVYqcRCaetYbuWju/qV
=d+0E
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--
