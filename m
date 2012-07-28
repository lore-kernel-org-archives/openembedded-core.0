Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvDjv-00040i-3l
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 22:35:55 +0200
Received: by weyr6 with SMTP id r6so2549084wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vFDxU/tK09DggDK/1Kajg8ex11nfs+Ix4hqdywV7FUM=;
	b=HS/i/dhthoXY/zlK+TCW8pBZOtJEMZ37MjcXP/TOORoeqBWlWEX7WfuYDX663fWQgk
	d+vCY/3y3ePk2qYb6WQGlXPaRoM1kJQSNjzPs6AWNNqJ5D/7GPVJGNNKbdi/WbYESiQt
	bKo20HXdPfuWETa9os6hX+Sm9C2tg8ZTKO57cQEZyXR2Y98dOXs+A4Yukm3ZTLm7gquN
	6KXdh3/+qRr1s0YYPIUnGywovpYWJEFdVRbJHL4rNUDOGAftf0pVwxb65g0/BzZfPQnq
	fvo/Jq53GsrD26By5GAFSIxGrHBQPS72VXpqmk9Dpdy5bonrJrzlUnDdBQdkglm9KomB
	BGnQ==
Received: by 10.217.2.146 with SMTP id p18mr3401089wes.224.1343507061686;
	Sat, 28 Jul 2012 13:24:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm9315663wiz.11.2012.07.28.13.24.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 13:24:20 -0700 (PDT)
Date: Sat, 28 Jul 2012 22:24:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120728202414.GA3261@jama.jama.net>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
	<4d738395bf7cd05c924a9facf9677bab784cb1b6.1341763346.git.raj.khem@gmail.com>
	<5013C1BB.9020504@communistcode.co.uk>
	<CAMKF1spLQ5M7fpjninE_Gbyq=faW9V0psMN1Hb9NZKfXGDTMBg@mail.gmail.com>
	<5014425C.3090506@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <5014425C.3090506@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 08/19] bison: Fix for gets being removed from eglibc 2.16
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
X-List-Received-Date: Sat, 28 Jul 2012 20:35:55 -0000
X-Groupsio-MsgNum: 26439
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 08:49:48PM +0100, Jack Mitchell wrote:
> I'm not sure quite what you mean by pre-processed output but here is my=
=20
> do_compile log which is where it fails.

He meant C source code after processing by preprocessor (-E option for
gcc), but it's not needed, see following patch.

The problem was that patch was applied only for target recipe not
-native which is failing for you (I guess you have (e)glibc-2.16 on host
like I do)

Cheers,

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAUSm4ACgkQN1Ujt2V2gBwFTwCeJfgQ3Oi6klRfgoJ5rI6fnQBy
8/YAnRGr7r7fMXNptFMr62Od70upyzza
=argp
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
