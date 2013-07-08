Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 803D06B0D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 03:30:36 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so3840697pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jul 2013 20:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=xeSMWtOSDMf0xJbowOl3xw6mFd6ec+zIrIZQPef2oag=;
	b=H6LqxedUDwB+XMtIIpFwZ4ZfmKUYOxE/c4WnfevprVGj5Vfth0UPGwebpGP+jHLZvw
	hn2bB/UqKUqlz+cQuK3tY2f7oh3QVHo0u4Bxd0BMfJKkD5eyqLCt3jIUUgXgdjn25L1N
	teIqXFdkuQmcMREf6JIGKcqJepjENppdTjp7cw09ui9UmD4+v2ffgQbo/rg62Hht/A1z
	9P9P4jWT9w2tx9WvEcAaD5mD5PCVXJe5l8wACsdDikIm2K871clXNuXYqLDpOYBebDur
	dLXUwuAv0CFx/qNUojOZjswVRoh2ib06flTFAsKPuor0RKDvKG/iMsHp674rg24RoBOz
	12ZA==
X-Received: by 10.66.190.101 with SMTP id gp5mr20659167pac.19.1373254237647;
	Sun, 07 Jul 2013 20:30:37 -0700 (PDT)
Received: from sa-nc-spg-194.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id iq6sm19825454pbc.1.2013.07.07.20.30.36
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 07 Jul 2013 20:30:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 7 Jul 2013 20:30:34 -0700
Message-Id: <0BA68180-92E5-4FCA-B3DF-CB3570BAE29C@gmail.com>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/2] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Mon, 08 Jul 2013 03:30:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 6, 2013, at 1:39 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> * eglibc-collateral.inc inhibits all default deps, but do_package =
needs
>  objcopy:
>  ERROR: objcopy failed with exit code 127 (cmd was
>  'i586-webos-linux-objcopy' --only-keep-debug
>  'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so'
>  'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
>  ERROR: Function failed: split_and_strip_files
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/recipes-core/eglibc/eglibc-locale.inc | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc =
b/meta/recipes-core/eglibc/eglibc-locale.inc
> index f4cb814..c3fcc6d 100644
> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
> @@ -5,6 +5,11 @@ SUMMARY =3D "Locale data from eglibc"
> BPN =3D "eglibc"
> LOCALEBASEPN =3D "${MLPREFIX}eglibc"
>=20
> +# eglibc-collateral.inc inhibits all default deps, but do_package =
needs objcopy
> +# ERROR: objcopy failed with exit code 127 (cmd was =
'i586-webos-linux-objcopy' --only-keep-debug =
'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so' =
'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
> +# ERROR: Function failed: split_and_strip_files
> +DEPENDS_class-target =3D "virtual/${TARGET_PREFIX}binutils"


Looks good.


