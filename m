Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D57867C75E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 09:05:56 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id z131so14078013itf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 01:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uP4lBFzm+1owGmrKWXZTzbzv6SwsRrpVB77UzG4kius=;
	b=lqCez7/kDK4J71PU2a2G2P7+gMUI/kNcGykHmTaD1ujGAdV5uKa2xGs1BnCT71qTvl
	x/5NhKSDIFxG2oxkT9j+kNlEYWjPOyVydoFJpk7CWHh2RWeRLg4ucXQJ0ICwLbQgvSSF
	35P8Ztnhqs7xlMiQYqB494y6csx/z/47RiHfRD0mlOBSxBQeB+7r8qoiuv1cL/yn6od8
	/5PXd2Q1Lqbsunwx6QI5YasCBYfpYgPnwtM50gF8TQQ7C2oNbRnuQE5ZTRRONIofKmvW
	u8qQZ3JhIb7Ew3L+Ji7U69XGV6IlKvJClwc+rT6O634c54meBDgevvIG3rX5Ah1juovP
	nL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uP4lBFzm+1owGmrKWXZTzbzv6SwsRrpVB77UzG4kius=;
	b=HRKlndcJiURpG1p40kP0ixCDbVMiodpgyW78+Jx7+BnYYtYC3Tu86le1p0iHUXNWW+
	ghxboaymSXD0G/3n2GHsINuKJbb+eKEDsEw37Tup5CqFjCuaaZCT4i4r5mgOyn9GXD2C
	x08sFQV6mB8ZeNO3NXjI60e9Y7Gue01sdSY5893DriXpEnqmsffCmCIUvZnfY/oZLQaO
	O0umn8lOz0RenQXw2NoxOOtbn6AYWPoLqMgEznvjc52bFsg8NKE1JbrmfbxP6BIJXORa
	dqVxKEql0/gVnI1twlBdGGiTpTvo+Cwx6JBnQ79WDkhyedxLae7KSpO2svY2oFEwKSTU
	IRuQ==
X-Gm-Message-State: APjAAAW+LYPLvzPcc5I+UX76UPKuONO/Bulgp/0AW4ps6mn6nZ92knQP
	SKvl40WZR7VpopDl2EyrBfOLS52PEHCvCWiizqJ2Iy1C
X-Google-Smtp-Source: APXvYqy2Xu7DPdN4Ra1uCM1O0q17uC6nFvf0ZT/uF4AqTNoSHbMZy89bLHxHQ/qudryJf21PwEZQubnBCtPEPTOpsoM=
X-Received: by 2002:a05:6638:348:: with SMTP id
	x8mr7064636jap.79.1551949557833; 
	Thu, 07 Mar 2019 01:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20190307065138.54589-1-zhixiong.chi@windriver.com>
In-Reply-To: <20190307065138.54589-1-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 09:05:46 +0000
Message-ID: <CAJTo0LbsGET5t6AyfgfQ2L=jR01g+uM8Ec0FA5L5nxpchGd49g@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-minimal-initramfs: add libgcc into the initramfs image
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
X-List-Received-Date: Thu, 07 Mar 2019 09:05:57 -0000
Content-Type: text/plain; charset="UTF-8"

Wouldn't it be better to add that dependency to the packages which need it?

Ross

On Thu, 7 Mar 2019 at 06:53, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
>
> Add the libgcc package into the initramfs image to avoid multithread
> function error in the userspace(eg: pthread_cancel).
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 7df8ab1ebd..3cf2c7b01f 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -11,7 +11,7 @@ INITRAMFS_SCRIPTS ?= "\
>                        initramfs-module-install-efi \
>                       "
>
> -PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
> +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd libgcc ${ROOTFS_BOOTSTRAP_INSTALL}"
>
>  # Do not pollute the initrd image with rootfs features
>  IMAGE_FEATURES = ""
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

