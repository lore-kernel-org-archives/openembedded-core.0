Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4006E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 06:04:44 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id u110so5517676qge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9AwExYGcWJbCL1AdrzdMvT9bIcgiG9KULcDItvq2mCY=;
	b=KvgBNZFlvjTJwtq7PE4JG0nIBDEO8QiXchJFS0AgKodxaBKcW++o7IL4Tmfu/Ecppd
	rYcquDNbrRI4NSqONJ68tFpSGATE93oCdk0XA2w5c8YF+6VXHpWlI7hBgGrKgGVnrXfv
	Zk8ftA4t1mK3Fam4hiHr4ay1o8Qvtm4NDgIwjNS3tcaiF/EHH7nOOo6VAvxdtj3t/nzN
	SJk6gmZ0xM7ChUWh1NL7yXstEs/mUc49ZoEQhN8J5PEuWGvGZmcSa70MKJ4j1EQfQqNC
	5UCFGodQvlQo3SqOpXprlcoaspvk+Ur/2NrRrJf9dBXUqIOuLoApdA7VXPUZ2CXSMkIm
	58yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9AwExYGcWJbCL1AdrzdMvT9bIcgiG9KULcDItvq2mCY=;
	b=PMHe5/0wWkQK2CuQQH8a8kz6k6CHMU3eKJqN/RTWEym4nKWA1+FxLJG2MYgEUwwxsB
	ksikz8RK3lzjjiq7AMDUpBnsBaVB3OllQb6hkm8Nk05JjT/TekNPcrsX7pQQ8txgkf6q
	K67kXsMmNFW/zM14r2aPfTGzo5U0nRbBEzV9ufM/V0hxVjNuaDRI3xJL3dVmqDRIL2uI
	4k++EF4diyKLTBBOt0hSqWeBWWMbeDTxjgHHOoUjc43VVdcbYVZMYAHchBOvtxrXjMYi
	rUD72Y1bbD39Ak/DJhHE32jeyQCz0H3aL96Bs7+CC1fEyYTM7nsNcEhcHALpP54vVCs7
	j9Pw==
X-Gm-Message-State: AD7BkJI6VXthH5YZWMuSjpEMsD1zEbLG/crc5+MiGzCz/C7MgsjQZ99XJu211WvgJ4kcp6rzLMYdd/mRJVyRGQ==
X-Received: by 10.141.4.135 with SMTP id g129mr26124407qhd.31.1456812285444;
	Mon, 29 Feb 2016 22:04:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 29 Feb 2016 22:04:16 -0800 (PST)
In-Reply-To: <e038722afdf9882154e43aaf8c814b708e0842ec.1456805735.git.mark.hatle@windriver.com>
References: <cover.1456805735.git.mark.hatle@windriver.com>
	<e038722afdf9882154e43aaf8c814b708e0842ec.1456805735.git.mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Feb 2016 22:04:16 -0800
Message-ID: <CAMKF1sp-37H1OfKMCvMN6aT5rAJq6n+NK+oHtMBUSVO-xkWdhQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc: Add support for atomic opertions (libitm) where available
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
X-List-Received-Date: Tue, 01 Mar 2016 06:04:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 29, 2016 at 8:18 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> GCC 4.7 and newer have supported various automic operation directives,
> however these have not been previously enabled.
>

this is ok


> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-5.3.inc     |  2 ++
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 22 +++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
> index 0667299..0bf9f55 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -103,6 +103,7 @@ LTO = "--enable-lto"
>  EXTRA_OECONF_BASE = "\
>      ${LTO} \
>      --enable-libssp \
> +    --enable-libitm \
>      --disable-bootstrap \
>      --disable-libmudflap \
>      --with-system-zlib \
> @@ -118,6 +119,7 @@ EXTRA_OECONF_BASE = "\
>  EXTRA_OECONF_INITIAL = "\
>      --disable-libmudflap \
>      --disable-libgomp \
> +    --disable-libitm \
>      --disable-libquadmath \
>      --with-system-zlib \
>      --disable-lto \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 844149f..707db37 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -10,9 +10,14 @@ EXTRA_OECONF_PATHS = "\
>
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic \
> +RUNTIMELIBITM = "libitm"
> +RUNTIMELIBITM_mips = ""
> +RUNTIMELIBITM_mips64 = ""
> +
> +RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
>  "
> +
>  #  ?
>  # libiberty
>  # libmudflap
> @@ -49,6 +54,7 @@ do_install () {
>                 oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
>         done
>         rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
> +       rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
>         rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
>         if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
>                 rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
> @@ -94,6 +100,9 @@ PACKAGES = "\
>      libatomic \
>      libatomic-dev \
>      libatomic-staticdev \
> +    libitm \
> +    libitm-dev \
> +    libitm-staticdev \
>  "
>
>  # Most libraries are licensed with the exception, but
> @@ -121,6 +130,9 @@ LICENSE_libquadmath-staticdev = "GPL-3.0-with-GCC-exception"
>  LICENSE_libatomic = "GPL-3.0-with-GCC-exception"
>  LICENSE_libatomic-dev = "GPL-3.0-with-GCC-exception"
>  LICENSE_libatomic-staticdev = "GPL-3.0-with-GCC-exception"
> +LICENSE_libitm = "GPL-3.0-with-GCC-exception"
> +LICENSE_libitm-dev = "GPL-3.0-with-GCC-exception"
> +LICENSE_libitm-staticdev = "GPL-3.0-with-GCC-exception"
>
>  LICENSE_libgomp = "GPLv3"
>  LICENSE_libgomp-dev = "GPLv3"
> @@ -196,6 +208,14 @@ FILES_libatomic-dev = "\
>  "
>  FILES_libatomic-staticdev = "${libdir}/libatomic.a"
>
> +FILES_libitm = "${libdir}/libitm.so.*"
> +FILES_libitm-dev = "\
> +    ${libdir}/libitm.so \
> +    ${libdir}/libitm.la \
> +    ${libdir}/libitm.spec \
> +"
> +FILES_libitm-staticdev = "${libdir}/libitm.a"
> +
>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

