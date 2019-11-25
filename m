Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 046227FCBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:27:32 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a137so12545703qkc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0srq3BEi+pbSJA5v4vOj09Tu9zsMJfNVvndEY94Dd2Q=;
	b=ADIxRUFUHcEHf2tv7IWA5OtN9K/Qg8uX7b/vvVV9SnNvL3noxyd+xJB/gXiTYQq0HF
	kyIp1nz4z00/bwVThZ6naYh9E3lRwK//ABbFAB54ThueY61KJFhyKDRw7KuxP32XU7m0
	ni6eWZ4VE/Cn5W9acblylyH1KHmm4GJIK2zNWhExx95nRGnJvBP6mLyQlr6yx1jORFjL
	emMgabBcT51dZOeRDbLVLbZ0ioWF9xtv06cXPwk3JSUpUpuTjHeJa8OWzfngXmggZkac
	UZf0KCdyzvVzzsJJ7krxY4NLdwaoZqWJ7twpYh116Eaj+rDyDd/vxKisVCJ+NJB28P09
	tqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0srq3BEi+pbSJA5v4vOj09Tu9zsMJfNVvndEY94Dd2Q=;
	b=Ho8GZPSzDmcKbf39O18hN8jAaORkECbhFFz0qqrnJows3cYxXnQ9f8+aurSNpRgikX
	OHV66vvRre6niCtPkoBlaK8y1/yiNJJOOM51Ky2z2bHRSOFrexZuJSc36SsOklIrvmtu
	CX7ky6EVSGieXXc6rEd7aDNJuIhHkEJmu8Jm4KChFIo1U7Pn1K8egVDySsnrhLlp+5VX
	SpnVy3Fnlh8NMxZKb1CobBFt7loTmc26vIC2VLz2+A9iNZ3bvRVCPQdEWp+MfUjAcxLi
	xWV6utz8gKp1hdOYmHoZn/R3jizLG/cdD5IjqZGTJzlq1P5N3UnDlJMQQcib290N4Qfo
	hqXQ==
X-Gm-Message-State: APjAAAUxI5Tlm8dTOMQVJnbKDwqd0DcmOVXD++hgsIfgD1cv3Od3L3XV
	LJI/KjCRxNRo6MaOEfZb79kKUutxighpWC6o7l0=
X-Google-Smtp-Source: APXvYqyXkGNIhW2OnGqQL0Qy37OvO3w0NecnX/ZjQ46VGnsFCrcGypgCmmMfoyTvSVt+2RxKkAxdzCHwnEEL2GlBBrw=
X-Received: by 2002:a37:8805:: with SMTP id k5mr20418369qkd.212.1574720853450; 
	Mon, 25 Nov 2019 14:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20191125221357.6560-1-kergoth@gmail.com>
	<20191125221357.6560-3-kergoth@gmail.com>
In-Reply-To: <20191125221357.6560-3-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2019 14:27:07 -0800
Message-ID: <CAMKF1sos77k28JEJYBf_ox3s-dOJL_-ohHJuyQ15kv=xxP6S4A@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libcap-ng: fix built failure with some external toolchains due to missing pthread
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
X-List-Received-Date: Mon, 25 Nov 2019 22:27:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 25, 2019 at 2:13 PM Christopher Larson <kergoth@gmail.com> wrote:
>
> From: Christopher Larson <chris_larson@mentor.com>
>
> The libcap-ng build doesn't pass -pthread and can fail to link.
>

perhaps, adding a configure time check for pthread.h would be possible

AC_CHECK_HEADERS(pthread.h, [], [AC_MSG_WARN(pthread.h not found,
pthread_atfork disabled.)])

then include pthread.h inside conditional like below in source files.

#ifdef HAVE_PTHREAD_H
#endif



> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-support/libcap-ng/libcap-ng.inc       |  1 +
>  .../libcap-ng/revert-pthread_atfork-fix.patch      | 56 ++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch
>
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
> index aec83896e4..46d37e6807 100644
> --- a/meta/recipes-support/libcap-ng/libcap-ng.inc
> +++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>
>  SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
>             file://python.patch \
> +           file://revert-pthread_atfork-fix.patch \
>  "
>
>  SRC_URI[md5sum] = "57dc267e2949cdecb651a929f9206572"
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch
> new file mode 100644
> index 0000000000..d3f7790b1e
> --- /dev/null
> +++ b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread_atfork-fix.patch
> @@ -0,0 +1,56 @@
> +From 81dc82393fae9851397fa5d94094434aa1d5c3d1 Mon Sep 17 00:00:00 2001
> +From: Christopher Larson <chris_larson@mentor.com>
> +Date: Thu, 14 Nov 2019 21:13:24 +0500
> +Subject: [PATCH] Revert "Fix usage of pthread_atfork a whole different way"
> +
> +This reverts commit 08a09cba90f3d960c080a20833fb8c0908f1cea6.
> +
> +The fix was breaking builds with some toolchains.
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +---
> + src/Makefile.am |  2 +-
> + src/cap-ng.c    | 12 +++++++++++-
> + 2 files changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 5a66d4e..d46d02b 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -34,5 +34,5 @@ noinst_HEADERS = captab.h
> + libcap_ng_la_SOURCES = cap-ng.c lookup_table.c
> + libcap_ng_la_LIBADD =
> + libcap_ng_la_DEPENDENCIES = $(libcap_ng_la_SOURCES) ../config.h
> +-libcap_ng_la_LDFLAGS = -Wl,-z,relro
> ++libcap_ng_la_LDFLAGS = -Wl,-z,relro -Wl,-z,nodelete
> +
> +diff --git a/src/cap-ng.c b/src/cap-ng.c
> +index 35fcd7a..ed31afa 100644
> +--- a/src/cap-ng.c
> ++++ b/src/cap-ng.c
> +@@ -155,6 +155,15 @@ static __thread struct cap_ng m = { 1,
> +                                       CAPNG_NEW,
> +                                       {0, 0} };
> +
> ++
> ++/*
> ++ * The pthread_atfork function is being made weak so that we can use it
> ++ * if the program is linked with pthreads and not requiring it for
> ++ * everything that uses libcap-ng.
> ++ */
> ++extern int __attribute__((weak)) pthread_atfork(void (*prepare)(void),
> ++      void (*parent)(void), void (*child)(void));
> ++
> + /*
> +  * Reset the state so that init gets called to erase everything
> +  */
> +@@ -166,7 +175,8 @@ static void deinit(void)
> + static void init_lib(void) __attribute__ ((constructor));
> + static void init_lib(void)
> + {
> +-      pthread_atfork(NULL, NULL, deinit);
> ++      if (pthread_atfork)
> ++              pthread_atfork(NULL, NULL, deinit);
> + }
> +
> + static void init(void)
> --
> 2.11.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

