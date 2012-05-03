Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPp1m-0006hO-EC
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 07:56:34 +0200
Received: by wera1 with SMTP id a1so995150wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lf5187TCu+lFARJLGu7kNKvBm0bnyJMAn4jO26nlNJQ=;
	b=mt35Us4JEsYj8m4kKkNYY9IYAYBrbFHQB8gWQSh35okMNAiLrCZgbWclF7jBocxLKs
	/dmJY8GMk6yznS1z95LKcD3A3kbDX45RxbkxLrO1piX6vV1K5T8mXoC/aS6r49ak2Y0P
	cXzMRWztkJI7fRXvjGjOQ90ywlUmQyIoXxp2NCEXL2KR7w44UwGQCWhz4jRJiFl/ynr2
	gfqNTU3eK0z2HNiBptbfKbEbnWmFkWr85WQbdlqqRqh4ZfBB7Al4Uk50SvZuO175Ule6
	zFevbQOCG+uVwf1xLwsZ7+C4gM0UGQMMMSP8oAnLqYsuzdtzkA+EbVvoQmChjNeYIS5s
	3qiw==
Received: by 10.180.91.10 with SMTP id ca10mr4997316wib.17.1336024009511;
	Wed, 02 May 2012 22:46:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm49281525wib.2.2012.05.02.22.46.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 22:46:48 -0700 (PDT)
Date: Thu, 3 May 2012 07:46:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120503054649.GD4658@jama.jama.net>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 05:56:34 -0000
X-Groupsio-MsgNum: 21554
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline

--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2012 at 10:44:05PM -0700, Khem Raj wrote:
> On Wed, May 2, 2012 at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, May 02, 2012 at 02:08:47PM -0700, Khem Raj wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 05/02/2012 07:09 AM, Martin Jansa wrote:
> >> > On Wed, May 02, 2012 at 03:59:45PM +0200, Martin Jansa wrote:
> >> >> From: Tomas Frydrych <tomas@sleepfive.com>
> >> >>
> >> >> These are required to build recent versions of glib-2.0
> >> >
> >> > similar patch is needed also for other site files, just noticed it
> >> > while building for qemux86-64
> >>
> >> would you also include rest of architectures too please ?
> >
> > I did for x86 and x86-64, for the rest I don't know the right values or
> > care enough to find them somewhere.
>=20
> will this upgrade break glib for architectures that have wrong values
> for these vars ?
> if answer is yes then I think we should do that before applying this
> upgrade otherwise
> it will be a regression

glib-2.32.1 will build there fine, but glib-2.32.2 will fail during
do_configure, so yes someone should add those.

Cheers,

>=20
> >
> > Cheers,
> >
> >>
> >> >
> >> >>
> >> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---
> >> >> meta/site/arm-common | =A0 =A03 +++ 1 files changed, 3 insertions(+=
),
> >> >> 0 deletions(-)
> >> >>
> >> >> diff --git a/meta/site/arm-common b/meta/site/arm-common index
> >> >> c3ffe08..cad8027 100644 --- a/meta/site/arm-common +++
> >> >> b/meta/site/arm-common @@ -76,6 +76,9 @@
> >> >> glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
> >> >> glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
> >> >> glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> >> >> glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_nice=
ness_surrogate=3Dyes}
> >> >>
> >> >>
> >> +ac_cv_alignof_guint32=3D4
> >> >> +ac_cv_alignof_guint64=3D8 +ac_cv_alignof_unsigned_long=3D4
> >> >>
> >> >> #gstreamer as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno} =
--
> >> >> =A01.7.8.6
> >> >>
> >> >
> >> >
> >> >
> >> > _______________________________________________ Openembedded-core
> >> > mailing list Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >> -----BEGIN PGP SIGNATURE-----
> >> Version: GnuPG v1.4.11 (GNU/Linux)
> >> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
> >>
> >> iEYEARECAAYFAk+hol8ACgkQuwUzVZGdMxQEkgCfZY5mVAR5RxST2olpH41m6V+d
> >> iQwAnRBaSrzbM/RGWmb8cZJjXwMAg6KJ
> >> =3DtUvc
> >> -----END PGP SIGNATURE-----
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+iG8kACgkQN1Ujt2V2gBwi2gCgs2YLkiI1PUKJQ0yKnSmUcL2b
BhkAn2edl0EcHdoyj+bjb5jJnZfnWo15
=iWAk
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
