Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id B06B86ADA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:44:54 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so1014537eei.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ALB5Bp1ftQz4Br1Cz64VY3fJHOjrRlzW2sggAO0eHHY=;
	b=zyORyJS7vG8C7zcV4BpJBwyuDwJJpk+SSgQ2sbHggGdwVB29C0umHjQ1GE5eTjb02v
	8GlIPxW8Kc6MF1wO60PD8naG4FQ4wT07H1QhxnNps4xW8XeCpT1k3ChzsREYa0w0B648
	7NABVVCFsEWSIMxFUS9C1BPLSfE1s0hdpfDb0di8IRlJ24mI6HXm7Bm8RqLMEfh11JsP
	ezO98wt7BFOBBCvUW5k2uHKMni+dKHJuGipwPuVOm2RzHtcpxdsINWaNYyr/jxvMd8m1
	uXjjg/6csaFG3RMliGz+18HHT1tJwLFSMoPY0D31JSZPqxujrIIGJ4GIafBaHRvm49kQ
	311g==
X-Received: by 10.15.51.202 with SMTP id n50mr13518791eew.39.1372423495043;
	Fri, 28 Jun 2013 05:44:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b3sm10323021eev.10.2013.06.28.05.44.54 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 05:44:54 -0700 (PDT)
Date: Fri, 28 Jun 2013 14:45:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130628124534.GN3261@jama>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
	<51CD7C66.3020702@gmail.com>
	<CA+chaQcjeX_y3c7=MOFkp5jndMdo4xKcAmgA7yWjB_bsaBMb3g@mail.gmail.com>
	<9031819.zlCvcHI3ah@helios>
MIME-Version: 1.0
In-Reply-To: <9031819.zlCvcHI3ah@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Fri, 28 Jun 2013 12:44:55 -0000
X-Groupsio-MsgNum: 41103
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lbQeYSs6J2ITmUo7"
Content-Disposition: inline

--lbQeYSs6J2ITmUo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 01:40:26PM +0100, Paul Eggleton wrote:
> On Friday 28 June 2013 14:28:56 Martin Jansa wrote:
> > It's failing in my world builds too now, you can see log here:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E2013
> > 0627_214856.log/bitbake.log
> >=20
> > Cheers,
> >=20
> > On Fri, Jun 28, 2013 at 2:07 PM, Jonathan Liu <net147@gmail.com> wrote:
> > > On 15/06/2013 10:06 AM, Jonathan Liu wrote:
> > >> The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CON=
FIG
> > >> pointing to the qt4 qconfig.pri when it should be pointing to the
> > >> qt4-embedded qconfig.pri.
> > >>=20
> > >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> > >> ---
> > >>=20
> > >>   meta/classes/qt4e.bbclass | 1 +
> > >>   1 file changed, 1 insertion(+)
> > >>=20
> > >> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
> > >> index de2a68d..13b1050 100644
> > >> --- a/meta/classes/qt4e.bbclass
> > >> +++ b/meta/classes/qt4e.bbclass
> > >> @@ -9,6 +9,7 @@ QT_LIBINFIX =3D "E"
> > >>=20
> > >>   # override variables set by qmake-base to compile Qt/Embedded apps
> > >>   #
> > >>   export QMAKESPEC =3D "${STAGING_DATADIR}/${QT_DIR_**
> > >>=20
> > >> NAME}/mkspecs/${TARGET_OS}-oe-**g++"
> > >> +export OE_QMAKE_QT_CONFIG =3D "${STAGING_DATADIR}/${QT_DIR_**
> > >> NAME}/mkspecs/qconfig.pri"
> > >>=20
> > >>   export OE_QMAKE_INCDIR_QT =3D "${STAGING_INCDIR}/${QT_DIR_**NAME}"
> > >>   export OE_QMAKE_LIBDIR_QT =3D "${STAGING_LIBDIR}"
> > >>   export OE_QMAKE_LIBS_QT =3D "qt"
> > >=20
> > > Hi Saul,
> > >=20
> > > Do you have a log of the error you had building qt4-embedded with this
> > > patch?
>=20
> FWIW, I see the same error without this patch if I build qt4-embedded aft=
er=20
> building qt4-x11, so I don't know if this patch is really related to the=
=20
> problem or not.

It was building fine in world builds until 1-2 weeks ago, but it's
possible that I was just lucky to have it in right order.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lbQeYSs6J2ITmUo7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHNhW4ACgkQN1Ujt2V2gBzXBQCgie8fIjN6blR9ZtGuyk2vL2vU
JVwAoIVAeU/ARzWCjoOwogec6CX1HGEK
=0ceh
-----END PGP SIGNATURE-----

--lbQeYSs6J2ITmUo7--
