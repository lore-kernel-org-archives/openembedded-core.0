Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWVvo-0005mY-Ti
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 17:25:49 +0100
Received: by wgbds11 with SMTP id ds11so1255765wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 08:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KMptcc+0/p5TWEtYZHUSHLsoh+sb9VyW1COsN/oTqK0=;
	b=iGAEefBN3jD7bXXNDXfDcqEF0f34Gvo25H84ljdOq/yTPosYNbuNRVlLZWSCvwuNKb
	HsubwlfA0cadRKosVVAtOoVjEGhLyHDExRyPzxRxB5lFyiBHfNkNyoyMGRR8M4QtUd8j
	XONQkparftHRc06yDPYpqJlfdTNwrI1xthJyI=
Received: by 10.227.209.85 with SMTP id gf21mr6599254wbb.5.1322842742338;
	Fri, 02 Dec 2011 08:19:02 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fi11sm10832248wbb.9.2011.12.02.08.18.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 08:19:00 -0800 (PST)
Date: Fri, 2 Dec 2011 17:18:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111202161847.GF3770@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<20111201130733.GF19917@jama.jama.net>
	<1322771625.17484.149.camel@ted>
	<ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>
MIME-Version: 1.0
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Fri, 02 Dec 2011 16:25:49 -0000
X-Groupsio-MsgNum: 13566
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Content-Disposition: inline

--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2011 at 08:46:43AM +0000, Mats K=E4rrman wrote:
> > From: openembedded-core-bounces@lists.openembedded.org [openembedded-co=
re-bounces@lists.openembedded.org] on behalf of Richard Purdie [richard.pur=
die@linuxfoundation.org]
> > Sent: Thursday, December 01, 2011 9:33 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] Coordinating inter-layer dependencies
> >=20
> > On Thu, 2011-12-01 at 14:07 +0100, Martin Jansa wrote:
> > > On Thu, Dec 01, 2011 at 10:59:03AM -0200, Otavio Salvador wrote:
> > > > On Thu, Dec 1, 2011 at 10:37, Richard Purdie <
> > > > richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > > On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
> > > > > > A while back I've proposed to make .bbappend without correspond=
ing .bb
> > > > > > only big fat warning, but not fatal to parse. Now you cannot ev=
en build
> > > > > > eglibc if there is libdrm bbappend you don't care at all about..
> > > > >
> > > > > You can do this by setting:
> > > > >
> > > > > BB_DANGLINGAPPENDS_WARNONLY
> > > > >
> > > >
> > > > This is even worse; you end up with a package without the changes d=
one on
> > > > the bbappend and as most bbappend files do not change PR, adding it=
 later
> > > > won't force a package update.
> > >
> > > If we find a way to allow PRINC in multiple bbappends for same .bb th=
en
> > > we can say that every .bbappend should use PRINC.
> > >
> > > For record I'll include my discussion about PRINC with RP and kergoth:
> > > 10:47 < JaMa> RP__: is there any way to improve PRINC concept to allo=
w multiple increments for same recipe while parsing multiple layers?
> > > 10:48 < RP__> JaMa: PRINC_append =3D ".1" ?
> > > 10:49 < JaMa> RP__: ie when meta-openmoko sets PRINC =3D "1" and meta=
-shr sets PRINC =3D "2" then if you're unlucky meta-openmoko is parsed late=
r and bumping PRINC in meta-shr won't help
> > > 10:49 < RP__> JaMa: I wonder if you could do PRINC :=3D "${PRINC + 1}"
> > > 10:50 < JaMa> and do we have default PRINC =3D 0 somewhere?
> > > 10:50 < RP__> JaMa: you might need to add that
> > > 10:50 < JaMa> ok, I'll try this, thanks
> > > 10:51 < JaMa> currently I'm moving PRINC only to meta-shr layer.. but=
 that breaks stuff if someone is using any BSP layer from meta-smartphone..
> > >
> > > 14:53 < JaMa> RP__: btw that PRINC trick didn't work (int type didn't=
 like expresion :/)
> > > 15:13 < RP__> JaMa: ah, try PRINC :=3D "${int(PRINC) + 1}"
> > > 15:21 < JaMa> RP__: still ValueError: invalid literal for int() with =
base 10: '${int(PRINC) + 1}'
> > > 15:21 < JaMa> with added PRINC :=3D 0 to bitbake.conf
> > > 15:22 < RP__> PRINC :=3D "${int(d.getVar(PRINC)) + 1}" ? :/
> > > 15:22 < JaMa> whole log http://paste.pocoo.org/show/514437/
> > > 15:22  * RP__ was trying to be too clever I suspect
> > > 15:23 < JaMa> ValueError: invalid literal for int() with base 10: '${=
int(d.getVar(PRINC)) + 1}'
> > > 15:41 < kergoth> PRINC is unquoted there, so it tries to get a value =
for a key of None
> > > 16:24 < RP__> kergoth: right, trying to do too many things at once :/
> > > 16:24 < RP__> kergoth: any thoughts on that knotty change to add the =
footer?
> > > 17:05 < JaMa> kergoth: something like this? ValueError: invalid liter=
al for int() with base 10: "${int(d.getVar('PRINC')) + 1}"
> > >
> > > Maybe someone else has better idea?
> >=20
> > Looking at that I was missing something obvious. Try:
> >=20
> > PRINC :=3D "${@int(PRINC) + 1}"
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20
> As I understand it, the PRINC increases the PR of the appended recipe. Th=
en the resulting package will have a version that is the same as "the next"=
 version of the base recipe. Since many people (me included) hardly remembe=
r what they did a month ago, isn't there a big risk of confusion in your de=
ployed systems if packages are upgraded there?
>=20
> I do something like  PR .=3D ".local0"  where "local" is the name of the =
layer containing the .bbappend.
> Of course this will create extensive version strings if multiple .bbappen=
ds are applied but the alternative is that you have no idea what layers tha=
t appended and what the the base version of the recipe really was.

So if you have some layer adding
layerB: PR .=3D ".b0"
and other
layerA: PR .=3D ".a0"

and PR appends are evaluated in this order, then you will break upgrade
patch forever if you have to remove layerB for some reason and you
cannot even fix it by bumping numbers in your layerA unless you rename
all PR appends as ".c0" right? That's why I prefer to use PRINC.

Yes it increases PR of desired number, but every time.. so if upper
layer increments PR your .bbappend will again increment it so you still
get always increasing sequence.

Only problem was multiple .bbappends overwritting PRINC value in each
other, but RP's latest proposal:
PRINC :=3D "${@int(PRINC) + 1}"
works and I'm going to push meta-smartphone migration to this PRINC
usage instead of more common 'PRINC =3D "1"'

for bb in `git grep "^PRINC" . | sed 's/:.*//g'`; do sed -i 's/PRINC *=3D *=
"\(.*\)"/PRINC :=3D "${@int(PRINC) + \1}"/g' $bb; done

And I'll send patch here to add default PRINC =3D "0" to bitbake.conf,
because otherwise it fails with:
ERROR: Failure expanding variable PRINC[:=3D], expression was
${@int(PRINC) + 1} which triggered exception NameError: name 'PRINC' is
not defined

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Y+mcACgkQN1Ujt2V2gByKZgCgtUB6kgrLZFf0c2U6ZSw1Y6QZ
oOwAoIFwxNYp3x4rVgCA5SwWsKCFqiBn
=AJqX
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--
