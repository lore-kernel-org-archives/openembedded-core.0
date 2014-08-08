Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id AD6EF60EFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 12:16:30 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so5606580wes.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yWoCMG3Xr+h4W+i9PQ2GBqxR/uGPX9VLy4mX+7Kthho=;
	b=AG2sUkj9sYkQlDtflFiXVid1mPwbbrep4BxGMha995eagzr73iGIM+nxwZ3Lqob96O
	yP+H8Rj7ZDWiwvdZ8mWeVwmzMmos7+cPJs68Dcx/UyTWdPmt4zdKP0HKq7sh1zhIY3g4
	cMe5R+m67IUPqQ0fb5vD/XNUG/LhjA3AZZmHXXtyOzY7nfgxBn3wtxynurjgSfduXK3D
	e+ppxtvzXJ0IpKvWKwYygLx7hah+dBXT2KnUiZ2To2v+mQKpTbngS6xEkaT7vngcLrUD
	mSJ0iVU9CAs59HYAoN52qwIz/a1AzPK7QyMoTGjecfmJZPMzRQx2ZBeEfZ38VDVemIE2
	Q0QA==
X-Received: by 10.180.189.4 with SMTP id ge4mr3883156wic.25.1407500191372;
	Fri, 08 Aug 2014 05:16:31 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	fv10sm6620413wic.23.2014.08.08.05.16.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 05:16:30 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Fri, 8 Aug 2014 12:16:28 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140808121628.GH32767@gmail.com>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
	<1407497829-9330-3-git-send-email-paul@paulbarker.me.uk>
	<20140808121346.GE14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140808121346.GE14848@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG
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
X-List-Received-Date: Fri, 08 Aug 2014 12:16:40 -0000
X-Groupsio-MsgNum: 56150
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jQIvE3yXcK9X9HBh"
Content-Disposition: inline

--jQIvE3yXcK9X9HBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 02:13:46PM +0200, Martin Jansa wrote:
> On Fri, Aug 08, 2014 at 11:37:09AM +0000, Paul Barker wrote:
> > The 'opkg-key' utility requires gpg to manage the list of trusted keys.=
 The
> > ability to verify package signatures is not much use without the abilit=
y to add
> > keys to the trusted list...
> >=20
> > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > ---
> >  meta/recipes-devtools/opkg/opkg.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtool=
s/opkg/opkg.inc
> > index ba21d84..56c54b6 100644
> > --- a/meta/recipes-devtools/opkg/opkg.inc
> > +++ b/meta/recipes-devtools/opkg/opkg.inc
> > @@ -27,7 +27,7 @@ OPKGLIBDIR =3D "${target_localstatedir}/lib"
> > =20
> >  PACKAGECONFIG ??=3D ""
> > =20
> > -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-error"
> > +PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-error,=
gnupg"
>=20
> Shouldn't this be gpgme?
>=20

Which bit? The PACKAGECONFIG name or one of the comma separated fields?

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--jQIvE3yXcK9X9HBh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT5L+cAAoJEBwoJlo7UPQD35UH/R2AZXG1FnburtPFPFSg45ES
Us22beoEXjt4xfIT3poRNbtNWPX/UWYe0d5RwxDsEiRmVjQdkLXJgUpq/aS6D4pz
M/vedKW0A862gAfsieXh4bhECdKkEo/C1M/g/TSMrr8DS0lSuoatf9VaAIZqpSDz
XM6QDdEqJzMeuRhX55KN+ect2it9P2j9SJ5NmSnQh4JzTsnKwpnwRI44cba+Wi9Z
Dwq4TwUuNk3iqcm9NrYtwvAMJkGv8ZeHN1arG3Pe2ilZELTufdQV9zvR/XeUASoC
7TzZAPVp8gxgWN2f4niSzi6CG94bNpg55K8LyTZnzU0G5qucjYB6kazurNxuopI=
=JV8V
-----END PGP SIGNATURE-----

--jQIvE3yXcK9X9HBh--
