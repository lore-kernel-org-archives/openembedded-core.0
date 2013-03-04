Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCU8V-0004Gk-Fj
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 13:04:57 +0100
Received: by mail-pa0-f41.google.com with SMTP id fb11so3144525pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WHdkLoIG5sdkD7fUj1wz5CPCQ6NXP4sKTfNtYWigc74=;
	b=WOB+MgWdnfG0sF8cB3C8EKJl8Wk2tIgDtF5dWC2jI0W+EF4J7tUmKrCycDvCokZGbF
	eFaP9kK/jnF1RursFc6x7jLaOi4efpNcSHtPbdzYWdArVxyFcaRuXfivYs5kHzyksVKR
	J5H3ffSYmKRWrG+Nw+79FnA1+Skv8ByT5Y4vYEgtvge6pgJFw8cQzdgqJQz7ljenIA7g
	UoCg0XydHSPZ+rb6gBInPqVoy1EPZs8a9DuhAJPsTupbZcb3woMwp/OhZ9Ur60HBPnjJ
	8xAodfGyTaF5GCONaMBJ5Pz4ws2EO1DP+r3aNDghRq2EOyTfy2yHr/w0FvWX/22s/YF7
	kKKQ==
X-Received: by 10.68.178.132 with SMTP id cy4mr6384435pbc.208.1362397707167;
	Mon, 04 Mar 2013 03:48:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	qb10sm22072576pbb.43.2013.03.04.03.48.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 03:48:26 -0800 (PST)
Date: Mon, 4 Mar 2013 12:48:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130304114815.GH3268@jama>
References: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
	<CA+chaQe3c3aYV6xEYsScoMWTMexe9rR4UiKCAszTjG-xrad59Q@mail.gmail.com>
	<1362394572.29587.10.camel@ted> <20130304111337.GG3268@jama>
	<513487B9.8000502@intel.com>
MIME-Version: 1.0
In-Reply-To: <513487B9.8000502@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: consider postinstall dependencies too
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
X-List-Received-Date: Mon, 04 Mar 2013 12:04:58 -0000
X-Groupsio-MsgNum: 36186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline

--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2013 at 01:38:33PM +0200, Laurentiu Palcu wrote:
>=20
>=20
> On 03/04/2013 01:13 PM, Martin Jansa wrote:
> > On Mon, Mar 04, 2013 at 10:56:12AM +0000, Richard Purdie wrote:
> >> On Mon, 2013-03-04 at 11:51 +0100, Martin Jansa wrote:
> >>> Shouldn't this list be defined in layer.conf like
> >>> SIGGEN_EXCLUDERECIPES_ABISAFE, so that other layers can extend that
> >>> list?
> >>
> >> I'm hoping we only have very small list of these problematic
> >> dependencies. If we end up with a large number of them then yes, we'd
> >> need to abstract it but I'd prefer to avoid that unless proven
> >> necessary.
> >>
> >> Is there a specific case you have in mind?
> >=20
> > Isn't systemd-systemctl-native another candidate to be included?
> >=20
> It looks like it should be in the list... I'll resend a new version.

what about all u-a-native implementations?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE0if8ACgkQN1Ujt2V2gByamwCgncmxRbM+58GD7IK16Ytr/Isz
yJkAoJBkIfDr4KmtoefxGGmQIHzlCZp3
=1TOP
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--
