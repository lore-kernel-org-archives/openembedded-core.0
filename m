Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6431177B6E;
	Wed, 29 Mar 2017 09:14:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o81so3837421wmb.0;
	Wed, 29 Mar 2017 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ltvUDJJKNtCaEJoq0TyufaJHVJ+TArUXiraiH9MRSbo=;
	b=F4k4AmE38gnkWdfoOJaB9TVQ2uZuE7B/qkieFnGGCZccTSV5OnDEiU5cXN7ue8p9IA
	FRYwEdQ+Rx60OVfCa2I0O2F1Q2KlfpiEuf57EbyfhVtvf4Y36+1hFYxbyWNjprinrdcS
	rpoXkD2Xp0hS7uz3JNbKVfIvBTyYuwZ2Wyw7VzJG6Pqfea6KMx2VjPC4HkGKA+zWAPR9
	9M8Os8CSraC6ZDLj65AhvWZnJjLet/bAot6urPO8oxpRw2qtOGcC1gb3gknTl30AEgLw
	bRr6ciV8X4NSY3F6OwGLt+oKpjNMJAHnBLS9efx6cSUAr5edvHtL8ZJGtyTddGQwskmr
	pNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ltvUDJJKNtCaEJoq0TyufaJHVJ+TArUXiraiH9MRSbo=;
	b=NOU/yai4ZPN3gSkYBNI6aPnPhvxJb0b76+HP0LFhABoSWY5Q4JjYNigrRcz2JIDalS
	l4L21h0rxHilzP+wAQB4k4/ZbUvjbBwBRaT8Qfi2R47n++ZIdQik7GPvUYaq087CvF+S
	40sO82PjiHIkRwZlDuAgt1TPYV8+563GEba+fGAvmcee07q6+b/L8k2B9cOUt+HKOsl3
	M5nTGNJS1ogAf+eXxrwWSDWUvm3KrCJSlY6i3kuP4MrErLyUkfty2B61FESg7sgwcTsd
	5o4fNYmxhZfrCHVrtDHDqIu+kVQaAotcWpP7jTpQXS1pXatSl+MDp/pbT8KdM81RYqMD
	PxWA==
X-Gm-Message-State: AFeK/H1TTv7+lZS7GQfQXFvurWGmObWtKRf42ZTXbGdY8inN7EysqSnowxyqXbJaCsAoAQ==
X-Received: by 10.28.174.203 with SMTP id x194mr304688wme.85.1490778886818;
	Wed, 29 Mar 2017 02:14:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n80sm8537729wrb.24.2017.03.29.02.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Mar 2017 02:14:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Mar 2017 11:14:44 +0200
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170329091444.GB3298@jama>
References: <20170329072316.GA3298@jama> <1490776523.6396.407.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1490776523.6396.407.camel@intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-03-27
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
X-List-Received-Date: Wed, 29 Mar 2017 09:14:47 -0000
X-Groupsio-MsgNum: 95431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline

--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 10:35:23AM +0200, Patrick Ohly wrote:
> On Wed, 2017-03-29 at 09:23 +0200, Martin Jansa wrote:
> > INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2=
-linux.org/buildlogs/oe/world/pyro/log.report.20170328_014155.log
>=20
> That used OE-core 552bd78, if I read this right:
>=20
>         =3D=3D Tested changes (not included in master yet) - openembedded=
-core =3D=3D
>         latest upstream commit:=20
>         552bd78 wic: use kernel_dir to find systemd-efi bootloader
>=20
> >     * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile
>=20
> http://errors.yoctoproject.org/Errors/Details/135202/
>=20
> "gcc-ar: not found" - that should have been fixed by OE-core 23a12d87a6
> "fix toolchain selection", which is included in OE-core 552bd78 and thus
> should have been included in the build.
>=20
> However, the error above was "Submitted on: 11/03/17 10:13", which was a
> while ago and in particular before that fix.
>=20
> Did ovmf really fail in the latest world build?

The report shows:
http://errors.yoctoproject.org/Errors/Build/34933/
which leads to:

http://errors.yoctoproject.org/Errors/Details/138261/
Submitted on: 27/03/17 05:31

So yes it failed again, but this time with different error:
TOPDIR/tmp-glibc/work/i586-oe-linux/ovmf/git-r0/recipe-sysroot-native/usr/b=
in/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/6.3.0/ld:
internal error in do_layout, at ../../gold/object.cc:1821


>=20
> --=20
> Best Regards, Patrick Ohly
>=20
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>=20
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNt7AwAKCRA3VSO3ZXaA
HI9eAJ9xiveMGZGUIPYH8hNMF0gk+/YjQQCgrnPPp/058SBXoqZwKazmfoCThvo=
=qK0p
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
