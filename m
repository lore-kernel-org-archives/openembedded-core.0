Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84E217F2F0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 02:00:20 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t1so558866plq.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 19:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=b6WB4n/H5NFgn1YKNU9JH4dyhzh0MCfDXWoiyV81AZU=;
	b=AAwLe8HKdugSo45KZKgrkJboA8IWmOB3m4UwhwcmlsaOzqemq7uo5UuYAvsveNDD17
	zqzM46xehDADwcI3TRpxgZiWj32rG8uWF6ODGy/8JDG+U9GY/K9q3CarVyt5TkLNtyB/
	ZSnwD7Q0XwcIflmReWWNxNxb335vGPxKmuhlJP/Q3dLSBh4LIEZCLa/b/E2voVPLuM7p
	N/dS8eHxPyvEd/0NJmK5KpZ+c0/srNF7AoC68lw4qHFQLSf0j+EXgdUF8gJCYDlRKPA7
	IP2tT0q4TRIXhuEjhFEvaXSKYsG0eSbv352k8LScFUTambpuKH+wHjoyrbF28cI1O9CV
	rRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=b6WB4n/H5NFgn1YKNU9JH4dyhzh0MCfDXWoiyV81AZU=;
	b=QePG/V5l7iekV+317XJ01rj0E01eHMEP2lBbPqlBwtuGLH3XMEbJUJtI5hwFL9bssW
	5uP6e63FYxJ5nrXYWNbRIOWrkZNeBMKPAr7jXGRBnmGpsAnK/KACt9J0lGbj7cc+QUoQ
	H2P9kFw4LmENWa2U0fNRW3SuqSdtK4XrIMVJRVxors39dX92E63uEA9bvQIUloesmRcE
	NoQWOl7qUXPI5g0tC7o1NcaqxScdSRMzpdCdpLQMDru9r5WDhszNI4/2HbfDVVx5aGql
	ssWff1AsjVArqWAn7fCGvGHNTBTxOciRZXX4NgD6sjiMgYxoXfu7GdDHtTANPklf4BYO
	e43Q==
X-Gm-Message-State: APjAAAXPgBwXWl1VNEOYMreVXp9B7cvouJQOM0qsMbRBITCgRwWJ7/YR
	fjHGSdYiAgwIGlAKbBomXzFm82t0Ldg=
X-Google-Smtp-Source: APXvYqzIMBVD+nKgRgC9kQoV8LtKkeM7W1+Ge7mXRiT5Pgs138Lk9bd6PSOzSaelyAdtuN+3RXaInw==
X-Received: by 2002:a17:902:e506:: with SMTP id
	ck6mr39051895plb.132.1567562420918; 
	Tue, 03 Sep 2019 19:00:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20::7c7a? ([2601:646:8500:1c20::7c7a])
	by smtp.gmail.com with ESMTPSA id
	n185sm17940100pga.16.2019.09.03.19.00.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Sep 2019 19:00:20 -0700 (PDT)
To: =?UTF-8?Q?Maxime_Roussin-B=c3=a9langer?=
	<maxime.roussinbelanger@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190904015657.20094-1-maxime.roussinbelanger@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <efa67b71-fa7a-7a0c-a200-c16394457ae1@gmail.com>
Date: Tue, 3 Sep 2019 19:00:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904015657.20094-1-maxime.roussinbelanger@gmail.com>
Subject: Re: [PATCH v2] meta: add missing descriptions and homepage in bsp
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
X-List-Received-Date: Wed, 04 Sep 2019 02:00:20 -0000
X-Groupsio-MsgNum: 128679
Content-Type: multipart/mixed; boundary="------------0AF25F24125944D7949D2EE4"
Content-Language: en-US

--------------0AF25F24125944D7949D2EE4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maxime

Thanks for this contribution

On 9/3/19 6:56 PM, Maxime Roussin-B=C3=A9langer wrote:
> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gma=
il.com>
> ---
> Changes in v2:
> 	- Rewrite acpid description to be more meaningful
> 	- Change grub-bootconf description
> =09
>  meta/recipes-bsp/acpid/acpid.inc              | 6 ++++++
>  meta/recipes-bsp/formfactor/formfactor_0.0.bb | 3 +++
>  meta/recipes-bsp/grub/grub-bootconf_1.00.bb   | 3 +++
>  meta/recipes-bsp/u-boot/u-boot-common.inc     | 4 ++++
>  meta/recipes-bsp/usbinit/usbinit.bb           | 4 ++++
>  5 files changed, 20 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/=
acpid.inc
> index 766ed4f89e..1e43e7a9db 100644
> --- a/meta/recipes-bsp/acpid/acpid.inc
> +++ b/meta/recipes-bsp/acpid/acpid.inc
> @@ -1,4 +1,10 @@
>  SUMMARY =3D "A daemon for delivering ACPI events"
> +DESCRIPTION =3D "ACPID is a completely flexible, totally extensible da=
emon for \
> +delivering ACPI events. It listens on netlink interface (or on the \
> +deprecated file /proc/acpi/event), and when an event occurs, executes =
programs \
> +to handle the event. The programs it executes are configured through a=
 set of \
> +configuration files, which can be dropped into place by packages or by=
 the \
> +admin."
>  HOMEPAGE =3D "http://sourceforge.net/projects/acpid2"
>  BUGTRACKER =3D "http://sourceforge.net/p/acpid2/tickets/?source=3Dnavb=
ar"
>  SECTION =3D "base"
> diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recip=
es-bsp/formfactor/formfactor_0.0.bb
> index 53cf1cf774..919fb1fbba 100644
> --- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
> +++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
> @@ -1,4 +1,7 @@
>  SUMMARY =3D "Device formfactor information"
> +DESCRIPTION =3D "A formfactor configuration file provides information =
about the /
> +target hardware for which the image is being built and information tha=
t the /

the above two lines should end with backslashes

> +build system cannot obtain from other sources such as the kernel."
>  SECTION =3D "base"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cf=
bcb788c80a0384361b4de20420"
> diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes=
-bsp/grub/grub-bootconf_1.00.bb
> index 750f8c808a..9d5dab9aa8 100644
> --- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> +++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> @@ -1,6 +1,9 @@
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cf=
bcb788c80a0384361b4de20420"
>  SUMMARY =3D "Basic grub.cfg for use in EFI systems"
> +DESCRIPTION =3D "Grub might require different configuration file for \=

> +different machines."
> +HOMEPAGE =3D "https://www.gnu.org/software/grub/manual/grub/grub.html#=
Configuration"
> =20
>  RPROVIDES_${PN} +=3D "virtual/grub-bootconf"
> =20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-b=
sp/u-boot/u-boot-common.inc
> index ad043dbcde..a056eae8ce 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -1,4 +1,8 @@
>  HOMEPAGE =3D "http://www.denx.de/wiki/U-Boot/WebHome"
> +DESCRIPTION =3D "U-Boot, a boot loader for Embedded boards based on Po=
werPC, \
> +ARM, MIPS and several other processors, which can be installed in a bo=
ot \
> +ROM and used to initialize and test the hardware or to download and ru=
n \
> +application code."
>  SECTION =3D "bootloaders"
>  DEPENDS +=3D "flex-native bison-native"
> =20
> diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usb=
init/usbinit.bb
> index aba44b4068..c93f5faee5 100644
> --- a/meta/recipes-bsp/usbinit/usbinit.bb
> +++ b/meta/recipes-bsp/usbinit/usbinit.bb
> @@ -1,4 +1,8 @@
>  SUMMARY =3D "Initscript for enabling USB gadget Ethernet"
> +DESCRIPTION =3D "This module allows ethernet emulation over USB, allow=
ing for /
> +all sorts of nifty things like SSH and NFS in one go plus charging ove=
r the /

same here

> +same wire, at higher speeds than most Wifi connections."
> +HOMEPAGE =3D "http://linux-sunxi.org/USB_Gadget/Ethernet"
> =20
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/COPYING.GPL;md5=3D751419260aa9=
54499f7abaabaa882bbe"
>=20

--------------0AF25F24125944D7949D2EE4
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------0AF25F24125944D7949D2EE4--
