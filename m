Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 10DB57CDBB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 19:45:59 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id z25so14273896qti.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ghAayTbP4PQekkDIWUJvOzl3ZseqKJ5XpwoR4LE9HQQ=;
	b=KosxbxEyl9YnrSj5m9iPbMvF76lWY27SCgf94KVufI3k9BaTOYZcx9sbSovfjjVCvH
	OcM1X/tA6IzKTas0laahnRYN3ecK2OUoEMBJW0WxEu7cfp3GX3xeUqQi4Z1fr9jAATtQ
	IGDG1pub6mDOt/lM1nfJj63QOkljSXc7JF7I2Pgx565fVojR7MDo3fgQzFBfkR9J22Aj
	7yoVCOvQD13pABguZ3qQGaMjGpJEq6SY0T7vj1NBM2NDN0p54XLfNc0wt0FiV7lskkTU
	+v1n+oIzJflrc0Bqpu7wE8m+2sH0546S6F0uT+LOwZvFXZNtvdt9yrOHblCovMiwVjYC
	Gosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ghAayTbP4PQekkDIWUJvOzl3ZseqKJ5XpwoR4LE9HQQ=;
	b=kOd+6fXn2/W8GFlgZ49l8F11SFgGJ2jaOpbq1wVIXbBGo8nraPUy4yaxrMakWG6oRb
	p7FmvSIyKHKfK68tShIw3FWonDJd+3BsZiXdWNvHKcAElhKh5iJX1raee1UQWyAmOLxH
	gN9oIuY29sbpxWQ9meBZnkjaZSLPC9YtKw8oEjjjY4soLCkODNqQDgMXYLYshWF8WmIW
	o/BqFDIcycLgmDj8ZpmqEetQM+t/ewo9gCmgewt5UGJP6GezXdp3KM/B6Fm8jNYorAlO
	dU56Czb2dVHDrhgRwmWOqcINn4/3EEvDN/km3DEpv2VG58iWCJU415WGpfZ9Lpdnzr3V
	mlGg==
X-Gm-Message-State: APjAAAXGW3zwxxu81z//9XrDfSVfnGalcuo4Tbcv9YuIGZEUM32lO2H+
	VEGX56OCahQyWOi9ix03eukHMRdAGZJR2GDucEKxYw==
X-Google-Smtp-Source: APXvYqwWQ4Uo4Ieqw4yr9Moai1es7r1UkN4RNlvBxcXVokBHwkgUpZnU3ho8wY1EhQkZEpwi32ZpgU3cKByKhtLlLaE=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr6913530qta.254.1551901560762; 
	Wed, 06 Mar 2019 11:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20190306192328.7300-1-bunk@stusta.de>
In-Reply-To: <20190306192328.7300-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2019 11:45:34 -0800
Message-ID: <CAMKF1so2fwe+AbQZ-dFLbK3K=icNKA7UWHkWgpQRC+h07htW9Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: Upgrade 8.2 -> 8.2.1
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
X-List-Received-Date: Wed, 06 Mar 2019 19:46:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 6, 2019 at 11:23 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-devtools/gdb/{gdb-8.2.inc => gdb-8.2.1.inc}      | 4 ++--
>  ...{gdb-cross-canadian_8.2.bb => gdb-cross-canadian_8.2.1.bb} | 0
>  .../gdb/{gdb-cross_8.2.bb => gdb-cross_8.2.1.bb}              | 0
>  meta/recipes-devtools/gdb/{gdb_8.2.bb => gdb_8.2.1.bb}        | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-8.2.inc => gdb-8.2.1.inc} (89%)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.2.bb => gdb-cross-canadian_8.2.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_8.2.bb => gdb-cross_8.2.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb_8.2.bb => gdb_8.2.1.bb} (100%)
>

LGTM

> diff --git a/meta/recipes-devtools/gdb/gdb-8.2.inc b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
> similarity index 89%
> rename from meta/recipes-devtools/gdb/gdb-8.2.inc
> rename to meta/recipes-devtools/gdb/gdb-8.2.1.inc
> index f6d75ed081..1fc1ec0da4 100644
> --- a/meta/recipes-devtools/gdb/gdb-8.2.inc
> +++ b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
> @@ -18,6 +18,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
>             file://gdbserver-ctrl-c-handling.patch \
>             file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
>  "
> -SRC_URI[md5sum] = "b5a49dbff00d9a87fbe114d14b3101c0"
> -SRC_URI[sha256sum] = "c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39"
> +SRC_URI[md5sum] = "f8b2562e830a4098dd5b5ea9e9296c70"
> +SRC_URI[sha256sum] = "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.2.bb b/meta/recipes-devtools/gdb/gdb-cross_8.2.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_8.2.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_8.2.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb_8.2.bb b/meta/recipes-devtools/gdb/gdb_8.2.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_8.2.bb
> rename to meta/recipes-devtools/gdb/gdb_8.2.1.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

