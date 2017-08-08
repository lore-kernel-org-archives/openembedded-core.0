Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0841771984
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:49:03 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id x16so2693275lfb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FOXCkL73S3oMKuj/QRpQXSfJM9VP8svj/e9SZ+ghzCY=;
	b=ZzOCOHg7pCWkWk6zQGXPxp1VUFQgs6h2CUohVRDrzJiickQblMajrFw90RaNnKVKy+
	OKzotnIrjDgJ4rzBJUiVYm+m0ofz0C7yQTAEhsv7nCiMI1jix4phj0/Pxw5zY2sY81RE
	z4ZdZSUt8yb+hddfrAJAN/fZZyLUYK8UdLlsDzWRk0OTi5/wY+xc/btECcRqSkPpZYXv
	AQp8iitndDu7TegqY64DjzmgL2fhi1ZIZp/8Yv5VfDOj2+ieotPxoIylRWcJb9oRk1AF
	jvbRlcLwMJg2CJWP+W6g1pYADMtU1EZCxKeCMNdPiu+Y63PN0Ba9uu3GSagpT/sVZyuG
	CPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FOXCkL73S3oMKuj/QRpQXSfJM9VP8svj/e9SZ+ghzCY=;
	b=eQdzq8T/kw+YmVGOlxahIOQQpDK7RgEe2ArkgOmsy3Yt0p4w1241t5lWcAtqJwLdr/
	WaBvTCknL94h0HGyVfcaC7SYMy4de1cj6T8JuWz8SykK90ZH+3rsgr6ZY8MPLYGH6/hh
	2xrD0NaKen9IxWzpfDKmpwU696B0h/pF6o/tyaoZxHI1mslHSTqLCwYGI4bGT/vQFH67
	4WC0UrzRs0xgJFZON/tjykmZG9e6YMvH3JLMwjeU3TbZIwWnfCmCZMhW/Ir5QlXQ+Erg
	rpIKLJbAn5+a2ezfp+YfNuoJ/gjDfNSUic7i4NWUmwvfTBVqf0gPe2IS951bECefNkUV
	eUug==
X-Gm-Message-State: AHYfb5jz2VIXVNYgtNci5mz61FIL79Ue5+iQyakqeivIJ5F8MyZ7UZ1u
	EX1LyRHSnsGPsUPZIO+XDmGJ3n9bXA==
X-Received: by 10.80.147.197 with SMTP id o63mr5168319eda.194.1502207344559;
	Tue, 08 Aug 2017 08:49:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 08:48:34 -0700 (PDT)
In-Reply-To: <20170807114504.28410-3-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-3-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 08:48:34 -0700
Message-ID: <CAMKF1so_29Ojxcmmm6u+HmSo3SF55DQHQEXmokdnvy_ca-5sCA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] btrfs-tools: update to 4.12
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
X-List-Received-Date: Tue, 08 Aug 2017 15:49:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 7, 2017 at 4:45 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Add a patch to force a native build for a helper binary
> (which is not installed or used outside of the build process).
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...-Makefile-build-mktables-using-native-gcc.patch | 30 ++++++++++++++++++++++
>  .../{btrfs-tools_4.11.1.bb => btrfs-tools_4.12.bb} |  6 +++--
>  2 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.11.1.bb => btrfs-tools_4.12.bb} (88%)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
> new file mode 100644
> index 00000000000..0a3b5fd7102
> --- /dev/null
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
> @@ -0,0 +1,30 @@
> +From e58369f6d36bc51eb59d6afa34c1cae3ff0810ef Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 7 Aug 2017 14:10:38 +0300
> +Subject: [PATCH] Makefile: build mktables using native gcc
> +
> +It's a throwaway helper binary used during build, and so it needs to
> +be native.
> +
> +Upstream-Status: Inappropriate [oe specific]

I think such a patch would be good upstream too. There are many
packages making distinction between
build host and target host and help cross compilation.

> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index b3e2b63..347aaf1 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -323,7 +323,7 @@ version.h: version.sh version.h.in configure.ac
> +
> + mktables: kernel-lib/mktables.c
> +       @echo "    [CC]     $@"
> +-      $(Q)$(CC) $(CFLAGS) $< -o $@
> ++      $(Q)$(BUILD_CC) $(CFLAGS) $< -o $@
> +
> + kernel-lib/tables.c: mktables
> +       @echo "    [TABLE]  $@"
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
> similarity index 88%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
> index a7b42e9546b..c3cc89c2b0f 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.11.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
> @@ -14,8 +14,10 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
>  DEPENDS_append_class-target = " udev"
>  RDEPENDS_${PN} = "libgcc"
>
> -SRCREV = "88221fc081a7a0979a012f243b66cf097382cc8f"
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
> +SRCREV = "0607132c3200bcead1426e6dc685432008de95de"
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
> +           file://0001-Makefile-build-mktables-using-native-gcc.patch \
> +           "
>
>  inherit autotools-brokensep pkgconfig manpages
>
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

