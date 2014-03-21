Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 42C8D6F9F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 14:39:37 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so1907690eek.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8UGINwtU23i2iCE7B65WpkcppuUN6Y/Thrj2hbZo8VI=;
	b=sgpYjcYTrswTLOGrf/D9PMbM9vJ32C6ibF+LYNesdyvz2OyY9fNyaSWgcwkduemtZO
	TFzqqvdCslP8tBdFNNIJ9U/3n2z1np2EuV96ItNe3ZNMHxRXu/N+VL9Sk39ZMdLkbTMW
	y1OZY0war8rJtx95cQB8v1B0F8FJbMZqyYyalbq0Tz8OQYzr7zD/PbhosPLf6GzjO6ux
	iMKVVcGLm3E4DxDMMsjhcYgjYopikahTdLBuLJZOHMT/Hhw9SpW6aucWLc49K8rbnKOL
	Dm6WPHFZAmdy/N45bkzvmu1XAUDTNP/EEV+WqxsJAhG3aGSSd/P/G/nzlVOw5AeTkAsa
	cBkw==
X-Received: by 10.14.110.199 with SMTP id u47mr32165912eeg.74.1395412778007;
	Fri, 21 Mar 2014 07:39:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm11979586eef.15.2014.03.21.07.39.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Mar 2014 07:39:36 -0700 (PDT)
Date: Fri, 21 Mar 2014 15:39:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20140321143939.GI3726@jama>
References: <CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
	<CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
	<CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
	<CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Fri, 21 Mar 2014 14:39:38 -0000
X-Groupsio-MsgNum: 51469
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pe+tqlI1iYzVj1X/"
Content-Disposition: inline

--pe+tqlI1iYzVj1X/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2014 at 01:59:15PM +0000, Laszlo Papp wrote:
> On Thu, Mar 20, 2014 at 7:59 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
> > On 20 March 2014 19:01, Laszlo Papp <lpapp@kde.org> wrote:
> >> This init script is adding support for sysv and no more. This is also
> >> indicated in the first line of the commit message. I am sorry, but I
> >> will not test it systemd and with other systems
> >
> > You're not being asked to test with systemd.  You're being asked to
> > add LSB-standard sysvinit-specific headers to a sysvinit script.
>=20
> In my understanding, people were referring to two issues:
>=20
> 1) not working with systemd and what not compat modes. This is not
> something I will test any soon.

Other people already know it's causing the issues without LSB headers,
so if you just add them, you don't need to test it with systemd, other
people who care about systemd will do that for you or at least be OK
with adding this script, because it will have LSB headers (so it should
work fine in systemd world).

> 2) It is not consistent, whereas if I take a look into busybox, the
> consistency is what I do, apparently.
>=20
> I would like to quote from the Fedora wiki for instance:
>=20
> "LSB Headers are not required for Fedora SysV-style initscripts, but
> they may be used. There is no requirement in the LSB certification for
> any system scripts to be LSB compliant, and it can cause issues with
> ordering."
>=20
> So what is wrong about it without systemd and other compat modes? If
> it is that big a deal (i.e. blocker), perhaps it is better to document
> it in the contribution guideline as a generic trap.
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pe+tqlI1iYzVj1X/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMsTysACgkQN1Ujt2V2gBwjwwCbB6wO8dd9MdLsBhwVxFNRECg8
FxYAn2EcqYhjtLDZ7SDsTxe5OvED9k94
=cVY2
-----END PGP SIGNATURE-----

--pe+tqlI1iYzVj1X/--
