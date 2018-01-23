Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id CC97A785D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 01:37:43 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id p36so9315450otd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 17:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=JTvbuAlz0PqpWfjzO3lUVJXVtoE4AoJJooj0OKI+oGM=;
	b=mkiF5svgbVPomkQJEhprUX88MBAtPY8Tc/a51RYri8HonHaZcclMZ5N8rwLRsHLpqG
	miEmdO8mbShrnY5/QuRrjTi34hrgb+7E4MHUEd+PSSx5/fsv2+2I7neeDPH4myxiNA26
	law2Z1imFcJN8qrXdaf1Laz1tBVwIaH2mrg/7uYFv282jQpFVlKNUxWx5mMYjNtFY/F7
	WwYbpOGQ5dysPibMCw+3wXLT0yUnAnm4JfsUhyUPkIpf0QqUPLDv7tJegPNr7V2N0XuU
	4DZCxoueaXD2uOtNW3o72BUtM1KPOa1rYo3x2oSqqbrdxfPnCTeEv8y1HnV2/jMCAnAk
	ZE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=JTvbuAlz0PqpWfjzO3lUVJXVtoE4AoJJooj0OKI+oGM=;
	b=A6chvmHJ8vyueptEXgmUEWAr/QUZAMVzh3JMrzJXS9BoQuCHwrkSnTPyzvWbBaNRUA
	5z7p2tcqEty64YMexxaA28lDCB8nsmsAu4FFkBmwAg7+smCwPoyEs00m/L9QK5VJj/C2
	wlyC83PjYNRF8rIaHpwp/eYWpWIbMdttZm7qyTvXAYvlMKn1PmIkbraWyEvGHaeKHPhB
	7miIox+orb9nAZgRJtoftZhzq7NgGFR4pSQSVERc2aqO8csHSZ9ZB7iXt9xqogyi1VYG
	83pVlgw3xuHP2fPw9C12FuQn4FJvLsgs4u4256Oqu+GVzwxWrhQC55XcKTYUfjr8HckU
	WwMA==
X-Gm-Message-State: AKwxytfcZGLve0OEl291EbgEcgmWCdlTVaJPolT2THCQr8afQAVlGbOc
	Jz1aOwPC5MPB5DEYDOJuY9UeL+7q
X-Google-Smtp-Source: AH8x225l1hguGySeRUgRhU3FLYB/DNHb3cI40w3q4hYqBzHXgzaVUW92s/0Iva1qo7C7TSsNnv/+Cg==
X-Received: by 10.157.50.132 with SMTP id u4mr6279569otb.1.1516671464181;
	Mon, 22 Jan 2018 17:37:44 -0800 (PST)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com.
	[74.125.82.180])
	by smtp.gmail.com with ESMTPSA id b9sm704771oii.21.2018.01.22.17.37.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 17:37:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f180.google.com with SMTP id d9so9307985oth.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 17:37:42 -0800 (PST)
X-Received: by 10.157.7.164 with SMTP id 33mr5425499oto.276.1516671462318;
	Mon, 22 Jan 2018 17:37:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.16.35 with HTTP; Mon, 22 Jan 2018 17:37:39 -0800 (PST)
In-Reply-To: <20180122165656.53234-1-Randy.MacLeod@windriver.com>
References: <20180122165656.53234-1-Randy.MacLeod@windriver.com>
Date: Mon, 22 Jan 2018 23:37:39 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqPg-+GWKDwMDV7H7Db9XtKfXRyk2GUnZsyKnbOmkGYhQ@mail.gmail.com>
Message-ID: <CAP9ODKqPg-+GWKDwMDV7H7Db9XtKfXRyk2GUnZsyKnbOmkGYhQ@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: link mesautil with pthreads
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
X-List-Received-Date: Tue, 23 Jan 2018 01:37:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 22, 2018 at 2:56 PM, Randy MacLeod
<Randy.MacLeod@windriver.com> wrote:
> Cherry-pick fix from mesa upstream:
>    23ce168048 link mesautil with pthreads
>
> link mesautil with pthreads to avoid:
>
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_setname':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66: undefined reference to `pthread_setname_np'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_join':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336: undefined reference to `pthread_join'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48: undefined reference to `pthread_sigmask'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_create':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296: undefined reference to `pthread_create'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `call_once':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96: undefined reference to `pthread_once'
> ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_get_time_nano':
> /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84: undefined reference to `pthread_getcpuclockid'
> collect2: error: ld returned 1 exit status
>
> Upstream-Status: backport

This goes in the patch file.

> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../files/0001-link-mesautil-with-pthreads.patch   | 51 ++++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa_17.3.3.bb          |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
> new file mode 100644
> index 0000000000..193c54661b
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
> @@ -0,0 +1,51 @@
> +From 23ce168048698eeea3df6bb8c9de5be3ca4784cd Mon Sep 17 00:00:00 2001
> +From: Igor Gnatenko <ignatenko@redhat.com>
> +Date: Mon, 1 Jan 2018 22:49:00 +0100
> +Subject: [PATCH] link mesautil with pthreads
> +
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_setname':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66: undefined reference to `pthread_setname_np'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_join':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336: undefined reference to `pthread_join'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48: undefined reference to `pthread_sigmask'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_create':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296: undefined reference to `pthread_create'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `call_once':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96: undefined reference to `pthread_once'
> +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_get_time_nano':
> +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84: undefined reference to `pthread_getcpuclockid'
> +collect2: error: ld returned 1 exit status
> +
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +Signed-off-by: Igor Gnatenko <ignatenko@redhat.com>
> +---
> + src/util/Makefile.am | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/util/Makefile.am b/src/util/Makefile.am
> +index a5241ad27b..633907b9fd 100644
> +--- a/src/util/Makefile.am
> ++++ b/src/util/Makefile.am
> +@@ -31,6 +31,7 @@ noinst_LTLIBRARIES = \
> +       libxmlconfig.la
> +
> + AM_CPPFLAGS = \
> ++      $(PTHREAD_CFLAGS) \
> +       -I$(top_srcdir)/include
> +
> + libmesautil_la_CPPFLAGS = \
> +@@ -50,6 +51,7 @@ libmesautil_la_SOURCES = \
> +       $(MESA_UTIL_GENERATED_FILES)
> +
> + libmesautil_la_LIBADD = \
> ++      $(PTHREAD_LIBS) \
> +       $(CLOCK_LIB) \
> +       $(ZLIB_LIBS) \
> +       $(LIBATOMIC_LIBS)
> +--
> +2.14.3
> +
> diff --git a/meta/recipes-graphics/mesa/mesa_17.3.3.bb b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> index 6e3f29a2c4..623046e116 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
> @@ -10,6 +10,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-winsys-svga-drm-Include-sys-types.h.patch \
>             file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
>             file://0001-anv_icd.py-improve-reproducible-builds.patch \
> +           file://0001-link-mesautil-with-pthreads.patch \
>             "
>
>  SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

