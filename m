Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B31ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 18:12:07 +0000 (UTC)
Subject: Re: [PATCH] rust-cross-canadian: Fix for the linker issues caused by
 using the shell
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.147.219)
X-Originating-Platform: Windows Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 04 Sep 2022 11:12:03 -0700
References: <20220904180946.1954417-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220904180946.1954417-1-sundeep.kokkonda@gmail.com>
Message-ID: <15621.1662315123898281773@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8YnvFWbyKyo21p6i97JW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 18:12:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170291

--8YnvFWbyKyo21p6i97JW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Since the issue " https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14892=
 " is sporadically appearing at autobuilder, I could not completely test it=
 on my local machine. This patch is posted here to test it on YP AB machine=
.

I ensured the test is passed at my local machine.

>=20
> SDK testing environment: cortexa57-poky-linux
> RESULTS:
> RESULTS - assimp.BuildAssimp.test_assimp: PASSED (78.38s)
> RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (42.25s)
> RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (18.43s)
> RESULTS - buildgalculator.GalculatorTest.test_galculator: PASSED (16.29s)
> RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (2.41s)
> RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.11s)
> RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.13s)
> RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.35s)
> RESULTS - gcc.GccCompileTest.test_make: PASSED (0.11s)
> RESULTS - perl.PerlTest.test_perl: PASSED (0.03s)
> RESULTS - python.Python3Test.test_python3: PASSED (0.04s)
> *RESULTS - rust.RustCompileTest.test_cargo_build: PASSED (0.26s)*
> SUMMARY:
> core-image-sato sdk
> (poky-glibc-x86_64-core-image-sato-cortexa57-qemuarm64-toolchain-4.1+snap=
shot.sh:environment-setup-cortexa57-poky-linux)
> - Ran 12 tests in 158.803s
> core-image-sato sdk - OK - All required tests passed (successes=3D12,
> skipped=3D0, failures=3D0, errors=3D0)
> NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun
> and all succeeded.
>=20
>=20
>=20
>=20

Please test the patch on autobuilder and let me know if it is ok.

--
Thanks
Sundeep K.

--8YnvFWbyKyo21p6i97JW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />Since the issue "<em>https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D14892</em>" is sporadically appearing at autobuilder, I cou=
ld not completely test it on my local machine. This patch is posted here to=
 test it on YP AB machine.<br /><br />I ensured the test is passed at my lo=
cal machine.<br /><br />
<blockquote>
<div>SDK testing environment: cortexa57-poky-linux</div>
<div>RESULTS:</div>
<div>RESULTS - assimp.BuildAssimp.test_assimp: PASSED (78.38s)</div>
<div>RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (42.25s)</div>
<div>RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (18.43s)</div>
<div>RESULTS - buildgalculator.GalculatorTest.test_galculator: PASSED (16.2=
9s)</div>
<div>RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (2.41s)</div>
<div>RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.11s)</div>
<div>RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.13s)</div>
<div>RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.35s)</div>
<div>RESULTS - gcc.GccCompileTest.test_make: PASSED (0.11s)</div>
<div>RESULTS - perl.PerlTest.test_perl: PASSED (0.03s)</div>
<div>RESULTS - python.Python3Test.test_python3: PASSED (0.04s)</div>
<div><strong>RESULTS - rust.RustCompileTest.test_cargo_build: PASSED (0.26s=
)</strong></div>
<div>SUMMARY:</div>
<div>core-image-sato sdk (poky-glibc-x86_64-core-image-sato-cortexa57-qemua=
rm64-toolchain-4.1+snapshot.sh:environment-setup-cortexa57-poky-linux) - Ra=
n 12 tests in 158.803s</div>
<div>core-image-sato sdk - OK - All required tests passed (successes=3D12, =
skipped=3D0, failures=3D0, errors=3D0)</div>
<div>NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be re=
run and all succeeded.</div>
<div><br /><br /></div>
</blockquote>
Please test the patch on autobuilder and let me know if it is ok.<br /><br =
/>--<br />Thanks<br />Sundeep K.

--8YnvFWbyKyo21p6i97JW--

