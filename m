Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B555E60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 01:23:48 +0000 (UTC)
Received: by pdea3 with SMTP id a3so29353417pde.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CvUCa2+OEZAr+8syGk6/SA+T63YUbyAuHtq5AgRo0ZE=;
	b=dQwutlyaAFF4gzupPWxMQ4tYn3mrEGHisIivdeFdniWAvrK/vtn+zs4Q2uW9o0WwIZ
	uwYY0INe0fkbdQzQveSDGD4Kfq4q+gPsWzkS7syO3hpkbPl4zY5dIFXFuX1pWY9B5lXH
	8iMywKsBc55Jc40HaGFZ3GXPTQPzsaaVHn9UORM4eMlO9muM9BoLmfnpLghGBMYlZ/wj
	+ysIqWKr9vGl+MdvpPcbq/EvduB7ajUxH1+w7vkrgt/5k1ijhbdp7YJPvz4S38S9gAWW
	wXG62X1XfHdUNOgfF8yThjchO6INm4TRyuzCpRonbV75jXgy6g7SCJ0lbSRirpPbFx6K
	CXCg==
X-Received: by 10.68.244.73 with SMTP id xe9mr496701pbc.98.1432776229582;
	Wed, 27 May 2015 18:23:49 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:90eb:a06b:3186:ca08?
	([2601:9:3580:84c:90eb:a06b:3186:ca08])
	by mx.google.com with ESMTPSA id ue9sm397030pbc.78.2015.05.27.18.23.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 May 2015 18:23:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAOMwXhN1Ww=T_OJC8e-VtzM_OozOQUjCU7cF1-shUMZ_kVG4Xg@mail.gmail.com>
Date: Wed, 27 May 2015 18:23:43 -0700
Message-Id: <C54FEAEF-9A11-42DE-BF44-CD22BDA74425@gmail.com>
References: <CAOMwXhN1Ww=T_OJC8e-VtzM_OozOQUjCU7cF1-shUMZ_kVG4Xg@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Post USERADD_PARAM action
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
X-List-Received-Date: Thu, 28 May 2015 01:23:49 -0000
X-Groupsio-MsgNum: 66064
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B8025153-A5B6-4B47-87D1-C0611675001A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B8025153-A5B6-4B47-87D1-C0611675001A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 22, 2015, at 4:37 AM, Laszlo Papp <lpapp@kde.org> wrote:
>=20
> Hi,
>=20
> is it possible to do some post action after useradd_param is executed?
>=20
> I would like to modify the created user's home directory, in this
> special case the profile. I see that the useradd util has this on
> desktop, but busybox does not have it, and very likely will not have
> it, at least not in the near future anyway:
>=20
>       -k, --skel SKEL_DIR
>           The skeleton directory, which contains files and
> directories to be copied in the user's home directory, when the home
> directory is created by useradd.
>=20
>           This option is only valid if the -m (or --create-home)
> option is specified.
>=20
>           If this option is not set, the skeleton directory is
> defined by the SKEL variable in /etc/default/useradd or, by default,
> /etc/skel.
>=20
>           If possible, the ACLs and extended attributes are copied.
>=20
> I would like to do something like this with the created user's home =
directory:
>=20
> echo PATH=3D/sbin:$PATH > /home/foo/.profile
> chmod foo:foo /home/foo/.profile
>=20
> But then again, for this, I need to make sure that the user is already =
created.
>=20

may be you can insert a custom task after useradd_sysroot ?

> Ys, L.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B8025153-A5B6-4B47-87D1-C0611675001A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVmbiMACgkQuwUzVZGdMxSquwCfYeftKiZYjFNpX/RF1o9DqXgc
dQUAnA1fPb1WL3tNeWNBc4sCEzVTIuk1
=ioc+
-----END PGP SIGNATURE-----

--Apple-Mail=_B8025153-A5B6-4B47-87D1-C0611675001A--
