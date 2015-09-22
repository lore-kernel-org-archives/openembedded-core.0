Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8049773243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 13:17:35 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so161087917wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BA1DC9YJT8uc6xfYyQDQkIt7O/3EfAiMMCrUCSlFows=;
	b=T5YThaVizAWV6swd+S41dNFWN570yD5iV7SKMoJG+V+/u60IsyeuJtxMTAJt4Tk+hg
	EfX+qRuC5OV+KA0EkDGoFnQxKYKGF6IvktaLrbQjqQRXJ2jsWUgZ47MkDEONIKEwz7ey
	GOyyzjE/Tn4YVpHvCfNJxzX6ewzC46pXxx5AU8KJQQCfSPDEsDHJEUBwIvIT++YOk156
	eOFOTWe2s1rT6iEK9PRpBd3kUbq7fidV416Cb6lmyOf6hOcS5MIRZ96HJrxdFhoVYajc
	QWBjeqixE1WAmI3/bmyXCuptVpB/Qo8uS0FPASxq9P664Ns/gPaPHmOwxpWNFyVwQ3nq
	OAoQ==
X-Received: by 10.194.75.169 with SMTP id d9mr28627130wjw.7.1442927855843;
	Tue, 22 Sep 2015 06:17:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm1849592wjb.29.2015.09.22.06.17.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 06:17:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Sep 2015 15:17:38 +0200
To: alexander.kanavin@linux.intel.com
Message-ID: <20150922131738.GA2388@jama>
References: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
	<560029CB.6050006@linux.intel.com>
	<CAJTo0LaJFQozfE1gaXvdEBR=ioCB7GR425_TDJaiVE1E9UnuXA@mail.gmail.com>
	<58887.10.252.48.86.1442920356.squirrel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <58887.10.252.48.86.1442920356.squirrel@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: add REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Sep 2015 13:17:36 -0000
X-Groupsio-MsgNum: 71424
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 02:12:36PM +0300, alexander.kanavin@linux.intel.com=
 wrote:
> > Remove x11 from DISTRO_FEATURES ("I'm building a product that doesn't n=
eed
> > or use X") and build webkitgtk.  webkitgtk depends on libxt which depen=
ds
> > on libx11 which then refuses to build because you explicitly said you
> > didn't want X.
> >
> > We're adding required_distro_feature annotations as required so that wo=
rld
> > builds without X11 enabled still work by skipping the recipes instead of
> > failing to build.
>=20
>=20
> But this means you need to add this to every recipe that directly or
> indirectly depends on libx11. Which is crazy awkward and error-prone.

And was already done:
http://git.openembedded.org/openembedded-core/commit/?id=3D78d269fa9a586e24=
ef058ba5315c696f15935f56
http://git.openembedded.org/openembedded-core/commit/?id=3Dbc4d051c2fa56acb=
0479330b4342a39396de30d4
http://git.openembedded.org/openembedded-core/commit/?id=3D8764282a06fa5f75=
71c479a5b3b35c7baaad241f
http://git.openembedded.org/openembedded-core/commit/?id=3Dfda535d5b5239b09=
1c79e957f68a45d4eab0ab5d
http://git.openembedded.org/openembedded-core/commit/?id=3D1cf0245344ce272e=
7330cfe1b04a0ed7bd18e8f5
http://git.openembedded.org/openembedded-core/commit/?id=3Dfa1d9b518708103b=
0b2e259aa78f8dd694cfc0d6

and it's not so error-prone, just call "bitbake world" in DISTRO without
x11 in DISTRO_FEATURES and fix all the ERROR: messages at the beginning.

> Why can't the tools figure out which recipes should be excluded from
> builds without explicit annotations?

See discussion around this change on ML and please don't remove stuff
just because you don't know/remember why it was added without at least
using "git blame" to read commit which introduced it.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYBVPEACgkQN1Ujt2V2gBxvxgCeMG3DHoidHJRfeP6P79FiTH65
s2kAoLHT8/qMB0ABSADNZKCbu73pNDzF
=ysiR
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
