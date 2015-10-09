Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 817BC734DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 07:03:55 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so78693165pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=s4e5xZ2sB57tbvxNHCSEuRzdF7N0ndYTuV3TzpTKlS8=;
	b=b9ARi45NPbYJgQAS+sYMzoF4hn30AH95Q9gi+MDoR23yU+jfIhUVAzSgQQ/ri7A+cB
	+nwhCB0D/JU0l32iwxcd1eaSktXQ/vZPpkHpphaHrv9lF576ra9fTS7EXvMoNSVoK4eO
	BTdh0FPEzHIMV8R6ZYdLhmv6Y3qsCEGI3yUQSAt2JmLgR+cGer5M8fDeKZc+DcKZ8TdJ
	NQ68Q3HCGDsLsZ1FQNmsfj+f/ObWd7EpmtEjOkeO4e7/UktM2mbo0TUBjHq//r9mweSZ
	dcv0Bd4EeCbYG2dI1x/823PB4EBxZ8QCGXVtjn4gDreHzsfX9q49bLBGkLlGIhvNSWb9
	aM+Q==
X-Received: by 10.68.202.9 with SMTP id ke9mr13556522pbc.85.1444374236110;
	Fri, 09 Oct 2015 00:03:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:24ad:a72d:669c:5092?
	([2601:646:8601:4580:24ad:a72d:669c:5092])
	by smtp.gmail.com with ESMTPSA id of1sm358522pbc.11.2015.10.09.00.03.55
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Oct 2015 00:03:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71Wjy4XmN6Ffu=reiNyR+_MDaSbGHwGU0DxRRz2msfQ_rgkg@mail.gmail.com>
Date: Fri, 9 Oct 2015 00:03:50 -0700
Message-Id: <30C6E750-ADC7-4C26-96B6-CFE4136B2944@gmail.com>
References: <CAP71Wjy4XmN6Ffu=reiNyR+_MDaSbGHwGU0DxRRz2msfQ_rgkg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailer: Apple Mail (2.3096.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: issues with gcc 5 + mesa
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
X-List-Received-Date: Fri, 09 Oct 2015 07:03:56 -0000
X-Groupsio-MsgNum: 72034
Content-Type: multipart/signed;
	boundary="Apple-Mail=_38409963-5983-4861-9F52-6B3BCDC139D3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_38409963-5983-4861-9F52-6B3BCDC139D3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 8, 2015, at 9:11 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
> hi,
>=20
> I am seeing this error on my board when compilng core-image-x11 based =
image:
>=20
> root@ifc6410:~# glxgears
> Running synchronized to the vertical refresh.  The framerate should be
> approximately the same as the monitor refresh rate.
> [   50.359341] Alignment trap: not handling instruction f4008a1f at =
[<b6cf3f84>]
> [   50.364408] Unhandled fault: alignment exception (0x801) at =
0x000cd5bc

alignment exception, you say its armv7 which should support unaligned =
access, so why is this error showing up
do you have it disabled in kernel ?

> [   50.371419] pgd =3D ec024000
> [   50.377885] [000cd5bc] *pgd=3Dfb85f835
> Bus error
>=20
> While I initially thought it was something to do with my kernel or =
firmware, I just thought about trying a build with GCCVERSION=3D"4.9.3" =
and the issue is gone.
>=20
> I was having this issue as soon as EGL/GLES is being used, and I could =
get it with both X11 or Weston/Wayland. This is running on IFC6410 (e.g. =
an ARMv7 platform). The same images built for ARMv8 (DragonBoard 410c) =
work fine.
>=20
> I am using Mesa Gallium/freedreno for the GPU. I have tried =
armv7athf-neon and armv7at-neon, and both show the same issue.
>=20
> I would be curious to hear from others using similar platforms , =
though it is likely something in mesa/gallium (so possibly in freedreno =
bits)..  Maybe someone using etnaviv ? Or is anyone building images for =
qemuarm v7?
>=20
> cheers
> nico
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_38409963-5983-4861-9F52-6B3BCDC139D3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYXZtoACgkQuwUzVZGdMxRPhACfR4R8dA05HJ9Hoh4eMfJRvwsY
3bEAnRXo6t266Wp/6irUSaUZx4GUf9V3
=jcmz
-----END PGP SIGNATURE-----

--Apple-Mail=_38409963-5983-4861-9F52-6B3BCDC139D3--
