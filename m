Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id ACFE77D2B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:51:24 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p2so11359007iol.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 14:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KBefitJQRVAe8p27kmx2x8xQqgKB66J3XFg9DLY8iIU=;
	b=lM39zFiHfOL0gIOH6EtuaIo7/Rgaq7sTTe+1fFgXnAyi8ILZcB0LC6UwKrnmOCKFku
	+NyWCYOEB6hHKE0p/xJX/qFsX3/znvRWEG1P3ytWar90QmJftEPBB6Vz8VBjOrseS6PO
	R7971W2mZuFNEwK+701WafLyDC5bjr8cjEMjX4TndaKbeCkBxLhUHAIGkwMoGBalW/Tb
	Xfu7TwTQqVkFJT5gTaVnBiYkWcoHscn9xa5uTLnWUBpG/Oe8cdTB4k9Yo+9Myr+Os7v4
	ReImIFKEvbQ87LQiDNHFSId/28t+MpFcqo71D4MWVH3Ctn8wfUA2n9VvPlc0xrnfurDY
	AwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KBefitJQRVAe8p27kmx2x8xQqgKB66J3XFg9DLY8iIU=;
	b=D21gljepncGqWrlKy+X6k78Vq9KUbpeheGm6kTX+R8qaUG31GoCtZFr8HgmO2tGB60
	OHGtzx2oaqRD4FtKxG3/kF5tqO+B/IMiJ3tWtRTsytbs145b9+Bb+ossR7Zhe79M8j9z
	uV2Ea2Yjpel6EAJ5H0sdL6XlUv8KA4q7xUcWxjZ5tq0eVDbDLMZLeedxDXojByuRy/oU
	T3frnD5W6s6ntVsn5xYFc2JvKwbbyP0Be54mABLfWdbr3FEa4Zr8bpFuLP1B51VdIPK6
	XfN5UWiFFZGf/fGFr2klMguA/kIToaWC2YZHsjW1CxYuyLQSr9cZJGG2vMtVKrxyXOn4
	R6UA==
X-Gm-Message-State: APjAAAV/6wpjZueN8ppxkBnhgaxFK2iSkQAe/ICN09hIcl/zRTWfWvG5
	XFA0ROzSB/HACNRHVvdt1roGFSbKf1P5R1sVHlKNNw==
X-Google-Smtp-Source: APXvYqyuDby9CE1GpjOcn5ElaWk/K3ATj1bj7nqzt/h2H6qJ8CiPr1LHcGjAs+l/6GaGa9ZC21VjNXdtRheySF/baw0=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr14141624ion.20.1557784285737; 
	Mon, 13 May 2019 14:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190417104853.18047-1-ovidiu.panait@windriver.com>
In-Reply-To: <20190417104853.18047-1-ovidiu.panait@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 14:51:14 -0700
Message-ID: <CAJTo0La5A7XQWKc4eMcckdX6s6k+cO7LjijkQp3AU6m0f5Qsxw@mail.gmail.com>
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
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
X-List-Received-Date: Mon, 13 May 2019 21:51:24 -0000
Content-Type: text/plain; charset="UTF-8"

This isn't OE-specific, can you try and send that upstream so we don't
carry the patch forever?

Also needs rebasing to current master.

Ross

On Wed, 17 Apr 2019 at 03:52, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
>
> "--printf" only works with the stat variant provided by coreutils.
>
> With busybox, when running grub-mkconfig, stat will fail with the
> following error:
> stat: unrecognized option '--printf=%T'
>
> Usage: stat [OPTIONS] FILE...
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  ...fig-Use-c-instead-of-printf-for-stat.patch | 36 +++++++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
>
> diff --git a/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
> new file mode 100644
> index 0000000000..0700911b78
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
> @@ -0,0 +1,36 @@
> +From b5011ea2bc57d80b3e5a42bc308fa2000e85eab1 Mon Sep 17 00:00:00 2001
> +From: Ovidiu Panait <ovidiu.panait@windriver.com>
> +Date: Wed, 17 Apr 2019 12:10:28 +0300
> +Subject: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
> +
> +"--printf" only works with the stat variant provided by coreutils.
> +
> +With busybox, when running grub-mkconfig, stat will fail with the
> +following error:
> +stat: unrecognized option '--printf=%T'
> +
> +Usage: stat [OPTIONS] FILE...
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + util/grub-mkconfig.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
> +index f8496d2..628706d 100644
> +--- a/util/grub-mkconfig.in
> ++++ b/util/grub-mkconfig.in
> +@@ -144,7 +144,7 @@ GRUB_DEVICE_BOOT_UUID="`${grub_probe} --device ${GRUB_DEVICE_BOOT} --target=fs_u
> + GRUB_FS="`${grub_probe} --device ${GRUB_DEVICE} --target=fs 2> /dev/null || echo unknown`"
> +
> + if [ x"$GRUB_FS" = xunknown ]; then
> +-    GRUB_FS="$(stat -f --printf=%T / || echo unknown)"
> ++    GRUB_FS="$(stat -f -c %T / || echo unknown)"
> + fi
> +
> + if test -f ${sysconfdir}/default/grub ; then
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index c6994723f9..a6909c31ca 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -23,6 +23,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://0001-grub-setup-Debug-message-cleanup.patch \
>             file://disable-address-of-packed-member.patch \
>             file://fix.build.with.squashfs.patch \
> +           file://0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch \
>  "
>  SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
>  SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

