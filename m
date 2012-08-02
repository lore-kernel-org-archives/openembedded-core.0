Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sx1Hf-0000zx-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 21:42:11 +0200
Received: by wgbdr1 with SMTP id dr1so7433899wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 12:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FMPnrQEYy8MHdF7faOk3cTeGOCuoe80Hcf0vayxcd4w=;
	b=ePRqqhXxW9uGZBNo2ajOSK4t3nslJYcbnLLCKTMlTqCcgVKRBCTuUS2KX4nJL1M2Yx
	klClo8qFJCtGjXrx3OWir8ZuMzK8yY+uCKDRFywPpMGundrKRRP6ncm6LMgX+At5rZPO
	Iv5R/M9kPSPBQFq9L2/UrsxgsmlFekXGKyxX+oc25IWKghQfGl9g1o1GzhsBDVsIt475
	DYu1IgtRF+epzsiI++i+GPXMGg1f5ZAck4FgROUO+2L1pzCa/1/Sy4RMUta7luM4/+Mt
	L/oE077IosjuMtPzAbiSzkSNRzaoczWQxYCKpCJy6AzHbuqjlnhZFrOmzi5Kn8wv2OYc
	GeeQ==
Received: by 10.180.92.9 with SMTP id ci9mr7091558wib.22.1343935831574;
	Thu, 02 Aug 2012 12:30:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm35232402wib.8.2012.08.02.12.30.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 12:30:30 -0700 (PDT)
Date: Thu, 2 Aug 2012 21:30:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802193028.GZ16306@jama.jama.net>
References: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
	<CALbNGRTJFg7yWMDEs9tF7VijLAgxGA178qasUYuh=Z_ky+CpXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTJFg7yWMDEs9tF7VijLAgxGA178qasUYuh=Z_ky+CpXA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: pango modules postinst issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 19:42:11 -0000
X-Groupsio-MsgNum: 26834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MzUyxqdXrKJm2YZW"
Content-Disposition: inline

--MzUyxqdXrKJm2YZW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 09:23:52PM +0200, Andreas M=FCller wrote:
> On Tue, Jul 31, 2012 at 5:01 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > Hi,
> >
> > sorry fur disturbing again - but:
> >
> > When starting X on a maiden image I receive:
> >
> > No builtin or dynamically loaded modules were found.
> > PangoFc will not work correctly.
> > This probably means there was an error in the creation of:
> >   '/etc/pango/pango.modules'
> > You should create this file by running:
> >   pango-querymodules > '/etc/pango/pango.modules'
> >
> > and have no fonts displayed. Followed the suggestion
> >
> > pango-querymodules > '/etc/pango/pango.modules'
> >
> > -> fonts are OK.
> >
> > I checked: Besides other pango modules my image contains
> > pango-module-basic-x. In the postinst of this package I see
> >
> > #!/bin/sh
> > if [ "x$D" !=3D "x" ]; then
> >   exit 1
> > fi
> >
> > if ! [ -e $D/etc/pango ] ; then
> >         mkdir -p $D/etc/pango
> > fi
> > /usr/bin/pango-querymodules > /etc/pango/pango.modules
> >
> > This looks OK so far ( besides that I would not have the $D in second p=
art ).
> >
> > Additionally log.do_rootfs says:
> >
> > Configuring pango-module-basic-x.
> > pango-module-basic-x.postinst returned 1, marking as unpacked only,
> > configuration required on target.
> >
> > Any idea what is happening here?
> >
> > Andreas
>=20
> Nobody else seeing this?

I do. Already got ticket about it
http://www.shr-project.org/trac/ticket/2045
but didn't have time to look into it

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MzUyxqdXrKJm2YZW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAa1VQACgkQN1Ujt2V2gBzjbwCfYT/u2JA5P2UwHhkIquGn6S5v
9XkAoIdM8XhMANLg7sy7Mu3OZQO6fbXd
=UGz0
-----END PGP SIGNATURE-----

--MzUyxqdXrKJm2YZW--
