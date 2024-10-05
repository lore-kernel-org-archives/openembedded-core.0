Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9443DCFB425
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 17:12:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15770.1728148331088882478
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Oct 2024 10:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=KoS3XGku;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 495HCAuT081731
	for <openembedded-core@lists.openembedded.org>; Sat, 5 Oct 2024 12:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728148330;
	bh=ibrL8/nzXvxyC65Gfztsw4hcuwlZrw+wVRnh/8m+sFk=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=KoS3XGku3t7JQuJojBJq2SwfdAEArzNVRaO0uMWghplvvZum15+wdF1YFSti3jlFR
	 fznT1tBx9s7iuuv0LT3b13iokP16Ff5AsshgwER93kcGO1fv+z6Gy4TNs9Awkfd2pk
	 WyI4BJEGyKJ7DUdYaBF4Q6sj/yTfjp8nk3GUedVE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 495HCArj024390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 5 Oct 2024 12:12:10 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 5
 Oct 2024 12:12:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 5 Oct 2024 12:12:09 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 495HC8uD017886;
	Sat, 5 Oct 2024 12:12:09 -0500
Message-ID: <1a372c2e-9836-47b4-8847-7ce795034e05@ti.com>
Date: Sat, 5 Oct 2024 22:42:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [OE-core] [scarthgap] cryptodev: upgrade 1.13 -> 1.14
To: <openembedded-core@lists.openembedded.org>
References: <20241004151337.23981-1-reatmon@ti.com>
Content-Language: en-US
CC: <reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241004151337.23981-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 495HCAuT081731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Oct 2024 17:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205240

Hi,

This back-port from oe-core:master certainly fixes build errors
observed with cryptodev 1.13 in oe-core:scarthgap with kernel tip
(i.e 6.12-rc1)

On 04/10/24 20:43, Ryan Eatmon via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@=E2=80=8Afujitsu.=E2=80=8Acom>=20
> 0001-Disable-installing-header-file-provided-by-another-p.=E2=80=8Apatc=
h=20
> 0001-tests-Makefile-do-not-use-Werror.=E2=80=8Apatch removed since they=
're=20
> included in 1.=E2=80=8A14 Changelog: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
* Fix compilation issues after
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9k0bKoZEn=
PPjvChtWQEhifZLq8O7CtulK1UFf3XihEYiQnDb88KEbuUHFzKchMH1NBnCeM755lo$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-Disable-installing-header-file-provided-by-another-p.patch
> 0001-tests-Makefile-do-not-use-Werror.patch
> removed since they're included in 1.14
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Fix compilation issues after API changes in several Linux kernels
> * Split install targets to help package maintainers
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   .../cryptodev/cryptodev-linux_1.13.bb              | 13 -----------
>   .../cryptodev/cryptodev-linux_1.14.bb              | 13 +++++++++++
>   .../cryptodev/cryptodev-module_1.13.bb             | 16 -------------=
-
>   .../cryptodev/cryptodev-module_1.14.bb             | 13 +++++++++++
>   .../cryptodev/cryptodev-tests_1.13.bb              | 21 -------------=
-----
>   .../cryptodev/cryptodev-tests_1.14.bb              | 17 +++++++++++++=
++
>   meta/recipes-kernel/cryptodev/cryptodev.inc        |  4 ++--
>   ...talling-header-file-provided-by-another-p.patch | 25 -------------=
---------
>   .../0001-tests-Makefile-do-not-use-Werror.patch    | 25 -------------=
---------
>   9 files changed, 45 insertions(+), 102 deletions(-)
>   delete mode 100644 meta/recipes-kernel/cryptodev/cryptodev-linux_1.13=
.bb
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-linux_1.14=
.bb
>   delete mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.1=
3.bb
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.1=
4.bb
>   delete mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.13=
.bb
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.14=
.bb
>   delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-i=
nstalling-header-file-provided-by-another-p.patch
>   delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-tests-Mak=
efile-do-not-use-Werror.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb b/me=
ta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
> deleted file mode 100644
> index d5ea9d8529..0000000000
> --- a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require cryptodev.inc
> -
> -SUMMARY =3D "A /dev/crypto device driver header file"
> -
> -do_compile[noexec] =3D "1"
> -
> -# Just install cryptodev.h which is the only header file needed to be =
exported
> -do_install() {
> -	install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev=
.h
> -}
> -
> -ALLOW_EMPTY:${PN} =3D "1"
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb b/me=
ta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
> new file mode 100644
> index 0000000000..d5ea9d8529
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
> @@ -0,0 +1,13 @@
> +require cryptodev.inc
> +
> +SUMMARY =3D "A /dev/crypto device driver header file"
> +
> +do_compile[noexec] =3D "1"
> +
> +# Just install cryptodev.h which is the only header file needed to be =
exported
> +do_install() {
> +	install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev=
.h
> +}
> +
> +ALLOW_EMPTY:${PN} =3D "1"
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb b/m=
eta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
> deleted file mode 100644
> index 5192cf03ed..0000000000
> --- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require cryptodev.inc
> -
> -SUMMARY =3D "A /dev/crypto device driver kernel module"
> -
> -inherit module
> -
> -# Header file provided by a separate package
> -DEPENDS +=3D "cryptodev-linux"
> -
> -SRC_URI +=3D "file://0001-Disable-installing-header-file-provided-by-a=
nother-p.patch \
> -           "
> -
> -EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" PREFIX=3D"${D}"'
> -
> -RCONFLICTS:${PN} =3D "ocf-linux"
> -RREPLACES:${PN} =3D "ocf-linux"
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb b/m=
eta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
> new file mode 100644
> index 0000000000..6fb75675bb
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
> @@ -0,0 +1,13 @@
> +require cryptodev.inc
> +
> +SUMMARY =3D "A /dev/crypto device driver kernel module"
> +
> +inherit module
> +
> +# Header file provided by a separate package
> +DEPENDS +=3D "cryptodev-linux"
> +
> +EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" PREFIX=3D"${D}"'
> +
> +RCONFLICTS:${PN} =3D "ocf-linux"
> +RREPLACES:${PN} =3D "ocf-linux"
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb b/me=
ta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
> deleted file mode 100644
> index 458ad8ecf2..0000000000
> --- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -require cryptodev.inc
> -
> -SUMMARY =3D "A test suite for /dev/crypto device driver"
> -
> -DEPENDS +=3D "openssl"
> -
> -SRC_URI +=3D " \
> -           file://0001-tests-Makefile-do-not-use-Werror.patch \
> -           "
> -
> -EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_EXECPREFIXDIR}" PREFIX=3D"${D}=
"'
> -
> -do_compile() {
> -	oe_runmake tests
> -}
> -
> -do_install() {
> -	oe_runmake install_tests
> -}
> -
> -FILES:${PN} =3D "${bindir}/*"
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb b/me=
ta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
> new file mode 100644
> index 0000000000..f6a286e1b7
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
> @@ -0,0 +1,17 @@
> +require cryptodev.inc
> +
> +SUMMARY =3D "A test suite for /dev/crypto device driver"
> +
> +DEPENDS +=3D "openssl"
> +
> +EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_EXECPREFIXDIR}" PREFIX=3D"${D}=
"'
> +
> +do_compile() {
> +	oe_runmake tests
> +}
> +
> +do_install() {
> +	oe_runmake install_tests
> +}
> +
> +FILES:${PN} =3D "${bindir}/*"
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes=
-kernel/cryptodev/cryptodev.inc
> index 64a9c2926b..8d0aad4a01 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263"
>  =20
>   SRC_URI =3D "git://github.com/cryptodev-linux/cryptodev-linux;branch=3D=
master;protocol=3Dhttps \
>              "
> -SRCREV =3D "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> -PV =3D "1.13+git${SRCPV}"
> +SRCREV =3D "135cbff90af2ba97d88f1472be595ce78721972c"
> +PV =3D "1.14"
>  =20
>   S =3D "${WORKDIR}/git"
>  =20
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installin=
g-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev=
/files/0001-Disable-installing-header-file-provided-by-another-p.patch
> deleted file mode 100644
> index c7fdef4da4..0000000000
> --- a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-heade=
r-file-provided-by-another-p.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 66d85d3f26e21cf7c38b27de0dcc42376f5d853e Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Sun, 6 Apr 2014 19:51:39 -0400
> -Subject: [PATCH] Disable installing header file provided by another pa=
ckage
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> -
> -Upstream-Status: Inappropriate [ OE specific ]
> -
> ----
> - Makefile | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index d83aee6..c8d8ae5 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -36,7 +36,6 @@ install: modules_install
> -
> - modules_install:
> - 	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
> --	install -m 644 -D crypto/cryptodev.h $(DESTDIR)/$(includedir)/crypto=
/cryptodev.h
> -
> - install_tests: tests
> - 	$(MAKE) -C tests install DESTDIR=3D$(PREFIX)
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do=
-not-use-Werror.patch b/meta/recipes-kernel/cryptodev/files/0001-tests-Ma=
kefile-do-not-use-Werror.patch
> deleted file mode 100644
> index 3285548a57..0000000000
> --- a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-us=
e-Werror.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 47438e53e1156db0916c0f4683a24fe4d82152f2 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Fri, 10 Sep 2021 10:44:42 +0200
> -Subject: [PATCH] tests/Makefile: do not use -Werror
> -
> -Otherwise, openssl 3 deprecation warnings become errors.
> -Reported athttps://urldefense.com/v3/__https://github.com/cryptodev-li=
nux/cryptodev-linux/issues/67__;!!G3vK!VTKl15T7qwj_TgE0YSGLB5hqqLhPa2QS5b=
G0HPNMZitM5KjMaZ3WTI2e7ff7M5gN9cxuscB5KQOGjjQFx0YnpfRDJqr-JxKoFg$
> -
> -Upstream-Status: Inappropriate [upstream needs to update the code]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> -
> ----
> - tests/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tests/Makefile b/tests/Makefile
> -index 2fb7a9a..e94f80e 100644
> ---- a/tests/Makefile
> -+++ b/tests/Makefile
> -@@ -1,4 +1,4 @@
> --CFLAGS +=3D -I.. $(CRYPTODEV_CFLAGS) -Wall -Werror
> -+CFLAGS +=3D -I.. $(CRYPTODEV_CFLAGS) -Wall
> -
> - comp_progs :=3D cipher_comp hash_comp hmac_comp
> -
> --=20
> cgit 1.2.3-korg
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205235): https://urldefense.com/v3/__https://lists.=
openembedded.org/g/openembedded-core/message/205235__;!!G3vK!VTKl15T7qwj_=
TgE0YSGLB5hqqLhPa2QS5bG0HPNMZitM5KjMaZ3WTI2e7ff7M5gN9cxuscB5KQOGjjQFx0Ynp=
fRDJqrtMNtNnw$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded=
.org/mt/108818948/7030289__;!!G3vK!VTKl15T7qwj_TgE0YSGLB5hqqLhPa2QS5bG0HP=
NMZitM5KjMaZ3WTI2e7ff7M5gN9cxuscB5KQOGjjQFx0YnpfRDJqr9uMEUnQ$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org=
/g/openembedded-core/unsub__;!!G3vK!VTKl15T7qwj_TgE0YSGLB5hqqLhPa2QS5bG0H=
PNMZitM5KjMaZ3WTI2e7ff7M5gN9cxuscB5KQOGjjQFx0YnpfRDJqq9anKlOQ$  [c-shilwa=
nt@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

