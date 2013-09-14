Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2B18061592
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 13:15:15 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so1103759eek.36
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KUOJmbSZ0g6W8Z7JzlmRyEQXjtopqyZkyvlu9zLw51E=;
	b=hUKupFkjpWjKshLjIuEXDCFqj2b4O0uRBGzrJAaZ7QwmsEHKwG2rfvouoO/Y/YjMyF
	l23sZYkbvSX2OZlZyDq4tJU7LnJaISCyD+IPB+oLM3nZFijRs+5A/2qk4KnqnpY5C2do
	UWcQK9+KY6MckoIrywXJNr6ZDyEnSI64j6n31Sll3As0BEXc1MN8sl0ngy6BQkEHbqmZ
	vK6ioLDWsoUdRxiQtdNsPZm1a8uQZLSnxqb8pW2gSt6f/uwySC2POMXY7qdf97732eY+
	n7VYpqb228BFIesrCSOsvMZzN4MjluQT90PuZ5UJFIK9UClHfhgeEkbO6SwnY1MtgkRb
	r1lg==
X-Received: by 10.14.246.11 with SMTP id p11mr26612881eer.9.1379164516266;
	Sat, 14 Sep 2013 06:15:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm24044135eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Sep 2013 06:15:15 -0700 (PDT)
Date: Sat, 14 Sep 2013 15:16:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20130914131645.GD30637@jama>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-5-git-send-email-jason.wessel@windriver.com>
	<20130914080555.GA30637@jama> <5234545F.70706@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5234545F.70706@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: dvhart@linux.intel.com, Openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 14 Sep 2013 13:15:16 -0000
X-Groupsio-MsgNum: 45030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline

--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2013 at 07:19:43AM -0500, Jason Wessel wrote:
> On 09/14/2013 03:05 AM, Martin Jansa wrote:
> > On Fri, Sep 13, 2013 at 07:09:00PM -0500, Jason Wessel wrote:
> >> A newer version of syslinux is required for an EFI enabled isohybrid.
> >> This is used for the the capability to generate 3 types of ISO images,
> >> all of which can be booted off a USB device or HDD if copied with dd.
> >>
> >> 1) PC BIOS only ISO
> >> 2) EFI only ISO
> >> 3) EFI + PC BIOS ISO
> >>
> >> The syslinux.bbclass required a minor tweak because ldlinux.c32 is
> >> dynamically loaded and needs to be in the created media as of syslinux
> >> 5 and up.
> >
> > Hi Jason,
> >
> > can you please look at
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3944
> > ?
>=20
>=20
> I can look at fixing the defect, but there is no description of how to us=
e the directdisk to see the problem.  Could you provide an example?
>=20
> I added the directdisk to IMAGE_FSTYPES, but didn't get a .directdisk in =
the deploy directory so that is not how it works.   Also I think the right =
solution is to simply call syslinux_hddimg_populate() from the directdisk c=
lass vs having copied code for the install of the syslinux specific files (=
that is how 1/2 the problem occurred in the first place).
>=20
> Back to this particular patch, the ldlinux.c32 change does not affect the=
 bootdirect class.  The ldlinux.c32 is only required for isolinux and the c=
opy is contained with in the inherited syslinux class.

You can reproduce it by adding vmdk to IMAGE_FSTYPES and building e.g.
qemux86 and trying to boot it in VirtualBox.

It will always enable tty0 and only way to disable it now is to enable
menu, but that doesn't work with vmdk images because of missing
vesamenu.c32

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI0Yb0ACgkQN1Ujt2V2gBy4EQCdEkG1bcgwr+mVN4Njpf+YPUaf
f3gAoJX93+iTifEg/fH8I1e6y2pOEbuV
=n3+U
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
