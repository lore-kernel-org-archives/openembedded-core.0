Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6607C783DE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 21:34:28 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id s3so5866800otc.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 13:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=jvUnZUmaXU9BfMH0MLYPDYbOvDWeDrV9VWRZd82kY/c=;
	b=xes73ldqLVFGbsoMs2MJ8T6oLwjsv9ADKmiRiHaTuC8tLXnimSX9+w5PUNm270E/+4
	ymBpbXePZZ83u9jnQQhG1lJQjQnkbE3xWDEYf6f5JESa5Y1M+xTkFfNYllJn5RQwV4RN
	Md3xZgMYv7865Mmzr2QKCXpd9ZDN0SSrzuDYcxiAAlNQxEvVSlKn5a2OZ1ZW5Io1Uj8F
	aqJbfyBy6moaGmxt+cJd2c+Yf3KFMAf68x4fVXZYcB9KlNZC7kw6lnaRRrUg2K6caWo7
	uAnO3Xx1bS7yIbOdmFZZZGAHnFTEbTwdkLSaa3HVQ4D1h6iRgarYlFUK5Hg/o8z2hQHn
	PMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=jvUnZUmaXU9BfMH0MLYPDYbOvDWeDrV9VWRZd82kY/c=;
	b=WgYcE7IqvjpjWkyyoBWDyIVQn7EFkbgjzDcTjQgJ0bM/+zivg4447m2/Rq68UhsczQ
	OQrbFULN5WtnXyCffYmgVgudQWMLVhsyZJM8GwwW5RKxiFEf9Jj+99/xHNBgLL4zuDxJ
	pUVNHTdbJPz1LJgedKZW4eExxjxRYoijv/eEfpb1bjDwdndPg3bI4d4WPdfJA+AOQOen
	f88sACHjrqe2rCWgwb33iEjPbe8ois6EELaCj+jV3kZnvjZvWjgTcz+nYlKc2MfMNIQt
	H/AkL2cUYIEcFXzUAJaggxDAzgSojzMamzksoKREL1mk+1O2pjIHBxXfGdcSwVVbOVZa
	zK5A==
X-Gm-Message-State: AKwxytdJ7BZwWt2s5GN3VEFXBuNXEv+mK8ujieKQxCWYz/sDcCdvWetT
	URWkh55RASm6NY+OrA7gNZwlkW+z
X-Google-Smtp-Source: AH8x224mWsqd28t63tOsE5OhgJcQUwMMLEC9XpD2gpB3nSOjyhheVdSQKE4/fmTa1GI+HZAFquxEQQ==
X-Received: by 10.157.55.246 with SMTP id x109mr2770278otb.266.1516570469149; 
	Sun, 21 Jan 2018 13:34:29 -0800 (PST)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com.
	[74.125.82.181])
	by smtp.gmail.com with ESMTPSA id v69sm330373oie.36.2018.01.21.13.34.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jan 2018 13:34:28 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f181.google.com with SMTP id v5so5876046oth.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 13:34:27 -0800 (PST)
X-Received: by 10.157.40.6 with SMTP id m6mr3499165otb.55.1516570467319; Sun,
	21 Jan 2018 13:34:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.92.130 with HTTP; Sun, 21 Jan 2018 13:34:26 -0800 (PST)
In-Reply-To: <20180121061857.29976-1-Randy.MacLeod@windriver.com>
References: <20180121061857.29976-1-Randy.MacLeod@windriver.com>
Date: Sun, 21 Jan 2018 19:34:26 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp_nHD+N_28qROJfsmWZh5AJes0iQQ0NBa0V8ABf0uaPQ@mail.gmail.com>
Message-ID: <CAP9ODKp_nHD+N_28qROJfsmWZh5AJes0iQQ0NBa0V8ABf0uaPQ@mail.gmail.com>
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
X-List-Received-Date: Sun, 21 Jan 2018 21:34:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 21, 2018 at 4:18 AM, Randy MacLeod
<Randy.MacLeod@windriver.com> wrote:
> Cherry-pick fix from mesa upstream:
>    23ce168048 link mesautil with pthreads
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

Missing Upstream-Status. Also, base it on 17.3.3 recipe so we avoid
another patch revision.

> ---
>  .../files/0001-link-mesautil-with-pthreads.patch   | 51 ++++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa_17.3.2.bb          |  1 +
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
> diff --git a/meta/recipes-graphics/mesa/mesa_17.3.2.bb b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> index 9e9b23322a..8cdcf6c84f 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
> @@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://llvm-config-version.patch \
>             file://0001-winsys-svga-drm-Include-sys-types.h.patch \
>             file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
> +           file://0001-link-mesautil-with-pthreads.patch \
>             "
>
>  SRC_URI[md5sum] = "5c59b779925f504ffd0f13c7dcd29ac6"
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

