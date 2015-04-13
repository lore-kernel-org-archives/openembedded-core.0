Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 93D7773D55
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 17:02:09 +0000 (UTC)
Received: by wiax7 with SMTP id x7so69573769wia.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vY/K6phloDSuTjSUa7wNp+ku1CFO56p2vG+zqY/25f0=;
	b=ZJhDsoI8pKziRX+6eo3jBDwwdWyIwxkw/xNiQCj4FsdkGn2e2xJFJvWn99XpnG3HmJ
	K/+6v8GsOb7vzVze8mUWj9UZ0RS0dph2CbFocEPlHgrICjDCA2557kiyZbuiTz/bs+v5
	4vPINazeXgYJFInWYw7GcRiL5aNmg8EH8n8Qi/beXrc2JQkalSb8BR5FwbF3PZLhdO7r
	qa8xSva90upUq8HvJvnjZTRk0WMEx8IHjWxN8E4d+Jk5/QWuPdsXXCi+cBfxo/vNGKSk
	Pr2QpKhSKEfi492ItY6hElY9VqNFIa2pZ3RidLwatfuU0cmfyMmRRNG6JUa5LhJ6uiRs
	iVRQ==
X-Received: by 10.194.110.69 with SMTP id hy5mr30471190wjb.121.1428944529805; 
	Mon, 13 Apr 2015 10:02:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	uo6sm12276558wjc.49.2015.04.13.10.02.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 10:02:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 19:02:13 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150413170213.GK2330@jama>
References: <cover.1428939870.git.paul.eggleton@linux.intel.com>
	<abe2d51f35b85dcbbd43c61d9309bfd7e38d3244.1428939870.git.paul.eggleton@linux.intel.com>
	<20150413162828.GJ2330@jama>
	<2445584.6Z3eITqUyt@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2445584.6Z3eITqUyt@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/package: clarify installed-vs-shipped message
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
X-List-Received-Date: Mon, 13 Apr 2015 17:02:10 -0000
X-Groupsio-MsgNum: 64320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lildS9pRFgpM/xzO"
Content-Disposition: inline

--lildS9pRFgpM/xzO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 05:46:03PM +0100, Paul Eggleton wrote:
> On Monday 13 April 2015 18:28:28 Martin Jansa wrote:
> > On Mon, Apr 13, 2015 at 04:44:52PM +0100, Paul Eggleton wrote:
> > > Based on the number of times I've had to explain it over the years it
> > > seems that a lot of new users don't immediately realise what is meant
> > > by "shipped" here (nor should we expect them to) so let's at least
> > > mention packaging and briefly tell the user what they need to do. (I =
was
> > > going to go into more detail in the message, but there is really more
> > > detail than can be covered succinctly here.)
> > >=20
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > ---
> > >=20
> > >  meta/classes/package.bbclass | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcl=
ass
> > > index 5558d0d..9790e9d 100644
> > > --- a/meta/classes/package.bbclass
> > > +++ b/meta/classes/package.bbclass
> > > @@ -1132,12 +1132,13 @@ python populate_packages () {
> > >=20
> > >                  unshipped.append(path)
> > >     =20
> > >      if unshipped !=3D []:
> > > -        msg =3D pn + ": Files/directories were installed but not shi=
pped"
> > > +        msg =3D pn + ": Files/directories were installed but not shi=
pped in
> > > any package:">=20
> > >          if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn, =
True)=20
> or "").split():
> > >              bb.note("Package %s skipping QA tests: installed-vs-ship=
ped"
> > >              % pn)
> > >         =20
> > >          else:
> > >              for f in unshipped:
> > >                  msg =3D msg + "\n  " + f
> > >=20
> > > +            msg =3D msg + "\nPlease either set FILES such that these=
 items
> > > are packaged, or alternatively delete them within do_install"
> > We should also mention the possibility to fix Makefile.am,
> > CMakeLists.txt, ... not to install them in first place.
>=20
> This is the sort of thing I was alluding to in the commit message, I'd ra=
ther=20
> not get into too many specifics, or the message is going to end up very l=
ong=20
> indeed covering all of the things you need to pay attention to. That kind=
 of=20
> thing is much better covered in the documentation.

OK, maybe I'm too sensitive for this, because recently I was fixing few
recipes where do_install task was doing
cp -ra ${S} ${D}
and then INSANE_SKIP was used to ignore "patches" and ".pc" files
"installed" in ${D} but luckily not included in any package.

So I fear that obvious fix after reading this message will be to delete
"patches" and ".pc" directories in do_install instead of fixing the root
cause.

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lildS9pRFgpM/xzO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUr9pUACgkQN1Ujt2V2gBxbegCgpZiOCuMVsGe4jjgTOTbTuhGf
XvwAoKZ6YnYzLm/1QpzTnkn6XvPDd3Qz
=NdCA
-----END PGP SIGNATURE-----

--lildS9pRFgpM/xzO--
