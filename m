Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9B58E7E210
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 01:35:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o2so2512207qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Dp/b9OoGPm4xSmK1hjWN/k6RfgtJYxLnOaUlpheTcZY=;
	b=kr+MA3FyMn1AlPXNiTUOXo52P0NoAP+0F+c+TfgFcf7HcXDcjw3SJpoD6xz/82l9/X
	1AYn/VfO7yO5K94AzTbOJ2q2rVkLEx2kULOlaIoZs5o7PuCdUmlA8M7Kn4/HjbMUaqiq
	hn/0OablV94CW9r+i5qjCVIqu7CEAc8DcGALKM7tJA/aIUgibbgTafMOV5xUYXpkdmIU
	fpKJGDZOzbM9hSo7w/T1b576jvm3OJZdE10sKcJXtHB0jA/vD2G0lF5hoa4qZfTMl4vM
	3ozaf9SP1+OmBzLBGfUCKqdFCvUTfkiBBc0fUOFabehmXo/rJZShz83y93EA4Uh4WSpl
	GjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dp/b9OoGPm4xSmK1hjWN/k6RfgtJYxLnOaUlpheTcZY=;
	b=ftfbQaI2bvGrE0MnEEHlcP0lI7aFZFp14sRmPJadOdA1/DC+QYbClblkeviBn5O124
	il4s9UrIPhMs6I/GOwtXkyY4cv6D0lSe+Sutmb7N8BlVUJrp6endotN30544Ukv9cQ4U
	jV9Jr/B2d8v1lRrErvjooE08aZLmke3IYOq3niqw2EM7sJS6Jz7mtWo+ttBxZ6DWAnq9
	HdmQnhc4ZXug/7i2Q/Ohycg1/n7N+AHMI9RqpGZYlFoDzNJGtgqHLQnewANTqMQcWEgD
	n+MlD76tfFRGv3FDclVBnWwttB101912PUwEJVhR13KN2U2IAjWvt5/vRtclxngOhNv8
	y9yQ==
X-Gm-Message-State: APjAAAXZdNB0UPukhzKY99NxGA9KEpBISoQLt9L9/OuwWJzRzF7VsnzO
	T84+wHH+9z0tgKgCxQ+Wm8NcF4BCo/Cf8SB0DDU/0zZG
X-Google-Smtp-Source: APXvYqzfGahm54eUqyv4+zovARCU4nsAVJyfGfCQDXKs83Wu81067xOzW6BQICyqTBnGtw/J51Aq63u23LPxLAuPBDE=
X-Received: by 2002:a37:8102:: with SMTP id c2mr429490qkd.208.1558575313264;
	Wed, 22 May 2019 18:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190522082954.24027-1-bunk@stusta.de>
In-Reply-To: <20190522082954.24027-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 18:34:47 -0700
Message-ID: <CAMKF1sq6rAKP-dVYa1F9Ae_LOo6uSUO8wHebTaytROasdLUDNQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] squashfs-tools: Mark as incompatible with musl
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
X-List-Received-Date: Thu, 23 May 2019 01:35:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 1:30 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Silently ignoring FNM_EXTMATCH makes fnmatch()
> behave different from what callers expect.
>
> Mark as incompatible with musl instead of risking
> broken runtime behaviour.
>
> The practical consequences should be small since
> what is used in OE is mainly squashfs-tools-native.
>

This has been working fine on musl for a while ar runtime as well
do you see issues ?

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../squashfs-tools/fix-compat.patch           | 46 -------------------
>  .../squashfs-tools/squashfs-tools_git.bb      |  3 ++
>  2 files changed, 3 insertions(+), 46 deletions(-)
>
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
> index 0ce7b4e8ce..87c1e8cac0 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
> @@ -1,39 +1,8 @@
> -Define FNM_EXTMATCH if not defined its glibc specific define
>  include missing sys/stat.h for stat* function declarations
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: squashfs-tools/action.c
> -===================================================================
> ---- squashfs-tools.orig/action.c
> -+++ squashfs-tools/action.c
> -@@ -44,6 +44,10 @@
> - #include "action.h"
> - #include "error.h"
> -
> -+#if !defined(FNM_EXTMATCH)
> -+#define FNM_EXTMATCH 0
> -+#endif
> -+
> - /*
> -  * code to parse actions
> -  */
> -Index: squashfs-tools/mksquashfs.c
> -===================================================================
> ---- squashfs-tools.orig/mksquashfs.c
> -+++ squashfs-tools/mksquashfs.c
> -@@ -1261,6 +1261,10 @@ void write_dir(squashfs_inode *inode, st
> -               dir_size + 3, directory_block, directory_offset, NULL, NULL,
> -               dir, 0);
> -
> -+#if !defined(FNM_EXTMATCH)
> -+#define FNM_EXTMATCH 0
> -+#endif
> -+
> - #ifdef SQUASHFS_TRACE
> -       {
> -               unsigned char *dirp;
>  Index: squashfs-tools/pseudo.c
>  ===================================================================
>  --- squashfs-tools.orig/pseudo.c
> @@ -46,18 +15,3 @@ Index: squashfs-tools/pseudo.c
>   #include <ctype.h>
>
>   #include "pseudo.h"
> -Index: squashfs-tools/unsquashfs.c
> -===================================================================
> ---- squashfs-tools.orig/unsquashfs.c
> -+++ squashfs-tools/unsquashfs.c
> -@@ -42,6 +42,10 @@
> - #include <sys/sysmacros.h>
> - #endif
> -
> -+#ifndef FNM_EXTMATCH
> -+#define FNM_EXTMATCH 0
> -+#endif
> -+
> - struct cache *fragment_cache, *data_cache;
> - struct queue *to_reader, *to_inflate, *to_writer, *from_writer;
> - pthread_t *thread, *inflator_thread;
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index 5a8b5f77bd..dc1568a77c 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -19,6 +19,9 @@ SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e
>
>  S = "${WORKDIR}/git/squashfs-tools"
>
> +# needs FNM_EXTMATCH
> +COMPATIBLE_HOST_libc-musl = 'null'
> +
>  EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
>
>  PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

