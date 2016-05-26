Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 75B9160670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 15:33:31 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id z87so104294550wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lJOiWz8Y/USwrQRoI0F0kDY28jUJlgEwW+owxTUBwoI=;
	b=LK2eX4requkMt2l6fiiQFAICROuABUTRmiQX9vbrwYqnZnWf1qW5HEzgv+MAhjME96
	sAv0Iqum+h+nDRrDBUSR0/IzEzPslN7mPFZliWPqKc+pkgWAddL0YlqNSP+5Ql15WkMr
	7zn88F5UIU1jFP7AarvSSDf03OqvCg2XL558mPWEae1U+QZXCZdGby56hgy6smnU0VjW
	nkjFhp2St+jvbHN1jz22NkruzgGZrFJO6UDwZpy9Vq7Dggj/pKojrARbsmwj0Ac1YN9k
	0oC/HyUOqfLPNFpKWOGnU25dQQYzR4tRkmgW+bHtgiIRtZT0a/cp6IZkmZhwKGD5oPD/
	fOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lJOiWz8Y/USwrQRoI0F0kDY28jUJlgEwW+owxTUBwoI=;
	b=PhwiWhRd2A4t5MesVyP23WGUXgqNolwiO84irYu075LY9Y17tHOK7LFT6IX8kRZpkF
	hT1bAUMsHwWZokP8yr7zRgDn4N4Y+H5JsTYaFQyOQKkFza58Jpm0xB2FIQ6mRjdM+7hT
	3Hd5A5CkPgnbYLyd9rLqCqCW40Z1sED73FHvuO+iVK7HTg8YPHNXf1hYilwAXw2woGhS
	HjbY4TmeLbIA2eoPI2ofanauVWAj7oBi539Yg+ombzOwCfAS3Yq5vJ3UmyMa9yh3550m
	ck+eO2TapoMDgr/TGJFTwADCxUFg3ICNriLqUz5oK54ifcdxBHLrRRtddurntYN41jDl
	Gvsw==
X-Gm-Message-State: ALyK8tLbDktQqpit5WPoMSgLLqsbu+F+rMFiGCVF8a4MGrlbvaR44M7FH8XAghzJqVMeZA==
X-Received: by 10.28.9.137 with SMTP id 131mr4333321wmj.13.1464276811972;
	Thu, 26 May 2016 08:33:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gk6sm14871656wjc.31.2016.05.26.08.33.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 May 2016 08:33:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 26 May 2016 17:33:51 +0200
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20160526153351.GA2575@jama>
References: <cover.1463042237.git.pkj@axis.com>
	<c044a00c888e3359e64270e57067df9d648f9896.1463042237.git.pkj@axis.com>
	<CALbNGRRogSXXcyLTUvq_CqS41wNqD1EjOXPpdGzH8SSKcAEorw@mail.gmail.com>
	<86b3cfaab1c3407990067447ffd990ed@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <86b3cfaab1c3407990067447ffd990ed@XBOX02.axis.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Thu, 26 May 2016 15:33:35 -0000
X-Groupsio-MsgNum: 82736
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2016 at 01:41:14PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Andreas M=FCller [mailto:schnitzeltony@googlemail.com]
> > Sent: den 26 maj 2016 14:00
> > To: Peter Kjellerstedt
> > Cc: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add
> > dirs to stage in sysroot
> >=20
> > On Thu, May 12, 2016 at 10:37 AM, Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > > ---
> > >  meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-
> > devtools/tcltk/tcl_8.6.4.bb
> > > index 8e92b3e..61be81d 100644
> > > --- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> > > +++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> > > @@ -68,10 +68,7 @@ do_install() {
> > >         done
> > >  }
> > >
> > > -SYSROOT_PREPROCESS_FUNCS +=3D "tcl_sysroot_preprocess"
> > > -tcl_sysroot_preprocess () {
> > > -       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDI=
R}${bindir_crossscripts}
> > > -}
> > > +SYSROOT_DIRS +=3D "${bindir_crossscripts}"
> > >
> > >  PACKAGES =3D+ "tcl-lib"
> > >  FILES_tcl-lib =3D "${libdir}/libtcl8.6.so.*"
> > > --
> > > 2.1.0
> > >
> > This one breaks meta-oe's postgresql.
> >=20
> > Andreas
>=20
> Breaks it how?

You can see the error in last status e-mail:
http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121725.h=
tml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldHF14ACgkQN1Ujt2V2gBw54gCgnWyp7ASydTfl8q8Pc+a8p49L
nk8AnRep0CWX7CAj17GmT6s7wlNa/XWq
=Xq84
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
