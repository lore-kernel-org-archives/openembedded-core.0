Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F98560853
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 09:03:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so14767090wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pdwtaus1yTtFmkr5sh/T6Jp1rrGqQAOzhqrR8jri15Y=;
	b=FVRqJeoAczB+JUgDShlL1lLJ9+phjv1olw9snWgsSZJ+To0A4o3iGMphU0cKnKzeLY
	/meAB84mrR48gTGaTKgOoXnCivZ2yTeblWILlU7cKShlo1kKdCYe04Hbkn2LhL/meUjf
	i8HIs/joVbNfkHgyqegdMb9brQGEG3o2CjTiCltB6NAsyh92yRD+m/IkOyMb1rQKJwd8
	5CS8zJvRI51V7i/vI3koCmOYJvD0wKFSbQgll72zFlHd8z1L1yuMvu8rdgva1HkhIEzM
	KqzZhmAnZCv3turzGhTKTZbHLTovTpKHNMH6WJhsb/prweEDN+LM0uWykeveikK64OU+
	1x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pdwtaus1yTtFmkr5sh/T6Jp1rrGqQAOzhqrR8jri15Y=;
	b=T77GwYb7yDWg6tIhtVwCWxBS2Zffo42O4CSs33tW62aE2Y9H0nA9Wfmw9Y9mvqsLis
	AJFudn5Y2p0FgFecw0JEtvqzxMgHerDcbt0fQrw74qH7l0ntjNlP8AzGD8gv+ecqvqbx
	UGCh4p3JIzAeNQXlXVbc5mkQw5tQSdpmKoixaqG3bQe7rS9pzWXPnj6byV/arTrzWk8n
	0dGgRRoMRyQ6zWjmL3CMg2sjYLq8yppUZoH7uIYKEsw67ZppFP18IfKVm3pCDbZdzS5R
	tSmXzLPK0bEfNa0wxbwLkgm4F+zzXPJZFJ4idcSa5GY6IBFiH8NEoOsqzXYjvbgr7OCg
	/tNw==
X-Gm-Message-State: AEkooutnkXkNr7ybkLlawPzu0o3icSwagTZMt8xI3FM+Y1xFp9OgRJFBa4O0ji9fyzxIew==
X-Received: by 10.194.148.202 with SMTP id tu10mr37789382wjb.56.1469782997180; 
	Fri, 29 Jul 2016 02:03:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	r16sm1992082wme.16.2016.07.29.02.03.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Jul 2016 02:03:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 Jul 2016 11:03:19 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160729090319.l2pqblhci76aqgvx@jama>
References: <20160708085912.13734.77555@opal.openembedded.org>
	<20160708085918.3A528501B3@opal.openembedded.org>
	<20160724121138.i7fp26ateflny4kl@jama>
	<CAJTo0LZmRoRqmHeCuNbQptBvM+Z46oQPPVsYXneeGmRK7P1V6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZmRoRqmHeCuNbQptBvM+Z46oQPPVsYXneeGmRK7P1V6w@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 21/28: rt-tests: move ptest to python3
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
X-List-Received-Date: Fri, 29 Jul 2016 09:03:19 -0000
X-Groupsio-MsgNum: 85100
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p6r66b7j4ecntcrk"
Content-Disposition: inline

--p6r66b7j4ecntcrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 09:17:13PM +0100, Burton, Ross wrote:
> On 24 July 2016 at 13:11, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Any idea why it fails now like this:
> >
> > http://errors.yoctoproject.org/Errors/Details/73086/
> >
> > ?
> >
>=20
> I've just sent a patch, can you see if that helps?

Thanks, worked

http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124488.=
html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p6r66b7j4ecntcrk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlebG9cACgkQN1Ujt2V2gBwC2ACggkakde9NsRq3U5t3mdoTmrHo
zysAoLGvScjd0NCvTXWqL+9xF9eGD022
=rIfE
-----END PGP SIGNATURE-----

--p6r66b7j4ecntcrk--
