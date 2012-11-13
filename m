Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYBPv-0001u4-7i
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 09:00:21 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so2610040bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RwXRdaH7BDZssgQMnyBMgzykM5hGm/wc5VGlscWZcOc=;
	b=INLvQecwOD+ltcmGrkdm/K3e4+1EJzUuv4cvu+Wp3052FIxS4DF1vQpqcGFTmMxkje
	6gTF/+uj8B5t2YK/G0IRsHIqvX32UtIU/2h5isIyq6juCx6MLR3ipJ0b/B8cc8QD/fP7
	+j63n+mYbyqw45Te2c3bl+jCzfiaKNw19LUAT3Jbz3KoxD1F9TgT21EDah6yxOt8b2wz
	CUou3KUKlN9RqyBnfJwM7hRAveecslpD/Tp+s2A2IdWvbD6ZHEDXrdekdFWTuGuksYON
	hMwAdlHZfN1+3wnFDKV0lf3kcLw9I+0xLpHhxGUZdl6gsm5DOmOGZasi+T6RQADLit6V
	vkbw==
Received: by 10.204.0.71 with SMTP id 7mr7674271bka.102.1352792781117;
	Mon, 12 Nov 2012 23:46:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gy18sm4581330bkc.4.2012.11.12.23.46.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 23:46:19 -0800 (PST)
Date: Tue, 13 Nov 2012 08:46:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
Message-ID: <20121113074630.GB3928@jama.jama.net>
References: <1352732608-9517-1-git-send-email-ross.burton@intel.com>
	<CAPj87rPgLqsH08iE3n75b-NmN1jrePnhT3agfRnZiLUCNtgmDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPj87rPgLqsH08iE3n75b-NmN1jrePnhT3agfRnZiLUCNtgmDA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: fix --with-glut check
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
X-List-Received-Date: Tue, 13 Nov 2012 08:00:21 -0000
X-Groupsio-MsgNum: 31226
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 11:25:21AM +1100, Daniel Stone wrote:
> Hi,
>=20
> On 13 November 2012 02:03, Ross Burton <ross.burton@intel.com> wrote:
>=20
> > The GLUT check was automatic and couldn't be disabled, so mesa-demos wo=
uld
> > gain
> > a GLUT dependency if it was present when built.
> >
> > So, fix configure.ac so that --without-glut works as expected.
> >
>=20
> Has this been sent upstream?

See Upstream-Status header in patch

Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=3D=
57013]

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCh+tYACgkQN1Ujt2V2gBxmqwCfSCRvIpxUXW3OL8a+rrbFzx1f
g1QAn0uh7TbdfvSeosRtQXWZN2eRgIuh
=iib9
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
