Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f43.google.com (unknown [209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id B8FC565FC8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 May 2014 08:42:13 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz1so5150408pad.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 May 2014 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HYjvztDswzFa6CfPpllPuP6xAIRr9G/g0mLTg6NCOwc=;
	b=YUDYYcDpaP7qMKmt0qj9FKLEaa7pw3mVqmx+1hMY4ssNXNBsVlrqW07oEzFL+La9gd
	yLBBDx/LWJdUd82KtwOSiDS/N71Fyh0a35+2WmvI3xjMLR3QHBvAaeyPva0hmwRrDeqF
	wfyNh3vSU+cTK+KsSiuA8y9rSAGnLV+Kre0t4XEzuC1BipbNDX/F3Ox/aR7LbYYBoiln
	QjF0DTNXLBuRbmeentGnCxYyMCl/0Pbo1Oc3tz+hXV7bhRtS8Wg9LiBfwBK5F6D6pWTx
	BxtpHsKp0NwVSRj8ZXmUZAKQyt7w/l+oe3568JRKBLy0llC8aRQcHIMRip9d+6pJQdeu
	dwTA==
X-Received: by 10.66.226.145 with SMTP id rs17mr12410094pac.144.1400920934986; 
	Sat, 24 May 2014 01:42:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jq6sm8232078pbb.76.2014.05.24.01.42.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 May 2014 01:42:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 24 May 2014 10:42:13 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140524084213.GC2715@jama>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1400672277-7181-4-git-send-email-Matthieu.Crapet@ingenico.com>
	<1423131.I8v84STvfF@peggleto-mobl5.ger.corp.intel.com>
	<CAMKF1srVR0u6OLL_6ZAFLjcbvf2iHNRbTRbZGX5yGtGgX1CUwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srVR0u6OLL_6ZAFLjcbvf2iHNRbTRbZGX5yGtGgX1CUwQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libav (9.13): remove DEFAULT_PREFERENCE
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
X-List-Received-Date: Sat, 24 May 2014 08:42:17 -0000
X-Groupsio-MsgNum: 53515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline

--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2014 at 07:36:42PM -0700, Khem Raj wrote:
> On Wed, May 21, 2014 at 4:57 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> >> Use PREFERRED_VERSION_libav in your distro definition instead.
> >
> > Why? PREFERRED_VERSION_libav will override this in any case...
>=20
> I would rather ask why not ? we are pinning to older version is there
> a reason for that ?

Current openal-soft, gst-ffmpeg and xbmc fail with libav-9, mplayer2
fails with old libav-8, we need someone to work on making them
compatible with the same version of libav (preferably newer one - 9 or
10) and then we should switch.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOAW2UACgkQN1Ujt2V2gByRQQCfd84ZIGmcCi1TCJ7cfUsYpx52
uDQAn0R/VzK/+nMWG8t1i3R0n2MkXZ05
=UvnJ
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
