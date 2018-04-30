Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 885B6600EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:09:14 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id p124-v6so10091379iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 06:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JJ51H6futqznQkFA22whd9ZW5RkYRKq6O/dGq5/YwVU=;
	b=SzMXMui2/SwRur3yknRw4qV7pbfMMBjquWq/8o/3vaeiHOHgy4oS66Uso4eLJKNDuV
	bSSXbfhhxYwThkvqrT2Ai3TTBBdEf0T0vMS54u4+cNW0oidaF8nr2b5HixdYhU91/LZh
	ybi/V7GANA8wjKgkVhSK756r77UmpgpNBW7WiZGhjhIT0Sn4vbIvbas8n00Z7iD2lddP
	3X4NcEsTC0rDCfPMSo3iYsm6XMhlW8cXX2T0YVhei7+MGc7dO6QsefcMhKWdVIyt4MpT
	3zNCn+7tCobDk2MVzlLuT/HRVZ7Yvqshu/QitLhjfqTbV56/1GaE5EjJowshdmDfUopE
	2eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JJ51H6futqznQkFA22whd9ZW5RkYRKq6O/dGq5/YwVU=;
	b=obVZiBA273WP5WjQdUZ4mC2C7/77Bdpbjx0ddjcxad3PICxDrGXWcpzVZDedk2gOam
	QfTXF7kh4TgC6EChoTZpXIGsRG4pITF7CsAkzQVOUZYemA1GGMIX843Os5XlfbqOPUmr
	sMoS7prKleAQwZgZdcaXpE/vB9jXjk5gOAXVCsmM+MkDto2zrGlw57O5jhZ9DxJxYIPU
	4n+qEheVEtOchGqSyy6rhC65AvQHx1Ygh85eVJLforAcXeBrlZc4QRmLL+rRCeygS3ub
	VAlrcG1Oery96ZHeiZuac25LG2j3SWDLwOcyi5le/SxMoXxosf2qPdih+xbPqo8cRsWS
	g0FA==
X-Gm-Message-State: ALQs6tCejhdW3CeynTubkhtRl2wkGhIGxwi7g0UR+vEt5wcv5KBxwOBR
	73UqkpGjPV3d5d5WgNk7BvYGJF6k1T5NIT12CLo/rg==
X-Google-Smtp-Source: AB8JxZqZ4y2uTyhYV1Wf8S0KvQfMAJjsN89tFdvhzJztC+F/3uGpMotJdkvueq+e51jqUaysDHdsOcd6sdMG8Pl4xAI=
X-Received: by 2002:a6b:5507:: with SMTP id
	j7-v6mr13194035iob.23.1525093754957; 
	Mon, 30 Apr 2018 06:09:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Mon, 30 Apr 2018 06:08:54 -0700 (PDT)
In-Reply-To: <20180420163354.12065-1-raj.khem@gmail.com>
References: <20180420163354.12065-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Apr 2018 14:08:54 +0100
Message-ID: <CAJTo0Lbqnrsa05cxUbpW0wDgRPMUqN60=X0rWKMPK9uqdpVogQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/6] libssp-nonshared: Add recipe
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
X-List-Received-Date: Mon, 30 Apr 2018 13:09:14 -0000
Content-Type: text/plain; charset="UTF-8"

build-appliance is failing at SDK creation time:

 Problem: package packagegroup-self-hosted-1.0-r13.0.noarch requires
packagegroup-self-hosted-sdk, but none of the providers can be
installed
  - conflicting requests
  - nothing provides libssp-dev needed by
packagegroup-self-hosted-sdk-1.0-r13.0.noarch

Ross

On 20 April 2018 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:
> libssp-nonshared is a minimal gcc runtime piece which is needed
> on non-glibc systems which do implement libssp APIs in libc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes since v1:
> - Package into staticdev package
>
>  meta/recipes-core/musl/libssp-nonshared.bb    | 39 ++++++++++++++++
>  .../musl/libssp-nonshared/ssp-local.c         | 45 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
>  create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c
>
> diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
> new file mode 100644
> index 0000000000..00a0a3d411
> --- /dev/null
> +++ b/meta/recipes-core/musl/libssp-nonshared.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Minimal libssp_nonshared.a must needed for ssp to work with gcc on musl"
> +LICENSE = "GPL-3.0-with-GCC-exception"
> +LIC_FILES_CHKSUM = "file://ssp-local.c;beginline=1;endline=32;md5=c06d391208c0cfcbc541a6728ed65cc4"
> +SECTION = "libs"
> +
> +SRC_URI = "file://ssp-local.c"
> +
> +PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
> +STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
> +
> +DEPENDS = "virtual/${TARGET_PREFIX}binutils \
> +           virtual/${TARGET_PREFIX}gcc-initial \
> +"
> +
> +do_configure[noexec] = "1"
> +
> +S = "${WORKDIR}"
> +
> +do_compile() {
> +       ${CC} ${CPPFLAGS} ${CFLAGS} -c ssp-local.c -o ssp-local.o
> +       ${AR} r libssp_nonshared.a ssp-local.o
> +}
> +do_install() {
> +       install -Dm 0644 ${B}/libssp_nonshared.a ${D}${base_libdir}/libssp_nonshared.a
> +}
> +#
> +# We will skip parsing for non-musl systems
> +#
> +COMPATIBLE_HOST = ".*-musl.*"
> +RDEPENDS_${PN}-staticdev = ""
> +RDEPENDS_${PN}-dev = ""
> +RRECOMMENDS_${PN}-dbg = "${PN}-staticdev (= ${EXTENDPKGV})"
> diff --git a/meta/recipes-core/musl/libssp-nonshared/ssp-local.c b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
> new file mode 100644
> index 0000000000..8f51afa2c1
> --- /dev/null
> +++ b/meta/recipes-core/musl/libssp-nonshared/ssp-local.c
> @@ -0,0 +1,45 @@
> +/* Stack protector support.
> +   Copyright (C) 2005-2018 Free Software Foundation, Inc.
> +
> +This file is part of GCC.
> +
> +GCC is free software; you can redistribute it and/or modify it under
> +the terms of the GNU General Public License as published by the Free
> +Software Foundation; either version 3, or (at your option) any later
> +version.
> +
> +In addition to the permissions in the GNU General Public License, the
> +Free Software Foundation gives you unlimited permission to link the
> +compiled version of this file into combinations with other programs,
> +and to distribute those combinations without any restriction coming
> +from the use of this file.  (The General Public License restrictions
> +do apply in other respects; for example, they cover modification of
> +the file, and distribution when not linked into a combine
> +executable.)
> +
> +GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> +WARRANTY; without even the implied warranty of MERCHANTABILITY or
> +FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> +for more details.
> +
> +Under Section 7 of GPL version 3, you are granted additional
> +permissions described in the GCC Runtime Library Exception, version
> +3.1, as published by the Free Software Foundation.
> +
> +You should have received a copy of the GNU General Public License and
> +a copy of the GCC Runtime Library Exception along with this program;
> +see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> +<http://www.gnu.org/licenses/>.  */
> +
> +extern void __stack_chk_fail (void);
> +
> +/* Some targets can avoid loading a GP for calls to hidden functions.
> +   Using this entry point may avoid the load of a GP entirely for the
> +   function, making the overall code smaller.  */
> +
> +void
> +__attribute__((visibility ("hidden")))
> +__stack_chk_fail_local (void)
> +{
> +  __stack_chk_fail ();
> +}
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

