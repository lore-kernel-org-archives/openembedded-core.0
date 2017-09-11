Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6187820F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 23:04:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h4so5496875pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 16:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZZcRKjvtYbPItMo7ZrrT7m80BrA2CtFN6FbCL7iT2i0=;
	b=rUMud/4VlrcsgJTbdeFm0Huy1GRvGZ/KHHHDg/Cq8PI/U/Bb5U4+kwZGbwVa416vFK
	xxDLN1bwDx/zwhnEQ1ZRmjqHDQw6zJUIuOlT2sE5AIrIci4qAiSIdq+Scz6aheMOF+Cl
	v9LdPMZLtoW4NWuBdjXRyQZBn18WVKQ5syan8I2d9X5M3Rxa74WFykSMjEPaQODF+F3F
	LKqAEBFaMsx9dWrccbD+vw50HbZzByTOMwuBjaWfYdVClEATsts/EeV2+swmHCa9BmPy
	UvdyIQITZUgN7TPgoXgbxQG9UKHmv7t0jkx/asy6itD5rASauu7zSNbPE2qQd7VsvoXX
	QuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZZcRKjvtYbPItMo7ZrrT7m80BrA2CtFN6FbCL7iT2i0=;
	b=OfDhYOj309LmkcUmOL9wk70wjbQ0Zq3coa6ezVIhVzRzk3M1gkART6KKvwU+yHEYAK
	p1qMndjbEbk2zKuFARBqVcbRlkql4gtf037fZUxjQMEkeoEy5aKyc79pc388I7auKQuO
	kJqZjplCyac8Ti0V2xRREm2yAeJWUqLyiQcx7PEaQWYCE4CREmNkJlcC1qiMjgDp13mG
	enDMJ2Y9yXhCdysHPip6xu4PM7HtgA2EW/VzcULUdxFZFAZ3zBLyoLdPYjlKMHpqFtda
	rDq9ehN3HeUyTnw752P7deW1T0gZNh6XkxQse1vj7pu5igHTkJ/NekRxHfezCsb8AuP6
	1Aog==
X-Gm-Message-State: AHPjjUj9xNu4LcPFaR7qRBLh3smiU8pPOgyaseR4iDz8ITnl4S1H/Fw/
	rrmOx5J89Me0euscYjK8vScm45AWzK4A/+TFFSE=
X-Google-Smtp-Source: ADKCNb5dZj5mHXVnpz9EHvs7QMCUb+YfpANDLEzYxETflBv5BnA31KmefJw2Ljo0L1ilE32l5acMmVdXtbbx5/ECx/Q=
X-Received: by 10.101.67.200 with SMTP id n8mr13301886pgp.317.1505171078439;
	Mon, 11 Sep 2017 16:04:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Mon, 11 Sep 2017 16:04:07 -0700 (PDT)
In-Reply-To: <20170911170533.24155-1-Martin.Jansa@gmail.com>
References: <20170911170533.24155-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Sep 2017 16:04:07 -0700
Message-ID: <CAMKF1spkQaLZpUT6P_gapHReWjQCKJ1enoMnMr0d3fu-y-JOyQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-locale: add runtime dependency on glibc
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
X-List-Received-Date: Mon, 11 Sep 2017 23:04:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 10:05 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * the libc.so.6 dependency is detected always:
>   $ grep FILERDEPENDS BUILD-*/pkgdata/qemux86/runtime/localedef
>   BUILD-bad/pkgdata/qemux86/runtime/localedef:FILERDEPENDSFLIST_localedef: /usr/bin/localedef
>   BUILD-bad/pkgdata/qemux86/runtime/localedef:FILERDEPENDS_/usr/bin/localedef_localedef: libc.so.6(GLIBC_2.15) libc.so.6(GLIBC_2.3) libc.so.6(GLIBC_2.2) libc.so.6(GLIBC_2.1) libc.so.6(GLIBC_2.0) libc.so.6
>   BUILD-ok/pkgdata/qemux86/runtime/localedef:FILERDEPENDSFLIST_localedef: /usr/bin/localedef
>   BUILD-ok/pkgdata/qemux86/runtime/localedef:FILERDEPENDS_/usr/bin/localedef_localedef: libc.so.6(GLIBC_2.15) libc.so.6(GLIBC_2.3) libc.so.6(GLIBC_2.2) libc.so.6(GLIBC_2.1) libc.so.6(GLIBC_2.0) libc.so.6
>
> * but in some builds the glibc dependency isn't built soon enough:
>   $ diff -uNr BUILD-*/pkgdata/qemux86/runtime/localedef
>   --- BUILD-bad/pkgdata/qemux86/runtime/localedef 2017-09-02 21:17:50.000000000 +0000
>   +++ BUILD-ok/pkgdata/qemux86/runtime/localedef  2017-09-11 10:15:49.954381592 +0000
>   @@ -6,6 +6,7 @@
>    LICENSE: GPLv2 & LGPLv2.1
>    DESCRIPTION_localedef: glibc: compile locale definition files
>    SUMMARY: Locale data from glibc
>   +RDEPENDS_localedef: glibc (>= 2.26)
>    SECTION: base
>    PKG_localedef: localedef
>    FILES_localedef: /usr/bin/localedef
>   and the build fails with QA issues:
>   http://errors.yoctoproject.org/Errors/Details/155529/
>
>   ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.0), but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.15), but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.3), but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.2), but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.1), but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6, but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: QA run found fatal errors. Please consider fixing them.
>
> * easily reproducible with empty TMPDIR and:
>   bitbake -c cleansstate glibc-locale && bitbake -c package_qa glibc-locale
>
> * reproducible with Yocto 2.2 Morty as well, with slightly different
>   error message:
>   ERROR: glibc-locale-2.24-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.4), but no providers found in RDEPENDS_localedef? [file-rdeps]
>
> * with Yocto 2.3 Pyro it's not reproducible by default, because rpmdeps
>   aren't enabled to populate FILERDEPENDS, but once you add:
>   ENABLE_RPM_FILEDEPS_FOR_PYRO = "1"
>   similar QA issue is shown as well:
>   ERROR: glibc-locale-2.25-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.15), but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: glibc-locale-2.25-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6(GLIBC_2.4), but no providers found in RDEPENDS_localedef? [file-rdeps]
>   ERROR: glibc-locale-2.25-r0 do_package_qa: QA Issue: /usr/bin/localedef contained in package localedef requires libc.so.6, but no providers found in RDEPENDS_localedef? [file-rdeps]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> index 70e2b3a16b..75ababea68 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -12,6 +12,10 @@ BINUTILSDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
>  BINUTILSDEP_class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
>  do_package[depends] += "${BINUTILSDEP}"
>
> +# localedef links with libc.so and glibc-collateral.incinhibits all default deps
> +# cannot add virtual/libc to DEPENDS, because it would conflict with libc-initial in RSS
> +RDEPENDS_localedef += "glibc"
> +

looks good to me.

