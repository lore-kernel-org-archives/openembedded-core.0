Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNejt-0000VU-BA
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 09:37:44 +0200
Received: by mail-pd0-f174.google.com with SMTP id p12so1280028pdj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 00:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=uKodjflFBNiRFrINZ48eKwuIifFT4hhrOk47bCNhGIc=;
	b=lU+KprAHgTavF65OE7bKsHGvyTNopWKeRK1RcwxH1LN36ed3ZG19NytP9Zz+vNOSkW
	K+EqQMqczeAwxGR5atN2mSxkdppluPxClCHHwC5T6WLmj2T7WOESNEtIRvWyuA0F+9km
	xFsPkxrpRzjyH4cifxXR/YwM6Ua8FFCBolDLNcokk/2rBL80M1qTAg5HQaf78tCsnh1l
	TtSl677yT0J7hR9qkkp78LZBCCucp4P40Q2ZxEwwfbla2bMQGGSTp5oXl2BGP/YwZu3M
	o3L/sF8BeAN10kXdKcLWkq3iBMOwZila3QytCX71QjpDrXb8TO4ienMqBNX30B56iQLA
	Yobg==
X-Received: by 10.66.184.203 with SMTP id ew11mr8022814pac.73.1365060028175;
	Thu, 04 Apr 2013 00:20:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ri1sm9141831pbc.16.2013.04.04.00.20.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 00:20:26 -0700 (PDT)
Date: Thu, 4 Apr 2013 09:20:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Message-ID: <20130404072027.GB1271@jama.dyndns-home.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
	<CAGiJk9eHjN5mUAiyYx3n_0wVeNzPKkzc-y3cVruKSfw4S=8jTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9eHjN5mUAiyYx3n_0wVeNzPKkzc-y3cVruKSfw4S=8jTg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 04 Apr 2013 07:37:44 -0000
X-List-Received-Date: Thu, 04 Apr 2013 07:37:44 -0000
X-Groupsio-MsgNum: 37401
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline

--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 08:59:11AM +0200, Samuel Stirtzel wrote:
> 2013/4/3 Burton, Ross <ross.burton@intel.com>:
> > On 3 April 2013 15:51, Samuel Stirtzel <s.stirtzel@googlemail.com> wrot=
e:
> >> When we decide that we handle standard behavior different than the
> >> rest of the world, then this patch is basically a fork of systemd.
> >> Also we tell every affected software developer:
> >> "No your software won't work with OE-core / Yocto Project without
> >> adaption, we are incompatible with the systemd standard to make life
> >> more comfortable for (some of) us"
> >
> > Changing the default target depending on the use of the image isn't
> > really the same as forking systemd, and we're not making anything
> > incompatible.
>=20
> Please read above what I wrote to Richard.
>=20
> >
> >>> How would you implement this?  Register the alternative in systemd.bb
> >>> defaulting to graphical, and then switch it in every image recipe in
> >>> oe-core/meta-oe/etc that doesn't use an X or Wayland (patches coming
> >>> shortly) session?
> >>
> >> If this works why not?
> >> It sounds like a good idea, because this way would not break anything,
> >> and we would be compatible with the standard systemd.
> >
> > Obviously the nuances of my sentiment were lost as it was transcribed t=
o ASCII.
> >
> > I'm advocating changing the default target to multi-user and then
> > patching the two recipes where X session scripts are packaged to also
> > set the target to graphical.  People switching to systemd who don't
> > use the standard X sessions (they roll their own, or don't use X, or
> > whatever) will notice quickly that the default target needs to be
> > changed, and can do it in their graphical startup recipes.
> >
> > You're suggesting leaving the default target as graphical and changing
> > uncountable numbers of *image recipes* to override the default target,
> > the alternative being errors in the log.
>=20
> Image inheritance will hopefully reduce the number of required changes.
>=20
> >
> > So far "the community" disagrees on the approach here - we've had
> > vocal objections to errors in the log for any image, changing the
> > default target, and the other proposals.
>=20
> The seen error is a warning IIRC.
> Breaking something to fix a warning somewhere else seems like a bold move.
> Being incompatible with systemd standards to archive this seems to be
> a very odd compromise.
>=20
> >
> > We *do* need a way of changing the default target.  Do we at least all
> > agree that update-alternatives is a logical way of changing it on a
> > per-image basis?
>=20
> Yes it is required to have the possibility to change the target where nee=
ded.
> I guess update-alternatives will do the job.

I agree that old implementation of this was really ugly:
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/32492

But patchset which consistently updates all related recipes to use u-a
for default-target looks OK to me (I don't see better alternative).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFdKbsACgkQN1Ujt2V2gBwfOQCcDR1IEaJb5/5uRFFZ+5BuziwV
k7cAnjHaK8FZGUC/IXHsuZxDJ8jmAFTb
=V9J0
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
