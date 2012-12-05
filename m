Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgH41-0007MR-IU
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:39:09 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2050151eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HIKQvPHvp9bfY+sfO/zQfzj9e+nufaaJPyLaCiseEeo=;
	b=gnVogZkd6YLu1dJ1U/Q9tm2bbupb8GkJzTzAHTeigsvBDv9SfISng+P22vl8VfRlfe
	5b3bx62z7tUIoHp6PlLiRbUjOqlh8UZ804MzdMUhLR+eGckjuAEta6QYq5eIcX94g/N+
	fyqYL7E//2EO6E7BNlm4fZ1VrTSbV8LCPSOjUM991kKpIGAzZebhhsRTTzDPthzETqJy
	P6r/1SwpPS8maCFpA0RaCk2EY6mEaPfyRphMZ2KwuLBozMq7kG5HFaqvI/iCBGrCEMFg
	JWt7BaZrg1h844fjSY2wu2dLKI7G+hiJqsAUhViyk1HHBFmvAx/HJ46LQkc5cohvEh8j
	q77g==
Received: by 10.14.178.7 with SMTP id e7mr61925003eem.44.1354721085704;
	Wed, 05 Dec 2012 07:24:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm9738192eel.17.2012.12.05.07.24.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 07:24:45 -0800 (PST)
Date: Wed, 5 Dec 2012 16:24:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121205152442.GC3396@jama.jama.net>
References: <1354716839.25268.105.camel@ted>
	<20121205144539.GA3396@jama.jama.net>
	<1354720793.25268.115.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1354720793.25268.115.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Switch to PR server model for PR bumps - 1 week
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
X-List-Received-Date: Wed, 05 Dec 2012 15:39:09 -0000
X-Groupsio-MsgNum: 32263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline

--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2012 at 03:19:53PM +0000, Richard Purdie wrote:
> On Wed, 2012-12-05 at 15:45 +0100, Martin Jansa wrote:
> > On Wed, Dec 05, 2012 at 02:13:59PM +0000, Richard Purdie wrote:
> > > I've made it clear we want and need to switch to the PR service for
> > > handling PR bumps. I'd now like to put a deadline in place for doing
> > > this, namely that I'm going to stop requiring PR bumps in patches as =
of
> > > 1 week's time. The TSC did discuss this and our conclusion was that we
> > > need to switch early in this release cycle to give time for any issues
> > > to get resolved. Now is a good time to do this as I think we're ready.
> > >=20
> > > There were a number of open bugs related to the PR service[1]. We've
> > > looked through them and they are now resolved with the exception of o=
ne
> > > related to the incremental git PV issue for which we have a plan in
> > > place and patches ready.
> > >=20
> > > We've taken on board feedback about documentation and the following w=
iki
> > > page has been setup which details the current situation:
> > >=20
> > > https://wiki.yoctoproject.org/wiki/PR_Service
> > >=20
> > > I appreciate this is going to be a disruptive change for some but I
> > > believe it is in the best interests of the project longer term and th=
at
> > > we will have a better system as an end result of this. If people do r=
un
> > > into problems, please send email or file bugs. I'm trying to ensure
> > > there are some people with time available to look into these issues a=
s a
> > > priority so we can make a smooth transition.
> >=20
> > After reading this wiki page I have few questions (I admit I haven't
> > tried it yet).
> >=20
> > 1) How do you limit access to shared prserv instance?
> >    Can you define some group as RO, some RW?
> >    For RO access it would be great to export state from remote PRSERV=
=20
> >    on first connection and then continue to increment locally (with
> >    PRSERV running on localhost)
>=20
> This isn't implemented as things stand. As you point out, a true RO
> connection causes problems...
>=20
> > 2) If you have slightly different builder (e.g. someone with extra BSP
> >    or different host distro), then he will have different checksums, so
> >    different AUTOPR values and you cannot share binary feed with such
> >    builder, right? I know this wasn't possible (or at least safe) to use
> >    before too. But it should be more clear from documentation.
>=20
> If the extra BSP uses its own package_arch it would probably be ok,
> otherwise not. The host distro only affects native/cross packages and
> not the checksum itself so again, that should also be ok?
>=20
> > 3) Is it possible to use OEBasic together with PRSERV or should bitbake
> >    show fatal error when PRSERV is used toghether with OEBasic?
>=20
>=20
> Added to the page: "The service works with both OEBasic and OEBasicHash
> generators, with the understanding that PR bumps happen when the
> checksum changes and the different generator mechanisms change
> signatures under different circumstances."
>=20
> > 4) Is there plan to import current PR values from recipes, so that
> >    bitbake can parse all enabled layers, gather checksum-PR values and
> >    export it for bitbake-prserv-tool to import it as inital state?
> > 5) Is there plan to remove PR from all recipes or are they ignored with
> >    PRSERV in use and can stay in for some time? If there is functionali=
ty=20
> >    for 4) then we should tag all layers just before PR/PRINC are remove=
d,=20
> >    so someone can create own initial export from last known PR state.
>=20
> Added to the page: "As implemented, values from the PR service are
> included into the PR field as an addition of the form ".X" so r0 becomes
> r0.1, r0.2 and so on. This allows existing PR values to be used for
> whatever reasons allowing manual PR bumps should it be necessary."
>=20
> (should cover both questions)
>=20
> As for removing PR, as recipes are upgraded, I'm expecting we will
> remove PR values so we should get a smooth transition. We can still have
> PR values, it will just become an exception rather than the rule.

So default "hidden" r0 is still used in such cases and PRSERV adds again
just .X.

Thanks for answers.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC/ZzoACgkQN1Ujt2V2gBz5HgCfc13BKRaNYrjPhthN1OAw9Iqx
fCUAn10nME/m3BTXWViziX0GLLPiGD02
=HcaM
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
