Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id DD81A6041D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 23:31:08 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id d15so3093361eaj.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 16:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dYMAM6a/LG5e/VZgTB+h3Mn/lxnNPjvt71Rho3du/ro=;
	b=lVx8KA43IHZfwJe9BFqvBSiVe3qS2Er06X2wnb5BdvXGueWezT8UI/HCgDXzvG9TDZ
	DbJP9rGukG9og5AQJDEUJ2ejbdnpuUsaGm1OoU0+QUxiKCvHyaiCPGugnK1jaC/TeeMf
	0BvqstziFQvnw2QTdRyYZIpecbft1/9Bv2r2OF7x6SFZJrSFDEFSJJOaFL2DxV1iJEyw
	otQ55AYyLYyHBBHrEwGneKEMS8uFirjcCLtn2FrEfB20lneNL7qRtHR5fLyvvSTOO+31
	HM6OYUKbpUvP4SDca0zrfuyUr4hiI0YzUfnNs7FPh5Yj5GzgLPzPEITVWIvbksyYgwh9
	DViw==
X-Received: by 10.14.10.9 with SMTP id 9mr36522200eeu.75.1370561468982;
	Thu, 06 Jun 2013 16:31:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm4872693eeh.15.2013.06.06.16.31.07 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 16:31:08 -0700 (PDT)
Date: Fri, 7 Jun 2013 01:31:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20130606233126.GF22710@jama>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<2054363.UxqkIOrzAJ@helios> <51AF6ED5.4010500@linux.intel.com>
	<14899581.O0scG6jzAS@helios>
	<CAGrhNMzSY-ow4PNzscD31qSW8st1tv9Fjmc9Xxx_Oqa2CjsuJA@mail.gmail.com>
	<51B0EBE2.3020909@linux.intel.com>
	<3011112518438126591@unknownmsgid>
MIME-Version: 1.0
In-Reply-To: <3011112518438126591@unknownmsgid>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Thu, 06 Jun 2013 23:31:09 -0000
X-Groupsio-MsgNum: 40267
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6lXr1rPCNTf1w0X8"
Content-Disposition: inline

--6lXr1rPCNTf1w0X8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 09:17:09AM +1000, Jonathan Liu wrote:
> On 07/06/2013, at 6:07 AM, Saul Wold <sgw@linux.intel.com> wrote:
>=20
> > On 06/06/2013 12:18 PM, Felipe Tonello wrote:
> >> On Thu, Jun 6, 2013 at 2:54 AM, Paul Eggleton
> >> <paul.eggleton@linux.intel.com> wrote:
> >>> On Wednesday 05 June 2013 10:01:09 Saul Wold wrote:
> >>>> On 06/05/2013 09:57 AM, Paul Eggleton wrote:
> >>>>> On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
> >>>>>> On 06/05/2013 02:30 AM, Martin Jansa wrote:
> >>>>>>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
> >>>>>>>> qconfig.pri was not being loaded by qmake properly. This means Qt
> >>>>>>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
> >>>>>>>> variables defined in qconfig.pri.
> >>>>>>>>
> >>>>>>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig=
=2Epri
> >>>>>>>> so that it can be located by qmake.
> >>>>>>>
> >>>>>>> There is such patch already:
> >>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-Ma=
y/07831
> >>>>>>> 4.
> >>>>>>> html
> >>>>>>
> >>>>>> Got lost in my queue, adding it for the next MUT.
> >>>>>
> >>>>> FWIW I am still concerned by the assertion in the commit message ab=
out it
> >>>>> causing undesirable behaviour. I'd want that checked out and the no=
te
> >>>>> removed before we look at merging this.
> >>>>
> >>>> OK, I will shelf this until I hear more about the testing of this ch=
ange
> >>>> regarding the original patch's note.
> >>>
> >>> So I tested a rebuild of qt4-x11-free with Felipe's patch and two of
> >>> Jonathan's ("qt4: fix QMAKE_QT_CONFIG being overwritten with empty va=
lue" and
> >>> "classes/qmake_base: allow parallel make"), and did not observe any u=
nexpected
> >>> behaviour and buildhistory looks clean for qt itself and fotowall/qui=
cky. So
> >>> I'd say feel free to throw these into MUT, but I think we need to dro=
p the
> >>> note.
> >>
> >> Awesome.
> >
> > So can someone put a final updated patch series together.  I am still n=
ot sure about Jonathans's allow parallel make change, it seemed to have the=
 -j option since it's added with a _prepend which is not overriden by the =
=3D assignment.
> >
> > Sau!
>=20
> It has make -j 16 MAKEFLAGS=3D.
> -j 16 adds to MAKEFLAGS, and MAKEFLAGS=3D clears it. It is trivial to
> check this is the case and I have verified it both when building
> fotowall and independently on command line for building Qt projects
> outside of Yocto.

disadvantage of this (at least in qt5) is that it starts independent
make processes which all inherit MAKEFLAGS, so instead of 16 processes
you can get a lot more - I've seen something like 40 when building
qtwebkit with -j 8.

But on other hand it's faster then -j1.
https://github.com/meta-qt5/meta-qt5/commit/e9c61a9e6f51f500df349f8fe569ec0=
95a1b8d2b
https://github.com/meta-qt5/meta-qt5/commit/f76e45b5a8c59b1b8e4b806d2a2a09e=
6baf4d4e2

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6lXr1rPCNTf1w0X8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGxG84ACgkQN1Ujt2V2gBz1IACgqnZpiCIxYZAbbSk4Ppzzh8Bs
cdgAn0JKvz/TMOuJdc7m01QIleGb/Mfa
=armi
-----END PGP SIGNATURE-----

--6lXr1rPCNTf1w0X8--
