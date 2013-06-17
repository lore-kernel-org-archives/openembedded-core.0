Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id EE4DD6098F;
	Mon, 17 Jun 2013 03:25:28 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so1474792ead.21
	for <multiple recipients>; Sun, 16 Jun 2013 20:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A/q9o7F8H+fuI/xOdbtrYe+xteu993OdYCpW2rHrzEI=;
	b=WBuWh0BRo5v/OwAauNqNMIJl6gKDCy8YW/7aGiYKEy/JXV+YQareXRYfzkkDvt/SVh
	Ip+9q4r3leUjbtAfbwui4p8qMFxAZ+i8KGqCYVd9k0JLCnGLC6/b5Pcv3yYeNDjW0Et/
	vP2K34L3t02xIOzL52C1SZVcXx6r50gL4TN6XPTpLPwStEGk3rYs5G4/X7l7Xd3DHiIO
	ev/+mizg8uamRyNMvrTmAeuCqrKmdpSbZ5hA/DDvVqGQ6Bfwez+DWA1B5Twdex5SZ/bM
	FqxFmuQpPH0XfPot6tP/OuuZU8xud0oHuhjaFHFwvJ0R5QH6EUIpeTPkzxmpgnRGWkci
	Q+Mw==
X-Received: by 10.15.22.3 with SMTP id e3mr14438843eeu.27.1371439529467;
	Sun, 16 Jun 2013 20:25:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c5sm20557634eeu.8.2013.06.16.20.25.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 16 Jun 2013 20:25:28 -0700 (PDT)
Date: Mon, 17 Jun 2013 05:25:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20130617032551.GB14021@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
	<CANyK_8dActF1_nuvK29WMdr-Kh1DONoRXB2YMXqVj89AKmEWYg@mail.gmail.com>
	<CANyK_8c6qZ2cS1MdoLocVw5rEyTyKjXY525Prfhcp4R5pnq4dQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8c6qZ2cS1MdoLocVw5rEyTyKjXY525Prfhcp4R5pnq4dQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 17 Jun 2013 03:25:29 -0000
X-Groupsio-MsgNum: 40629
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2013 at 01:13:45AM +0100, Paul Barker wrote:
> On 17 June 2013 01:02, Paul Barker <paul@paulbarker.me.uk> wrote:
> >
> > samba: builds for me, I'm not using gcc-4.8 though
> > packagekit, gypsy, omgps: Reference deprecated/removed functions in glib
> > tk: tcl is version 8.6 in openembedded-core so can't build tk 8.5 anymo=
re
> >
> > I'm currently playing around with upgrading packagekit to a more
> > recent version, will see how I get on. I'm busy with other work at the
> > minute and openembedded work is just a side project for me so it may
> > take a while...
> >
>=20
> ... and just saw that Khem has posted fixes to most of these,
> including packagekit, that just haven't been committed yet. Is it
> still worth me trying to update packagekit or is there somewhere else
> my effort would be better spent? I'm just looking for interesting bugs
> to shoot at the minute...

jenkins probably finished building them, but I wont be able to send new
status or push them for next couple of days as I'm online only from
phone over quite slow gprs.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG+gb8ACgkQN1Ujt2V2gByQ5wCgspreYsDH2SugjO9rjUQV8CB2
OacAnj+0IZw/JMdoD5BjMVgtS1rTnpou
=o/1e
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
