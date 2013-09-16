Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id B6EB26041D
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 19:30:01 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2208288eek.20
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=chaCcyrTqrOxCa106byUUCLn6n5qFD8d1WE4jQz59bQ=;
	b=T/wr4RgjYTZLayUZjehoCsh5X7Y0H9YNhniNZnz1t9Lfp+DOWMmYjV2uIey9+95nac
	rNjq5pJoEEg7J3rhwvCrfJyZjzV9IiiwWkw1XzvsS2vZ5FtyQg+oC/kkje8cKNgrguRN
	0eabPlOSQGe89e3p/5px7WXY5eo7JfAdxVP2OdTYhh4I/o9x8ShEwgFDaJ78CRjB2kvc
	vY5i/r57O4uGHrCxPlys+oqH/t78Y8gllChOb3gsKD2dmWFrE2RK62tOgvfaVZQ4aLHx
	XCXlJlZtM6QVWKcoHCdqoTQhS6LGFcq4rX16a5TPz5vhq7p1CVFgP9JoK9R9xeYIo0SY
	sGjw==
X-Received: by 10.15.35.196 with SMTP id g44mr45330337eev.18.1379359802370;
	Mon, 16 Sep 2013 12:30:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm44583336eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 12:30:01 -0700 (PDT)
Date: Mon, 16 Sep 2013 21:31:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20130916193133.GA26007@jama>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-5-git-send-email-jason.wessel@windriver.com>
	<20130914080555.GA30637@jama> <5234545F.70706@windriver.com>
	<20130914131645.GD30637@jama>
	<1379355017.1285.171.camel@dvhart-mobl4.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1379355017.1285.171.camel@dvhart-mobl4.amr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 4/7] syslinux.bbclass, syslinux: Update to syslinux 6.01
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
X-List-Received-Date: Mon, 16 Sep 2013 19:30:02 -0000
X-Groupsio-MsgNum: 45102
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 11:10:17AM -0700, Darren Hart wrote:
> On Sat, 2013-09-14 at 15:16 +0200, Martin Jansa wrote:
> > On Sat, Sep 14, 2013 at 07:19:43AM -0500, Jason Wessel wrote:
> > > On 09/14/2013 03:05 AM, Martin Jansa wrote:
> > > > On Fri, Sep 13, 2013 at 07:09:00PM -0500, Jason Wessel wrote:
> > > >> A newer version of syslinux is required for an EFI enabled isohybr=
id.
> > > >> This is used for the the capability to generate 3 types of ISO ima=
ges,
> > > >> all of which can be booted off a USB device or HDD if copied with =
dd.
> > > >>
> > > >> 1) PC BIOS only ISO
> > > >> 2) EFI only ISO
> > > >> 3) EFI + PC BIOS ISO
> > > >>
> > > >> The syslinux.bbclass required a minor tweak because ldlinux.c32 is
> > > >> dynamically loaded and needs to be in the created media as of sysl=
inux
> > > >> 5 and up.
> > > >
> > > > Hi Jason,
> > > >
> > > > can you please look at
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3944
> > > > ?
> > >=20
> > >=20
> > > I can look at fixing the defect, but there is no description of how t=
o use the directdisk to see the problem.  Could you provide an example?
> > >=20
> > > I added the directdisk to IMAGE_FSTYPES, but didn't get a .directdisk=
 in the deploy directory so that is not how it works.   Also I think the ri=
ght solution is to simply call syslinux_hddimg_populate() from the directdi=
sk class vs having copied code for the install of the syslinux specific fil=
es (that is how 1/2 the problem occurred in the first place).
> > >=20
> > > Back to this particular patch, the ldlinux.c32 change does not affect=
 the bootdirect class.  The ldlinux.c32 is only required for isolinux and t=
he copy is contained with in the inherited syslinux class.
> >=20
> > You can reproduce it by adding vmdk to IMAGE_FSTYPES and building e.g.
> > qemux86 and trying to boot it in VirtualBox.
> >=20
> > It will always enable tty0 and only way to disable it now is to enable
> > menu, but that doesn't work with vmdk images because of missing
> > vesamenu.c32
> >=20
>=20
> Thanks for catching that Martin.
>=20
> I agree that the SYSLINUX_SERIAL needs to be respected regardless of if
> menu is set.

Yes, that would preserve existing behavior, not everybody wants to
have menu.

> It should be acceptable to install vesamenu.c32 I would think, although
> it sounds as though there is some work to perform to make sure
> bootdirect uses all the new infrastructure as well.

Yes it would be nice to have the possibility to enable menu, it can even
be enabled by default once it's working properly and there is an option
to disable it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI3XJUACgkQN1Ujt2V2gBzE6ACeMSTmDiwH4rzlsUMTlVGreSvl
78wAnjd5zNQ/8qb7IeSy99qfbBRiXjqV
=LoZw
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
