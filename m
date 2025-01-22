Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69BCC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 00:41:16 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.31957.1737506467087165425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 16:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZQVitYq+;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50M0f5A2095963
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 18:41:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737506466;
	bh=kr4x+LaqxaBMHR5UL+VvX+YsXO56rWXC/tqugopbXSc=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=ZQVitYq+zVzqbb0Yb5mwOs2DPC6ouoWj/p05VHQoqgPDWpsv12WhO375aLRgusSXg
	 GYx/NO1a/HKOmANRyUJSgXof2zYI2aUUyhHNMh+qITfJ1/pAr8dq4Vam3og4c0CeJN
	 q9fnAiTWZuiOdroYM72G0OOzCnky3Qr3iaRosdI8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50M0f5jL029792
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 18:41:05 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 18:41:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 18:41:05 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50M0f5rL005533;
	Tue, 21 Jan 2025 18:41:05 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Jan 2025 18:41:05 -0600
Message-ID: <D786MZ0M27T7.20232DKF09I6A@ti.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][PATCH] opencl-cts: add recipe
From: Randolph Sapp <rs@ti.com>
To: <a-christidis@ti.com>, <raj.khem@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250117215818.445740-1-a-christidis@ti.com>
In-Reply-To: <20250117215818.445740-1-a-christidis@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 00:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210111

On Fri Jan 17, 2025 at 3:58 PM CST, a-christidis via lists.openembedded.org=
 wrote:
> From: Antonios Christidis <a-christidis@ti.com>
>
> This recipe provides the opecl-cts suite.  This is a pre-release version
> v2024-08-08, which I have tested to work with opencl-headers version v202=
4.05.08
> . The pre-release version was picked due to incompatibility issues with o=
ther
> versions of headers. Commits past the pre release will run into issues wi=
th=20
> CL_UNORM_INT_2_101010_EXT =20
>
> The recipe also includes a patch, to allow it to compile and build proper=
ly.
> Further information below.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../files/0001-Ignore-Compiler-Warnings.patch | 36 +++++++++++++++++++
>  .../opencl/opencl-cts_2024.08.08.bb           | 24 +++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compile=
r-Warnings.patch
>  create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
>
> diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warni=
ngs.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings=
.patch
> new file mode 100644
> index 000000000..38016789b
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.pat=
ch
> @@ -0,0 +1,36 @@
> +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
> +From: Antonios Christidis <a-christidis@ti.com>
> +Date: Fri, 17 Jan 2025 15:05:39 -0600
> +Subject: [PATCH] Ignore Compiler Warnings
> +
> +
> +Upstream repo is using Ubuntu 20.04 to build. Their compiler is old enou=
gh to
> +to not catch these warnings. While our distro compiler is capable of cat=
ching=20
> +them, resulting in compilation failures. Thus change the build system to=
 ignore
> +the warnings. Resulting in no errors (-Werror flag enabled). =20
> +
> +Upstream-Status: Inappropriate [oe specific - compilation errors due to =
cross-compiling]
> +
> +Singed-Off-By: Antonios Christidis <a-christidis@ti.com>
> +---
> + CMakeLists.txt | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5cfef6b3..71b6ddb4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_=
ID}" MATCHES "(Apple)?Clang"
> +     add_cxx_flag_if_supported(-Wno-error=3Dcpp) # Allow #warning direct=
ive
> +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
> +     add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths) # Issue =
#784
> +-
> ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> +     # -msse -mfpmath=3Dsse to force gcc to use sse for float math,
> +     # avoiding excess precision problems that cause tests like int2floa=
t
> +     # to falsely fail. -ffloat-store also works, but WG suggested
> +--=20
> +2.34.1
> +
> diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-=
oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> new file mode 100644
> index 000000000..aa0e090db
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "OpenCL CTS"
> +DESCRIPTION =3D "OpenCL CTS test suite"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
> +
> +inherit pkgconfig cmake
> +
> +DEPENDS +=3D "opencl-headers opencl-icd-loader"
> +RDEPENDS:${PN} +=3D "python3-core"

Missing RDEPENDS on python3-io since the run_conformance.py script needs th=
e
tempfile module.

> +
> +S =3D "${WORKDIR}/git"
> +
> +SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=3Dhtt=
ps;branch=3Dmain \

Would recommend using ";lfs=3D0" here. LFS isn't setup in the CROPS contain=
ers and
even though this git project has lfs metadata, it hasn't used lfs since:

ad8ab3fe (Remove OpenCL C++ tests (#1241), 2021-05-13)

> +	   file://0001-Ignore-Compiler-Warnings.patch"
> +
> +SRCREV =3D "a406b340913f622da089b00f284a597656c10239"
> +
> +EXTRA_OECMAKE:append =3D " -DCL_INCLUDE_DIR=3D${STAGING_INCDIR} -DCL_LIB=
_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
> +
> +do_install() {
> +        install -d ${D}${bindir}/opencl_test_conformance
> +        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conforma=
nce
> +        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/open=
cl_test_conformance/run_conformance.py

Would recommend the following to help with QA warnings:
        find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cm=
ake -type f -delete
        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type=
 d -exec rm -rf "{}" \; -depth

> +}


