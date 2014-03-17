Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 65AE86ED34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 11:40:43 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so3985286eek.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vQHJH5GHPWne+uury3YFp7mLM7490rNLxGozERhAZK0=;
	b=dPYDlyp4Z+LuDGlygvyI4JB9QqDiREmXgag4hL3MQU7SfI0Ek5F6m3bwJ7Xssln94L
	9RT2YVu0Xcowie6PKFPKxYzbtnKUDcMXsbRKcpb2A5LwcdpIiSFEBbgx7pCCiu90HdrT
	hkwlw6STzxrSnOybbZAgLDKPlJ6Bys78+T9Xmrz7DPQvZLc9ZMliOR5sDK9OHMQsXudH
	Eo56s3GgD3t7cWT/Qh534Kh4AyxENFvKSvorToAkt9UnjtO+LETTKqxmbDUDGkLJcJoe
	4oF5WihDEp6R/bf8LtgO0z9KMMqnQLvnpDgLa4p7iL5gZ+knMwD+loIcJEKehW/SflL1
	V2jw==
X-Received: by 10.14.127.4 with SMTP id c4mr3165607eei.86.1395056444143;
	Mon, 17 Mar 2014 04:40:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w6sm38986071eex.9.2014.03.17.04.40.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 04:40:42 -0700 (PDT)
Date: Mon, 17 Mar 2014 12:41:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140317114101.GG3725@jama>
References: <cover.1394948105.git.raj.khem@gmail.com>
	<1395055876.3808.38.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1395055876.3808.38.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] systemd-211 upgrade and uclibc fixes
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
X-List-Received-Date: Mon, 17 Mar 2014 11:40:46 -0000
X-Groupsio-MsgNum: 51281
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
Content-Disposition: inline

--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2014 at 11:31:16AM +0000, Richard Purdie wrote:
> On Sat, 2014-03-15 at 22:42 -0700, Khem Raj wrote:
> > Finally, managed to get systemd 211 to boot on uclibc and eglibc
> > on all supported qemu machines, this should fix bug #5940
> >=20
> > Additional functionality in uclibc is needed to support this
> > systemd
> >=20
> > gnutls, glib-2.0, intltool fixes are uclibc specific and are needed
> > to get uclibc images going
> >=20
> > util-linux fix is moulded to support uclibc
> >=20
> > I have been testing this fix on the qemuarm/qemuppc/qemumips/qemux86/qe=
mux86-64
> > on both uclibc/eglibc images and its been working good.
> >=20
> > The following changes since commit 58aae40bbf8edd9c5ca70b2094eeb724391f=
1993:
> >=20
> >   eglibc: Update SRC_URI to point to final download location (2014-03-1=
3 20:44:48 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.openembedded.org/openembedded-core-contrib kraj/systemd-211
> >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dkraj/systemd-211
> >=20
> > Khem Raj (7):
> >   uclibc: Implement clock_adjtime()
> >   uclibc: Remove iconv.h
> >   gnutls: Link in pthread explicitly for uclibc
> >   glib-2.0: Fix localedir expectations for uclibc
> >   util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
> >   intltool: Define DATADIRNAME=3Dshare for uclibc based systems
> >   Upgrade to systemd 211+
>=20
> I tried this on the autobuilder, with and without the pulseaudio 4->5
> upgrade. The result was:
>=20
> http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/buil=
ds/111
> http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/buil=
ds/112

Both links show pulseaudio/4.0 in error log and 4.0 needs something
like:
http://lists.openembedded.org/pipermail/openembedded-core/2014-February/089=
796.html

> so I'm afraid I can't take the systemd part of this series. Its getting
> late in the cycle for a pulseaudio 4->5 upgrade too :/
>=20
> Does anyone have any strong opinions on this?
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMm300ACgkQN1Ujt2V2gByN8wCgqYPkuFKPS/nJkriCLuSHlquu
0qoAn0l8KofVMLcrp+FOutdBMgA5fyDC
=EF+m
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--
