Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40CB4606CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 23:24:53 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 3so14391627pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=gBLBDhP6VWhABacsbG5tRJ1DWO+51NIGDUDa2eL2rGw=;
	b=iUn6W8i3vQ+L/BtSkRQFlYRpu/q+VoN2nYP76hD0UlVPEAAzgBTdaaTnqtvuibebtx
	kv/XjKmjM//ea4fYIh5HKYN5LYUGDQKps9OZcDA+NeEGEILvfj086NLZQrqBvXLScBNN
	QGGw/ouMae6VrefYKBVORLzVWdjOVPQRu1OmpMaefloZiyQ/AtPHwzwtbWN+Bl/iI5Ri
	M59MELzdiOICQ/T+XtKbHDu1AHOVrbzSCuFuxtdDB38bfqcPBzDae53cbVhGTHDVMtjT
	kcCLB7EU66mWk4ekJj+R7Okw6ZpddoUo0EHDYPFVzXDUhzAck/URavHYr4MBwhUXh6mV
	e9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=gBLBDhP6VWhABacsbG5tRJ1DWO+51NIGDUDa2eL2rGw=;
	b=helHLZ2G6qYMvF0qzkD1vW+z82R3MQulhsAAcmTPSoeBXn/tBrYxv+0Lovhs8i7TDx
	BddXUk79pfiT2ukuJgaxwMcxLjducsxEUI16flyGMu2HhDSkFB/qu4faBg+jecOodl6g
	DCq5FjYJ1syjG32/v7CnlduQbsaFBChXemVj9HZ5E9jzSOjmStPgRTPW000h1Q4jpkPD
	m+fR4+oPXcdrD/CPsh+uk0sLTpcQZwEF9CUlDbgJfafzIrM25CxcgndYYXdj3xj7TU1/
	C14hZB2oYNg/FfqJZgLPY4Bgx7icJ/ljrlYWBtkynD+ZECfEqO+DNpsCrCBpgvQtiTLX
	n5uA==
X-Gm-Message-State: AKaTC02FKOoOT0t7zZ14YHXjtPJYSlseXXEttzpzzbgOA+TgqxIOtYZGbe2NoW6/34PJ0w==
X-Received: by 10.84.218.15 with SMTP id q15mr54925006pli.143.1480375495585;
	Mon, 28 Nov 2016 15:24:55 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:f08c:19b4:e718:7b0b?
	([2601:646:8882:b8c:f08c:19b4:e718:7b0b])
	by smtp.gmail.com with ESMTPSA id
	t21sm89727050pfa.1.2016.11.28.15.24.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 15:24:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <25f83a1bf177dde8db32ac494b4f0a82839ffb43.1480333940.git.alexander.kanavin@linux.intel.com>
Date: Mon, 28 Nov 2016 15:24:54 -0800
Message-Id: <57D1D0A9-6C79-4556-A863-A6553364746E@gmail.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
	<cover.1480333940.git.alexander.kanavin@linux.intel.com>
	<25f83a1bf177dde8db32ac494b4f0a82839ffb43.1480333940.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/18] cmake: update to 3.7.0
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
X-List-Received-Date: Mon, 28 Nov 2016 23:24:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 28, 2016, at 5:34 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> License is still 3-clause BSD.

OK. what triggered the checksum change then ?

>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> .../cmake/{cmake-native_3.6.2.bb =3D> cmake-native_3.7.0.bb}        | =
1 +
> meta/recipes-devtools/cmake/cmake.inc                             | 8 =
++++----
> meta/recipes-devtools/cmake/{cmake_3.6.2.bb =3D> cmake_3.7.0.bb}    | =
1 +
> 3 files changed, 6 insertions(+), 4 deletions(-)
> rename meta/recipes-devtools/cmake/{cmake-native_3.6.2.bb =3D> =
cmake-native_3.7.0.bb} (95%)
> rename meta/recipes-devtools/cmake/{cmake_3.6.2.bb =3D> =
cmake_3.7.0.bb} (97%)
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.2.bb =
b/meta/recipes-devtools/cmake/cmake-native_3.7.0.bb
> similarity index 95%
> rename from meta/recipes-devtools/cmake/cmake-native_3.6.2.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.7.0.bb
> index aec0d64..7ad4345 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.6.2.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.7.0.bb
> @@ -17,6 +17,7 @@ CMAKE_EXTRACONF =3D "\
>     -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
>     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
>     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
>     -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
>     -DHAVE_SYS_ACL_H=3D0 \
> "
> diff --git a/meta/recipes-devtools/cmake/cmake.inc =
b/meta/recipes-devtools/cmake/cmake.inc
> index fee511f..9ae2890 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -6,8 +6,8 @@ HOMEPAGE =3D "http://www.cmake.org/"
> BUGTRACKER =3D "http://public.kitware.com/Bug/my_view_page.php"
> SECTION =3D "console/utils"
> LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D =
"file://Copyright.txt;md5=3D052f86c15bbde68af55c7f7b340ab639 \
> -                    =
file://Source/cmake.h;beginline=3D1;endline=3D10;md5=3D341736dae83c9e344b5=
3eeb1bc7d7bc2"
> +LIC_FILES_CHKSUM =3D =
"file://Copyright.txt;md5=3D7a64bc564202bf7401d9a8ef33c9564d \
> +                    =
file://Source/cmake.h;beginline=3D1;endline=3D3;md5=3D4494dee184212fc89c46=
9c3acd555a14"
>=20
> CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV', =
True).split('.')[0:2])}"
>=20
> @@ -17,8 +17,8 @@ SRC_URI =3D =
"https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>            file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
>            "
>=20
> -SRC_URI[md5sum] =3D "139d7affdd4e8ab1edfc9f4322d69e43"
> -SRC_URI[sha256sum] =3D =
"189ae32a6ac398bb2f523ae77f70d463a6549926cde1544cd9cc7c6609f8b346"
> +SRC_URI[md5sum] =3D "3801dc4e54c1c957a7378d8b0d4254ba"
> +SRC_URI[sha256sum] =3D =
"ed63e05c41aeb6c036e503114ab15847f29c312f9f21f5f1a7060a4b4ec2fb31"
>=20
> UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake_3.6.2.bb =
b/meta/recipes-devtools/cmake/cmake_3.7.0.bb
> similarity index 97%
> rename from meta/recipes-devtools/cmake/cmake_3.6.2.bb
> rename to meta/recipes-devtools/cmake/cmake_3.7.0.bb
> index 850d6de..58c6615 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.6.2.bb
> +++ b/meta/recipes-devtools/cmake/cmake_3.7.0.bb
> @@ -27,6 +27,7 @@ EXTRA_OECMAKE=3D" \
>     -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} =
\
>     -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
>     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
>     -DKWSYS_CHAR_IS_SIGNED=3D1 \
>     -DBUILD_CursesDialog=3D0 \
>     ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', =
'-DKWSYS_LFS_WORKS=3D1', '-DKWSYS_LFS_DISABLE=3D1', d)} \
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


