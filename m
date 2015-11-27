Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 32C326012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:18:56 +0000 (UTC)
Received: by wmec201 with SMTP id c201so65950727wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GcrppAbv/2AOp1G0ISOEMjIw5CnDloJPef769uXIusY=;
	b=IXqdX1aghZwx87rKB76yHsyx8mNNuZLUhME0b2Q+Mmx30ip1XwvG+T7r4uhclR6IH0
	BcCv/pKBKSRs7hV8cvglPtsKWfE9BFWTsl/jSRvL3je8YBN792e3Cn7Otfbp62fr4TkL
	jxOCxgxpy8PGujOFSq5gnz19ryRoVgTDYZct0RHv/ayaaIl865eDbDUDqCouJQHGlIrF
	MSGn0r/Wj6Wbb4PcJVNSYhpfczXmxZb9+oHDQLQA+m0XwZbL7oQi2s/ZUa/D4Rj4qanu
	axvQesiAu8aPH/l8DagIprkvmAwia501Fxd5r+jNMa8UxXtu0BWoBngwLnqhXn+fvatu
	WirA==
X-Received: by 10.28.89.137 with SMTP id n131mr10301894wmb.9.1448623137091;
	Fri, 27 Nov 2015 03:18:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 186sm7029774wmv.9.2015.11.27.03.18.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 03:18:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Nov 2015 12:19:32 +0100
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20151127111932.GC17303@jama>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<CAP9ODKq4R9UT2oL_vMALhCA_ocqCSxJoegCa_WEgy0Xj9xFT5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq4R9UT2oL_vMALhCA_ocqCSxJoegCa_WEgy0Xj9xFT5A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Use libjpeg-turbo in place of libjpeg
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
X-List-Received-Date: Fri, 27 Nov 2015 11:18:57 -0000
X-Groupsio-MsgNum: 74084
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZOBTspFzEMOlPevk"
Content-Disposition: inline

--ZOBTspFzEMOlPevk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2015 at 09:13:22AM -0200, Otavio Salvador wrote:
> On Fri, Nov 27, 2015 at 9:04 AM, Maxin B. John <maxin.john@intel.com> wro=
te:
> > This patch set provides libjpeg-turbo as a drop-in replacement for libj=
peg.
> >
> > libjpeg-turbo is a fork of the original libjpeg project.Most of the maj=
or Linux
> > distros (Fedora, Debian, OpenSUSE) moved from libjpeg to libjpeg-turbo =
recently.
> > lbjpeg-turbo provides better JPEG compression/decompression(at least 25=
% faster)
> > while maintaining same API/ABI as libjpeg.
> >
> > Once we reach an agreement on this, based on the decision, we can move =
the
> > libjpeg package to meta-oe for applications which may depend on API ver=
sion 9.
>=20
> I support this change, due:
>=20
>  - agreement with major Linux distros
>  - performance improvement
>=20
> I also think moving libjpeg (API version 9) for meta-oe is fine as
> well. I am not aware of any application which requires it, though.

I'm not aware of any as well, so I would prefer to drop libjpeg
completely.

+ less junk in meta-oe
+ people were confused about multiple jpeg providers before, now they
would be again, but without good reason (as nobody knows about apps
depending on libjpeg9).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZOBTspFzEMOlPevk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZYPEMACgkQN1Ujt2V2gByvewCgpE2PehKkvpRWBC+/5+jvsEjA
VzgAni4sdMLiA1YlpWH2e6nXCCSRgyv0
=E+h1
-----END PGP SIGNATURE-----

--ZOBTspFzEMOlPevk--
