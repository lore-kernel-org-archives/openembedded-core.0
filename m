Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A92C7E418
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:03:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so3777709wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F8Jx3T6szx95IMGR1P7P1wTa1sS9bJXw2Z6r7mow+Pw=;
	b=hsC/z79Deb4XeIppGT+KnaTVQI+q6OnO3ZZj6WJj8LxoeXgV000Utw74Atq1+4NvAR
	YS5oxFC5KcxsgPsiUInDa+q7glRZYl2VDwAActSAv0GYEXE5UrFPfkJkJgJYaKNltKQh
	8BtG9TGC8JW03YV65nu88auMBdBfkJBvk/dysR6w/YZy1BvyDkuA6UmO7aJSrwcsI7+o
	AlYkX+Ct/+3/8KDaBIARs8wxopjLzQdf25TBQg3A03yaupHHZsp63u8u05AyD0zqOVla
	vgZxajLwfAVjgT7h75VYJywTtZgbMEtgeoCcui/AMmIix96+G9pDQSfPpUFhi20FMNe3
	TQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F8Jx3T6szx95IMGR1P7P1wTa1sS9bJXw2Z6r7mow+Pw=;
	b=speygavdEE7X4MsyAENrWSLDu1rSmSRqsvKcGf4aZFpUnoAj33NYutF28p+FQwFran
	B38mllFJHrvUCb25u+3ADqmx57CoQyabntKE13dpmMwhWbg2G5hXi6wMXh8e/1MFEW92
	gamTqml3yAMhbNQM5CmCewA8q0gHVbLjPObs9ODz6HwmcJ+qd3SYIhabXf/NQ9ZpIxnq
	X+1iQN53CLAvaPz6gUS5NkSNgjnMm6Wn4ORBLulmol/F0QSZO9k3Cm34id266XDVFo+K
	aM4FVIF+jw4kni+/zXzJXJlqC3Jhej0vUsaGTvAA3CfEdVmypec47PPjGTY3hkfa4+re
	KNTg==
X-Gm-Message-State: APjAAAVcV5dCIoKsyjrNFJFV2hOAd71tYmuYPNAtYoPeylDl2F+aR0c4
	ZhrghzvMD848E0OKDANXvdsXsv07pKi+VI9TgDM=
X-Google-Smtp-Source: APXvYqy7713FZQ4yE5+cYIw0qiVfgwuPLZ1nrX32RYbyC8tERuGCUYgoVtvIzuQq6tjodP1OzkXg+5rQ0oe5SdG1S98=
X-Received: by 2002:a1c:2082:: with SMTP id g124mr2157143wmg.71.1559221425840; 
	Thu, 30 May 2019 06:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<74d2e3a8ebd01013d2fb417670ccfb668974cb95.1559220004.git.bruce.ashfield@gmail.com>
In-Reply-To: <74d2e3a8ebd01013d2fb417670ccfb668974cb95.1559220004.git.bruce.ashfield@gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 30 May 2019 15:03:33 +0200
Message-ID: <CAAfyv37+CXbvBF6D+G00hBSH6t_OmKLNWpL_JuMQFt+_V0MZDw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] kernel: package modules.builtin.modinfo
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
X-List-Received-Date: Thu, 30 May 2019 13:03:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 30, 2019 at 2:45 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> As of commit 898490c010b [moduleparam: Save information about built-in
> modules in separate file] (kernels v5.2-rc1+), modules.builtin.modinfo
> is generated as part of the kernel build process.
>
> We package it along with the other module artifacts, so it can be used
> by scripts/other build steps.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
You can add my Tested-by: Marek Belisko <marek.belisko@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 437b8c7671..111a0b2eeb 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -558,7 +558,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>  # kernel-image becomes kernel-image-${KERNEL_VERSION}
>  PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>  FILES_${PN} = ""
> -FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
> +FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
>  FILES_${KERNEL_PACKAGE_NAME}-image = ""
>  FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>  FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

BR,

marek

