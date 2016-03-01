Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF5773D27
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 00:41:19 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so12312088wml.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PQiaaYprKmDARLOWehqI8PTMgfBoJL59VxI+9e0YrgI=;
	b=kr5j8RFCLkXyPUfaD75IiNE+DDLnKmINUgJvLijlqu+fZeotSuOUpl+ScxjrWpxrTL
	lUclyWE/aAJGqmfQYd2nt3o6awZJdgqsF/Yjs3GGEBnY529+OTlgQq42dIZ2Say7riFd
	v2O5/h373/AScc/d966yJLfc0ePm2RIuEl3L11DBvvBq9l60zkiCnDbRsvP2/ZFcPbJs
	C931882H25tZM6TLK7VRX8JSaj0N61+vwRHJTkBGFaHpJtY1otB98BA2lS+T/c9CVfAe
	TguyJHZmC5xoWHVGbYt5hrNBWFKEGScgjI5mS0SxUqEfw4Mq2hy+FSiD4mHFzFf3KWp0
	nOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PQiaaYprKmDARLOWehqI8PTMgfBoJL59VxI+9e0YrgI=;
	b=CCj54QbwXV/FxoTIhvPXU7x+Q2qMiUnfPfWD7A/wf3HS+hqxtuPlpM/cRtfZewt/o4
	UrVZ0e3+/L/GsoqMCnOPp4TSSVCsJUyHOhP+9RbGMq44vC5Javf4C8FILh3qa8SN0BPM
	Dsmo3IWbAeUj8cclYD3uj3FdlQlD4D6wwZMCAk4KOIiV2MzxJr/wsfK2S13dP146n8qB
	TYfzObZB35yldjP9ZcWbMwDyZTnEZjLVnoE/edIH35PyfDV8AqMceHxi0DaS7iGX0KpI
	f9ISr9KdWcux895ikgyGOgindUgrL6NHbnkCTukHNoQwMFIsHSBH9bVYlZ3sBm7Uu8ct
	xMhQ==
X-Gm-Message-State: AD7BkJJtl9UNXbYJBALV/djLV70A1HcLGZHHGB1dnhdgLU4F8E7RhXuuwik6YwRk2CO6Kw==
X-Received: by 10.194.112.165 with SMTP id ir5mr20871089wjb.113.1456792879572; 
	Mon, 29 Feb 2016 16:41:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s66sm18767919wmb.6.2016.02.29.16.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 16:41:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 01:43:09 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160301004309.GA2559@jama>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
	<CA+chaQfHZPKviheG2NY7miXe9YZir0pszp8qCQbb1kgzPABPDQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfHZPKviheG2NY7miXe9YZir0pszp8qCQbb1kgzPABPDQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Tue, 01 Mar 2016 00:41:21 -0000
X-Groupsio-MsgNum: 78953
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 10:30:17PM +0100, Martin Jansa wrote:
> No special configuration IIRC (will check tomorrow and send whole
> config.log).
>=20
> But it failed the same in my minimal chroot env with just oe-core and on
> Ubuntu jenkins slave doing bitbake world with many layers, here is full l=
og:
> http://errors.yoctoproject.org/Errors/Details/38149/
>=20
> and it shows --without-system-readline parameter.

It's caused by bbappend in meta-qt5

OE qemux86@ ~/build/oe-core $ cat meta-qt5/recipes-devtools/gdb/gdb_%.bbapp=
end
PACKAGECONFIG ??=3D "python"

But on the other hand does this change make more harm than confusing
error for people who try to build without readline in PACKAGECONFIG?

Regards,

>=20
> On Mon, Feb 29, 2016 at 9:50 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>=20
> > On Mon, Feb 29, 2016 at 12:43 PM, Burton, Ross <ross.burton@intel.com>
> > wrote:
> > >
> > > On 29 February 2016 at 20:40, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > >>
> > >> I'm a bit puzzled as our autobuilders build this all the time and we
> > >> don't see failures. Any idea what the configuration difference might
> > >> be?
> > >
> > > Since oe-core 94e1b917078bedf73830e54278af77f742c93581 gdb has a
> > > packageconfig for system readline, which is enabled by default (and h=
as
> > been
> > > enabled explicitly for a long time).  Do you have some local patches
> > adding
> > > more PACKAGECONFIG options but not enabling readline?
> >
> > gdb 7.10.1 depends on readline features which are not present in
> > readline 5.2 (ie the GPLv2 version). Using the gdb internal readline
> > is a workaround for people who don't want to switch to the GPLv3
> > version of readline.
> >
> > (Although gdb is itself GPLv3, it's self contained and easy to exclude
> > from release builds).
> >
> > > Ross
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbU5ZwACgkQN1Ujt2V2gBzjgACeJ6PC+XI3Xk0XiPISOd4EfrDf
+cYAn22IUO5iyj4I+txNdyDC89yHDHkc
=Kn5G
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
