Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 523C86EAE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 04:59:58 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so11468435pde.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 20:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ifLzwsTnXoTt4T7eM7nTQE6WEqrrg58uQC5oob3Ulv0=;
	b=MKELLz0dzFX2FKjqMrf091OQqvAX+5d6I/a6phi8nG43MrzaWz6jJKVsbZPJUJgl9v
	g6AktBmCS0CdXtR9Cr1CNn0to+cd/LCSOkQTuR1/Kx4co/So/pTlAhzVIqap6gS/HCQh
	mt5FL7FqDXfIO2Joc2dHP8MQMUrhvHX3+RJ4VwvgbvG1VS9VWeKEk7wgqsdQAaKCgbul
	pFqCfDX+k5jTGpgO3hpPzFLji6aukduntMnGNng336mxn96J/AegVIxRxjynsBF2fNPl
	n8SoNcQX89v7iu5lwunn1gVc15nEZOkhHExzRP5dT3+helAR6HZWGTPRngF3LKHgxMZY
	QOIA==
X-Received: by 10.66.49.74 with SMTP id s10mr6704426pan.0.1392353999033;
	Thu, 13 Feb 2014 20:59:59 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	kc9sm12499319pbc.25.2014.02.13.20.59.57 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Feb 2014 20:59:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1392348651-16466-1-git-send-email-rongqing.li@windriver.com>
Date: Thu, 13 Feb 2014 20:59:55 -0800
Message-Id: <A564E7B2-6046-4C2F-9DF9-9D8748569895@gmail.com>
References: <1392348651-16466-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: change kernel version from 3.4 to 3.10
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
X-List-Received-Date: Fri, 14 Feb 2014 04:59:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Feb 13, 2014, at 7:30 PM, <rongqing.li@windriver.com> =
<rongqing.li@windriver.com> wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Linux kernel 3.10 is used currently

Can you explain a bit more ? is it kernel-headers thats important here
or is it the machine kernel ? if its machine kernel then this recipe
should be made machine specific and a mechanism to dig the machine =
kernel
version should be used which won=92t be 3.10 always. but if its just =
kernel
headers then its less of a concern still this must be documented.

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
> meta/recipes-support/nss/nss.inc |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/nss/nss.inc =
b/meta/recipes-support/nss/nss.inc
> index a6aeed8..e0840c4 100644
> --- a/meta/recipes-support/nss/nss.inc
> +++ b/meta/recipes-support/nss/nss.inc
> @@ -55,7 +55,7 @@ do_compile() {
>     export NSS_USE_SYSTEM_SQLITE=3D1
>     export NSS_ENABLE_ECC=3D1
>=20
> -    export OS_RELEASE=3D3.4
> +    export OS_RELEASE=3D3.10
>     export OS_TARGET=3DLinux
>     export OS_ARCH=3DLinux
>=20
> @@ -95,7 +95,7 @@ do_install() {
>     export NSS_USE_SYSTEM_SQLITE=3D1
>     export NSS_ENABLE_ECC=3D1
>=20
> -    export OS_RELEASE=3D3.4
> +    export OS_RELEASE=3D3.10
>     export OS_TARGET=3DLinux
>     export OS_ARCH=3DLinux
>=20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


