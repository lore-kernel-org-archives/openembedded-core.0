Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5F567BEDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 19:05:09 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id j21so1047129uap.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 12:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kIaN1VMHJc9gmhM7hlwWBK0Ezanz8X6TC8sskT4eZjA=;
	b=hE3v6d5Gw66qDtgxgYQr5zLBNKxL0VqtiSKZ5S2BHMyJp/LIBVPmmrDLLjMp0qwYZg
	BicOdmu8d5IXRw1hJaxLGLBERlrcv5LSCBgAu/6JOADcEp8UMPMh8G18GtS2Iwt0IlAi
	bvr9yQ908y0/c4mxKf/4dhx2iwzRKft78z0A8lDrFtCH9Pz40oInfriMzV6Cz/gR+aay
	WLkJvakPhnUHH3b7oXkT96tYAvX44sr6TNSrGzgL8a1u2oSHi7sWhaRMXP9Z/iG/nEYq
	qih0VlPoii1+5npaxUhk1j40/0le0z/+Lfl+fwA9OIbKeQRdaVX634lHO8xFXO8ZG/N7
	mYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kIaN1VMHJc9gmhM7hlwWBK0Ezanz8X6TC8sskT4eZjA=;
	b=Mfihwb6O9cPgo/mO6FIR7Q+bLQuA3NHPJOfCrvp3gc5XRUK8KOI0iRF9okARjUNj40
	YxqmN7mVubIjwzN7AEXppsVer3djWXzJfcqIAf6h7IRyc7WX9bDs0tI52EnIpSb0WWCA
	2wOMWtpM7aEYB0E7WbTP1umfgtVRmCUe6zRJNhOkAHKaL//kRTlUVD/+m37GbYUtP52r
	l7VXjFphM686d+mGDLp2lnvkAzBGGQ6z/dQcKHR9ooO5HzN8fJTCvUXbNm8fy+9Z5v47
	vSNR7DtcGEDzwjOXSLJMJd7E6Lkia7Q8ZHvPp62r+dR2nDBhHxfQt93gMnL65fJk5/AJ
	E5IA==
X-Gm-Message-State: APjAAAVLh6W62aZkrXVeZDc4chvmk4zRDiU/vxRVxRldW+y2NZgn/gzU
	OlJn6NdxQMfhs50thtWtpDyeYc60vu1VJPKClKE=
X-Google-Smtp-Source: APXvYqyxSePKxm+PJRCdvlCD9bwfiGZbcqnLxolYJhZyaLJ3D0sGk6dbJjcqdGpGDNNTcC+qkOmkBrSGisyXm6oDtT4=
X-Received: by 2002:ab0:2085:: with SMTP id r5mr8071161uak.92.1566241510399;
	Mon, 19 Aug 2019 12:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_BxAjV=8OQ+95tk2+KnmJoXKVa71Agk4o5uKzYDraP0A@mail.gmail.com>
	<1566232619-199878-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1566232619-199878-1-git-send-email-hongxu.jia@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Aug 2019 12:04:58 -0700
Message-ID: <CAJ86T=WtuV46YbMMcGigKRrsvTNTtgWWdNLDp2P27-Zx6Rn+Yw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] systemd: add menson option to decrease RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 19:05:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 19, 2019 at 9:38 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Since do_testimage for core-image-sato-sdk has memory limitation (256Mib)
> which caused rpc.statd failed with out of memory.
> [  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or sacrifice child
>
> The rpc.statd allocates memory according to RLIMIT_NOFILE,
> so decrease RLIMIT_NOFILE to 4k to keep sync with sysvinit
>
> After applying the patch, the memory cost is the same with sysvinit
> rpcuser    340  0.0  1.0   3212  2588 ?        Ss   13:20   0:00 /usr/sbin/rpc.statd -F
> root       473  0.0  0.2   3464   496 ?        Ss   13:23   0:00 /usr/sbin/rpc.mountd
>
> For other bsp, still keep RLIMIT_NOFILE to 512k by default
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...001-meson-add-option-to-set-RLIMIT_NOFILE.patch | 50 ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_242.bb           |  5 +++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch b/meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch
> new file mode 100644
> index 0000000..e822238
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch
> @@ -0,0 +1,50 @@
> +From d42d1512402de0d2249e2d68040c5c3887e7ea99 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 19 Aug 2019 12:06:59 -0400
> +Subject: [PATCH] meson: add option to set RLIMIT_NOFILE
> +
> +Add option to set RLIMIT_NOFILE and keep 512*1024 by default
> +
> +It is helpful for embedded device which has memory limitation
> +to decrease RLIMIT_NOFILE
> +
> +Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/13359]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + meson.build       | 2 +-
> + meson_options.txt | 5 +++++
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 18a7cc5..26d9cf0 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -79,7 +79,7 @@ conf.set10('HAVE_SYSV_COMPAT', sysvinit_path != '' and sysvrcnd_path != '',
> +
> + conf.set10('BUMP_PROC_SYS_FS_FILE_MAX', get_option('bump-proc-sys-fs-file-max'))
> + conf.set10('BUMP_PROC_SYS_FS_NR_OPEN',  get_option('bump-proc-sys-fs-nr-open'))
> +-conf.set('HIGH_RLIMIT_NOFILE',          512*1024)
> ++conf.set('HIGH_RLIMIT_NOFILE',          get_option('high-rlimit-nofile'))
> +
> + # join_paths ignores the preceding arguments if an absolute component is
> + # encountered, so this should canonicalize various paths when they are
> +diff --git a/meson_options.txt b/meson_options.txt
> +index d4ec37d..5d4ee18 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -56,6 +56,11 @@ option('bump-proc-sys-fs-file-max', type : 'boolean',
> +        description : 'bump /proc/sys/fs/file-max to ULONG_MAX')
> + option('bump-proc-sys-fs-nr-open', type : 'boolean',
> +        description : 'bump /proc/sys/fs/nr_open to INT_MAX')
> ++
> ++# Default is 512*1024
> ++option('high-rlimit-nofile', type : 'integer', value : 524288,
> ++       description : 'set RLIMIT_NOFILE')
> ++
> + option('valgrind', type : 'boolean', value : false,
> +        description : 'do extra operations to avoid valgrind warnings')
> + option('log-trace', type : 'boolean', value : false,
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
> index 1953fef..96a53dc 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -28,6 +28,7 @@ SRC_URI += "file://touchscreen.rules \
>             file://0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch \
>             file://0001-networkd-fix-link-up.patch \
>             file://0002-network-do-not-send-ipv6.patch \
> +           file://0001-meson-add-option-to-set-RLIMIT_NOFILE.patch \
>             "
>
>  # patches needed by musl
> @@ -211,6 +212,10 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>                    -Dsulogin-path=${base_sbindir}/sulogin \
>                    -Dumount-path=${base_bindir}/umount"
>
> +EXTRA_OEMESON += "-Dhigh-rlimit-nofile=${RLIMIT_NOFILE}"
> +RLIMIT_NOFILE ??= "524288"
> +RLIMIT_NOFILE_qemuall ?= "4096"

This doesn't look right. By making the fix qemu specific you're
effectively changing the QA tests to pass - but leaving the underlying
issue there for all real world use cases.

Better to set the safe value by default and let users with lots of
memory change it if they need to.

> +
>  do_install() {
>         meson_do_install
>         install -d ${D}/${base_sbindir}
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

