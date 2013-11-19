Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id E86466D000;
	Tue, 19 Nov 2013 18:51:52 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so2633347eak.18
	for <multiple recipients>; Tue, 19 Nov 2013 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=srVIMvoBq6Mfz0EaxAki786jmIUVl7p4S2TjFNw0i+g=;
	b=pHPmMmFghlZPiHfAaYioT6DMqSiU5+sMCLIWnhZCFFskHRk63TuQoW3ejKjjv/bfHA
	gh+iwzlPHZ+o9Uh6xp2mqATHogG3QUvOQoekWCECOyDiidEQZJ0cf9THGv34hIn+ZQ5/
	/TaYs5P6t5lbNcfaF/R1xRCQwtTYRFSMJKoXnStIQvs2aO+YpEQpy1byZDCqsf6Am+e7
	s1ENETB0ZwSDh4apbcQrZ6zjO/AE4j5K9ZHWgXGrmc1B633uoxvqH7LoZVW40jNlN21d
	v8pWYYe5l5krRkeoJFwPQkGuE1GFH2vAEhZA7ra7xI7yUZ0V1kKpMktAarzEST2atTcU
	OysQ==
X-Received: by 10.15.34.5 with SMTP id d5mr22247778eev.20.1384887113124;
	Tue, 19 Nov 2013 10:51:53 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g8sm51550523eep.20.2013.11.19.10.51.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 10:51:52 -0800 (PST)
Date: Tue, 19 Nov 2013 19:51:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131119185154.GH3708@jama>
References: <20130611160434.GI3233@jama>
	<CALbNGRR=RixaPbdqW4P2YQ-EH=vu3Ni-2zvOhKSDBo=RCTA52A@mail.gmail.com>
	<20131119182012.GE3708@jama> <2322495.JISmJUGcVm@helios>
MIME-Version: 1.0
In-Reply-To: <2322495.JISmJUGcVm@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 19 Nov 2013 18:51:53 -0000
X-Groupsio-MsgNum: 47296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline

--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 06:36:41PM +0000, Paul Eggleton wrote:
> On Tuesday 19 November 2013 19:20:12 Martin Jansa wrote:
> > On Tue, Nov 19, 2013 at 04:59:19PM +0100, Andreas M=FCller wrote:
> > > On Tue, Nov 19, 2013 at 4:50 PM, Martin Jansa <martin.jansa@gmail.com=
>=20
> wrote:
> > > > On Thu, Oct 31, 2013 at 12:08:25AM +0100, Martin Jansa wrote:
> > > >> Starting now I'll use
> > > >> http://openembedded.org/wiki/Bitbake_World_Status
> > > >> to post results from my bitbake world buils.
> > > >=20
> > > > It was updated few times since this e-mail and I've received no
> > > > feedback.
> > > >=20
> > > > Should I continue to post them or nobody except me is really intere=
sted?
> > >=20
> > > I am interested but would prefer some short information as mail like
> > > in the past because prefer events more than polling.
> >=20
> > OK, I'll continue to send summary to list as well.
>=20
> Would it be possible to send the summary as a new email e.g. "state of bi=
tbake=20
> world for <date>" instead of attaching to the existing thread? It might b=
e a=20
> bit selfish, but surely I can't be the only one whose mail client will dr=
edge=20
> up the entire thread under today's date...

Sure, it will be easier for me as well.

I was trying to always reply on previous report to see if we're
improving or not, now with "history" in wiki it doesn't help much, so
I'll be starting new threads now.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKLs0oACgkQN1Ujt2V2gBxJ3QCdETOTpwb/HA5lOI4+A/PJNQNO
GgYAn0fQAW8F9sA2IWme3YHMOakvAR2w
=gj/R
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--
