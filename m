Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1B9F79AEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 18:52:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r63-v6so3035151wma.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 11:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=U9CGhjgpebqFoxpGaJqrkRfh2LZ87Ovg6ThVjcimG54=;
	b=dcWcslVuEg7zJdKMGoNKHtK6CBY3PRb0QvCUi+gYruLdy5sFkVlaRnozW4Yb08tBAc
	zQC9ClkreTlPpE9QzzMENjjDVF6sqLpmMGmJ6rYJO+UFDfnn02uzeh9dPttBLeAaZMBN
	mIXzuKdgCTMpffQsOxjAZ77enca1iP0BuutilKjX22aGMSpm8yMSgb5X9uG9AJLHuUB/
	SaFOzqxzW2IpQlz9BlQT6ajSdGBQssX6qcqju7vGsRyu89Uyg0WCYhKfPP6RRNvImyjZ
	GjhJmAK12ZFILGMXYFLOpgEavsIdOFL0sWxM+Xh1Fdais1HnYya7VAc0FaCKdb9YI941
	vLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=U9CGhjgpebqFoxpGaJqrkRfh2LZ87Ovg6ThVjcimG54=;
	b=D/5aajN75vmxkaeyayKdW8yjmVPi8lDuSAJMJxM36AKqwcyGiQx7fAt5XdVR2TYmHf
	3NVeAXMZOeZPPSVysXe/g7Z1zzIWaLXwX0BJ/ZVYMVNyrpS4U6UHcMJIkswhQ9chdssj
	XI8KGha0Do5aCShyXlLQgj1k5Un4duDizOlDyEyu5RBF1vHCgfvH4H9k8FzY+kTu3XaA
	QRlyn882gUoBnW2f3jL71ZM+CQgjIPq3Q3d6EWG1j7IQ2bHm6hVZmrSD+nHfpup1Zp+u
	4qJjALZQcAgBj0+KUYGhKPJe38cYql3QjOWH05s3MJVyAMANnfmDmU1j4My2/dG8Q1Nk
	nDrg==
X-Gm-Message-State: ABuFfogZp+0/JOlKBMs8Qd16pKkUIimOVpEP9JHgYRkxxBbRChFtq0py
	VCptCWgY2LvEsDwNNVO2/EI=
X-Google-Smtp-Source: ACcGV632UPpfNyUk/zXqQ9CKEpVJjI98h4OFYA4Fp3ovEojUnIsbQlAARut8w+Wh3CAr6W+RFN+Vng==
X-Received: by 2002:a1c:38c5:: with SMTP id
	f188-v6mr3955700wma.19.1539802337528; 
	Wed, 17 Oct 2018 11:52:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	199-v6sm1553595wme.39.2018.10.17.11.52.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 11:52:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Oct 2018 20:52:16 +0200
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20181017185216.GA1375@jama>
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
	<CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
	<CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
	<333ac1ec-594d-ebc8-4855-af533f1b016c@windriver.com>
MIME-Version: 1.0
In-Reply-To: <333ac1ec-594d-ebc8-4855-af533f1b016c@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 18:52:17 -0000
X-Groupsio-MsgNum: 117405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 10:58:49AM -0500, Mark Hatle wrote:
> On 10/17/18 10:46 AM, Martin Jansa wrote:
> > well, I realized that this won't work with the BLUEZ intentionally set =
to empty
> > value and setting BLUEZ to no-bluetooth globally also probably won't wo=
rk for
> > cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe inline py=
thon
> > appending only either bluez4 or bluez5 alternative here?
>=20
> I'm slightly confused.  In the suggestion you made below, ??=3D within the
> specific package, why would 'no-bluetooth' cause a problem.  For all other
> recipes it will remain blank as expected.

Because if you set it to empty, then ??=3D won't be used and we'll be back
to RDEPENDS_.

And if you set BLUEZ to no-bluetooth e.g. in your DISTRO config than it
will break other recipes, e.g.:

meta/recipes-connectivity/ofono/ofono.inc:PACKAGECONFIG[bluez] =3D "--enabl=
e-bluetooth, --disable-bluetooth, ${BLUEZ}"
meta/recipes-core/packagegroups/packagegroup-base.bb:    ${BLUEZ} \
meta/recipes-devtools/python/python3.inc:PACKAGECONFIG[bluetooth] =3D ",ac_=
cv_header_bluetooth_bluetooth_h=3Dno ac_cv_header_bluetooth_h=3Dno,${BLUEZ}"
meta/recipes-devtools/qemu/qemu.inc:PACKAGECONFIG[bluez] =3D "--enable-blue=
z,--disable-bluez,${BLUEZ}"
meta/recipes-devtools/strace/strace_4.24.bb:PACKAGECONFIG[bluez] =3D "ac_cv=
_header_bluetooth_bluetooth_h=3Dyes,ac_cv_header_bluetooth_bluetooth_h=3Dno=
,${BLUEZ}"
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bb:PACKAG=
ECONFIG[bluez]           =3D "--enable-bluez,--disable-bluez,${BLUEZ}"

> --Mark
>=20
> > On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson <yann.dirson@blade-group.com
> > <mailto:yann.dirson@blade-group.com>> wrote:
> >=20
> >     Yeah, that looks like a better idea.
> >=20
> >     Le=A0mer. 17 oct. 2018 =E0=A017:27, Martin Jansa <martin.jansa@gmai=
l.com
> >     <mailto:martin.jansa@gmail.com>> a =E9crit=A0:
> >=20
> >         What about using some less confusing default BLUEZ value? RDEPE=
NDS_
> >         looks wrong.
> >=20
> >         BLUEZ ??=3D "no-bluetooth"
> >         RDEPENDS_no-bluetooth =3D ""
> >=20
> >         Might be a bit more clear.
> >=20
> >         On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com
> >         <mailto:yann.dirson@blade-group.com>> wrote:
> >=20
> >             From: Yann Dirson <yann@blade-group.com <mailto:yann@blade-=
group.com>>
> >=20
> >             Otherwise the build fails with:
> >=20
> >             =A0 NOTE: Runtime target '${RDEPENDS_}' is unbuildable, rem=
oving...
> >             =A0 Missing or unbuildable dependency chain was: ['${RDEPEN=
DS_}']
> >=20
> >             This restores some truth in the "Otherwise install nothing"=
 comment
> >             in the recipe.
> >=20
> >             Signed-off-by: Yann Dirson <yann@blade-group.com
> >             <mailto:yann@blade-group.com>>
> >             ---
> >             =A0.../packagegroups/packagegroup-tools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>=A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| 2 ++
> >             =A01 file changed, 2 insertions(+)
> >=20
> >             diff --git
> >             a/meta-oe/recipes-connectivity/packagegroups/packagegroup-t=
ools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             b/meta-oe/recipes-connectivity/packagegroups/packagegroup-t=
ools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             index 0ede5e57b..e81516fef 100644
> >             ---
> >             a/meta-oe/recipes-connectivity/packagegroups/packagegroup-t=
ools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             +++
> >             b/meta-oe/recipes-connectivity/packagegroups/packagegroup-t=
ools-bluetooth.bb
> >             <http://packagegroup-tools-bluetooth.bb>
> >             @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
> >             =A0 =A0 =A0 =A0 =A0'', d)} \
> >             =A0"
> >=20
> >             +RDEPENDS_ =3D ""
> >             +
> >             =A0# Install bluez4 tools or bluez5 tools depending on what=
 is
> >             specified in the distro.
> >             =A0# Otherwise install nothing.
> >             =A0RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> >             --=20
> >             2.19.1
> >=20
> >             --=20
> >             _______________________________________________
> >             Openembedded-core mailing list
> >             Openembedded-core@lists.openembedded.org
> >             <mailto:Openembedded-core@lists.openembedded.org>
> >             http://lists.openembedded.org/mailman/listinfo/openembedded=
-core
> >=20
> >=20
> >=20
> >     --=20
> >     Yann Dirson <yann@blade-group.com <mailto:yann@blade-group.com>>
> >     Blade -- 38 rue du Sentier, 75002 Paris
> >=20
> >=20
> >=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW8eE3wAKCRA3VSO3ZXaA
HP5nAJ482Kmi/tlPidvEP/lJuxlkxPkuGQCfbMC6DuZticZPsKp8TYVRnntDWlc=
=uVgd
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
