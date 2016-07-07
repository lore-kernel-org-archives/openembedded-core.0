Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 82DD16FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 00:37:55 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n132so337446qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 17:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=78rQaTCeBzpc4YjM5p3cCgNhXHZhzCloF9dhC80ifjM=;
	b=OQmZz7M4Dp9E8aGGLOWnXxLKTTGIDbQm2OBk+qSw4mwUGrtBgXyY+0cxFNl2cDvBl3
	6Ad/z0+NvjA6LMMiVFwzQReUPIfyddX+RaCq8FpJBp+n1H4uk9nicVuSfqvC9Wzb9WLX
	04k/pH++pubKU+7XecPQiAyYzfMzaLONM2J62W8FsRqZtDsswqabljoMyFskNHe4c1IF
	V0NPEQa7Dw7w1GcpbPPc5iek3dHmNsDsqOSjB9I8jIlxMo2xxwcdIBxDTk6ENIzq5I2k
	WjDqcXqspRDChBDY+gOEdYWXwrWicGdvq8gPRaBA1JIv/2+rfIu/0EHOPaC8p3ooEq1J
	rE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=78rQaTCeBzpc4YjM5p3cCgNhXHZhzCloF9dhC80ifjM=;
	b=PuxplTerkfC+Gk8TNJ4JOWKLgUEk6KtlwuuESn9z8G3OHYGECShFsEGZBNWzojceKm
	okM0m7Ul+XOxFRSA7KsBZ8Us3s2Va5E0NFSZ0PCa6ydnimHzqEes7vGDek76W9nzcl5t
	DE990fuqlQcAITRk9ugRfzQgnMUXYcd2lUlif6MEekUovZpVlx1SWMY8yChU1F7iz9A9
	cfPaVUpFnNrOsqrT1hT0hunDD0BCY+FoCx0mvTq51pZrLc8dmVZF1q73YweWikXjDhD+
	yBjeUyMy3s5xx9VGhdgChinWeoS7ej6lw34DKPd3l8fuQgpnwSXueQObOeWhYe0aEf9g
	Hy9w==
X-Gm-Message-State: ALyK8tIE0+iCM9cYatr5Im9q4fzq7g4uS2VN4uv4J/Wkn8UsJAE7cb6ek496EZQ8b6Z/vkyLVoNj3VjfGaP63w==
X-Received: by 10.55.39.142 with SMTP id n136mr35551523qkn.149.1467851875647; 
	Wed, 06 Jul 2016 17:37:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 17:37:26 -0700 (PDT)
In-Reply-To: <094b6e045fc95f2698ac32d19b4f639f9539b6d3.1467848566.git.paul.eggleton@linux.intel.com>
References: <cover.1467848566.git.paul.eggleton@linux.intel.com>
	<094b6e045fc95f2698ac32d19b4f639f9539b6d3.1467848566.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 17:37:26 -0700
Message-ID: <CAMKF1sp-2w6FCAVW6tPhrrMQZL0c5EMSOLAuoqWp0-fpcvcF8Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] gcc-runtime: add SUMMARY values
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
X-List-Received-Date: Thu, 07 Jul 2016 00:37:55 -0000
Content-Type: text/plain; charset=UTF-8

looks ok now

On Wed, Jul 6, 2016 at 4:48 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> It's useful to know what the various libraries are that get produced by
> gcc-runtime, as well as to have a specific SUMMARY for the recipe.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 99f50f8..526be55 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -1,5 +1,7 @@
>  require gcc-configure-common.inc
>
> +SUMMARY = "Runtime libraries from GCC"
> +
>  # Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
>  # All gcc-runtime packages are now covered by the runtime exception.
>  LICENSE = "GPL-3.0-with-GCC-exception"
> @@ -135,73 +137,98 @@ FILES_${PN}-dbg += "\
>  "
>
>  FILES_libg2c = "${target_libdir}/libg2c.so.*"
> +SUMMARY_libg2c = "Companion runtime library for g77"
>  FILES_libg2c-dev = "\
>      ${libdir}/libg2c.so \
>      ${libdir}/libg2c.a \
>      ${libdir}/libfrtbegin.a \
>  "
> +SUMMARY_libg2c-dev = "Companion runtime library for g77 - development files"
>
>  FILES_libstdc++ = "${libdir}/libstdc++.so.*"
> +SUMMARY_libstdc++ = "GNU standard C++ library"
>  FILES_libstdc++-dev = "\
>      ${includedir}/c++/ \
>      ${libdir}/libstdc++.so \
>      ${libdir}/libstdc++*.la \
>      ${libdir}/libsupc++.la \
>  "
> +SUMMARY_libstdc++-dev = "GNU standard C++ library - development files"
>  FILES_libstdc++-staticdev = "\
>      ${libdir}/libstdc++*.a \
>      ${libdir}/libsupc++.a \
>  "
> +SUMMARY_libstdc++-staticdev = "GNU standard C++ library - static development files"
>
>  FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
> +SUMMARY_libstdc++-precompile-dev = "GNU standard C++ library - precompiled header files"
>
>  FILES_libssp = "${libdir}/libssp.so.*"
> +SUMMARY_libssp = "GNU stack smashing protection library"
>  FILES_libssp-dev = "\
>      ${libdir}/libssp*.so \
>      ${libdir}/libssp*_nonshared.a \
>      ${libdir}/libssp*.la \
>      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
>  "
> +SUMMARY_libssp-dev = "GNU stack smashing protection library - development files"
>  FILES_libssp-staticdev = "${libdir}/libssp*.a"
> +SUMMARY_libssp-staticdev = "GNU stack smashing protection library - static development files"
>
>  FILES_libquadmath = "${libdir}/libquadmath*.so.*"
> +SUMMARY_libquadmath = "GNU quad-precision math library"
>  FILES_libquadmath-dev = "\
>      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
>      ${libdir}/libquadmath*.so \
>      ${libdir}/libquadmath.la \
>  "
> +SUMMARY_libquadmath-dev = "GNU quad-precision math library - development files"
>  FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
> +SUMMARY_libquadmath-staticdev = "GNU quad-precision math library - static development files"
>
> +# NOTE: mudflap has been removed as of gcc 4.9 and has been superseded by the address sanitiser
>  FILES_libmudflap = "${libdir}/libmudflap*.so.*"
> +SUMMARY_libmudflap = "Pointer debugging library for gcc"
>  FILES_libmudflap-dev = "\
>      ${libdir}/libmudflap*.so \
>      ${libdir}/libmudflap.la \
>  "
> +SUMMARY_libmudflap-dev = "Pointer debugging library for gcc - development files"
>  FILES_libmudflap-staticdev = "${libdir}/libmudflap.a"
> +SUMMARY_libmudflap-staticdev = "Pointer debugging library for gcc - static development files"
>
>  FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
> +SUMMARY_libgomp = "GNU OpenMP parallel programming library"
>  FILES_libgomp-dev = "\
>      ${libdir}/libgomp*${SOLIBSDEV} \
>      ${libdir}/libgomp*.la \
>      ${libdir}/libgomp.spec \
>      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
>  "
> +SUMMARY_libgomp-dev = "GNU OpenMP parallel programming library - development files"
>  FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
> +SUMMARY_libgomp-staticdev = "GNU OpenMP parallel programming library - static development files"
>
>  FILES_libatomic = "${libdir}/libatomic.so.*"
> +SUMMARY_libatomic = "GNU C++11 atomics support library"
>  FILES_libatomic-dev = "\
>      ${libdir}/libatomic.so \
>      ${libdir}/libatomic.la \
>  "
> +SUMMARY_libatomic-dev = "GNU C++11 atomics support library - development files"
>  FILES_libatomic-staticdev = "${libdir}/libatomic.a"
> +SUMMARY_libatomic-staticdev = "GNU C++11 atomics support library - static development files"
>
>  FILES_libitm = "${libdir}/libitm.so.*"
> +SUMMARY_libitm = "GNU transactional memory support library"
>  FILES_libitm-dev = "\
>      ${libdir}/libitm.so \
>      ${libdir}/libitm.la \
>      ${libdir}/libitm.spec \
>  "
> +SUMMARY_libitm-dev = "GNU transactional memory support library - development files"
>  FILES_libitm-staticdev = "${libdir}/libitm.a"
> +SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
>
>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

