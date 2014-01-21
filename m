Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3884E60144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 23:12:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jan 2014 15:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; 
	d="asc'?scan'208";a="468669668"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.24.1.180]) ([10.24.1.180])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2014 15:12:27 -0800
Message-ID: <1390345935.13672.13.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jan 2014 15:12:15 -0800
In-Reply-To: <20140121225825.GM4100@jama>
References: <cover.1390342768.git.dvhart@linux.intel.com>
	<c65b846c5d5882f4adcb504ca01291173bd4bcf8.1390342768.git.dvhart@linux.intel.com>
	<20140121225825.GM4100@jama>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/15] genericx86: Use the core2 tune file
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
X-List-Received-Date: Tue, 21 Jan 2014 23:12:27 -0000
X-Groupsio-MsgNum: 49311
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-GvLNsQzIgkuEizrIUKkZ"

--=-GvLNsQzIgkuEizrIUKkZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-01-21 at 23:58 +0100, Martin Jansa wrote:
> On Tue, Jan 21, 2014 at 02:39:58PM -0800, Darren Hart wrote:
> > Aside from the movbe and specialized instruction scheduling for the lac=
k
> > of out-of-order scheduling in the older Atom CPUs, the core2 tune cover=
s
> > these CPUs adequately. Since the current atom tune just uses core2
> > anyway, go ahead and make this explicit here.
> >=20
> > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > ---
> >  meta-yocto-bsp/conf/machine/genericx86.conf |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-b=
sp/conf/machine/genericx86.conf
> > index 9d29f62..549fc8e 100644
> > --- a/meta-yocto-bsp/conf/machine/genericx86.conf
> > +++ b/meta-yocto-bsp/conf/machine/genericx86.conf
>=20
> This isn't for oe-core, is it?
>=20

Nope. I called this out in the cover letter. It spans oe-core and poky,
but I felt they were best viewed as a whole, rather than splitting them
apart and worrying about the order in which they were applied. I
understand the desire to not cross post and generally agree and avoid it
- on rare occasions such as this, it seems the least awful way to go
about it...

> > @@ -3,5 +3,6 @@
> > =20
> >  #@DESCRIPTION: Machine configuration for generic X86 (32-bit) PCs. Sup=
ports a moderately wide range of drivers that should boot and be usable on =
"typical" hardware.
> > =20
> > -include conf/machine/include/tune-atom.inc
> > +DEFAULTTUNE ?=3D "core2-32"
> > +include conf/machine/include/tune-core2.inc
> >  include conf/machine/include/genericx86-common.inc
> > --=20
> > 1.7.9.5
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


--=-GvLNsQzIgkuEizrIUKkZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAABAgAGBQJS3v7PAAoJEKbMaAwKp364068IAIwgR+nR7cdxe07XEYEphjYm
KWsCMiRXp9gP3/MZx3ktBIBVYOtE804gNU8KcwX5b1wSSxoAaMRO/Jmv15lGAOt0
eNNx38eRbid8I9q63c0r+GKuhKRP10pXtDcd0ZwiGUZaLsGSF9G99ZAUSAf2q6Il
1S2+79g++r+PWJis63vvTOYc86AjiNwAJseLgzkGQEqqx1tt8NHFPhyKKEh73Ntf
WCR/RBPtAHrH4wmepn6E+NBJRHSvkpAubwCaS6/p+aMeLdSkcl6TJFGg8dW8hglo
H3Cwcx3y8ueqzejVr8Kdm9cZYBDd3CeakbBxoFuYFbEZFRQonlA0/HlA5lqmjkM=
=I1ha
-----END PGP SIGNATURE-----

--=-GvLNsQzIgkuEizrIUKkZ--
