Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id F192765CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:54:18 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so148482101wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xYAK6P8Kqu/0aHktx44iIC9duHwHR/aaZzhYNXpinJM=;
	b=G7dlLzySUKhpMX7IER6PUydizB0WEsBmEyfQVUGdOHgvrkMMnARceyjbnqjVcOXOTC
	9RGUZZM9KFAWq8HCPsniB/sbD8bJ+QCmabDIxZlE+8eAS/wVMz/5PuY0KBZru+1Or+Ws
	1/m+lJKx3PSqKgQaxcQUswjBydG73k8KmAAMEk6e57annUUrAiQarQZlK0uEYFUjST9j
	BKf1Wi132UBGSVdx3QRn2Fy+z3UFJeHKaBsy3IirGDcb8ZUSLXzO1wE+CwhjORkE2U4H
	pzniTgW+ZRAm1BUGR+QkADDOMNQuQ2zXfU/f/YnGR/rwi4NNsZtAynRxn4Fe2yiLRmCi
	GfiA==
X-Received: by 10.180.39.229 with SMTP id s5mr2271849wik.70.1440082457994;
	Thu, 20 Aug 2015 07:54:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	im10sm5887172wjb.40.2015.08.20.07.54.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 07:54:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 16:54:44 +0200
To: Alex M <0xf777@gmail.com>
Message-ID: <20150820145444.GC2446@jama>
References: <CAHyyKNnpUqqsDahww8wCKbDCrFSS8Ry7cdnpmTYXx0ipgxx0JA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHyyKNnpUqqsDahww8wCKbDCrFSS8Ry7cdnpmTYXx0ipgxx0JA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Phonon is not available Qt 4.8.7
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
X-List-Received-Date: Thu, 20 Aug 2015 14:54:19 -0000
X-Groupsio-MsgNum: 69730
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline

--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 05:18:47PM +0300, Alex M wrote:
> Hello!
> I have a piece of my custom software which is depends on Qt4 + Phonon +
> gstreamer 0.1 and two years ago I had successfully built oe-core image.
> Recent version of oe-core (19 Aug 2015) contain QT_PHONON ?=3D "-no-phono=
n"
> option inside qt4.inc file. Why this option banned in default Qt 4
> configuration? Also I do not see qt4-plugin-phonon-backend-gstreamer

git log is your friend (sort of)

commit 096b71a5c24378a449bc38063316555f02af8e18
Author: Alexander Kanavin <alex.kanavin@gmail.com>
Date:   Mon May 18 16:58:38 2015 +0300

    qt4: disable Phonon framework
   =20
    This allows removal of gstreamer 0.10 dependency from Qt4 recipe
   =20
    https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6294
    Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


> package in recent version, which my software also requires. Other
> gstreamer-0.1 components is fine and already built. What I should do to
> activate Phonon support for Qt4 in oe-core?

Undo this change in your distro configuration if you're still using 0.10
gstreamer.

> Also I saw "Phonon for Qt5" meta layers in meta-qt5-extra however I don't
> understand how it will work without "***-plugin-phonon-backend-gstreamer"?
> Is this package required in case of "Phonon for Qt5"? Should I rewrite my
> old Qt4/Phonon code for this?
>=20
> Thank you for attention :)

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV6jMACgkQN1Ujt2V2gBwm8wCgtoRbgzyFeC+fbfsCobS4mkjJ
nlMAoJLFXi7Hrnc1X2emAjXLXX7QNtxU
=zUZS
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
