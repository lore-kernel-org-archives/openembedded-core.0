Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86D7D71A39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 11:44:07 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l131so9435313lfl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nFe8/oqtg+L/6pomSkh0pHMNA2RgNhJTW1JMNa03GdE=;
	b=Q/65WeujV18LKdP2glW2XD93XJ988XYCV4Zs3KBfVt3ga9WKxj2AmuCaSyKRslDBOD
	05bQJ9aC41S88WPx9pOcnUjNgTXgWI3YBYw7Zmuco5/EsIhTE2aPoRkXeERX5NtGG+/Y
	CGL5drsRhLDLMCC0SPy2chM3EZRbZuDuvMxyzXDJtZYPe+lNYBBybYlyCX2V2qMqx7XQ
	KkLshp6a3XXnhO83Dec/rDibHLAHYDo9/K7e1HLi/2s834OU/PpcZP/BJJc+khqvH1/A
	pmWQDfK7gnfyuDoxT/eCkC5RRiG3H/pVqUMHb2Gu7T86W0f1jsx6ZVh96BNmfx5cCHYO
	vn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nFe8/oqtg+L/6pomSkh0pHMNA2RgNhJTW1JMNa03GdE=;
	b=HioJzpXreKeiUTrL693yzXecfXAJBjJeqE5J309aNdRMMEPTgnSIDk1wnM6vZbGiJJ
	wXX8UXpbU68WY5sWyDX3alBZO48lMJ2C7sHXPch0THUYxJ4GiEulYmcz6fmpOEhk+44w
	AI/JAU8v/eI3PPdmL2+uXAZLte0qAYrqS8SRpDfpAk4oupR3DyHPr6H2182OhIcM5mp3
	i+tjN0e37dSGxK0vGe4h7OLgAHi+87V6cvmDk+P2Qkzte7D5adwMIYtZ6yKyy25E89ZP
	2TUmNJSbzCurJrIngh7h+ajY3vBYUBoM6HeJIr6BkB+WQARhEzcybo+F6XqRzjFbXq87
	mfBw==
X-Gm-Message-State: AA6/9Rmc1nr7PKwHrq/WXBAtGI1I613kWjZrRAeb3PQAPFh6d2d9RLo+U2hKWOEMNmo0Lg==
X-Received: by 10.194.142.116 with SMTP id rv20mr6888746wjb.184.1476359048776; 
	Thu, 13 Oct 2016 04:44:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	ux6sm10364215wjb.18.2016.10.13.04.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Oct 2016 04:44:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 13 Oct 2016 13:44:05 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20161013114405.GA2924@jama>
References: <20161012132615.GC2923@jama>
	<7066324.XsME15mTTJ@peggleto-mobl.ger.corp.intel.com>
	<3373280.EktDFKHOVZ@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3373280.EktDFKHOVZ@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK_OLDEST_KERNEL vs OLDEST_KERNEL
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
X-List-Received-Date: Thu, 13 Oct 2016 11:44:08 -0000
X-Groupsio-MsgNum: 88155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2016 at 04:23:21PM +1300, Paul Eggleton wrote:
> On Thu, 13 Oct 2016 09:38:08 Paul Eggleton wrote:
> > On Wed, 12 Oct 2016 15:26:15 Martin Jansa wrote:
> > > is this separate variable working correctly?
> > >=20
> > > It was introduced in:
> > > commit 522ba4c51fff53566678b2689d0d63c393e417b3
> > > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Date:   Fri Sep 11 13:25:46 2015 +0100
> > >=20
> > >     populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues
> > >    =20
> > >     aarch64 sets OLDEST_KERNEL to 3.14. This stops the aarch64 SDK
> > >=20
> > > installing on anything with an older kernel which is clearly incorrec=
t.
> > >=20
> > >     I attempted to extract the correct non-overridden version from the
> > >     data
> > >=20
> > > store but it proved problematic and I was running into data store iss=
ues.
> > > Those are a separate problem but there isn't time to fix this right n=
ow.
> > >=20
> > >     Instead just code the SDK kernel version separately to work around
> > >     this
> > >=20
> > > for now (and fix the autobuilder tests and SDK usage).
> > >=20
> > > But when I'm using:
> > > OLDEST_KERNEL =3D "3.2" (default)
> > > SDK_OLDEST_KERNEL =3D "2.6.32"
> > > because we would like to use SDK on host with older kernel, then
> > > SDK_OLDEST_KERNEL helped to bypass the uname check in environment-set=
up
> > > script, but then gcc cannot be used, because it fails immediately wit=
h:
> > >=20
> > > FATAL: kernel too old
> > >=20
> > > So I'm not sure what this variable are trying to achieve, maybe
> > > autobuilder
> > > tests were only testing setup script and not the actual $CC?
> > >=20
> > > The other option is that it works only when sdk toolchain is built wi=
th
> > > default OLDEST_KERNEL (which is lower than OLDEST_KERNEL_aarch64) and=
 only
> > > target bits use OLDEST_KERNEL_aarch64, but those aren't executed on h=
ost
> > > using SDK.
> >=20
> > I'm not sure how this ever could have worked, since it doesn't enter in=
to
> > the nativesdk-glibc configuration. It seems to me that the glibc recipe
> > needs to be using SDK_OLDEST_KERNEL in place of OLDEST_KERNEL for
> > class-nativesdk.
>=20
> Thinking about it - even if that were fixed, would setting it to 2.6.32=
=20
> actually work on master? We are now using glibc 2.24 and that requires a=
=20
> minimum kernel version of 3.2.0.

I think it might work in the "special" case RP mentioned in commit
message and I've tried to describe (I admit quite badly) in my e-mail).

With qemuarm64 I can see from bitbake -e:

OE qemuarm64@ ~/build/oe-core $ grep ^OLDEST_KERNEL=3D env.*glibc*
env.glibc:OLDEST_KERNEL=3D"3.14"
env.nativesdk-glibc:OLDEST_KERNEL=3D"3.2.0"

Because the nativesdk-glibc doesn't use the aarch64 OVERRIDE

OE qemuarm64@ ~/build/oe-core $ grep ^OVERRIDES=3D env.*glibc*
env.glibc:OVERRIDES=3D"linux:aarch64:build-linux:pn-glibc:qemuall:qemuarm64=
:aarch64:nodistro:class-target:forcevariable:libc-glibc"
env.nativesdk-glibc:OVERRIDES=3D"linux:x86-64:build-linux:pn-nativesdk-glib=
c::nodistro:class-nativesdk:forcevariable:libc-glibc:virtclass-nativesdk"

so it's using "default" OLDEST_KERNEL

meta/conf/bitbake.conf:OLDEST_KERNEL =3D "3.2.0"
meta/conf/bitbake.conf:OLDEST_KERNEL_aarch64 =3D "3.14"

The actual SDK (e.g. meta-toolchain) on the other hand is built with
aarch64 in OVERRIDES, so 3.14 made it into the setup environment script
even when the glibc included there was built against 3.2.0

OE qemuarm64@ ~/build/oe-core $ grep ^OVERRIDES=3D env.meta-toolchain=20
OVERRIDES=3D"linux:aarch64:build-linux:pn-meta-toolchain:qemuall:qemuarm64:=
aarch64:nodistro:class-target:forcevariable:libc-glibc"

So this might be useful for cases where target specific OLDEST_KERNEL is
higher than the OLDEST_KERNEL used by nativesdk-glibc, but in my case it
isn't enough and I had to lower the kernel version in both (which now
I'm testing to see if Khem's and glibc's commit message was right about
the x86/x86_64 compatibility - I've already verified that building arm
image with 2.6.32 OLDEST_KERNEL causes postinst in do_rootfs to fail,
I'm waiting for local build to finish to see the actual error.

Next step is to see if arm binaries built with 2.6.32 nativesdk-glibc
(on x86 host) work in arm image built with 3.2.0 glibc - this wasn't
clear to me from the commit message.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf/c4MACgkQN1Ujt2V2gBy5VACfXht6A3liOUfonP/X0wwDhEzu
i7sAn2+6X/5+jyXLx+wApWtWhjW0fwjw
=qD4g
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
