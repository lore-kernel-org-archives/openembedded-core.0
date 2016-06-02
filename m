Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B3AA677448
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 16:05:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a136so17086468wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9iqMzLqUw2Fy/uPw9dblqCp9oyv99Sllhvn8QKyk8iw=;
	b=O1vfv3wsrLis55EVJNDbxtYSuqL9myC+VSYozRWfWNXkv0/GAavEykIb7eKfvrws7r
	IjcM7mFf0/9kA0UwNv0U0CRCxL77ANo+wT2mULlujAhswITutwPGy69cNGFStlKt2sUA
	fJpQ3U3qRMJYVvAf/ezA8d9AkeWn8ndfT22nAPiNWlWB+5fk6MeAv7LneriixGULbYJQ
	DaBam918csjlWA2AMY5Uo5r74BrHmfASTntA6/kzaUVu0pvMs1Ts7QV8Al+StkViSya8
	rAbJ152O8sR+Bb8gs8qlIaXVRH0iRY7Z0PFgJRFscR04+7i/rjmamBOe7t6ZImCBfsUU
	Cpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9iqMzLqUw2Fy/uPw9dblqCp9oyv99Sllhvn8QKyk8iw=;
	b=kkpFY1igNjGYGx48eh4BrGglW1GZxVdnhuL8dkYtfsY/5HNa+hBTtdkJYZ16ywgVp6
	q6sVlYjgAl+//YW2Twz2pOaLlUGWozhA0qh0BZW711F7/Bu4VKn+zA06C8ARo1I0yuct
	UeSeCYs8262eOd01n2hnqbIEHhTArhQT2JC9j3KDXRU7cCcVvDRkgYDBTmkhe4O9a7nF
	LSN+JA/ONYI1g1mXWLOsLJh7hTLvDEZ1XP86BPC3iXJzzKoDR01lXVMSpUUjf9IBPyb0
	BJSewN1zE4Pu8yf2u8slZUuwNPdPYVVSIqgs3RfRnVuoVBFHkQ8XxuDRsw2pkIxD1ct8
	/Mkw==
X-Gm-Message-State: ALyK8tJqOTbwKpJi+IfuVWTw7DAtDQIreei1rEMwMOi618GFr2iE8QuEGWzbZy1/lz4IwA==
X-Received: by 10.28.50.194 with SMTP id y185mr16377108wmy.51.1464883509526;
	Thu, 02 Jun 2016 09:05:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dj4sm1279006wjc.13.2016.06.02.09.05.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Jun 2016 09:05:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Jun 2016 18:05:35 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160602160535.GA2571@jama>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<CAHiDW_H7EpNa6cPQxinNdq5WHvjxOQ81bEOZTWVECTOprU+8zg@mail.gmail.com>
	<3214370.KVsKdKNYRI@peggleto-mobl.ger.corp.intel.com>
	<1570473.5iIQe2jHu3@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1570473.5iIQe2jHu3@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/42] gcc: Add gcc6 recipes
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
X-List-Received-Date: Thu, 02 Jun 2016 16:05:09 -0000
X-Groupsio-MsgNum: 83004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2016 at 10:23:35AM +1200, Paul Eggleton wrote:
> On Wed, 01 Jun 2016 10:20:23 Paul Eggleton wrote:
> > On Tue, 31 May 2016 11:12:21 Jussi Kukkonen wrote:
> > > On 11 May 2016 at 20:35, Khem Raj <raj.khem@gmail.com> wrote:
> > > > +#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> > > > +BASEURI ?=3D "git://
> > > > github.com/gcc-mirror/gcc;branch=3Dgcc-6-branch;protocol=3Dgit"
> > >=20
> > > I guess this is where git2_github.com.gcc-mirror.gcc.tar.gz download =
comes
> > > from? It increased the size of my downloads-directory by >30% -- and I
> > > must
> > > have quite a bit of old junk in that directory already.
> > >=20
> > > Is there no other solution to this than a 2.5G git copy (honest quest=
ion,
> > > I
> > > don't know gcc)?
> >=20
> > We went down this road before and it wasn't great for users. There is at
> > least a tarball for 6.1, we'd presumably need some patches on top of th=
at
> > (~43 if we were to simply take what's in the gcc-6-branch between 6.1 a=
nd
> > bd9a826, minus the "daily bumps").
>=20
> Perhaps that was a little unclear - when I say "we went down this road be=
fore"=20
> I'm agreeing with Jussi - we pointed to a git branch in a previous releas=
e=20
> with the same resulting huge download for everyone, something I think we=
=20
> should avoid if at all possible.

Maybe it's biggest but at least there is only one copy of it:

top 10 in my downloads (archives and then git clones).

823M    /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.14.git.tar.gz
831M    /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.10.git.tar.gz
893M    /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.17.git.tar.gz
934M    /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.19.git.tar.gz
969M    /OE/downloads/git2_git.yoctoproject.org.linux-yocto-4.1.git.tar.gz
1.2G    /OE/downloads/git2_git.yoctoproject.org.linux-yocto-dev.git.tar.gz

2.4G    /OE/downloads/git2_github.com.gcc-mirror.gcc.tar.gz

854M    /OE/downloads/git2/github.com.qtproject.qtwebengine-chromium.git

877M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.10.git
900M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git
921M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.17.git
964M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.19.git
999M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.1.git
1.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-dev.git
2.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.4.git

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldQWU0ACgkQN1Ujt2V2gByflACfZl7eJei8aTASP8zg+TC6IYUy
9DAAn0OCf/FVQsHZZEmxIrfyI2/rI6Yu
=XhbN
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
