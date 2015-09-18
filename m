Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BD7F375F3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 01:44:55 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so35636219pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 18:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2N81EVUE13xScrxAO0Pays6LfceA0YB7Y8Fm3cPTrZo=;
	b=rqyCOfv3jo9afLYrNKGv26kvzHovdY3G8hG6mpVKtHCcNkOHX14UPouYdetrstDSgL
	N8ZD9uESKDD2gUwMWocOOPp3eJN0kLlBr1JC3FeNbcSFtB7KuiLz9L/NnQo9alJJuW+L
	sOLlkhE+vbTndV3cWx55k8JJtbJeqAFZnN+ldY6AJielJ3X849USPrHTPibI2ItBjYFO
	zWwFvgQ3Fmy1QXqCQ6G9shr0/C+9FaVT2XcIrN2YgryfLfsJY2HWySeOhyRY66vRrdTU
	djMUgrLQKhmq7L2kA3FOvLmDzLc6uxU4fSgf4uhLax5m3vUVZC7P4Mazqv/ysfCymOHW
	B/wg==
X-Received: by 10.66.141.141 with SMTP id ro13mr4184436pab.68.1442540695839;
	Thu, 17 Sep 2015 18:44:55 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1079:2f51:a2f9:e171?
	([2601:646:8601:4580:1079:2f51:a2f9:e171])
	by smtp.gmail.com with ESMTPSA id
	kv10sm5683076pbc.2.2015.09.17.18.44.54
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Sep 2015 18:44:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1442500317-9064-1-git-send-email-marex@denx.de>
Date: Thu, 17 Sep 2015 18:44:54 -0700
Message-Id: <7502171E-B73E-4C1D-930B-B7EBBE881446@gmail.com>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3094)
Cc: lftan@altera.com, waltergoossens@home.nl,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] nios2 fixes
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
X-List-Received-Date: Fri, 18 Sep 2015 01:44:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
>=20
> This patchset fixes various minor issues found during the process
> of getting Yocto working with the Altera NIOS2 soft-processor.
>=20

Looks ok to me with few nits. But the changes are self contained which =
is less risk for other arches

> Marek Vasut (8):
>  insane: Add nios2 support
>  kernel-arch: Add nios2 to valid archs
>  linux-yocto: depend on libgcc for nios2
>  openssl: Add nios2 configuration
>  siteinfo: Add nios2-linux
>  libtool: Fix nios2 support
>  pixman: Fix missing FE_DIVBYZERO on nios2
>  libgpg-error: Add support for nios2
>=20
> meta/classes/insane.bbclass                        |   1 +
> meta/classes/kernel-arch.bbclass                   |   3 +-
> .../openssl/openssl/openssl_add_nios2.patch        |  32 ++
> .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
> meta/recipes-devtools/libtool/libtool-2.4.6.inc    |   1 +
> ...1-libtool-Fix-support-for-NIOS2-processor.patch |  67 ++++
> ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |  65 ++++
> meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |   1 +
> meta/recipes-kernel/linux/linux-yocto.inc          |   4 +
> .../0001-libgpg-error-Add-nios2-support.patch      |  45 +++
> .../libgpg-error/libgpg-error_1.19.bb              |   4 +-
> meta/site/nios2-linux                              | 395 =
+++++++++++++++++++++
> 12 files changed, 617 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch
> create mode 100644 =
meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-p=
rocessor.patch
> create mode 100644 =
meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVB=
YZERO.patch
> create mode 100644 =
meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2=
-support.patch
> create mode 100644 meta/site/nios2-linux
>=20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


