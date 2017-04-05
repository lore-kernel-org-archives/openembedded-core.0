Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2F577A48
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 10:06:29 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id p68so984676qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cEXNkpuC1Q1l564ESHs0uEXXpEsIqZoKMvY6Dp1QVUE=;
	b=TwF/M/qXN0BVWqC5ybTSkI9EJ27GEbdCk6Y0tb6cyweFBbcR3ze+cWAl0TazuK7Aam
	OOoC8HT8X7vvaTT8XkU9eYf3gKCDZOTf2nCRMFrpm18xhxI6X+aqjlLxSMbrj9HtM0HN
	E6pnJ94fqk2Abe3/bFlGwBZRV5DKd5s3xg0Tnyk7OUaXBqJ96s+bpH1BMnSg3TkLPHGH
	ZOWxli7ScNzA7X4jKzCq9nrMZMCpyQV66C/VduvLjvr2iiI1Inydgf5uHvbKY/JC2zMo
	Z9Ovjag3lSkKA64Am4riWEd2pAUnaeDpEBM6KOkUIolBA90w6NMuh+JoxPU8+AG3Uaqp
	DDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cEXNkpuC1Q1l564ESHs0uEXXpEsIqZoKMvY6Dp1QVUE=;
	b=h36YeVXsmxK321qz616Du0TviLeeS77UNpA48KxUlBeEt1/VAVlCideiOMwi+qJAMk
	pJJdrNHvHaKk1yHpla+uQrMNrSjQ41uCsd2W3w7Yqv1R+NhU5pN6JOwKTZVuR5Srahvm
	XRnUaJ5C9Lmt047txEDsG++g1x9o2BxeZZZXnnxTsKwCNjDZDSyq+BGG5co3ICK6iJCE
	E7XZnhYUymujSnBfIs1HmOrAzZ6b+vSwAYQTlSq2lQQ1qem8RFpaGKMqdPpzyljdTFkT
	iq9ocWzkZzjfWReO/6TMXcdKBMKsi3+MjqCOsw1oP7OhvoZaThaVcEvldVGpJR4wKuX7
	vcBg==
X-Gm-Message-State: AFeK/H3fk/2lGWi67+hOzaQjjkcxRPj9zRSX954Xp2iHT2iIMs2aUQmKBxA2V5dGavzuXi2owkEbC0uyvdJwgA==
X-Received: by 10.55.114.199 with SMTP id n190mr27810845qkc.229.1491386790270; 
	Wed, 05 Apr 2017 03:06:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.134.130 with HTTP; Wed, 5 Apr 2017 03:06:29 -0700 (PDT)
In-Reply-To: <d6b2737e706f743644df63f21a8f061b9e2f83c7.1490850708.git.Qi.Chen@windriver.com>
References: <cover.1490850708.git.Qi.Chen@windriver.com>
	<d6b2737e706f743644df63f21a8f061b9e2f83c7.1490850708.git.Qi.Chen@windriver.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 5 Apr 2017 20:06:29 +1000
Message-ID: <CA+aJhH1JjWONYpOFi8S4QsDzUdfoPSJS_0FZf=5dQTm-O_4wEQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.inc/qemu.inc: preserve directories to be used by runqemu
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
X-List-Received-Date: Wed, 05 Apr 2017 10:06:29 -0000
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 15:12, Chen Qi <Qi.Chen@windriver.com> wrote:
> The 'recipe-sysroot' and 'recipe-sysroot-native' directories need to
> be preserved for runqemu to work correctly. Otherwise, when 'rm_work'
> is enabled, these directories are removed, thus causing errors when
> using runqemu .
>
> [YOCTO #11266]
> [YOCTO #11193]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass         | 1 +
>  meta/conf/machine/include/qemu.inc | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 405fd73..cac3a5f 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -8,6 +8,7 @@ inherit ${SDKEXTCLASS}
>  TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
>  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
>  POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
> +RM_WORK_EXCLUDE_ITEMS_append = " ${IMAGE_RM_WORK_EXCLUDE_ITEMS}"
>
>  LICENSE = "MIT"
>  PACKAGES = ""
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 0e4103b..8345c08 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -29,3 +29,6 @@ KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
>  MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
>
>  IMAGE_CLASSES += "qemuboot"
> +
> +# These two directories need to be preserved for runqemu to work well
> +IMAGE_RM_WORK_EXCLUDE_ITEMS = "recipe-sysroot recipe-sysroot-native"

Should this be setup by qemuboot.bbclass instead, so that it applies
to any image/machine (even those that do not use qemu.inc) that is
intended to be used by runqemu?

Regards,
Nathan

