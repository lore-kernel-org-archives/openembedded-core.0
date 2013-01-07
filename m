Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsC4V-0002PI-7U
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:45:09 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so9787743wgb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=EaLucZnbkbW7S410q8hinmvxXu+SnSRaAEPYbZOcXCI=;
	b=O+V28kxesuTAi/xuG4MxkhmWahZlvdK8cpqL4cYKpRd+wsGJVdvvBqP6P+mDIXxYUB
	MNa7rImAuFbWoWWME2OB1X9Zw0ZZuiRoHa1uMfUYoety1aBSiqy5Z1CC7j3yXUhVSW0l
	X8EORHYirYwUuwwZvVbMasZdA1Xw1v9zYDE8RBY9jni0gCwLHzBGJDFrqOK4+O9YewIU
	wACVl54wNnTgiSiI3W9JdnhOTVtOYnA+ah7A2fUGS29O8CDiujy9Y9506ydIdSJjXE6u
	xNPb+DX+60FibJbKwz3x2pxQ7bawQJhXuIxGvsy9DSxEZfhMtm4n9GWNXRSmrGZzVpj5
	zWLw==
X-Received: by 10.180.84.131 with SMTP id z3mr8911844wiy.25.1357561786184;
	Mon, 07 Jan 2013 04:29:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hg17sm11940308wib.1.2013.01.07.04.29.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Jan 2013 04:29:45 -0800 (PST)
Date: Mon, 7 Jan 2013 13:29:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Message-ID: <20130107122949.GD3285@jama>
References: <20130107113603.F0F381034A@opal>
MIME-Version: 1.0
In-Reply-To: <20130107113603.F0F381034A@opal>
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
X-List-Received-Date: Mon, 07 Jan 2013 12:45:11 -0000
X-Groupsio-MsgNum: 33402
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Content-Disposition: inline

--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2013 at 11:36:03AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 35291c97edc05756788d206457c56dcc41edb637
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D35291c97edc05756788d206457c56dcc41edb637
>=20
> Author: Kang Kai <kai.kang@windriver.com>
> Date:   Mon Nov  5 10:42:00 2012 +0800
>=20
> perl: update dependency creating script
>=20
> Base on dependency create script provided by Saul, I update it with:
> 1 remove document strings in perl module files that may import fake
>   dependencies.
>=20
> 2 not all the 'use' or 'require' clauses start at the begin of line, and
>   some of them don't end with ';', such as:
>=20
> use vars qw(
>             $AUTOLOAD
> 	    ...
>=20
> 3 filter some strings that they are not real dependencies: some of them
>   are wrong result of script, some are conditional use/require, and some
>   are cpan extra modules that we don't need.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

This breaks parsing when=20
http://patchwork.openembedded.org/patch/40997/
is used.

Parsing recipes...ERROR: There is a confusing multiline, partially commente=
d expression on line 10 of file /OE/shr-core/openembedded-core/meta/recipes=
-devtools/perl/perl-rdepends_5.14.2.inc (| sed "s/\/.*\.pm: */ +=3D /g;s/[\=
"\']//g;s/;.*/\"/g;s/+=3D .*\(require\|use\)\> */+=3D \"perl-module-/g;s/CP=
ANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\=
=2Epl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] \).
Please clarify whether this is all a comment or should be parsed.
ERROR: Unable to parse /OE/shr-core/openembedded-core/meta/recipes-devtools=
/perl/perl_5.14.2.bb: Exited with "1"
ERROR: Command execution failed: Exited with 1

>=20
> ---
>=20
>  .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2336 ++++++++++++++=
+++++-
>  1 files changed, 2287 insertions(+), 49 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3D35291c97edc05756788d206457c56dcc41edb637
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDqv70ACgkQN1Ujt2V2gByivACfRqkJT+2VgFhW5Xv2UKmFGzUP
JzMAn3tU+dlufBXtauMNT+JGkAbxyXyK
=u7t5
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
