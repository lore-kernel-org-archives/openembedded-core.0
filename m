Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6B37270057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Reply-To:To:From;
	bh=E5DD5aRgJmDQ9wfp32BeXmAUpIy0g2cHQlBQGe1Rb0w=; 
	b=oO0yXvKGYcpjDX6vjwGT8HLyvajewfypYRNjge491hVew6gQY22C2oU+YbxnyPAWbhAfYUoLuhjohgbYW4xbNEmjN8ads0BrfqsK5IY8H9kzZFuhJ5fCc0cGPfuvf121lXAyK4IAj6qwYUl5kYm0couRV+vWV82Od0yOaeNdxE2b6Vhap6+bIx+l8I73NXl+w+ztjJOZPeVyOBTlvtFVXn+ggEEn5KIql+xoLI1rXeO3QFxKDL6vQjeao7lQmVk7N2uUx7d+898BrA93iax03E67RWw+qN30F0llN/hkvdXpJUXfZUsPq67m9386xzsfOMNE02q0e+MPUXe9jY5XEA==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>) id 1a9I4g-0003Ed-Ub
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Dec 2015 22:49:23 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-core@lists.openembedded.org
Reply-To: roman@khimov.ru
Date: Wed, 16 Dec 2015 22:49:22 +0300
Message-ID: <2045232.bSqE8jkMWe@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <c69d29cd0ed3171613c5b30894a33e24ef29e20b.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<c69d29cd0ed3171613c5b30894a33e24ef29e20b.1450288828.git.mschiffer@universe-factory.net>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] kernel: allow kernel module and firmware installation with ${base_libdir} != "/lib"
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
X-List-Received-Date: Wed, 16 Dec 2015 19:49:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 16 =D0=B4=D0=B5=
=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2015 19:11:58 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>          # instead is prefixed with /lib/modules/${KERNEL_VERSION}
> -        file =3D file.replace("/lib/modules/%s/" % d.getVar('KERNEL_=
VERSION',
> True) or '', '', 1) +        file =3D file.replace("%s/modules/%s/" %=

> (d.getVar('base_libdir', True), d.getVar('KERNEL_VERSION', True)), ''=
, 1)

And, BTW, the comment still references /lib.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

