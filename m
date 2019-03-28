Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8ACF7CD89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:21:09 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v4so17188179ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nlSpnI5pXiVpKsyRckfQlTOYsfep6RyRzWlAxn5W6Gc=;
	b=e5Pf0KkvljvWyRpSf/af+NO3jQdCe2KiRVUand3YKp9hoSCks701XruYvVqjJxnTXN
	+zv6q4ND0LqTI+faB4g0acZac7t+9CzlPyK3uXqWI1jB1PC+7uWCSLVtNF1JbcbaNV5B
	gVM4RTNDBjexPscPkXv2A3ch1VFTym53bZKdV3TKMaQ9u7MBjgqQaOepTKyJkUt1oa0F
	b/26zffpLpsdNwpmxMivL1Q+ieoVjIpuLbkP2oDhuF3P53+OTuNhpo3K97OBf9q+fyN5
	eKeOEDR3TilvUgFt1euYKMZV8xYRpXAtcXVG4oIYazIZY7ItCErXqT+dRp5IGUpApxoR
	UBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nlSpnI5pXiVpKsyRckfQlTOYsfep6RyRzWlAxn5W6Gc=;
	b=Yh/xUg2RBSNjnTKPVEmrKRTCmGGOEUMuaSpobtayLDH4miUvb4GeU8vGVP+IGFI9Tq
	0tFzMmOON99Z0N7bmiqJDlYd3BA5HpdgKIk8fYKaTCkZkewv7wT5jvGkyQfzCS1LkmMN
	RwB/KsXv76JppHgKS6lTxT+UBLOXUrK+43wiGhVOCahF3/3gkbWuEOCo+VmgYVasG1ET
	CKcjnjb/xHYFLYdz+elAss8A9GCYhQLowSbffvDplBMWcURnQQ6CJQ0NsNQ6wUzmgRyr
	16XEl8hN4ochAtlimwSqtdvo/o5Qa2qsFftxQaQtAApAHLB9Xpc7Wzt4Yvh4orQ/f2a3
	fmgw==
X-Gm-Message-State: APjAAAUgPkXjOwneTrdKmxx8ku7w3NWEMLUYsQqj1vtezDIgChs3DnNp
	9GeItalkHjgejbZ29rvRnad8e/YCMbGWH50uWL9fxG61rVM=
X-Google-Smtp-Source: APXvYqz3T03U/F0C88B5njbz+qnFXy5xnoAH3ahtHpfKKerddAgqHhx5xLoTXTCpMKVSfWwoL9p0HHxPDLJKVU8DxMk=
X-Received: by 2002:a6b:3c05:: with SMTP id k5mr406386iob.270.1553779270616;
	Thu, 28 Mar 2019 06:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
	<20190327081852.20155-2-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190327081852.20155-2-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 13:20:59 +0000
Message-ID: <CAJTo0LagWF8uZnBHHfBK_-gg8vjN0J22HmGWttgADU1mNv3dAg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] atk:upgrade 2.30.0 -> 2.32.0
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
X-List-Received-Date: Thu, 28 Mar 2019 13:21:09 -0000
Content-Type: text/plain; charset="UTF-8"

Please remember to read the warnings:

WARNING: atk-2.32.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-meson.build-enable-introspection-for-cross-compile.patch
patching file atk/meson.build
Hunk #1 succeeded at 137 with fuzz 1.

Now at patch 0001-meson.build-enable-introspection-for-cross-compile.patch

Ross

On Wed, 27 Mar 2019 at 08:19, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> upgrade from atk_2.30.0.bb to atk_2.32.0.bb
> delete atk/0001-Switch-from-filename-to-basename.patch beacuse of this
> patch has been fixed
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...001-Switch-from-filename-to-basename.patch | 38 -------------------
>  .../atk/{atk_2.30.0.bb => atk_2.32.0.bb}      |  5 +--
>  2 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
>  rename meta/recipes-support/atk/{atk_2.30.0.bb => atk_2.32.0.bb} (86%)
>
> diff --git a/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch b/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
> deleted file mode 100644
> index 047e81fb61..0000000000
> --- a/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Upstream-Status: Submitted
> -
> -From 0330251715fee908f2f162565d4fa1df5030d0c0 Mon Sep 17 00:00:00 2001
> -From: Jeremy Puhlman <jpuhlman@mvista.com>
> -Date: Thu, 14 Jun 2018 17:21:49 +0000
> -Subject: [PATCH] Switch from filename to basename
> -
> -When atk-enum-types.h is installed in to a system, the user likely has
> -no access to the location where the headers were built, especially if
> -the software was built in a sysroot environment. If the headers were
> -built for a mulitlib environment, the build pathing may be different.
> -Subsequently, if two mulitlib variants of atk are installed together the
> -headers conflict for no other reason then they were built in two
> -different locations. Switching from filename to basename, still should
> -provide sufficient information on the providence of the enums, while not
> -conflicting for really no good reason.
> -
> -Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ----
> - atk/atk-enum-types.h.template | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/atk/atk-enum-types.h.template b/atk/atk-enum-types.h.template
> -index 7b4cec4..8321c24 100644
> ---- a/atk/atk-enum-types.h.template
> -+++ b/atk/atk-enum-types.h.template
> -@@ -14,7 +14,7 @@ G_BEGIN_DECLS
> -
> - /*** BEGIN file-production ***/
> -
> --/* enumerations from "@filename@" */
> -+/* enumerations from "@basename@" */
> - /*** END file-production ***/
> -
> - /*** BEGIN value-header ***/
> ---
> -2.14.1.459.g238e487
> -
> diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.32.0.bb
> similarity index 86%
> rename from meta/recipes-support/atk/atk_2.30.0.bb
> rename to meta/recipes-support/atk/atk_2.32.0.bb
> index 4e2dacbc4d..5425c8e57e 100644
> --- a/meta/recipes-support/atk/atk_2.30.0.bb
> +++ b/meta/recipes-support/atk/atk_2.32.0.bb
> @@ -30,10 +30,9 @@ EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'Tr
>
>  SRC_URI_append = " \
>                     file://0001-meson.build-enable-introspection-for-cross-compile.patch \
> -                   file://0001-Switch-from-filename-to-basename.patch \
>                     "
> -SRC_URI[archive.md5sum] = "769c85005d392ad17ffbc063f2d26454"
> -SRC_URI[archive.sha256sum] = "dd4d90d4217f2a0c1fee708a555596c2c19d26fef0952e1ead1938ab632c027b"
> +SRC_URI[archive.md5sum] = "c10b0b2af3c199e42caa6275b845c49d"
> +SRC_URI[archive.sha256sum] = "cb41feda7fe4ef0daa024471438ea0219592baf7c291347e5a858bb64e4091cc"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

