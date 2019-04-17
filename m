Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 52CD56D147
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:24:52 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id z17so27207623qts.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xS8d8q+uHTfUpQTkPITMK5DjAmm6NkXqg6GApd5Bt1k=;
	b=pRDgZ+mXd+ue6u1GaD3tpByokmvIX997xiJRx2Fx5dSzeRQBlL/pXeX9cH1FY0wi+q
	UMsZ2rZ7QCeucdPhUqhsBQ9msZpN5z4HNxucaIj3wRiEwI2mGSlO8y8AjwcyVR6ST4FG
	ltcDNKwEz15B+0Vo2e/MXP0iOoZ7UXLV7ymAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xS8d8q+uHTfUpQTkPITMK5DjAmm6NkXqg6GApd5Bt1k=;
	b=k4JUkFI3SmSu3TivGuNIjEGQ9r5pIXEet51/8IxNQYp5VHiUmquLUw2Kdx5OO3H2IX
	Y9JDl/PCQjhyfSvfc/d+7I3F4Jlc7sGnUauebHPhaazbq1Zt7rgzKtCf93vNO60jV6sT
	bzs1K7hS8t6Oimab6oqUj5VIehDKOEJP8Tlmeh3WNS9wcSdFncpfOYaul8URWuCAm+Fx
	RW2knNW9M9thfyLEziub3FuLjVvOFDA1UhLAqWiEcusYLCSGjx7UG04+jASkoKcWtr2P
	vpNsUk25LrTU+68LmVtzWVIfQxLnZ6SqRRcVyjs/YBnCBfTKXb+k/YzYiSogLQOhizU1
	vltw==
X-Gm-Message-State: APjAAAU+VYl73ssz3lU/0HiAr+W53yzx+9s8FAVpwzB66qA5BdTtsUNr
	D2lZnYsrEqkhtCpQX57VA/P8bHEZc6rtAw==
X-Google-Smtp-Source: APXvYqxXNRSsAarTyUv2IVIJVeY5hLTFTnII8s1tzJIBAHDbDzijhcvYCAQIKThrFI7OUPUtLtWEUQ==
X-Received: by 2002:a0c:b743:: with SMTP id q3mr13143675qve.60.1555507493234; 
	Wed, 17 Apr 2019 06:24:53 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id u2sm869935qkb.37.2019.04.17.06.24.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Apr 2019 06:24:52 -0700 (PDT)
Date: Wed, 17 Apr 2019 09:24:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190417132450.GB4664@bill-the-cat>
References: <20190417063944.65623440004@auh.yoctoproject.org>
	<20190417131842.GA4664@bill-the-cat>
	<CANNYZj9dFvhw8jRw305ugGxtHfHJtjdMQZqbKCbP-LNX-GnEXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9dFvhw8jRw305ugGxtHfHJtjdMQZqbKCbP-LNX-GnEXw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] vim: upgrading to 8.1.1174 FAILED
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
X-List-Received-Date: Wed, 17 Apr 2019 13:24:52 -0000
X-Groupsio-MsgNum: 123486
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3UPmaERo5Z2xREC"
Content-Disposition: inline

--O3UPmaERo5Z2xREC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 03:23:23PM +0200, Alexander Kanavin wrote:

> I think this is actually a devtool issue, where it won't expand the
> LICENSE path properly if there is a .. in it.
> Try 'devtool upgrade vim' and you should see the same error.

OK, thanks, I'll put that on my list.

>=20
> Alex
>=20
> On Wed, 17 Apr 2019 at 15:19, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Apr 16, 2019 at 11:39:44PM -0700, auh@auh.yoctoproject.org wrot=
e:
> >
> > > Hello,
> > >
> > > You are receiving this email because you are the maintainer
> > > of *vim* recipe and this is to let you know that the automatic attempt
> > > to upgrade the recipe to *8.1.1174* has Failed (devtool error).
> > >
> > > Detailed error information:
> > >
> > > The following devtool command failed:  upgrade vim -V 8.1.1174 -S 8dc=
4c7292364d31cfb8afa8a67984b78b657b192
> > > NOTE: Starting bitbake server...
> > > NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
> > > WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspace=
layer in its conf/layer.conf file to list the core layer names it is compat=
ible with.
> > > Loading cache...done.
> > > INFO: Extracting current version source...
> > > Loaded 1303 entries from dependency cache.
> > >
> > > Summary: There was 1 WARNING message shown.
> > > NOTE: Resolving any missing task queue dependencies
> > >
> > > Build Configuration:
> > > BB_VERSION           =3D "1.43.0"
> > > BUILD_SYS            =3D "x86_64-linux"
> > > NATIVELSBSTRING      =3D "universal"
> > > TARGET_SYS           =3D "i586-poky-linux"
> > > MACHINE              =3D "qemux86"
> > > DISTRO               =3D "poky"
> > > DISTRO_VERSION       =3D "2.7+snapshot-20190417"
> > > TUNE_FEATURES        =3D "m32 i586"
> > > TARGET_FPU           =3D ""
> > > meta
> > > meta-poky
> > > meta-yocto-bsp       =3D "tmp-auh-upgrades:d8076ffc00fad478a50510b864=
fc59e77d95217b"
> > > workspace            =3D "<unknown>:<unknown>"
> > >
> > > Initialising tasks...done.
> > > NOTE: Executing RunQueue Tasks
> > > NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be r=
erun and all succeeded.
> > > NOTE: Writing buildhistory
> > > Traceback (most recent call last):
> > >   File "/home/auh/poky/scripts/devtool", line 344, in <module>
> > >     ret =3D main()
> > >   File "/home/auh/poky/scripts/devtool", line 331, in main
> > >     ret =3D args.func(args, config, basepath, workspace)
> > >   File "/home/auh/poky/scripts/lib/devtool/upgrade.py", line 555, in =
upgrade
> > >     old_licenses =3D _extract_licenses(srctree, rd.getVar('LIC_FILES_=
CHKSUM'))
> > >   File "/home/auh/poky/scripts/lib/devtool/upgrade.py", line 470, in =
_extract_licenses
> > >     with open(os.path.join(srcpath, path), 'rb') as f:
> > > FileNotFoundError: [Errno 2] No such file or directory: '/home/auh/bu=
ild/workspace/sources/vim/../runtime/doc/uganda.txt'
> > >
> > >
> > >
> > > Please review the attached files for further information and build/up=
date failures.
> > > Any problem please file a bug at https://bugzilla.yoctoproject.org/en=
ter_bug.cgi?product=3DAutomated%20Update%20Handler
> >
> > If I want to trying to debug the AUH, are there any pointers?  It really
> > ought to be able to handle vim... Thanks!
> >
> > --
> > Tom
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Tom

--O3UPmaERo5Z2xREC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJctykiAAoJEIf59jXTHXZS29QP/jhaHbELjSr6/qITXXVtJPg0
nhuFL/Hj3D10L/i6UyGmBYuISc2kttgB8rEkgYpiDydYg/a+Ac6bQn2/pGfJrySF
fzxbTN4r96dIyE+kbGAAUNUZDJEyjPwx8TrEHVSdbwkrMPz+N3AmVh/sh2sreq0J
Lq5y2kovUQRXhGTZ77MzQQBiekDVcHb761VrrN6bH0FYDZ9Fdn4LVjwVYAqyI/wT
vxMUTAvT6ek/mhjODLK/lV1RMRAhc+Mnx3674HFGmz52SAWgi9rCUnS4yuFxRhUI
uCn9o5slRsy5DYQDYZqqEj0G8lPLC2tGdQgwWcWQRIsRPOzdxp9fEvIt7V1AMOil
+jfd0j8N/O8wiM7yZ9OuWxRmH4YHCysR71nCuBCV74K+kU0kXvujZ+UX+XPpOrK+
npLp05U1DGS9iuSegNIRdX21itdISVGo7Svbu8Rk+MpZ/+deE4cLO1IQSS34BDTG
SZr3038QBFB589qWEBHrBq+Sk6CGTtWWEffy+tnBE9WJEZmLPdsjE+KbhFqAB3vB
inU9sl1RQX4aj0gTjeRDqDE9brM3QNG8wmMuCzF9eqA+H1r7gSUfx8Q8j+6d26A8
tPU4yEp6lnXLKBW/mHxWNlhTv1VhGkBiB7MxEGPQxmRYlapXDY3V9OiVWqQ6olrt
M9txSocHs8Q04Awonst+
=TtHN
-----END PGP SIGNATURE-----

--O3UPmaERo5Z2xREC--
