Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TyPCj-0005Tp-D1
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:59:05 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so5595220pac.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=cKba2lPXcmGfJx5wehsJFh5yDcQ8kjTb25qTqeqMwCs=;
	b=P+Lh8zajFyqVa7mm4dpXBeWxFhbstTuRMjo6HZw+I0DHug5pUICfeRpUyDX8VDmS5e
	0IetqedOKEZ1/p7u8roc9IWW0Um+CrKqdQsbwhwKbwz4PaxoQTYSqU5zdr63laLPceS+
	uL9XeRCXpBCMvYdHFjQxWo/zaK2/CQLIeCVJBgLOLRQuIb4MBCmF48XpsoxToaJIEHQ3
	Yywz9b26yN5obMeJj6BmHnTO4TZGUdc6RvgOQITlbQMSR6EhLgijVBLEdi0rc+yX4Toh
	h2ksuAvU/gbhvOc+rw4DirO1e+bWtJN7AY1CFHPERgB2cWfxjcY780pDazXCTTRUL7Ey
	2v4g==
X-Received: by 10.66.76.198 with SMTP id m6mr5715927paw.32.1359042211703;
	Thu, 24 Jan 2013 07:43:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oj5sm15065900pbb.47.2013.01.24.07.43.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 07:43:30 -0800 (PST)
Date: Thu, 24 Jan 2013 16:43:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130124154325.GB3200@jama>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
	<CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
	<CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
	<CAJTo0LZR4BjQYHPfaBtGpDe9Oi1qTuv=wAvhCkQ6EtfNkuLKtg@mail.gmail.com>
	<CAGiJk9ca7C5UWwLW0GTsiqSxH=TjOHfQ_bd4L9YgiKW+151cuw@mail.gmail.com>
	<CAJTo0LaEiSg-V_kFPLMVDfz51GunE97JwPUHTDW_WWjCXoPOaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaEiSg-V_kFPLMVDfz51GunE97JwPUHTDW_WWjCXoPOaA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 15:59:05 -0000
X-Groupsio-MsgNum: 34376
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 03:37:09PM +0000, Burton, Ross wrote:
> On 24 January 2013 15:30, Samuel Stirtzel <s.stirtzel@googlemail.com> wro=
te:
> > There is no reasoning why to change the _default_ so that others have
> > to change their image rather than you have to change yours.
>=20
> core-image-minimal needs to boot to multi-user.  core-image-sato needs
> to boot to graphical.  This isn't a "we'll make this change, screw
> you" situation

I think the point is, keep default default.target for images where it's
OK (gui or warning) and change default.target to something else only for
images where it matters (nogui if you care about warning).

Changing default value by patch in systemd recipe and then setting
default value back in many image recipes doesn't look sane.

> oe-core itself needs to be able to select the default
> target, and I'm not terribly happy with a warning on every boot that
> doesn't happen to involve a display manager.

Yes there needs to be easy way for image to say default target, just
don't change default value in systemd source.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEBVp0ACgkQN1Ujt2V2gByK5QCfQY42NEw/4qbgteP3J2fbMxH+
TecAnj1baZuPAFPA5rWUvBNA0L0qAEXR
=LKq5
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
