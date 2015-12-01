Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9896FEFE;
	Tue,  1 Dec 2015 10:46:22 +0000 (UTC)
Received: by wmec201 with SMTP id c201so198697041wme.0;
	Tue, 01 Dec 2015 02:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B7lO56y53B/PFU1p6F2n0m2+37BJk5ZTYC2EY4Bro98=;
	b=Uu9fvkKxyFbXF1kj6z26Z+IgiQf3Rka1I3kJGi758DG8kKl9j08x9u9naYmTICwZDP
	560Cc4T81wd/bxBTmwX3r7hbS+aZrzNi81farTnmZ2OcJjvgpLOH8WjH03IxucJZROt5
	+0/L7u4BXDPlVBQ04CBjz9zfshAP5CSscnoTJqqmzzSrFUX3l56RPalqkUlAoFDJ7xBU
	60qpZI8xt5G2MDi39j6qaf/YA7plc+RNpsh8XZ7L3jsDWcVGDudlgkwVPycKKCHdLlVK
	sNA7kJMuIoLtln+dtz9/A3c86xikcnmd2KiQYMFusTPPDZ561Mef2CAEaqyxgQtLY2ur
	UgCw==
X-Received: by 10.28.53.130 with SMTP id c124mr33461049wma.16.1448966783118;
	Tue, 01 Dec 2015 02:46:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m11sm25477294wma.5.2015.12.01.02.46.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Dec 2015 02:46:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Dec 2015 11:47:20 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20151201104720.GB2251@jama>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<565C6907.3020501@gmail.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Tue, 01 Dec 2015 10:46:25 -0000
X-Groupsio-MsgNum: 74178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline

--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2015 at 07:49:50AM +1300, Paul Eggleton wrote:
> Hi Trevor,
>=20
> On Mon, 30 Nov 2015 10:19:35 Trevor Woerner wrote:
> > On 11/26/15 16:00, Paul Eggleton wrote:
> > > I'm also
> > > trying to ensure that the patch validation is generic enough so it can
> > > live in OE-Core, and thus we can easily update and refine it over tim=
e in
> > > line with the code itself as well as encourage submitters to use the
> > > script on their own changes before sending.
> >=20
> > This all sounds like an improvement and is therefore a step in the right
> > direction :-)
> >=20
> > A while back I had the idea of "porting" the kernel's "checkpatch.pl" to
> > The Yocto Project (it was around the same time that I was trying to
> > float the whole "Maintainers File" idea too, since I was also trying to
> > re-purpose "get-maintainer.pl" as well). About one minute into that
> > effort I realized the existing *.bb files were all over the place in
> > terms of the order of statements and the order of the blocks of
> > statements. At that time I found one recipe style guide from OE, and
> > another one from The Yocto Project, each of which described a slightly
> > different preference. So I asked on the mailing list and quickly
> > discovered that both groups prefer a different style.
> >=20
> > I'm not saying this job isn't worth doing, but I am pointing out there's
> > the potential for feathers to be ruffled on both sides if someone tries
> > to produce a definitive style guide for recipe files and then enforces
> > it in an automated way. Since it is the OpenEmbedded Project's job to
> > provide the recipes for The Yocto Project, I'm guessing this question
> > needs to be decided by them? If that sounds reasonable, then maybe The
> > Yocto Project needs to acquiesce to OE's decision?
>=20
> I don't think there's that much of a division. I don't recall if it was y=
ou=20
> that raised it at the time but the issue of having two style guides did g=
et=20
> rectified - I changed the one on the Yocto Project wiki to simply be a li=
nk to=20
> the OE style guide in June last year. It certainly didn't come about thro=
ugh a=20
> conscious decision to have a different style.
>=20
> However there is a minor disagreement over indentation for shell function=
s=20
> between OE-Core and other layers - this persists because of the backporti=
ng=20
> pain a blanket replacement would potentially lead to. As I recall this di=
d get=20
> discussed at the OE TSC level. I think that's one thing we could just not=
=20
> evaluate (or make an option) until such time as we resolve the difference=
 - and=20
> I do mean to see it resolved at some point in the future.

Using consistent indentation (4 spaces) at least for new metadata would
be step in right direction.

With the amount of changes which are backported to older releases I
still don't see this "backporting pain" argument. Doing it just before
the release is of course useful, because e.g. now more changes will be
backported to Jethro than to Fido or Dizzy. So having consistent
indentation in Jethro and master would prevent 95% of "backporting
pain". Maybe some Yocto 10.0 will finally get the meaning of
"consistent" indentation.

Regards,

> > Instead of cross-posting, maybe this would be a good email for the new
> > architecture list (CC'ed)?
>=20
> Perhaps yes; I'm a bit concerned that list still doesn't have that many=
=20
> subscribers though (currently 28, two of which are the same person).
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZdergACgkQN1Ujt2V2gByzjwCcCZKVGEOpkPHD+8rryOe3S4W2
WtEAnik5dBmzwirgaqorcSzO1OxgXD31
=hji/
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
