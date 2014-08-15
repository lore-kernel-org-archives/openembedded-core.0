Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5374070D30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 09:09:18 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so2012443lab.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d/7f8WKxf08UNH5g5+y2NLhcHBCf58rW32kWrHhHsMU=;
	b=XfeZV0whQ9ijq1I5y4zK9rZcoc5rNxl6+5HSqBmWTHVMQzQ1S0Ac4Fwrz+iLL30c1e
	YFl44udV33lhagUWZY2wn9+dwcOtnpIDDBb1t+2+Glr7I9u9nAyBE9eEYSGv0XEypPa/
	+O8O+q/6zGx+0rL7pCk9VK9Ry+a9SF/xKvW7H7gYG7EdrUmBY6o+0+IZFdjOkdFmnbhn
	ZSGDJJ3Yd2rBnZIpLFAk5znTOsqrg/rKA/BWL4/d86r7gDj32r4cUb8Hh2F0mIzKjIZV
	24j7UaqdWo+ikJM8rgwcp2zUtaR+H+jyRn4bZ1CylVqb9kUVuWAymdNR7MDMftteqa6V
	aYpw==
X-Received: by 10.112.40.161 with SMTP id y1mr10549857lbk.61.1408093758965;
	Fri, 15 Aug 2014 02:09:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qz5sm11860916lbb.39.2014.08.15.02.09.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 02:09:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 11:09:56 +0200
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20140815090956.GC22747@jama>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
	<d77cfaf8b63e3dd1d7b05ff4b547b6a4a4fc6b47.1408005909.git.Qi.Chen@windriver.com>
	<20140814085432.GG14848@jama> <1408009147.22187.87.camel@ted>
	<53ED77DE.7020208@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53ED77DE.7020208@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] systemd: add libdw to RDEPENDS
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
X-List-Received-Date: Fri, 15 Aug 2014 09:09:24 -0000
X-Groupsio-MsgNum: 56576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2014 at 11:00:46AM +0800, ChenQi wrote:
> On 08/14/2014 05:39 PM, Richard Purdie wrote:
> > On Thu, 2014-08-14 at 10:54 +0200, Martin Jansa wrote:
> >> On Thu, Aug 14, 2014 at 04:46:01PM +0800, Chen Qi wrote:
> >>> Add libdw to RDEPENDS of systemd to avoid build-deps QA warning.
> >>>
> >>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> ---
> >>>   meta/recipes-core/systemd/systemd_215.bb |    2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-=
core/systemd/systemd_215.bb
> >>> index 770787b..a52a042 100644
> >>> --- a/meta/recipes-core/systemd/systemd_215.bb
> >>> +++ b/meta/recipes-core/systemd/systemd_215.bb
> >>> @@ -244,7 +244,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
> >>>   FILES_${PN}-dbg +=3D "${rootlibdir}/.debug ${systemd_unitdir}/.debu=
g ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
> >>>   FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-=
1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> >>>  =20
> >>> -RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount udev (=3D ${EXTENDPK=
GV})"
> >>> +RDEPENDS_${PN} +=3D "libdw kmod dbus util-linux-mount udev (=3D ${EX=
TENDPKGV})"
> >> Shouldn't it be build-time dependency?
> >>
> >> If it's detected from sysroot in do_configure then it has to be in
> >> DEPENDS to get deterministic results.
> > Right. Secondly, what benefit does this library bring us?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>=20
> Richard & Martin,
>=20
> Thanks for reminding me about this.
> I shouldn't have rushed into fixing the QA warning without looking into=
=20
> the configure.ac file.
>=20
> It should really be a PACKAGECONFIG for 'elfutils'.
> PACKAGECONFIG[elfutils] =3D "--enable-elfutils,--disable-elfutils,libelf=
=20
> libdw,libelf libdw"

I don't think there is libdw and libelf recipe, they are just packages crea=
ted by
elfutils recipe, so I think it should be:

PACKAGECONFIG[elfutils] =3D "--enable-elfutils,--disable-elfutils,elfutils"

the runtime dependency is added automatically by shlibs code (as the QA
warning confirmed).

> I will send out V2 of this patchset.
>=20
> Best Regards,
> Chen Qi

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPtzmQACgkQN1Ujt2V2gBxlrACgnx3hifbV3yhjqeMxmrEtiJ7L
ZX4An03wOKmJdRplPiGJZyJ7uZMQMiCu
=ghYI
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
