Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE137CEC0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:23:40 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id e24so15194708itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 05:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cnu8YzhY9gUmVbJumanxEpdG/miypfb6thNlMwGUXMY=;
	b=sCTtilRvMb94x0pRAGcjc8Qxl5OhHy/KGYh3sHX31yS1Uq/6ZNcvkinL8AdyRH+3Ov
	fjDRWjh9hnWnQezHnO4t3laWcanECOzt9uZ1/Dgp3XvJJeB7oWiClFxNUrCtXC/klh6e
	akZNAZOBbw0jCs/JHAwlGH3A+1XYPorrUiCIdYcp6ChD6e6XMgz+UPeGGJefySHIQAIx
	0J6a49w0vUWZ4yeDbNlPfqFxnLUltWQvSIaeozIoDGT8ObgCnJdfFOkXHE+OMW89mLBF
	74wftIhVpxCDdVh0GCKZB8AnJQ1etAVnsRGfkBhwbRqw1hlviZKMqJUETSjdOLtkJR6E
	wEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cnu8YzhY9gUmVbJumanxEpdG/miypfb6thNlMwGUXMY=;
	b=Vm+Q/Uot7LXOlCqOXvD6mAbymNIkd95QWqJxB+qFBrbiYmXoBtYFIHFNTJLxpt+QtT
	4MGwp/dkKV3S+zOI/3sq3Sav9JqL0CgFnW3OOH326MHabLFvoKeN1ekfn7VUtqcu8weU
	p/I83qvAmVQiyiXnykFSnJG+Tr+6btMUqz/JyRLdJAgopvUadS9PaPCKlbq+O1WOTaKU
	oLp6KJ7WjNNI1tGpZwmomZpWaVws96fZ7crOhU4BQydckPye7CuqN9MUtOw8tiqmu3g9
	yMoPEfo8VFEsKWP5UIr0+gc9/tb1BdHuHjRu7y4VjWCjmBJ8VcVNRsUvZAqyKaAwo54j
	wmKw==
X-Gm-Message-State: APjAAAWZVk7QkuQucAcRgp3GWMkydWJycfYkW2SFpAf8glfLM7njrQ/3
	uNNN2KjWAS8i16rY9c8QWDOvokAlKy+3ZXNGzFP+te2b
X-Google-Smtp-Source: APXvYqxSdIAjtZ7LVMSDP0r8w/6JRrF0M5FhQO969QBUS8v9r0u+ol20JJo0QkqQ7hK2dyT99NClmN5pXKuUJEVuZLE=
X-Received: by 2002:a02:240d:: with SMTP id f13mr7833243jaa.105.1551965021395; 
	Thu, 07 Mar 2019 05:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20190307131832.27205-1-max+openembedded@blarg.de>
In-Reply-To: <20190307131832.27205-1-max+openembedded@blarg.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 13:23:30 +0000
Message-ID: <CAJTo0LYAOqVjJhGwKqNz0j48QP1LEazdCzj432=pw-i+qpe=Ew@mail.gmail.com>
To: Max Kellermann <max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsndfile1: make sqlite and FLAC/Vorbis optional
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
X-List-Received-Date: Thu, 07 Mar 2019 13:23:40 -0000
Content-Type: text/plain; charset="UTF-8"

I just double-took at the sqlite dependency.  This is only used by a
testing tool that we don't build or install.

How about renaming the option to regtest and disabling by default?

Ross

On Thu, 7 Mar 2019 at 13:18, Max Kellermann <max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> index eb2c719d8d..7b5eb4f71c 100644
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Audio format Conversion library"
>  HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
>  AUTHOR = "Erik de Castro Lopo"
> -DEPENDS = "flac libogg libvorbis sqlite3"
> +DEPENDS = ""
>  SECTION = "libs/multimedia"
>  LICENSE = "LGPLv2.1"
>
> @@ -27,8 +27,10 @@ CVE_PRODUCT = "libsndfile"
>
>  S = "${WORKDIR}/libsndfile-${PV}"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} sqlite external-libs"
>  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
> +PACKAGECONFIG[external-libs] = "--enable-external-libs,--disable-external-libs,flac libogg libvorbis"
>
>  inherit autotools lib_package pkgconfig
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

