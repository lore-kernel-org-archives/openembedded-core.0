Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 71DA97D5B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 12:28:46 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so1114459iot.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JyyV7XZZNm7mZlfkyLux2YHkW5d9r+VD30xgct0QX4o=;
	b=Zf0qsAiy1fRifL02D7mi324eAotawVQK2FzV30oGT8IDPYMgc6J5POCwJ1eaW70EsH
	z/UXuBdvwOmgTf3icQR6otRWEJTzfi+q9w1XQdlL3a5FlggiG9VVXsbADg7LmFy/vqVT
	7bVgtMrEQDXY5Bkvj1MDMOnC9uHvxfZL75l9TiOVb0XE8awXPegPRqj6Pc59WSihAbJi
	CAWaL2CFzYHTBjjhcAqMKZsS+RosuBOTrGM/ZPVKWSMd+orpgNki0sR7hmPci5eVDuZe
	zEglFgZ8OeJmrBSgn0LyTvkML3XuXgTtn3G56rwbR9K6fOyeioYac1XGyAt6vfzmeJGU
	X86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JyyV7XZZNm7mZlfkyLux2YHkW5d9r+VD30xgct0QX4o=;
	b=q6+/hGwMbqcIJBeFEBf2KLgpLJWm8AZzZuDNB3t2yf6VsKysHbLaOh8a0znqbXZQ8u
	tH6Ig1Zk/NqmB6ZkiFAZV0lw8LHHRJHfW6mx5UxPFQ0c+lF71DMvptZkqNTl/yrPv4EE
	d5Qo1eBupRERCvDNFRo9KCwkIlqRXUZAn56Pm0zs9X2Vn6REGjilO+RohnuUo5fImBJ/
	GtbajoT4gB3iGThOsbjiPqB0qQox5q0x8RDkMS0dfitmWOOxoo818CmYWhhtQyDQqOPC
	jV3DWjH4P8SYnwgf7Qea+18hFWyMSKOC8Wfj7+o9znQABrQcZN4la8Rs+GtP/OHxYCdG
	qSrQ==
X-Gm-Message-State: APjAAAUuhs3bJ7RmDwClPLZM6zXih4xAPK8f7YczQjXt2DLee1Pl3L9M
	jtcONUuzOSxPJab7NApP7Pe35n1UHXNRnGY69A52Hw==
X-Google-Smtp-Source: APXvYqzoCkEL89Y82F8G9TdCu24ZVpNN7WtCJ7Av/e4uSqi2CVVKwgSJj5yQw9b+pwJHYDBPZzgQ14MuJJRFalHnI3Q=
X-Received: by 2002:a5e:9701:: with SMTP id w1mr18912599ioj.294.1561379327390; 
	Mon, 24 Jun 2019 05:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190620174455.155106-1-joe.slater@windriver.com>
In-Reply-To: <20190620174455.155106-1-joe.slater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 13:28:36 +0100
Message-ID: <CAJTo0LYQnB535S8tWCU5OKJY+BEHmrdJUJ-3VCk1d8UFMkEinQ@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH 1/1] glib-2.0: Fix CVE-2019-12450
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
X-List-Received-Date: Mon, 24 Jun 2019 12:28:46 -0000
Content-Type: text/plain; charset="UTF-8"

Will you be backporting this to Warrior and Thud?

Ross

On Thu, 20 Jun 2019 at 18:45, Joe Slater <joe.slater@windriver.com> wrote:
>
> Unchanged patch from glib.git which was added after current release.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../glib-2.0/glib-2.0/CVE-2019-12450.patch         | 62 ++++++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb      |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
> new file mode 100644
> index 0000000..59e4919
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
> @@ -0,0 +1,62 @@
> +glib-2.0: fix CVE-2019-12450
> +
> +Not in release 2.61.1.
> +
> +CVE: CVE-2019-12450
> +
> +Upstream-Status: Backport [github.com/GNOME/glib.git]
> +Signed-off-by: Joe Slater <joe.slater@windrivere.com>
> +---
> +From d8f8f4d637ce43f8699ba94c9b7648beda0ca174 Mon Sep 17 00:00:00 2001
> +From: Ondrej Holy <oholy@redhat.com>
> +Date: Thu, 23 May 2019 10:41:53 +0200
> +Subject: [PATCH] gfile: Limit access to files when copying
> +
> +file_copy_fallback creates new files with default permissions and
> +set the correct permissions after the operation is finished. This
> +might cause that the files can be accessible by more users during
> +the operation than expected. Use G_FILE_CREATE_PRIVATE for the new
> +files to limit access to those files.
> +---
> + gio/gfile.c | 11 ++++++-----
> + 1 file changed, 6 insertions(+), 5 deletions(-)
> +
> +diff --git a/gio/gfile.c b/gio/gfile.c
> +index 24b136d80..74b58047c 100644
> +--- a/gio/gfile.c
> ++++ b/gio/gfile.c
> +@@ -3284,12 +3284,12 @@ file_copy_fallback (GFile                  *source,
> +         out = (GOutputStream*)_g_local_file_output_stream_replace (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
> +                                                                    FALSE, NULL,
> +                                                                    flags & G_FILE_COPY_BACKUP,
> +-                                                                   G_FILE_CREATE_REPLACE_DESTINATION,
> +-                                                                   info,
> ++                                                                   G_FILE_CREATE_REPLACE_DESTINATION |
> ++                                                                   G_FILE_CREATE_PRIVATE, info,
> +                                                                    cancellable, error);
> +       else
> +         out = (GOutputStream*)_g_local_file_output_stream_create (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
> +-                                                                  FALSE, 0, info,
> ++                                                                  FALSE, G_FILE_CREATE_PRIVATE, info,
> +                                                                   cancellable, error);
> +     }
> +   else if (flags & G_FILE_COPY_OVERWRITE)
> +@@ -3297,12 +3297,13 @@ file_copy_fallback (GFile                  *source,
> +       out = (GOutputStream *)g_file_replace (destination,
> +                                              NULL,
> +                                              flags & G_FILE_COPY_BACKUP,
> +-                                             G_FILE_CREATE_REPLACE_DESTINATION,
> ++                                             G_FILE_CREATE_REPLACE_DESTINATION |
> ++                                             G_FILE_CREATE_PRIVATE,
> +                                              cancellable, error);
> +     }
> +   else
> +     {
> +-      out = (GOutputStream *)g_file_create (destination, 0, cancellable, error);
> ++      out = (GOutputStream *)g_file_create (destination, G_FILE_CREATE_PRIVATE, cancellable, error);
> +     }
> +
> +   if (!out)
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
> index bb77294..5942241 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
> @@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>             file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
>             file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
> +           file://CVE-2019-12450.patch \
>             "
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

