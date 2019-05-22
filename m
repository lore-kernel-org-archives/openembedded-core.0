Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA567D9E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 02:04:35 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id a17so566983qth.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 19:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W1wfIiEbNPdkXAupX8neB52kdB1GxROHa8lCqdSVDq0=;
	b=dQ1GbLQ1GCKgkwUOe1F7i7vKyFqX/rF0S6jagPmhTBV0dO5rH+fYxdhwnoZP0pit/T
	OfPqHXA9so1FAZ3RqWrCknM3ZyGjePekkJ/ttSlcFeEKVTrkaHnUmljT/ikO1T0lqEcE
	dzmONOVEnmzJvM1cCpPHVetVctvCK0sIF3XkZvw7adJrcTQSEgqPXXjOcIEkkf5rNrIw
	wztb5HqEfhLjtEqHHDuKCWZdQEi5oOhuZtuuC3kSuiZhtQDNSKtAyQh8xvohEY0fUNpL
	9iGlINDPuh8PyJfgW7xi2RCU/M10rP/yL5af6L9lEowX6THC66+tZRcEi632doR8RexR
	vriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W1wfIiEbNPdkXAupX8neB52kdB1GxROHa8lCqdSVDq0=;
	b=XXUeXh8hKdtrN2zRFK6Bg+HEMjzjNzIDD60Fb3V1IMql3u3nwvb5OijDQUqyfkrdst
	ItdUTbUmnBctRkhAUIn7ounRG2EqqrZN1fn8XPw1yK4o8dAe5EapncFRrMZ08iaBpUmN
	RtwtFPbIXpGHd3+OFhKSYvrz1WkISMSLqhzQdB0ueM0FBBQc8q6RUqY1+3VuyDCNqe6W
	yp5FPJGGFd+a64DZUmTAy09Y+NTQyYKTJYI59xRjniBzGXyRicDzPfmdS8TEl5W+mair
	RGgSg6cYDEB8dX5jE37Ba1ofO6ApjoW0GB+MzCcX4ZlL3wDib6MYzGs19DHqNF17oGf9
	Nnfw==
X-Gm-Message-State: APjAAAVms0p/GPtIjFPcqmJCJSveE2soxXPG2Mc3AOmujNCWiup8irpM
	6Xol5pVaRMAJGSV5UK7BDvJoqoYyLpRHKK2MOp0=
X-Google-Smtp-Source: APXvYqwRPWyl90fr7jynwsqJg6ZClqQsIWE6mL9iw6IX0TvdkKCMG3jsN62Q5mbeRitOW83/MPO7KMZOBbvr8F2UhkI=
X-Received: by 2002:ac8:2f35:: with SMTP id j50mr70246289qta.378.1558490676202;
	Tue, 21 May 2019 19:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161158.45329-1-alex.kanavin@gmail.com>
In-Reply-To: <20190521161158.45329-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 19:04:10 -0700
Message-ID: <CAMKF1so7ASfBEknz4t727WGHvSOvJ2z=v87m0o=iZW4VdqFztw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodulemd: fix erroneous linking against v2 library when v1 was requested
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
X-List-Received-Date: Wed, 22 May 2019 02:04:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 9:12 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...xplicitly-specify-the-v1-library-in-.patch | 28 +++++++++++++++++++
>  .../libmodulemd/libmodulemd_git.bb            |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
>
> diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
> new file mode 100644
> index 00000000000..1568d25f9d8
> --- /dev/null
> +++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
> @@ -0,0 +1,28 @@
> +From b651551134cf170038b3e01812e3767969506491 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 21 May 2019 17:59:26 +0200
> +Subject: [PATCH] v1/meson.build: explicitly specify the v1 library in
> + pkgconfig
> +
> +Otherwise there would be '-lmodulemd' which resolves
> +to v2 version if both v2 and v1 are present in the sysroot.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + modulemd/v1/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/modulemd/v1/meson.build b/modulemd/v1/meson.build
> +index 4d54e69..9144ca2 100644
> +--- a/modulemd/v1/meson.build
> ++++ b/modulemd/v1/meson.build
> +@@ -325,7 +325,7 @@ configure_file(
> + )
> +
> + pkg.generate(
> +-    libraries : modulemd_v1_lib,
> ++    libraries : '-l:libmodulemd.so.1',

shouldn't it be generating a separate package for v1 ?
hardcoding linker paths seems a bit hackish here, is it going
to generate a .pc file with .so.1 version ?

> +     subdirs : v1_header_path,
> +     version : libmodulemd_v1_version,
> +     name : 'modulemd',
> diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> index d7f486868b8..d4ffd281b5f 100644
> --- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> +++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
>  SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
>             file://0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch \
>             file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
> +           file://0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch \
>             "
>
>  PV = "2.4.0"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

