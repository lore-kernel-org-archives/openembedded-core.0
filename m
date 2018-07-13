Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id D46BD745BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 12:30:35 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id 198-v6so3031718ite.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=X465XFGT4DzaUBJXazjCTthRbvCf6c7T7DoiUWSlnI4=;
	b=g9hxB4sr/p8293muZGgZoLxnH4xwL22Hhc/L4p/6HXfk4g282C4lv0J7Y6LpHL8ets
	BbZcnEa8c+dzxH1XfibA2k5Xe/hpqtfQLH7Tt0X46//7uTKPQcENfmgPfS7LSIhWtU0G
	PHMFs6Cc1lVvFe++x1En3fO5IHPaUXHDdjnh6gkFg0T2+17zVkWzZR4klfhfYmKbS5h/
	jtWBD+68s2XhuZ2cL7RRzUAMzUjNDG07vJz/LOt4jU4GHceL5mAQa1k1j71X8bnOArnR
	TzbNmoPl5Xf9P3tDDT8CzNLsmzGCUua5ypmcVsvhOSjnTX5wIxgI9u/sENDtjk3/iy96
	7TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=X465XFGT4DzaUBJXazjCTthRbvCf6c7T7DoiUWSlnI4=;
	b=Pa7i5dvJyD6IqMV+9XXesAZYPxz/AbOVnQnvh0pod8YVWrOuT0RDFHjwPfMCIWfIiM
	O/5B7UbDznF0qsX6BPCtFyD9avfGkPhWkizafy1u8I4jJ9RHMKipa3IrdUNXyxv5kG0z
	GOdMcO2U/sggBDIM/24c57P5fLIykWCajzve/O6kG3htmrVwpE96ZxD8O3ZbJRvuCsr6
	tqD0qHS0e9dj8sghDVw2OVT2zp0tUQVnYSmOoBm3GebNXF8hdmmHXS84u0wlRbMNgy8d
	Vjyn03DHFdoIjGT/ywUOuvbI8YX3+9nXaYwlx/k+3lJwz4+aL/kQuMBZr5nHTt28gDPH
	ITZA==
X-Gm-Message-State: AOUpUlFB7arR2dpHTdxdCFE/SgcHcX0rDI9KciCF8BpEHe+fm+NefA5D
	Bp9z8BcWLiyZlByb57JopfparXeG
X-Google-Smtp-Source: AAOMgpdbGifW5oxr9F47St3KES1KhwsTVolH1HCJHz3t/uUyxmRrnSB8V5E5c10XHyMJExcrBY345g==
X-Received: by 2002:a24:1fc7:: with SMTP id
	d190-v6mr4369972itd.52.1531485036545; 
	Fri, 13 Jul 2018 05:30:36 -0700 (PDT)
Received: from [192.168.182.182] ([23.31.91.134])
	by smtp.gmail.com with ESMTPSA id
	r20-v6sm7599226iog.85.2018.07.13.05.30.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jul 2018 05:30:36 -0700 (PDT)
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	openembedded-core@lists.openembedded.org
References: <20180710134409.16911-1-adrian.ratiu@ni.com>
	<ca01f644-3389-7e89-07e3-8547fd8cddeb@gmail.com>
	<8736wnze0d.fsf@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <918da0cc-b3f8-b34c-91cb-7a8c0e550741@gmail.com>
Date: Fri, 13 Jul 2018 06:30:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <8736wnze0d.fsf@ni.com>
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
X-List-Received-Date: Fri, 13 Jul 2018 12:30:36 -0000
X-Groupsio-MsgNum: 113475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ANbVlVCY5ulhgvVf2b013x5bzcXMNCxkj"

--ANbVlVCY5ulhgvVf2b013x5bzcXMNCxkj
Content-Type: multipart/mixed; boundary="pZ2ltAGeFk5aEtV9QDVObQAiL0Iahtq9T";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <918da0cc-b3f8-b34c-91cb-7a8c0e550741@gmail.com>
Subject: Re: [OE-core] [] default-providers: introduce
 VIRTUAL-RUNTIME_initscripts
References: <20180710134409.16911-1-adrian.ratiu@ni.com>
 <ca01f644-3389-7e89-07e3-8547fd8cddeb@gmail.com> <8736wnze0d.fsf@ni.com>
In-Reply-To: <8736wnze0d.fsf@ni.com>

--pZ2ltAGeFk5aEtV9QDVObQAiL0Iahtq9T
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/13/18 3:22 AM, Ioan-Adrian Ratiu wrote:
> On Thu, 12 Jul 2018, Khem Raj <raj.khem@gmail.com> wrote:
>> On 7/10/18 7:44 AM, Ioan-Adrian Ratiu wrote:
>>> Commits 1202307b24 ("lsbinitscripts: don't use update-alternatives")
>>> cdcebd81c87 ("initscripts: don't use update-alternatives") and
>>> 061fa614cec ("update-alternatives.bbclass: refuse to manage SysV init=

>>> scripts") make sure that the lsbinitscripts and initscripts packages
>>> conflict with eachother and can't be alternatives.
>>>
>>> lsb has a hardcoded dependency on lsbinitscripts which makes it
>>> impossible to install on systems using initscripts (acl depends on
>>> initscripts) and lsbinitscripts also has a runtime dependency on the
>>> full util-linux package making it an unwanted dependency on busybox
>>> systems.
>>>
>>> Therefore introduce VIRTUAL-RUNTIME_initscripts to choose between the=

>>> versions of /etc/init.d/functions and allow installing lsb alongside
>>> initscripts avoiding the full util-linux dependency.
>>>
>>> Default it to lsbinitscripts so we don't have a change in the existin=
g
>>> behavior; distros/users can override it in their conf when needed.
>>>
>>
>> We already have PREFERRED_RPROVIDER_initd-functions I wonder if that i=
s
>> the right option to use here.
>=20
> (I've sent patch v2 which fixes a build-error causing typo, sorry for i=
t :)
>=20
> We could use PREFERRED_RPROVIDER_initd-functions but that currently
> defaults to "initscripts". In all my layers nothing is using that
> variable, so would it be ok to change its default to lsbinitscripts to
> preserve the current default lsb/util-linux behaviour?
>=20
> Or are you ok with using it as is, leaving the default to "initscripts"=

> and just change the lsb dependency?
>=20

if it is unused then change it to lsbscripts.

>>
>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>> ---
>>>  meta/conf/distro/include/default-providers.inc               | 1 +
>>>  meta/recipes-extended/lsb/lsb_5.0.bb                         | 3 +--=

>>>  meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/co=
nf/distro/include/default-providers.inc
>>> index e65c1ed323..37e7478ea0 100644
>>> --- a/meta/conf/distro/include/default-providers.inc
>>> +++ b/meta/conf/distro/include/default-providers.inc
>>> @@ -23,6 +23,7 @@ VIRTUAL-RUNTIME_update-alternatives ?=3D "update-al=
ternatives-opkg"
>>>  VIRTUAL-RUNTIME_apm ?=3D "apm"
>>>  VIRTUAL-RUNTIME_alsa-state ?=3D "alsa-state"
>>>  VIRTUAL-RUNTIME_getopt ?=3D "util-linux-getopt"
>>> +VIRTUAL-RUNTIME_initscripts ?=3D "lsbinitscripts"
>>>  VIRTUAL-RUNTIME_wireless-tools ?=3D "iw wireless-tools"
>>>  VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
>>>  VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
>>> diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-exte=
nded/lsb/lsb_5.0.bb
>>> index df4812e4bc..6cb1751664 100644
>>> --- a/meta/recipes-extended/lsb/lsb_5.0.bb
>>> +++ b/meta/recipes-extended/lsb/lsb_5.0.bb
>>> @@ -8,8 +8,7 @@ LSB_CORE_x86 =3D "lsb-core-ia32"
>>>  LSB_CORE_x86-64 =3D "lsb-core-amd64"
>>>  RPROVIDES_${PN} +=3D "${LSB_CORE}"
>>> =20
>>> -# lsb_release needs getopt, lsbinitscripts
>>> -RDEPENDS_${PN} +=3D "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
>>> +RDEPENDS_${PN} +=3D "${VIRTUAL-RUNTIME_getopt} ${VIRTUAL-RUNTIME_ini=
tscripts}"
>>> =20
>>>  LIC_FILES_CHKSUM =3D "file://README;md5=3D12da544b1a3a5a1795a21160b4=
9471cf"
>>> =20
>>> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-ls=
b.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>>> index 53d100ce74..74547b0773 100644
>>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>>> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>>> @@ -118,7 +118,7 @@ RDEPENDS_packagegroup-core-lsb-misc =3D "\
>>>      gettext \
>>>      gettext-runtime \
>>>      groff \
>>> -    lsbinitscripts \
>>> +    ${VIRTUAL_RUNTIME-initscripts} \
>>>      lsbtest \
>>>      lsof \
>>>      strace \
>>>



--pZ2ltAGeFk5aEtV9QDVObQAiL0Iahtq9T--

--ANbVlVCY5ulhgvVf2b013x5bzcXMNCxkj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW0ibZgAKCRC7BTNVkZ0z
FAUtAJ9pkx+AtoLb7I0llvd3nhKp04F2BgCeOkt/d6LBtojwefCUH344cWslEbs=
=NQ24
-----END PGP SIGNATURE-----

--ANbVlVCY5ulhgvVf2b013x5bzcXMNCxkj--
