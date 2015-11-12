Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE327719C;
	Thu, 12 Nov 2015 12:17:05 +0000 (UTC)
Received: by wmec201 with SMTP id c201so88611277wme.1;
	Thu, 12 Nov 2015 04:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JQHMhCtd07Xah21lV6l9O9YOFzz18z6IN7bHdbYTJBI=;
	b=k8HxY7tP93LLUOPaDp+FY59O1ngLIxQaHpy5Vrg0RzFgZ/Hvj2fH8sJI5Fp26xjUeO
	KfwrCyABbQ7XJGsmWWB1FpUQwQXe70cKWnUaqqpfwlO1wfKZr6LOm/wjh5dOfxHfYyXq
	EVamfGp2KfQoIl1AtN+2wcTg/fWrTjS1isNR0/ePq5hatoGwFIA7x8eHqsC7MHMMGcZJ
	TZRsu0tsihfw0gllzmRdyQ+61g4vNuRVprsMgYzygSupLgcQ8rG4nhG1MqRRdBn+QZzv
	Up0i+H2OhziB5SG/AGwVQHbdNPijrgRpA7ABTjrnDwiLRRuDBIWQXPvWf6dB5/6KvJQh
	v7lw==
X-Received: by 10.28.218.72 with SMTP id r69mr17666463wmg.98.1447330625658;
	Thu, 12 Nov 2015 04:17:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	b12sm30446422wma.6.2015.11.12.04.17.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 04:17:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 13:17:21 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151112121721.GE2574@jama>
References: <20151112114311.GD2574@jama>
	<CAJTo0LaeSCxpDbt2QmKXyE+hdYJs5Sb7NuVPZ3=1ZzyfrVfd7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaeSCxpDbt2QmKXyE+hdYJs5Sb7NuVPZ3=1ZzyfrVfd7A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, test-dependencies 2015-11-12
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
X-List-Received-Date: Thu, 12 Nov 2015 12:17:06 -0000
X-Groupsio-MsgNum: 73294
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline

--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 12:12:09PM +0000, Burton, Ross wrote:
> On 12 November 2015 at 11:43, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libgudev, but it isn=
't
> > a build dependency?
> > WARN: gammu: gammu rdepends on libgudev, but it isn't a build dependenc=
y?
> > WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2
> > rdepends on libgudev, but it isn't a build dependency?
> >
>=20
> Looks like oe-core should take gudev for consistency between init systems.

Using correct DEPENDS should be enough to get at least deterministic
builds.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEg1AACgkQN1Ujt2V2gBzEIQCcC+xMsVmgkbX7CLbTVinpenSF
phIAnjFdoHwxOGEFVybnItl5uYoJ89ru
=Myfd
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--
