Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 65F2A76099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:04:39 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id p4-v6so7551092itf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=oY0ODeSpSY0A+mmREg26L6aWYpH7cYyMBCOopsUoLFg=;
	b=VxvkVfX0fqXmvKkY5esTY7GFOPlioJ33YaU529tgYZ6kSrIT3qgWF2Tlp3CkHsL12N
	gwh/jqn9ksVRxuwYDpI2Gq6esX0tponoZ3TwmqAycanlzVgTJzcOv4nZKG09Ab4L4AOl
	aZjl+on2pjtnDRe9/k0r9HV/sYBFO+XXfd/LMSnCtN1OemiQEn5WjdMVXz2Ai0Qy8BtC
	5DtbDYqvloI3/eNLacNddc4XZUAPOIaKSzgkoIDNbpTXTShyWQAKkOpHwbm7+vthjIoX
	Zgpo9wEFGVbKxyS1cSbHmFKAY99iPHkI2DKbp5Gfk5tE1E7cXkfmBJG/XN0moXywxZy5
	W+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=oY0ODeSpSY0A+mmREg26L6aWYpH7cYyMBCOopsUoLFg=;
	b=pHskHue+2ARSD2FsDto3yKuEuJ34KfvrSIjgsKXeVuH8ajXyNpm8RhsJpsWigW+cqf
	D6R6q84kBonjlCFWuycWAYeK1+odZ1MfYl7mE/zEqYn6IHVN3HC432J7YzXsAB62RYpI
	PKCMlDKUGNLncwCCsJ5OScVuVx6L2V6nOrKcakYxNtWPy7nKGMM1CMGejckIqg+4o6Dw
	vDjBgdMFvmqtTN2kGYyXMrOPhzFl+0WEDdq4K2LDlGbgAJOe/3GMWfLJkazKgAgS9dA5
	ueAIq8i7fLfD9S38v1h1H0Lo87jvwiutODdePPMxCwcKtgz/qY5MXou11GHxZUo44GMT
	yNEw==
X-Gm-Message-State: AOUpUlFQVMAXhoxRagQ/9AZJ91yiUA8bAtqSjm0fTz/m5V7zNtUtb4iH
	l7SySRE41rSCYYhY9chHz2uIITKe
X-Google-Smtp-Source: AAOMgpcjws6oUe5gReeD536i0mGmBhVpyIn1hqAwrW/+vfkaHMW6w3KBias3Pi03ec1RVS7xKLEQ4A==
X-Received: by 2002:a24:818a:: with SMTP id
	q132-v6mr1872319itd.51.1531411479926; 
	Thu, 12 Jul 2018 09:04:39 -0700 (PDT)
Received: from ?IPv6:2620::2b10:e6:c4aa:a72f:b2e8:eaec?
	([2620:0:2b10:e6:c4aa:a72f:b2e8:eaec])
	by smtp.gmail.com with ESMTPSA id
	i15-v6sm11458163ioh.80.2018.07.12.09.04.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 09:04:38 -0700 (PDT)
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	openembedded-core@lists.openembedded.org
References: <20180710134409.16911-1-adrian.ratiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <ca01f644-3389-7e89-07e3-8547fd8cddeb@gmail.com>
Date: Thu, 12 Jul 2018 10:04:29 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180710134409.16911-1-adrian.ratiu@ni.com>
Subject: Re: [] default-providers: introduce VIRTUAL-RUNTIME_initscripts
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
X-List-Received-Date: Thu, 12 Jul 2018 16:04:39 -0000
X-Groupsio-MsgNum: 113438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="5v85365TOEMr28QZoLV0swG0Uo9l9yKw0"

--5v85365TOEMr28QZoLV0swG0Uo9l9yKw0
Content-Type: multipart/mixed; boundary="KXpsrHatY3lUn9WhmTj8cT9mrJTgYs5BZ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <ca01f644-3389-7e89-07e3-8547fd8cddeb@gmail.com>
Subject: Re: [OE-core] [] default-providers: introduce
 VIRTUAL-RUNTIME_initscripts
References: <20180710134409.16911-1-adrian.ratiu@ni.com>
In-Reply-To: <20180710134409.16911-1-adrian.ratiu@ni.com>

--KXpsrHatY3lUn9WhmTj8cT9mrJTgYs5BZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/10/18 7:44 AM, Ioan-Adrian Ratiu wrote:
> Commits 1202307b24 ("lsbinitscripts: don't use update-alternatives")
> cdcebd81c87 ("initscripts: don't use update-alternatives") and
> 061fa614cec ("update-alternatives.bbclass: refuse to manage SysV init
> scripts") make sure that the lsbinitscripts and initscripts packages
> conflict with eachother and can't be alternatives.
>=20
> lsb has a hardcoded dependency on lsbinitscripts which makes it
> impossible to install on systems using initscripts (acl depends on
> initscripts) and lsbinitscripts also has a runtime dependency on the
> full util-linux package making it an unwanted dependency on busybox
> systems.
>=20
> Therefore introduce VIRTUAL-RUNTIME_initscripts to choose between the
> versions of /etc/init.d/functions and allow installing lsb alongside
> initscripts avoiding the full util-linux dependency.
>=20
> Default it to lsbinitscripts so we don't have a change in the existing
> behavior; distros/users can override it in their conf when needed.
>=20

We already have PREFERRED_RPROVIDER_initd-functions I wonder if that is
the right option to use here.

> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/conf/distro/include/default-providers.inc               | 1 +
>  meta/recipes-extended/lsb/lsb_5.0.bb                         | 3 +--
>  meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf=
/distro/include/default-providers.inc
> index e65c1ed323..37e7478ea0 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -23,6 +23,7 @@ VIRTUAL-RUNTIME_update-alternatives ?=3D "update-alte=
rnatives-opkg"
>  VIRTUAL-RUNTIME_apm ?=3D "apm"
>  VIRTUAL-RUNTIME_alsa-state ?=3D "alsa-state"
>  VIRTUAL-RUNTIME_getopt ?=3D "util-linux-getopt"
> +VIRTUAL-RUNTIME_initscripts ?=3D "lsbinitscripts"
>  VIRTUAL-RUNTIME_wireless-tools ?=3D "iw wireless-tools"
>  VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
>  VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
> diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extend=
ed/lsb/lsb_5.0.bb
> index df4812e4bc..6cb1751664 100644
> --- a/meta/recipes-extended/lsb/lsb_5.0.bb
> +++ b/meta/recipes-extended/lsb/lsb_5.0.bb
> @@ -8,8 +8,7 @@ LSB_CORE_x86 =3D "lsb-core-ia32"
>  LSB_CORE_x86-64 =3D "lsb-core-amd64"
>  RPROVIDES_${PN} +=3D "${LSB_CORE}"
> =20
> -# lsb_release needs getopt, lsbinitscripts
> -RDEPENDS_${PN} +=3D "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
> +RDEPENDS_${PN} +=3D "${VIRTUAL-RUNTIME_getopt} ${VIRTUAL-RUNTIME_inits=
cripts}"
> =20
>  LIC_FILES_CHKSUM =3D "file://README;md5=3D12da544b1a3a5a1795a21160b494=
71cf"
> =20
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.=
bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 53d100ce74..74547b0773 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -118,7 +118,7 @@ RDEPENDS_packagegroup-core-lsb-misc =3D "\
>      gettext \
>      gettext-runtime \
>      groff \
> -    lsbinitscripts \
> +    ${VIRTUAL_RUNTIME-initscripts} \
>      lsbtest \
>      lsof \
>      strace \
>=20



--KXpsrHatY3lUn9WhmTj8cT9mrJTgYs5BZ--

--5v85365TOEMr28QZoLV0swG0Uo9l9yKw0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW0d8EgAKCRC7BTNVkZ0z
FGIhAJ0StN+SDGORMOpxojbYbxi/2GC6cQCcDrBKU4pezzBbt/boqniua1iDZAQ=
=Gugx
-----END PGP SIGNATURE-----

--5v85365TOEMr28QZoLV0swG0Uo9l9yKw0--
