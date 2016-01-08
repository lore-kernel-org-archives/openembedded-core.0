Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D23C60620
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 15:34:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b14so16558039wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 07:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s3nAKgJSjYqpsArNzLm1LTgiAFDPhGSFpSZJ0TdifNQ=;
	b=xler0R94CO2i8yAOxjZhQAJzdcvgiuc2Z4WA0cTtnLCP8izUPPYNGdKv7PuftCHlyn
	ek1YTvnnmdzYtNZxdgr74JLJ50mNTxjVT6oAzU2/tTcIKiatE5wuzMHUivdiASc1Yw2F
	vA2W+wAh4okUIwRH6WTwr3UeTJBkR+BMQFjEkaY/KB5ZYmpQ4VR0ccQtx6WLNpbJY0Ep
	AI2fn7AakFco6Kw4GzNmBBnc3o4j5D8FhQjrKupQPEfvX7j0FvyHUXXuVqoGSuQ0Akbc
	tRYovZs/jpCMHT09MzBGNCJtGYMwMUgthSGsubg0gNweq0S39f5cOQkXVsCnWJq5iClO
	J5xQ==
X-Received: by 10.194.9.169 with SMTP id a9mr119232757wjb.60.1452267260314;
	Fri, 08 Jan 2016 07:34:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ql10sm106625088wjc.23.2016.01.08.07.34.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jan 2016 07:34:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Jan 2016 16:34:51 +0100
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Message-ID: <20160108153451.GA2573@jama>
References: <CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
	<c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LbyG07bauQnVJeHYCcZ9=zhjFZdj44E1vS-kXHMVuq0BQ@mail.gmail.com>
	<5683B790.7000905@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <5683B790.7000905@collabora.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cups: update systemd support
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
X-List-Received-Date: Fri, 08 Jan 2016 15:34:20 -0000
X-Groupsio-MsgNum: 75722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2015 at 11:53:04AM +0100, Andrew Shadura wrote:
> On 11/12/15 22:39, Burton, Ross wrote:
> > Sorry for the delay in looking at this.  buildhistory-diff reports this:
> >=20
> > packages/corei7-64-poky-linux/cups/cups: FILELIST: removed
> > "/etc/rc2.d/S81cups /lib/systemd/system/cups.service /etc/rc5.d/S81cups
> > /etc/rc5.d/K36cups /etc/rc0.d/K36cups /etc/rc2.d/K36cups
> > /etc/rc3.d/S81cups /etc/rc3.d/K36cups /lib/systemd/system/cups.socket
> > /lib/systemd/system/cups.path /etc/init.d/cups" added
> > "/lib/systemd/system/org.cups.cupsd.socket
> > /lib/systemd/system/org.cups.cupsd.service
> > /lib/systemd/system/org.cups.cups-lpd@.service
> > /lib/systemd/system/org.cups.cupsd.path
> > /lib/systemd/system/org.cups.cups-lpd.socket"
> >=20
> > Looks like if systemd is enabled it removes the sysvinit files, but we
> > still need those installed if sysvinit is in DISTRO_FEATURES.
>=20
> I just had a look at the recipe, and it seems it removes those files on
> its own even without my patch. I guess fixing that makes sense in a
> separate patch then?

My latest bitbake world build shows new QA issue:

cups-2.0.4: cups: Files/directories were installed but not shipped in
any package:
  /lib/systemd/system/org.cups.cupsd.path
  /lib/systemd/system/org.cups.cupsd.service
  /lib/systemd/system/org.cups.cupsd.socket
  /lib/systemd/system/org.cups.cups-lpd@.service
  /lib/systemd/system/org.cups.cups-lpd.socket
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.

I'm not sure if it's caused by this change, but it would be good to fix
it.

>=20
> --=20
> Cheers,
>   Andrew
>=20



> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaP1xEACgkQN1Ujt2V2gBx68QCff+c0IfuwK40R4U4CaH/Vur34
OuEAnAuUBubeylsGigs+9nSwavrbczh/
=5cEf
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
