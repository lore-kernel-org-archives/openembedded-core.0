Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 12A196BC44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:09:40 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so318394eaj.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B782tAIU4ahiZGG2ghqsiYrFBaoizhUrr13+zBNOfrw=;
	b=II+GT7ngrYHrMhCEYyAfS5qTBV8Dcxc81wbqx/GJxt8jDdJyyRDZHVjiilJGPhUfcv
	L8EO4jTKxqcIB54yuBkB+SwvN1gmgy+HpmZL7k5hl8jAppkAwkdZSpAJigJopp5b59l2
	wxt0UFqDm1pVG34v1Zbhat/g15tIaZ0mH02EdGt3g+Z/gmD8lyPYTzT8LlYE9NgGoECq
	YPtundSkBK44M5HfwP4UHv2O015w//5jfRFi5wge/NsWqauaZ2PkEDV9eOWgqNBlezmi
	Rv6+qIkqHX3zJSYYR2uJyWt0V0Rpz8IPDy2wZQHUB7LsgFW2adz5dZEyp/u9R2W+X73Y
	/LBA==
X-Received: by 10.14.177.199 with SMTP id d47mr5066976eem.14.1377788980718;
	Thu, 29 Aug 2013 08:09:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm46857999eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:09:40 -0700 (PDT)
Date: Thu, 29 Aug 2013 17:10:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130829151053.GP3544@jama>
References: <CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
	<CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
	<CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
	<20130821110401.GG522@jama>
	<CAOMwXhNa+ZjLU_Wx=d3RsMHJm84=9gbH2jFSytd-gjwv1HUaBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhNa+ZjLU_Wx=d3RsMHJm84=9gbH2jFSytd-gjwv1HUaBA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Thu, 29 Aug 2013 15:09:44 -0000
X-Groupsio-MsgNum: 44253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QCvc+0a4DZLbIBWe"
Content-Disposition: inline

--QCvc+0a4DZLbIBWe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 04:01:20PM +0100, Laszlo Papp wrote:
> On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com>wr=
ote:
>=20
> > It does, all you need to do is enable BB_GENERATE_MIRROR_TARBALLS
> >
>=20
> I need all the three lines or just the last?
>=20
>  SOURCE_MIRROR_URL ?=3D "file://${DL_DIR}"
>  INHERIT +=3D "own-mirrors"
>  BB_GENERATE_MIRROR_TARBALLS =3D "1"

Depends on what you're trying to do, BB_GENERATE_MIRROR_TARBALLS just
generates tarballs from SCM checkouts.

SOURCE_MIRROR_URL ?=3D "file://${DL_DIR}" doesn't look correct (DL_DIR is
used by default), SOURCE_MIRROR_URL + own-mirrors are useful on other
builders which will be using the generated mirror (over http:// or
smb/nfs etc - with file://mount-point/foo)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QCvc+0a4DZLbIBWe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIfZH0ACgkQN1Ujt2V2gBz/wwCfQ3muF9G1mrplHWmjyV0uXylU
cS0An3JkP7IA6a6PZXG0w4oynHU8v94M
=4Hrt
-----END PGP SIGNATURE-----

--QCvc+0a4DZLbIBWe--
