Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E5991601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 10:47:05 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l68so183831626wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=hUtbOCW+0ofXtma9a4kayj6LwcoUIia8OQfeSdiM7pU=;
	b=Uq2UZ50w+8XSkcWkie4BbQ6irXyk6gVtgLv3fjIW+z4vu6OBWao4ZjPyeWMYmoIcVo
	opwaTfnQyIE+AlZm3yY5qo3CR5SKiUm5nwnrlJSw3xnkdLXVPo1KIZKu/8TpvBJgAtqg
	fwoWtHQJfyYX0oE7de+/EYVxLFkw3eCmcxE5SlEeSKN7X0G3jrwCXoP4Wsy/0pQvQIva
	WVeKEdCC+lFH8I8KCLZ1d9gG7+4OdHbfOeTBmLZGNI1+h1pKm5oHO4sTN+4LA57ISREH
	2xlgBQIsaA+2rElWdz+LZdfT17kQLHt2xTfZi50jluc5v1HCnQS7B2M7CPCv7mrw4QpW
	pvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=hUtbOCW+0ofXtma9a4kayj6LwcoUIia8OQfeSdiM7pU=;
	b=UMTT4efazI7ddiv3mHzRI2tc0F0hkR1bA6Mqt9YtTNo2twgx1M0KuCMcF4eN9x70Bd
	aZTGlE3B7EPacCFOaGoFUmwZC204QR9kwmIoJbwRJ6eUXMdxYpU6Cy+POgYQPZdtAqex
	BHUo39nsE4QFPWik7Q8Cnp69TGpMDvv4VkjHoWzpJmgxpuSt2mvjFvADwGtQjbbg2Dem
	5SmAmB+AqmBwBrWfkD/Xk5yg9KLgHB0cApXFZh2RKn2zndtBh0pH0mTT4YD/2R7G/bWa
	kOxNNHIRvjyOo06Y2VN6zxceMuwVo3gEdSjeK2cH4Ksf/f6Pl8a3EhavOUPNsl3l27fk
	Ubcg==
X-Gm-Message-State: AD7BkJJt/Hk5hc+CiOSQtZhdYziAtZBSjg5OVKbftBI6uzz1D9NPgYhkajI+ucSxTsZq6Q==
X-Received: by 10.28.19.130 with SMTP id 124mr3804962wmt.2.1458125225761;
	Wed, 16 Mar 2016 03:47:05 -0700 (PDT)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id 192sm2925345wmw.0.2016.03.16.03.47.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 03:47:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1457689286-30239-1-git-send-email-catalin.enache@windriver.com>
Date: Wed, 16 Mar 2016 11:47:04 +0100
Message-Id: <56E4C481-78ED-4220-B37E-DE7BEAEF89A9@gmail.com>
References: <1457689286-30239-1-git-send-email-catalin.enache@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCH] perl: fix missing dependency for perl-misc
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
X-List-Received-Date: Wed, 16 Mar 2016 10:47:08 -0000
X-Groupsio-MsgNum: 79685
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DC9A639F-61FE-4C0C-9A7F-1DC06DB8275B";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_DC9A639F-61FE-4C0C-9A7F-1DC06DB8275B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 11.03.2016 um 10:41 schrieb Catalin Enache =
<catalin.enache@windriver.com>:
>=20
> "perl-misc" package is adding tens of perl utilities which have
> depencies on perl-modules.
>=20
> For example, in order for "prove" to work correctly following modules
> are needed:
>=20
> RDEPENDS_perl-misc +=3D "perl perl-module-app-prove
> perl-module-overloading perl-module-tap-base perl-module-file-glob
> perl-module-tap-formatter-console perl-module-tap-formatter-base
> perl-module-tap-formatter-file perl-module-tap-formatter-session
> perl-module-tap-parser perl-module-tap-parser-aggregator
> perl-module-tap-parser-scheduler"
>=20
> If we compile a list of modules needed by the utilities added by
> "perl-misc" we may end up having to add hundreds of modules to
> RDEPENDS_perl-misc.
>=20
> Rather than adding hundreds of dependencies only perl-modules was =
added.

Beside of that - perl5.x.x bundles several modules with reason:

Programms written in Perl need them and very often rely on what's =
bundled.
Modern author kits like Dist::Zilla prove Perl-Version (when author =
specifies
MIN_PERL: 5.10) which module is bundled and don't explicitly add =
dependencies
on that.

Nowadays it's not reasonable to distribute perl without core. What might
be sane is:

RDEPENDS_perl +=3D "libperl perl-interpreter perl-modules"

This would allow maximum reduce for those who need and default =
dependency
as meant by Perl5 Porters (those who care since 5.10).

Just a side-note - catch me in IRC if wanted for a plan how to "fix" =
perl
after 2.1 release (maybe with 5.24 update).

> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
> meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc =
b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
> index 033d4e3..830ecce 100644
> --- a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
> +++ b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
> @@ -13,7 +13,7 @@
> #| sed =
's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s=
/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'
> #| egrep -wv =
'=3D>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmd=
ata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-=
dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|m=
odule-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system=
-simple|module-lexical|module-local-lib|metadata|module-modperl-util|modul=
e-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|mod=
ule-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > =
/tmp/perl-rdepends
>=20
> -RDEPENDS_perl-misc +=3D "perl"
> +RDEPENDS_perl-misc +=3D "perl perl-modules"
> RDEPENDS_${PN}-pod +=3D "perl"
>=20
> # Some additional dependencies that the above doesn't manage to figure =
out
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_DC9A639F-61FE-4C0C-9A7F-1DC06DB8275B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW6TmoAAoJEESZlq7c5Qqd4f0P/jMxFfstMegUmlqq+Y4OZzks
bDo8xOl2S0sIJBYX0okt47zWU7iLmcVYsiUuXtwV1Ufc8DzpHNUEzxFZSrWVlyDw
z0Ae7bbJVcvUbraYKztwWftwntM9Rd+BnoJel0edAJs/ePxKgi0+ITi8EqHwyh6y
iUUgzE0ti2gpVxpgBJR1qYYMob4aeJrjNmgzTQiRS+Hey85+PG7FPeSCjVi9VvbQ
cWDdKYE6wfGe4UciG22Cfv8vd3p7KBE4SHucY4eh8QPISJN5gkHWRQELnHGquVyj
5AvfX3hgHwok3Jiet/Rw23gbbSiGfr1ky4eCl4D8bLTv3yN/kI/uVuRXyI1wvM/Q
Q8mVYtGy8hFvksmkaSKno5khwqjbLYyx2QgvQAiz8mVb2RcfChW5ZjVfasboos79
N14RtwQ5DS8xFAJGEhmiDoiD5WzMP6E0xj4UHswVzOdSXwtK5LP8TLO4fqPDkUjG
JPTBXBrMkRTxNEqkZQjv4l/4dQ4IlhHXqH0b5zMN4I8xwtmsRtz5j2l20mHZPCRq
HUIsfI2NCcXrfQitbGpsL7oG7sN0GujZyD6/H5KO0mRlPicxlvdA6qvuGBiAWL/S
D6b9wdXz8cls/K4H7phkxgavTu9u55e7CLP9ICJG0a5eqkL9PkGiG+dTYappQZEj
XS1l8wZTkBbZAtPGAtEA
=U8vN
-----END PGP SIGNATURE-----

--Apple-Mail=_DC9A639F-61FE-4C0C-9A7F-1DC06DB8275B--
