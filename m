Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGUa0-0000bB-6l
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 14:49:36 +0200
Received: by wgbdq11 with SMTP id dq11so4859237wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SqcOSoBPeaERssolzNp4spQSBV+/3FqaGiY2xjKQF/M=;
	b=YOpYv3n/3Q7ogHDJ16VyrsrUdtdmM9utYu8lXNbwYx1FwqNRTwR46Bc+H89SA/cGwn
	FQaka1hbfAsvqIHI5i2wtg5rhcpg4BEWkAGiyEnNcFYP/lnBMMfZT2vIYzCGKe5GDN8l
	lE/SLRAMfR7ESg9WvJxM1UQ4jn2w/IcLmio4Off6lbyo+7ASPfNy5d0zILQX6lI9NJns
	/aNJp9acloWcviRNnZ/pNxEFHvbIR/3j7C04XlhgAoPFxJ7dCLGKc4QCHe1qGM+9waG3
	gK18K1aUAPncxBEJwHwrDjOcCEkle+4OaNojOg91SHA22cjkvHNj1DGU+/faOr57qGzB
	mvCQ==
Received: by 10.180.78.102 with SMTP id a6mr9427615wix.20.1348576607182;
	Tue, 25 Sep 2012 05:36:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm374746wib.8.2012.09.25.05.36.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 05:36:46 -0700 (PDT)
Date: Tue, 25 Sep 2012 14:36:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120925123652.GI3295@jama.jama.net>
References: <1348570313-16920-1-git-send-email-Martin.Jansa@gmail.com>
	<1348575933.8662.48.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1348575933.8662.48.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] linux-yocto: drop machine from SRCREV_FORMAT
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
X-List-Received-Date: Tue, 25 Sep 2012 12:49:36 -0000
X-Groupsio-MsgNum: 29844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IbVRjBtIbJdbeK1C"
Content-Disposition: inline

--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2012 at 01:25:33PM +0100, Richard Purdie wrote:
> On Tue, 2012-09-25 at 12:51 +0200, Martin Jansa wrote:
> > * otherwise LOCALCOUNT is incremented after each MACHINE switch when=20
> >   machine usually has different SRCREV (e.g. because of different KBRAN=
CH)
> > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-Septe=
mber/029392.html
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-k=
ernel/linux/linux-yocto.inc
> > index 973970d..6efb578 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE ?=3D "standard"
> >  # KMETA ?=3D ""
> >  KBRANCH ?=3D "master"
> >  KMACHINE ?=3D "${MACHINE}"
> > -SRCREV_FORMAT ?=3D "meta_machine"=20
> > +SRCREV_FORMAT ?=3D "meta"=20
> > =20
> >  LINUX_VERSION_EXTENSION ?=3D "-yocto-${LINUX_KERNEL_TYPE}"
>=20
> No, absolutely not. I have discussed this with Bruce before and there
> are no guarantees that the meta branch gets updated whenever machine
> changes. This is necessary to have deterministic builds and correctness
> of sstate for example.

Isn't SRCREV_FORMAT used only to construct PV? So builds are still
deterministic because SRCREV is still locked to same value?

Also PV which keeps changing without any change in source or metadata
doesn't look deterministic to me.

Cheers,

> Whatever the problem we're trying to fix here, we need to find a
> different way. We probably need to fix the git LOCALCOUNT counters in
> the fetcher instead.
>=20
> Cheers,
>=20
> Richard
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBhpWQACgkQN1Ujt2V2gBycKQCcD18vCLd4ySCBMImMJtAxALSG
5OcAn1Bfx3MFGcfbmKQqmhtX/lTxh2Zk
=B6hr
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
