Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 04DDE6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 00:49:17 +0000 (UTC)
Received: by pfbu66 with SMTP id u66so70076237pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 16:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=SAVmXbrSw2QrOBYqbtQeHXuyX2hbIFT+72McG+wwnFc=;
	b=dZ8tHZaoGa0oSBIG0Ur3AMf3nSfpuuknJTCoPOOtgXhO607ZUDolJCj0wHV7CpLK5G
	KkXnl2YJWYJGbKN2VXjaLjw/qrOLlNpJuNCDtg4BEG6cVPLSEnCzQdniX4PK1Gh+FLsA
	HPkcSsNL8+VjtpPQvmC+B9BQTtqXSYNIBCkidECs0/YvYW9/J3XfUolmqts+sFl+xH+2
	7qO9HezTAlUeVF9tX7fnGX44CVfbn/z8HSN8LuMHqq8sTir5R01IXTP/jje2jFCi7oP3
	KbCoukhBh57WqkCXwm+7nY82HQg9itUBFkFgDxGgzNuMACQ/bdqAopGw1eq6LVvKpin/
	RO5w==
X-Received: by 10.98.68.129 with SMTP id m1mr21993516pfi.16.1450140558396;
	Mon, 14 Dec 2015 16:49:18 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5c4d:b840:1a41:b442?
	([2601:646:8802:5d5c:5c4d:b840:1a41:b442])
	by smtp.gmail.com with ESMTPSA id
	87sm44780158pfj.23.2015.12.14.16.49.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 16:49:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKp8nvmTMe-Vu8Y+JyYF7453bV_zMK0GjTqhMk0rQDBsUw@mail.gmail.com>
Date: Mon, 14 Dec 2015 16:49:13 -0800
Message-Id: <11D031D2-AA97-4E17-B60D-76AA4DDC1230@gmail.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<80f3d12d7eb901a0deb50508d54bd89192b88a8a.1449671297.git.alexander.kanavin@linux.intel.com>
	<CAP9ODKp8nvmTMe-Vu8Y+JyYF7453bV_zMK0GjTqhMk0rQDBsUw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] openssl: update to 1.0.2e
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
X-List-Received-Date: Tue, 15 Dec 2015 00:49:19 -0000
X-Groupsio-MsgNum: 74767
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2D22A6F5-75A8-49A3-BADC-59A926493CA7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2D22A6F5-75A8-49A3-BADC-59A926493CA7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 14, 2015, at 6:34 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Wed, Dec 9, 2015 at 12:40 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> [YOCTO #8765]
>> [YOCTO #8758]
>>=20
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>=20
> This update seems to have break imx53 build[1].
>=20
> 1. =
http://ci.ossystems.com.br/view/All%20failing%20jobs/job/fsl-community-bsp=
-master-next_x11-imx53qsb/909/consoleText
>=20
> Has anyone seen something similar?

the error is

x11 fsl-image-machine-test@imx53qsb | =
.../build-x11/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi=
/gcc/arm-poky-linux-gnueabi/5.2.0/ld: libcrypto.a(v3_crld.o): bad reloc =
symbol index (0x800075 >=3D 0xbc) for offset 0x238e in section =
`.debug_info'
x11 fsl-image-machine-test@imx53qsb | libcrypto.a(v3_crld.o): error =
adding symbols: Bad value

so either this v3_crld.o is corrupt or built for another architecture.


>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2D22A6F5-75A8-49A3-BADC-59A926493CA7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZvY4wACgkQuwUzVZGdMxQ3jwCfYzULabd/4qrR8Ecr/k8Ak+oC
pZwAmgOnHcpBd2ZUi1Q54izeLo/oK7wZ
=FEZD
-----END PGP SIGNATURE-----

--Apple-Mail=_2D22A6F5-75A8-49A3-BADC-59A926493CA7--
