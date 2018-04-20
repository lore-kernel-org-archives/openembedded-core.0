Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id EDBE974499
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 13:05:44 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id s25-v6so4468434ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=28O4rPSVhh0ldduNL9xCRL1F1cNS0tyd7DgL+HE7mgw=;
	b=XYfgCWD0mUDtB8Tye1waeOn0R5XNXE/XGqpTHNCzD1RHZoC0h6M/oONbvwMS3jN9TA
	AlXdXAY9K6K6Qwfl/hYFf3R1JdPqCkhmSLTOBP3wPJMoS8sQoGo2tcF7+wR3hj5OEFym
	a/II5FDgPHuqSs8JCdlMKeC/U2k92mh1DqgDD8ILJ4th4LINewrYQfuyePlSi6zj+aFk
	sJ9lxLc/GUl2eMWLTBqCK6WwG7CG61eKtgWs2BD50/ohpbYyHimzXU5ceAG5cUmx6cmJ
	ZjNAP4/xHW41Eth1qP00zZWIiu/m48RZME3oYd8cJbtQYVnu/ptACZD4AWmDn7R9YbW8
	zBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=28O4rPSVhh0ldduNL9xCRL1F1cNS0tyd7DgL+HE7mgw=;
	b=gUV6lVDIfmhTroo0WNR2TeFfQA1hfPZ1Qyz5ZbLLotRfgoM4o9Y8SMuCTRHqeG/3ll
	W8wbhDHPEvmmM9DeBFmdjvdxbW5uSfH7Um89zlsM6RduiDolu0PnwnlS38KjxLSX5kt7
	0U24ElNBfyoX8XWth/ZQkx8Q4nBPXgA2ugMLY2o2BPlfuWi1JHrYtlpKX5/+1fLTMqgc
	4GZvlD+IKQemc0W0RTW4BX/HumV1ywWjhgyAE1wLKwliE2ukU54GeJRaDD3FRGC9b3ZN
	iaoNIFTk0wpux+8SUA2bcZeqI94QVMVDvXP/zRC4BQDRj2Gvb7+/wS723pibAc3PLoJH
	iP6g==
X-Gm-Message-State: ALQs6tDLIUgG/XzRr1A5d7wlaVbHkRFaPIRbIiFQDnNIS8Zp8q8AilGP
	5a49ly2DL8uvwZ8yAP+VvLpx2MJY4c5S+rZi9BLIxw==
X-Google-Smtp-Source: AB8JxZquj6S9gMknYceEQZTRB2fxcW9WyjLMFEsjtvnXRe4z0NS9tx5sIo1rviSsWKRsIvvrimxJOZ9FcnA4pLSJZgc=
X-Received: by 2002:a6b:6b16:: with SMTP id
	g22-v6mr8416075ioc.20.1524229545689; 
	Fri, 20 Apr 2018 06:05:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 20 Apr 2018 06:05:25 -0700 (PDT)
In-Reply-To: <20180404111321.10824-7-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-7-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Apr 2018 14:05:25 +0100
Message-ID: <CAJTo0LZNhoSzuVypcWe68YCiSLXCUrrN36wcaQjAyGwVCV5OJA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/22] glib-2.0: update to 2.56.0
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
X-List-Received-Date: Fri, 20 Apr 2018 13:05:45 -0000
Content-Type: text/plain; charset="UTF-8"

This breaks when building for mingw, but 2.56.1 has the fixes so should work.

Ross

On 4 April 2018 at 12:13, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Remove upstreamed ptest-paths.patch
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../0001-Do-not-ignore-return-value-of-write.patch | 17 +++++-------
>  .../glib-2.0/glib-2.0/ptest-paths.patch            | 30 ----------------------
>  .../glib-2.0/glib-2.0/relocate-modules.patch       | 13 ++++++----
>  .../{glib-2.0_2.54.3.bb => glib-2.0_2.56.0.bb}     |  5 ++--
>  4 files changed, 17 insertions(+), 48 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.54.3.bb => glib-2.0_2.56.0.bb} (82%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
> index aee96aaa6e7..0ebf138d60a 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
> @@ -1,30 +1,30 @@
> -From d6501b107940e9f548c89236d773c6d33c15a5c9 Mon Sep 17 00:00:00 2001
> +From d250652782b65b071b7cc8f01f2db833df104e0e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 16 Apr 2016 13:28:59 -0700
> -Subject: [PATCH 1/2] Do not ignore return value of write()
> +Subject: [PATCH] Do not ignore return value of write()
>
>  gcc warns about ignoring return value when compiling
>  with fortify turned on.
>
>  assert when write() fails
>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
>  Upstream-Status: Submitted
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> +---
>   glib/tests/unix.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/glib/tests/unix.c b/glib/tests/unix.c
> -index 3543458..4e7ed85 100644
> +index 9d55a6c..a07f945 100644
>  --- a/glib/tests/unix.c
>  +++ b/glib/tests/unix.c
>  @@ -32,14 +32,15 @@ test_pipe (void)
>     GError *error = NULL;
>     int pipefd[2];
>     char buf[1024];
> --  ssize_t bytes_read;
> -+  ssize_t bytes_read, bytes_written;
> +-  gssize bytes_read;
> ++  gssize bytes_read, bytes_written;
>     gboolean res;
>
>     res = g_unix_open_pipe (pipefd, FD_CLOEXEC, &error);
> @@ -37,6 +37,3 @@ index 3543458..4e7ed85 100644
>     memset (buf, 0, sizeof (buf));
>     bytes_read = read (pipefd[0], buf, sizeof(buf) - 1);
>     g_assert_cmpint (bytes_read, >, 0);
> ---
> -2.8.0
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch b/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
> deleted file mode 100644
> index f3be02770cb..00000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Instead of writing the temporary mapping files in the mappedfile test to the
> -user runtime directory, write them to $TMP.  The runtime directory may not
> -currently exist if the test is executed on a non-desktop system and the test
> -doesn't attempt to create the directory structure.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/glib/tests/mappedfile.c b/glib/tests/mappedfile.c
> -index 40e0e60..27a24be 100644
> ---- a/glib/tests/mappedfile.c
> -+++ b/glib/tests/mappedfile.c
> -@@ -81,7 +81,7 @@ test_writable (void)
> -   const gchar *new = "abcdefghijklmnopqrstuvxyz";
> -   gchar *tmp_copy_path;
> -
> --  tmp_copy_path = g_build_filename (g_get_user_runtime_dir (), "glib-test-4096-random-bytes", NULL);
> -+  tmp_copy_path = g_build_filename (g_get_tmp_dir (), "glib-test-4096-random-bytes", NULL);
> -
> -   g_file_get_contents (g_test_get_filename (G_TEST_DIST, "4096-random-bytes", NULL), &contents, &len, &error);
> -   g_assert_no_error (error);
> -@@ -125,7 +125,7 @@ test_writable_fd (void)
> -   int fd;
> -   gchar *tmp_copy_path;
> -
> --  tmp_copy_path = g_build_filename (g_get_user_runtime_dir (), "glib-test-4096-random-bytes", NULL);
> -+  tmp_copy_path = g_build_filename (g_get_tmp_dir (), "glib-test-4096-random-bytes", NULL);
> -
> -   g_file_get_contents (g_test_get_filename (G_TEST_DIST, "4096-random-bytes", NULL), &contents, &len, &error);
> -   g_assert_no_error (error);
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index 65d5b43f9b6..d3d63b2cd15 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -1,3 +1,8 @@
> +From 3edc9a063ceaf27129e0dd96a8be3942e3dd5e96 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Fri, 11 Mar 2016 15:35:55 +0000
> +Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
> +
>  Instead of hard-coding GIO_MODULE_PATH when glib is built, use dladdr() to
>  determine where libglib.so is and use that path to calculate GIO_MODULES_DIR.
>
> @@ -8,12 +13,13 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>
>  Port patch to 2.48
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +
>  ---
>   gio/giomodule.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
>  diff --git a/gio/giomodule.c b/gio/giomodule.c
> -index da7c167..cc0bc7c 100644
> +index 6937932..66852e6 100644
>  --- a/gio/giomodule.c
>  +++ b/gio/giomodule.c
>  @@ -40,6 +40,8 @@
> @@ -25,7 +31,7 @@ index da7c167..cc0bc7c 100644
>   #endif
>   #include <glib/gstdio.h>
>
> -@@ -1036,7 +1038,15 @@ get_gio_module_dir (void)
> +@@ -1050,7 +1052,15 @@ get_gio_module_dir (void)
>   #endif
>         g_free (install_dir);
>   #else
> @@ -42,6 +48,3 @@ index da7c167..cc0bc7c 100644
>   #endif
>       }
>
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.56.0.bb
> similarity index 82%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.56.0.bb
> index faf594569d6..81d207c5963 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.56.0.bb
> @@ -7,7 +7,6 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://configure-libtool.patch \
>             file://run-ptest \
> -           file://ptest-paths.patch \
>             file://uclibc_musl_translation.patch \
>             file://allow-run-media-sdX-drive-mount-if-username-root.patch \
>             file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
> @@ -20,5 +19,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
>
> -SRC_URI[md5sum] = "16e886ad677bf07b7d48eb8188bcf759"
> -SRC_URI[sha256sum] = "963fdc6685dc3da8e5381dfb9f15ca4b5709b28be84d9d05a9bb8e446abac0a8"
> +SRC_URI[md5sum] = "f2b59392f2fb514bbe7791dda0c36da5"
> +SRC_URI[sha256sum] = "ecef6e17e97b8d9150d0e8a4b3edee1ac37331213b8a2a87a083deea408a0fc7"
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

