Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 023A47404E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:38:41 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so148443965pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=GwMUVVzCYAsoqez291VjHxxItH5GNwWhalLZTM09M50=;
	b=aN3WOlybvVWQ/lJ+kwq1bfrdUXMCM+k8cGS6rprMlzGYZA6DMak137tSgnmwxI5PFZ
	xIq0VKiV83ZSWMXB4ovqcgzxaBBXr+5hPrw9EpHhr8dZhrhGl9imVHGgIxJY8lX9AsB3
	BnITkHf7cwyErK8EgOH2EzefQ/JKGFhJDdwsz82iHt6cqYczuHQfIXtfT0mLJg0hEt/C
	jHN2doQEBNw/BVE4qyiPEfqMHz3l8x3HL2aKg/LUPxWjdRyvUjXlctTMSNatZwzcphAu
	p56yB2A9tBLZZLpUqIVjzvDWUOGRc55h/HFyOZ5dbRQCHKKn5vDu5y/VRpMaQDQCQ0J2
	HLZw==
X-Received: by 10.68.94.195 with SMTP id de3mr36510053pbb.47.1442248721550;
	Mon, 14 Sep 2015 09:38:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:8d6e:46a6:5187:f53c?
	([2601:646:8601:4580:8d6e:46a6:5187:f53c])
	by smtp.gmail.com with ESMTPSA id
	qr5sm17155686pbb.26.2015.09.14.09.38.40
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Sep 2015 09:38:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1442247767-7879-1-git-send-email-juro.bystricky@intel.com>
Date: Mon, 14 Sep 2015 09:38:40 -0700
Message-Id: <7D6F58E5-BF37-4757-8B9A-5C37BAE5ED8E@gmail.com>
References: <1442247767-7879-1-git-send-email-juro.bystricky@intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
X-Mailer: Apple Mail (2.3094)
Cc: richard.purdie@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgcc.inc: package baremetal multilib libraries
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
X-List-Received-Date: Mon, 14 Sep 2015 16:38:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Sep 14, 2015, at 9:22 AM, Juro Bystricky <juro.bystricky@intel.com> =
wrote:
>=20
> When building libgcc for baremetal cross-compilers, some files and =
libraries
> may be built but not packaged. This patch fixes errors such as these:
>=20
> ERROR: QA Issue: libgcc: Files/directories were installed but not =
shipped in any package:
>  /usr/lib/arm-poky-eabi/4.9.3/thumb
>  /usr/lib/arm-poky-eabi/4.9.3/fpu
>  /usr/lib/arm-poky-eabi/4.9.3/thumb/libgcov.a
>  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtn.o
>  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtend.o
>  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtbegin.o
>  /usr/lib/arm-poky-eabi/4.9.3/thumb/libgcc.a
>  /usr/lib/arm-poky-eabi/4.9.3/thumb/crti.o
>  /usr/lib/arm-poky-eabi/4.9.3/fpu/libgcov.a
>  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtn.o
>  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtend.o
>  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtbegin.o
>  /usr/lib/arm-poky-eabi/4.9.3/fpu/libgcc.a
>  /usr/lib/arm-poky-eabi/4.9.3/fpu/crti.o
> Please set FILES such that these items are packaged. Alternatively if =
they are unneeded,
> avoid installing them or delete them within do_install. =
[installed-vs-shipped]
>=20
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
> meta/recipes-devtools/gcc/libgcc.inc | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc =
b/meta/recipes-devtools/gcc/libgcc.inc
> index 739adbd..95709e4 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -28,6 +28,12 @@ FILES_${PN}-dev =3D "\
>     ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
> "
>=20
> +FILES_${PN}-dev_libc-baremetal =3D "\
> +    ${base_libdir}/ \
> +    ${libdir}/* \
> +    ${libdir}/${TARGET_SYS}/* \
> +=E2=80=9D

why not put it into libgcc-dev itself=20

> +

> FILES_${PN}-dbg +=3D "${base_libdir}/.debug/"
>=20
> LIBGCCBUILDTREENAME =3D "gcc-build-internal-"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


