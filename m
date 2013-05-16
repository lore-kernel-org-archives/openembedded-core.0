Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Ucukl-0002Ux-HX; Thu, 16 May 2013 11:45:42 +0200
Received: by mail-pb0-f42.google.com with SMTP id up7so2164301pbc.15
	for <multiple recipients>; Thu, 16 May 2013 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aD+dCibXZBS7o1BHXCA0FNwFZJ/1PQ4VivLgY7UJG3w=;
	b=TuhXYwNySm0EzdBlgL7/VBmUTgyznolwxKf+evHhr4SilLGEZHogV3A2/F1dm/IkHM
	uOQAQYEPuNudlUA7LEVRD7ecMQJuwacu3yijHLFIKv5huvd3QG9w6Wd2f0EpiQ0NMI/1
	1hNOv1TuIj54uXBPJN3PnE5gLnbPdxmskOOudpV82tx/hRt2WudAFQp30ZUP+JLxw+uD
	bIdKaJA7+GHo3EK0cVaXdOeZYqC6IMyJIisMvV7mZv+1pqWobfd/5Ms/22xA7on3pf27
	NOE/cX17w1+apAA1AHz1KX+rDpQCi4d/xs1VswA+qzQfHd9wHWGTWuwP1NwoXHcnH/sO
	ucbw==
X-Received: by 10.68.237.74 with SMTP id va10mr42547770pbc.76.1368696444714;
	Thu, 16 May 2013 02:27:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	br2sm6087421pbc.46.2013.05.16.02.27.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 16 May 2013 02:27:23 -0700 (PDT)
Date: Thu, 16 May 2013 11:27:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130516092724.GF24809@jama.dyndns-home.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
	<E8F9ED28-58F5-422C-8B07-ACD8791202A1@dominion.thruhere.net>
	<3292696.1H20MyJFTP@helios>
MIME-Version: 1.0
In-Reply-To: <3292696.1H20MyJFTP@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 09:46:06 -0000
X-Groupsio-MsgNum: 39329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline

--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2013 at 09:37:23AM +0100, Paul Eggleton wrote:
> On Thursday 16 May 2013 08:23:35 Koen Kooi wrote:
> > Op 15 mei 2013, om 22:33 heeft Richard Purdie
> > <richard.purdie@linuxfoundation.org> het volgende geschreven:
> > > On Tue, 2013-05-14 at 09:36 +0200, Koen Kooi wrote:
> > >> 2) *Never* use PRINC in type b) bbappends
> > >> 3) Avoid PRINC in general
> > >=20
> > > Could we undergo some mass purge of PRINC from master branches and th=
en
> > > change the PR values once and for all in the core recipes? We could m=
ake
> > > PRINC throw a bb.fatal() from that point onwards.
> >=20
> > That would be nice.
>=20
> Maybe we could add some logic into the PR server that if it sees PRINC go=
=20
> backwards, it could just print a warning and increment the stored PR valu=
e to=20
> compensate? That might mean storing the previous value of PRINC if we're =
not=20
> already doing that of course.

PRINC is applied to INC_PR/PR
PR server handles only PRAUTO AFAIK
PKGR ?=3D "${PR}${EXTENDPRAUTO}"

so this wont work

BTW: some files are using AUTOPR as reference to PRAUTO
meta/classes/prexport.bbclass:            bb.warn("prexport_handler: No AUT=
OPR values found for %s" % ver)
meta/classes/primport.bbclass:        #import all exported AUTOPR values
scripts/bitbake-prserv-tool:    echo -e "\texport <file>: export and lock d=
own the AUTOPR values from the PR service into a file for release."
scripts/bitbake-prserv-tool:    echo -e "\timport <file>: import the AUTOPR=
 values from the exported file into the PR service."

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGUpnwACgkQN1Ujt2V2gBy4FgCgnoHEdF1CE5AC4waMyK39q3Ks
+7cAoJ0IJNbXX+QpYXQ6wrc+NINwp3vW
=YgcO
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
