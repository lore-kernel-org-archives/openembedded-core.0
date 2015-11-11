Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E620677140
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 16:27:45 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so119701889wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 08:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=YC+3xZ2WtnuIRs0MNscybLc4nGZzxpGqc0LJ0YC5doo=;
	b=SR/JbVcopVQpBzoAAP1u9kvuQHxN7vYNDRpuIIYSvpnHsDXFunIul+q+CnnsHC2Pf8
	O9YO/WclK0rNxeKJTKAsUcbMIFC1EeHP65ECcgKd8ipfyVb7LHY8G0gaJC1JIip7Ztwu
	7VD/wR84STV3V4RvVLEsBgm++3IAJHM3yQEa3MXDgd6qjggasmaAxXdKRN5IH7glYndw
	LmZ48U1r7XJhuPm10bRsrAFcv0EFOiZPO4h1ktZwXPUvMUbDLm6CAbbLvYLeB0F4EIZN
	yVf3uvm6vJ6qwRchGIC3h/xyHbA1FXFlmYVHvZgob5HmXUk6Sg9IzRw0kA86p6HrqqRV
	RS8Q==
X-Received: by 10.194.92.138 with SMTP id cm10mr11279382wjb.6.1447259265170;
	Wed, 11 Nov 2015 08:27:45 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	r65sm26051873wmb.20.2015.11.11.08.27.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 08:27:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0Lav3zHGErVDp+h-o1tCa2HCDruU8+4=NGND7kOyyu-5pA@mail.gmail.com>
Date: Wed, 11 Nov 2015 17:27:43 +0100
Message-Id: <BEFC06DF-1D58-4FB3-AF0F-2733DF33085A@gmail.com>
References: <9EEC2D18-21A2-40BA-97B3-D8DD67015AC9@gmail.com>
	<1444032741.5118.5.camel@linuxfoundation.org>
	<563FFA16.6070606@windriver.com>
	<CAJTo0Lav3zHGErVDp+h-o1tCa2HCDruU8+4=NGND7kOyyu-5pA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should openssl(-native) build-depends on perl-native?
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
X-List-Received-Date: Wed, 11 Nov 2015 16:27:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 09.11.2015 um 13:17 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 9 November 2015 at 01:42, Randy MacLeod =
<randy.macleod@windriver.com> wrote:
> openssl fails to build on Fedora 23 with this signature.
> I suspect that bigint.pm isn't standard and that we
> need to re-work:
>=20
> commit cd3eddcf2842b9a360f72caf4337ab2968462bb2
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Tue Jun 16 00:32:15 2015 +0300
>=20
>     openssl: fix building on x32 systems
>=20
>     Fix build on Fedora 21 i686.
>=20
>     When building on x32 systems where the default type is 32bit,
>     make sure that 64bit integers can be represented transparently.
>=20
>     Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> ---
>=20
> $ git show cd3eddcf2842b9a360f72caf4337ab2968462bb2 | grep bigint
> +Subject: [PATCH] crypto: use bigint in x86-64 perl
> ++      use bigint;
>              file://crypto_use_bigint_in_x86-64_perl.patch \
>=20
>=20
> More later in the week unless someone has fixed this already.
>=20
> That's right (#8562).  Installing perl-bignum should fix that.  =
Ideally someone who understands perl can rewrite the patch so that it =
works out of the box on F23.

In my special case I have a very limited perl environment for testing =
some modules before uploading them to cpan ;)
It'll help to clean up my PATH before running bitbake ^^

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


