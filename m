Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id B473470330
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 03:07:48 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so3381144wiv.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jul 2014 20:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9Jgozm/j3ijpZc7Tul+sCKy01in90lsGmehtsfN5aEM=;
	b=0WR1vSWfT9uOGtEagk3yCemy/DwNvN8IKOFNypbdH+EuHEEyhwCDIXFQCyUdc66LJe
	oRHaOJnJDuHduRPGmWDwIDFRJPVvfJTrWrBRO/1UCcs3QRpwqtnYclarBF9bi0shrD7m
	M8cb033vtuzjXYOn1LX0FEn2r3/2FIWAvZFSdGp+aACh6054G5IaL/isz5pr6Jn2NZ57
	q1eadX1ua2J+64UcfSFPQyDc3/LTOTq8djzUFXvO06e4Hyf5O2R1NmnDmqMtWjoQdB/U
	9qBvNmR8fBMF+UPrzVcgdMD7UPMluB5OeNyBDYklvLVd0nrQ4j8xzOv8BXQdQKVhgcBq
	Ur5Q==
X-Received: by 10.194.186.178 with SMTP id fl18mr18059492wjc.83.1405912069810; 
	Sun, 20 Jul 2014 20:07:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	20sm34128835wjt.42.2014.07.20.20.07.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 20:07:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Jul 2014 05:08:03 +0200
To: Jate S <jatedev@gmail.com>
Message-ID: <20140721030803.GI22875@jama>
References: <1405349203-32702-1-git-send-email-jatedev@gmail.com>
	<lyzjgchs81.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAPphmgYUX828A=6SayztArEdU9L-=Hhfkw2w3mRw1ka_AmCWsw@mail.gmail.com>
	<lylhrviyfo.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAPphmgZhVbj-Fb+XOL3p4bUVa_T0=AZnYuxetWPYqV5ZeUjNww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPphmgZhVbj-Fb+XOL3p4bUVa_T0=AZnYuxetWPYqV5ZeUjNww@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python2: Add PACKAGECONFIG for tkinter to support tk from meta-oe
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
X-List-Received-Date: Mon, 21 Jul 2014 03:07:52 -0000
X-Groupsio-MsgNum: 55246
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FxlYARId5dseejUu"
Content-Disposition: inline

--FxlYARId5dseejUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 09:01:05PM -0400, Jate S wrote:
> The presence of the tk library determines whether python's compile
> task will build tkinter. Then the presence of python-tkinter in
> IMAGE_INSTALL will then determine whether it is installed.
>=20
> In the absence of tk provided by meta-oe, the python recipe will
> install an empty python-tkinter package.
>=20
> I cannot think of a cleaner way to do this right now. Ideally the
> package python-tkinter could trigger a python DEPENDS on tk...
>=20
>=20
> Martin, you originally suggested the PACKAGECONFIG. Do you have any
> further thoughts on this?

Richard just submitted patch to explicitly disable tk, extend the patch
to make it configurable and use this new option from PACKAGECONFIG

http://git.openembedded.org/openembedded-core/commit/?id=3D53ae544cfdac22c8=
2af452b8c7ebe6664296bd9b

>=20
> - Jate S.
>=20
>=20
> On Mon, Jul 14, 2014 at 2:32 PM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
> > Jate S <jatedev@gmail.com> writes:
> >
> >> Python 2.7.x does not use an explicit configure option for tk support.
> >> Instead, it tries to detect the tk and tcl libraries before compiling
> >> python-tkinter.
> >
> > Your patch does not solve the issue of non-deterministic builds.  When
> > tk was added by some other way, python will get tkinter support although
> > PACKAGECONFIG was not set.
> >
> > An idea to make build deterministic might be patching of detect_modules=
()
> > in setup.py to add disabled modules to 'missing'.  E.g.
> >
> > |             missing.append('_tkinter')
> > |
> > |+        missing.extend(os.environ('OE_HACK_MISSING').split())
> > |         return missing
> >
> > Probably there are better/cleaner ways but I am not familar with python
> > distutils.
> >
> >
> > Enrico

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FxlYARId5dseejUu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPMhBMACgkQN1Ujt2V2gBwjtQCgryhE3S20PtWcqCWjnK1b21qz
/8IAn1CS6pYXngQ0M5kLTI36s3ccN+/5
=OB1T
-----END PGP SIGNATURE-----

--FxlYARId5dseejUu--
