Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id E066975D4A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Oct 2015 01:06:37 +0000 (UTC)
Received: by pasz6 with SMTP id z6so88690869pas.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 18:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=112tTNK/vbAF+g1q13dT/soTmMMwDdTW2ZAsmZ2EWLc=;
	b=cFFTdgA4s5IMkb7X1D8SzdUHoLnfEdxB5jpoa2XWsRnYXo0aeIWdxM3p3aW3Nnav8y
	J0wHQCbTuAijDILxYrdl7SnQyQ7rHrpmYUCqq9DOXnMe96UPR9qzCIOXZONzQcn3lk2H
	nBD+0YEjHs17AD34ifoC53AxFoYy5oo76ho5Akwev4XHiWQP98ko6hS55l/I4iMUVCet
	WVO29g3ybn6RvQMOmzT+PteCBKNUemnUfQ0ZNpc8u3AU04FLnvkv/Tro7PdHlTc+DHS9
	0ZPTg1vNLooivRAng9HiXdG9u4bmIXQRc2u9F0zC9j6GDiEWNt3fPzmOoNZ1Qkc38q3I
	JbUA==
X-Received: by 10.68.228.3 with SMTP id se3mr12092679pbc.114.1446253598098;
	Fri, 30 Oct 2015 18:06:38 -0700 (PDT)
Received: from ?IPv6:2601:641:c000:1d0:9139:22be:56a:125d?
	([2601:641:c000:1d0:9139:22be:56a:125d])
	by smtp.gmail.com with ESMTPSA id
	xe9sm10501436pbc.4.2015.10.30.18.06.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Oct 2015 18:06:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1510221223420.24305@localhost>
Date: Fri, 30 Oct 2015 18:06:33 -0700
Message-Id: <1AF2F35D-302D-4D33-8E9B-F1DB81D2D3F6@gmail.com>
References: <alpine.LFD.2.20.1510221223420.24305@localhost>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3096.5)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add entry for qemumips64 to local.conf.sample.
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
X-List-Received-Date: Sat, 31 Oct 2015 01:06:40 -0000
X-Groupsio-MsgNum: 72794
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0626A374-0433-48D9-BDCA-A9E6A9A6E197";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0626A374-0433-48D9-BDCA-A9E6A9A6E197
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 22, 2015, at 9:25 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
> For whatever reason, qemumips64 isn't mentioned in local.conf.sample
> as a valid target machine.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 3ae24ab..92ee7a1 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -20,6 +20,7 @@
> #MACHINE ?=3D "qemuarm"
> #MACHINE ?=3D "qemuarm64"
> #MACHINE ?=3D "qemumips"
> +#MACHINE ?=3D =E2=80=9Cqemumips64"

Make sure that Qemu is also enabling mips64

> #MACHINE ?=3D "qemuppc"
> #MACHINE ?=3D "qemux86"
> #MACHINE ?=3D "qemux86-64"
>=20
> --
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0626A374-0433-48D9-BDCA-A9E6A9A6E197
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY0FB4ACgkQuwUzVZGdMxTodgCfTAh0dWzscmTWZO8BCeBv+R1z
bTkAnjYrmTd2kgXT5gwqZ+uzPwfaailu
=SBLg
-----END PGP SIGNATURE-----

--Apple-Mail=_0626A374-0433-48D9-BDCA-A9E6A9A6E197--
