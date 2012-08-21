Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T3tN8-0003lp-J2; Tue, 21 Aug 2012 20:40:14 +0200
Received: by weyr6 with SMTP id r6so73191wey.6
	for <multiple recipients>; Tue, 21 Aug 2012 11:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dnrp3aaTTz3F0TYZp3Ldu4oi0QWPVTLqX4bYUDpolgc=;
	b=rEJX5lcPuM8tSwyPnGy9mAcCzKh+nU8HWOyZ+42q26CD+GfV1Hj/MqOPbPWPa2ko0a
	2hf+kCyIgYU/UZcJChHCjwXqDz+lVpYyK7j6JTPabldCXDpENT4K097aGw+7v8cZjNpY
	K6vq0h8ddF8AX+1QFBolGFX5G8vd+GGc1IuYGifA0Vl6dmPA+IfklK0pIO/xcddUnrtE
	EmU5tBoxs+nEIlIPYrK5HbM16sA9AtAUzH+vfsyR7GqglGRVoa2rkXFdczbt5mj4TF7v
	01Npt7pmcPY3wov/cJsivX4WyFH1F+TFSPTDO1LHnB71RY29rPu7r/alx3xDtXLuQHaV
	IkRw==
Received: by 10.180.96.3 with SMTP id do3mr41140989wib.5.1345573690613;
	Tue, 21 Aug 2012 11:28:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm5947764wix.5.2012.08.21.11.28.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 11:28:08 -0700 (PDT)
Date: Tue, 21 Aug 2012 20:28:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120821182813.GF3029@jama.jama.net>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<20120821121850.GD3029@jama.jama.net>
	<CAMKF1spWTYExCcvQ9Uqo-470Qxb2NTwB_xYHhU7RzFOuiYP_VA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spWTYExCcvQ9Uqo-470Qxb2NTwB_xYHhU7RzFOuiYP_VA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: yocto@yoctoproject.org,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Toolchain rework, call for testing
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
X-List-Received-Date: Tue, 21 Aug 2012 18:40:14 -0000
X-Groupsio-MsgNum: 28004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline

--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 10:15:47AM -0700, Khem Raj wrote:
> On Tue, Aug 21, 2012 at 5:18 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > Maybe it's because
> > http://git.openembedded.org/openembedded-core/commit/?id=3D30617bde61a3=
b0a0944b49a0c9fb7159dacbb19f
> > is missing PR bump and gcc wasn't rebuilt before eglibc upgrade (OEBasi=
c not OEBasicHash here).
>=20
> yes seems so. I have stopped using OEBasic long ago, you should stop
> using it too.

I'm using OEBasicHash on one jenkins setup, but that one is still
building changes from 2 days ago.. (building 24/7.. )

> But feel free to send a PR bump patchlet.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAz0z0ACgkQN1Ujt2V2gByr1QCgqAdGqRvm6A1h1bp3OoHSpsXk
4l0AnR74WsFFVNl66jvfm58umvk0bWeG
=x8AF
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--
