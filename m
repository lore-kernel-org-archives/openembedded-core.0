Received: from mail-wg0-f48.google.com ([74.125.82.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TufQV-0006Zz-Sz
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 09:30:05 +0100
Received: by mail-wg0-f48.google.com with SMTP id 16so926768wgi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 00:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=efh8+vHUjfsbp4hbJwZrwBnX4+4NlFUkkN6fJYWLLoo=;
	b=WghBrXStqElYkMlscwiZ2L85OVSL15LhedJ8Thr/VELPWACkumcToQJmzP/L6pCYEb
	D+cXIQy3F5aNEz+AF20N+5Egep2VSQ+XJozrmsEkfEbTebwDvkiojjCjo5oEnG7IwiBA
	fmWzaoFSDfnYWNTpPaGNztjikSo+5DihQskvHd/k7ODEk7qNtay7QEjRad/OXmfsfdhe
	Ap91hGLKKPEZ7fKrC5H6Xe3QC+EsIDahobteceDJeqEsZmV9VJNT3Wh3vki7CJ0RB4cF
	OzmV714a/Sq3VvOmfMyWI8kwk3N7P+lcIMrUC7+ySLAaQIjLvKBCWBeG3bFpr290pO8y
	sfPg==
X-Received: by 10.180.107.130 with SMTP id hc2mr10774633wib.12.1358151273339; 
	Mon, 14 Jan 2013 00:14:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g2sm12828192wiy.0.2013.01.14.00.14.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 00:14:32 -0800 (PST)
Date: Mon, 14 Jan 2013 09:14:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20130114081434.GA2992@jama>
References: <20130107113603.F0F381034A@opal> <20130107122949.GD3285@jama>
	<50F37555.9090604@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50F37555.9090604@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Kang Kai : perl: update dependency creating script
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
X-List-Received-Date: Mon, 14 Jan 2013 08:30:05 -0000
X-Groupsio-MsgNum: 33760
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2013 at 11:02:45AM +0800, Kang Kai wrote:
> On 2013=E5=B9=B401=E6=9C=8807=E6=97=A5 20:29, Martin Jansa wrote:
> > On Mon, Jan 07, 2013 at 11:36:03AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 35291c97edc05756788d206457c56dcc41edb637
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D35291c97edc05756788d206457c56dcc41edb637
> >>
> >> Author: Kang Kai<kai.kang@windriver.com>
> >> Date:   Mon Nov  5 10:42:00 2012 +0800
> >>
> >> perl: update dependency creating script
> >>
> >> Base on dependency create script provided by Saul, I update it with:
> >> 1 remove document strings in perl module files that may import fake
> >>    dependencies.
> >>
> >> 2 not all the 'use' or 'require' clauses start at the begin of line, a=
nd
> >>    some of them don't end with ';', such as:
> >>
> >> use vars qw(
> >>              $AUTOLOAD
> >> 	    ...
> >>
> >> 3 filter some strings that they are not real dependencies: some of them
> >>    are wrong result of script, some are conditional use/require, and s=
ome
> >>    are cpan extra modules that we don't need.
> >>
> >> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> >> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> > This breaks parsing when
> > http://patchwork.openembedded.org/patch/40997/
> > is used.
> >
> > Parsing recipes...ERROR: There is a confusing multiline, partially comm=
ented expression on line 10 of file /OE/shr-core/openembedded-core/meta/rec=
ipes-devtools/perl/perl-rdepends_5.14.2.inc (| sed "s/\/.*\.pm: */ +=3D /g;=
s/[\"\']//g;s/;.*/\"/g;s/+=3D .*\(require\|use\)\>  */+=3D \"perl-module-/g=
;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/=
g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] \).
> > Please clarify whether this is all a comment or should be parsed.
> > ERROR: Unable to parse /OE/shr-core/openembedded-core/meta/recipes-devt=
ools/perl/perl_5.14.2.bb: Exited with "1"
> > ERROR: Command execution failed: Exited with 1
>=20
> Hi Jansa,
>=20
> Because my boy was born, I have been leaving office and missed this messa=
ge.

np, congratz!

Cheers,

> >
> >> ---
> >>
> >>   .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2336 ++++++++++=
+++++++++-
> >>   1 files changed, 2287 insertions(+), 49 deletions(-)
> >>
> >> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dco=
mmitdiff;h=3D35291c97edc05756788d206457c56dcc41edb637
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDzvmoACgkQN1Ujt2V2gBxvfgCfWb/gMeoF0J9qs4OsEJX6JszM
+IMAn2dE/AGEq2c64oK3RL6jOQ4cn8DM
=P9Nh
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
