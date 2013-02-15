Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6VCd-0004nx-97
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 01:00:27 +0100
Received: by mail-pa0-f44.google.com with SMTP id kp1so1977856pab.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lO92Vu1rC5r/2Gv6K1SXUs0T7iSd6zd8gKym1KoUdJU=;
	b=ZxcvQaZdZ1JiLOO6CfQPGhfxUrIzoKY6IZTLwJ69TwPuuQ5doaXwrEQUG6y8zdhARx
	AM6xey+CkYr8Ddk0F+RTLiYSmrxwFAtX4cEmAF+D1GVt920apcscnAjtO33iqiVtk8ui
	7A42WShSxWlK4SCTNHG/2wlcLPmD4x8OlFhAVXskN9jAHYHBSyUkRZ8auWvquZEBSO1c
	knW3pOYFbVOFPnaDGDn9QVMnMUQrhyDzOnsR1+KBIwn2Z3jz00nO+n3/ph7yigRAgVFe
	I3wUZFpaqtN08dOzPki67I7dbKg87YJaDkXidQUjSXH5BJgqVpVY0F9JOCBFvxD9PJ7a
	ieTw==
X-Received: by 10.68.31.73 with SMTP id y9mr10016922pbh.102.1360971862202;
	Fri, 15 Feb 2013 15:44:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tp2sm6085910pbc.12.2013.02.15.15.44.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 15:44:21 -0800 (PST)
Date: Sat, 16 Feb 2013 00:44:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130215234419.GQ3300@jama>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKocKGhHrnqEsrgaiRPkw5qs5P_X0TxBJR0NnLy1cFdjJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKocKGhHrnqEsrgaiRPkw5qs5P_X0TxBJR0NnLy1cFdjJw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sat, 16 Feb 2013 00:00:27 -0000
X-Groupsio-MsgNum: 35508
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zywvytGCXzdVpkje"
Content-Disposition: inline

--zywvytGCXzdVpkje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 04:47:37PM -0200, Otavio Salvador wrote:
> On Fri, Feb 15, 2013 at 4:19 PM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
> > Hello,
> >
> > it would be nice when the decision to make the init manager a distribut=
ion
> > feature will be reverted to the old oe-meta mechanism.
> >
> > Being a distribution feature means, that packages are created in such a
> > way that it is impossible to split off unwanted and heavy weighted
> > functionality at image creation time.
> >
> > E.g. on most of my systems, I create two kinds of images: a full
> > featured, systemd based one and a very minimal rescue system with
> > busybox and some filesystem utilities.  With recent systemd packaging
> > change, the rescue image size grow up from 5.9 MiB to 27 MiB because
> > systemd dependencies are hardcoded in mandatory packages.
> >
> > Formerly, systemd dependencies could be avoided by adding the -systemd
> > packages to BAD_RECOMMENDATIONS (e.g. due to busybox-syslog ->
> > busybox-syslog-systemd rrecommend).
> >
> > I am aware that initscripts were always part of the main package.  But
> > sysvinit was very lightweighted and the extra space either negligible or
> > easy to recover by removing some files in IMAGE_PREPROCESS_COMMAND.
> >
> > Hence my recommendation: make the init manager an image feature again
> > and create -systemd and -sysv packages with the corresponding scripts.
> > OpenEmbedded is still for embedded devices where size matters.
> >
> >
> > Of course, systemd can be still a distribution feature to enable things
> > like socket activation as part of PACKAGE_CONFIG.  But dependencies on
> > init system packages should be RRECOMMENDS which can be overridden
> > easily at image creation time.
>=20
> I fully support this! I also want this flexibility back (in fact I see
> no reason why it has been dropped).

me too

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zywvytGCXzdVpkje
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEeyFMACgkQN1Ujt2V2gBxz3ACgrQ5cHxU8XbzECjal+TL8Ejjp
OooAnikEYfhHuwxbgofEVuG3SK0L0FaH
=8W1v
-----END PGP SIGNATURE-----

--zywvytGCXzdVpkje--
