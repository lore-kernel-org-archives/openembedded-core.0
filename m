Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A796E6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:04:22 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 82so2731719qko.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vmzcc2H29xLd2wk0rX0PGFpbSPXiQgmqE50+4uhoAt8=;
	b=kXpb5iniEKUjR8RJFS8gsl61yPp3rnreDvze5c6XN3rSKfNHpHsV/ZAZu6nHrSgAFD
	IB/7I1diqtM4jNw5rMhk/GybVh5QkISSspf5hP3bhf4KYhZCL/z94WXRPbNKRrNsYtlx
	RKeT01xx4Q9PMQoToxxKFSlImddcz3nwuDLvb1DTE5DKnoZBW5gIWud/aEMMcrOsiphX
	TZ5KnuNUNAZUEuWIbjqmYPcPyWPLv4L/eMZUPqVL3U8SSTQxScBYfsZ+6pKaf6kMc0Yw
	WkYYbMihH6CHMuFWj7KTSYeIxgYDDhiqBY1xif7g31q4z5Qt/y5sZr0XKM1BLJuqwpJt
	IpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vmzcc2H29xLd2wk0rX0PGFpbSPXiQgmqE50+4uhoAt8=;
	b=ArJi0tIRdimQ+RQHUzr563xP2uUJc1bos7usF7JCAB4f4xZ7FUKkkgUyW+wo48+pYX
	FNxHhd/Qmc272idWtj0bzv8A7i8uwjCSbGnjNINQ0gNQxvBzTOS/wHHYSsxpnPyUNmtk
	Kb/4kUXdy+XDf2xKrRKHwqJdNR3U7O0t++CujcwWqI/TP9hq2DS1klEI5Gauljp2IuRO
	Z33K1cbYqhUWXvHHDJUCkzSIDRfvOkDwlFf9TrTz3qeJD9SmlvSIWvCbVAouRV6w5bxN
	ZyYFMMXWUHoagbcNWwJY+swokqCaYQYnFXBzLwzFrKHqJZGw1hNGjricwxPQfatCrHBp
	HLrQ==
X-Gm-Message-State: ALyK8tL7a7gMGnVpgt8DHgneZEZJEwRcK3oQEg0e7/stFuY5N7s4GUcJ29DjubKqu9mWOPuU+cKJErCfhAKyRA==
X-Received: by 10.55.74.138 with SMTP id x132mr4303947qka.26.1467839062391;
	Wed, 06 Jul 2016 14:04:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 14:03:53 -0700 (PDT)
In-Reply-To: <9e9da3e1b8034b9c233471e6053c920aa6476bad.1467838464.git.paul.eggleton@linux.intel.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
	<9e9da3e1b8034b9c233471e6053c920aa6476bad.1467838464.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 14:03:53 -0700
Message-ID: <CAMKF1spDqBxSpQ_kumzEgUR1YeEKOka+5yNoKH=ZdJHOAaZ8ow@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-runtime: add SUMMARY values
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
X-List-Received-Date: Wed, 06 Jul 2016 21:04:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 1:55 PM, Paul Eggleton
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
> index 99f50f8..8e42a57 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -1,5 +1,7 @@
>  require gcc-configure-common.inc
>
> +SUMMARY = "Runtime libraries for GCC compilers"
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
> +SUMMARY_libstdc++ = "C++ standard library for g++"

Drop for g++ here, something like GNU Standard C++ Library is better
in general replace g++/gcc with GNU

>  FILES_libstdc++-dev = "\
>      ${includedir}/c++/ \
>      ${libdir}/libstdc++.so \
>      ${libdir}/libstdc++*.la \
>      ${libdir}/libsupc++.la \
>  "
> +SUMMARY_libstdc++-dev = "C++ standard library for g++ - development files"
>  FILES_libstdc++-staticdev = "\
>      ${libdir}/libstdc++*.a \
>      ${libdir}/libsupc++.a \
>  "
> +SUMMARY_libstdc++-staticdev = "C++ standard library for g++ - static development files"
>

same here Header files and libraries for C++ development

>  FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
> +SUMMARY_libstdc++-precompile-dev = "C++ standard library from gcc - precompiled header files"
>
>  FILES_libssp = "${libdir}/libssp.so.*"
> +SUMMARY_libssp = "Stack smashing protection library for gcc"

same here

>  FILES_libssp-dev = "\
>      ${libdir}/libssp*.so \
>      ${libdir}/libssp*_nonshared.a \
>      ${libdir}/libssp*.la \
>      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
>  "
> +SUMMARY_libssp-dev = "Stack smashing protection library for gcc - development files"
>  FILES_libssp-staticdev = "${libdir}/libssp*.a"
> +SUMMARY_libssp-staticdev = "Stack smashing protection library for gcc - static development files"
>
>  FILES_libquadmath = "${libdir}/libquadmath*.so.*"
> +SUMMARY_libquadmath = "Quad-precision math library for gcc"
>  FILES_libquadmath-dev = "\
>      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
>      ${libdir}/libquadmath*.so \
>      ${libdir}/libquadmath.la \
>  "
> +SUMMARY_libquadmath-dev = "Quad-precision math library for gcc - development files"
>  FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
> +SUMMARY_libquadmath-staticdev = "Quad-precision math library for gcc - static development files"
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
> +SUMMARY_libgomp = "GNU OpenMP parallel programming library for gcc"
>  FILES_libgomp-dev = "\
>      ${libdir}/libgomp*${SOLIBSDEV} \
>      ${libdir}/libgomp*.la \
>      ${libdir}/libgomp.spec \
>      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
>  "
> +SUMMARY_libgomp-dev = "GNU OpenMP parallel programming library for gcc - development files"
>  FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
> +SUMMARY_libgomp-staticdev = "GNU OpenMP parallel programming library for gcc - static development files"
>
>  FILES_libatomic = "${libdir}/libatomic.so.*"
> +SUMMARY_libatomic = "C++11 atomics support library for g++"
>  FILES_libatomic-dev = "\
>      ${libdir}/libatomic.so \
>      ${libdir}/libatomic.la \
>  "
> +SUMMARY_libatomic-dev = "C++11 atomics support library for g++ - development files"
>  FILES_libatomic-staticdev = "${libdir}/libatomic.a"
> +SUMMARY_libatomic-staticdev = "C++11 atomics support library for g++ - static development files"
>
>  FILES_libitm = "${libdir}/libitm.so.*"
> +SUMMARY_libitm = "Transactional memory support library for gcc"
>  FILES_libitm-dev = "\
>      ${libdir}/libitm.so \
>      ${libdir}/libitm.la \
>      ${libdir}/libitm.spec \
>  "
> +SUMMARY_libitm-dev = "Transactional memory support library for gcc - development files"
>  FILES_libitm-staticdev = "${libdir}/libitm.a"
> +SUMMARY_libitm-staticdev = "Transactional memory support library for gcc - static development files"
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

