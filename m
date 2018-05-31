Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2099774F01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 18:00:18 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id o138-v6so3787617vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 11:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pS9f5wBcSnA+MrXMJD3Rtva0qFiTRwA1Tghh3Yb5Z7g=;
	b=PRamREPW/mi4AbTu8sfIcXQJW6kelexJt142YifihrcD4mpLXvnPZB3VAG8O7SjVWl
	g6BeOGz0hYcpf27wD5mdjJKhVlQ05khFv+1LZxiu1bx35OSZCfPoFE1miMhI/A8BNqTb
	Ij3sd0PXcJ1WQOBr+PXcBIax9VqPMbmQl2EYfLXVdXOb5STKjFbKnqe8C6Ndl2etB3Fr
	lv/36nldPL1rF6QTNxn0gcaGisEXOtBPNlu0QGjjoUiUFXPx2TJmcWQEjZOfckyKVm22
	alpSBPM6jrJGNuJsA08INLT1f1TEX7Fl1kGv++Bqc8iLJoxytfgcTWbkX8vlqxiojbzn
	YoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pS9f5wBcSnA+MrXMJD3Rtva0qFiTRwA1Tghh3Yb5Z7g=;
	b=qtobFNOrvtTF87Gdp0nnpO6UX/Aj5nldkZM5W9l8LDu/1bV9mephQ18CeqUaFvuHRi
	xFjLQhOEIfZ/sc+I5SOvP26ZorN2K92GPNBuZZ2Le4T1rsL6nInjXVKn6PEplw+adFlE
	ZZ1a6VJQzyBhr363MkWqoJzihyPYq55QqxImlgHBgwBvWj9GEDTdAdmOIq5d7UHIyrsK
	33Z56ySkv6Mso7/CcIVxeeJFCQNOZr/N7ceEHuU4KFDHT2J775dt76iOCjWQg5w32sqW
	ujo3gcjEKHZqIR4iyFBmuhCxoH31kzCfuvXsoZ833DdcjNVHIAr8Z42WpxA1kypEZSBH
	rAdg==
X-Gm-Message-State: ALKqPwcIa4Gi58uUoclnala/PQImev4olBHHaJoWP7aZ22dJ9me1t9dD
	hNcQTcZUUOecse0uW2zjtczTzaLfo7VZxFRpljA=
X-Google-Smtp-Source: ADUXVKKunZtHlpmY2BS0BXRMRZerOStfEG2C0y0NTjHY91ZHiHBqmQCN2e53dimAjcbSRS8oO8uLnstmPNc+rn2V8MY=
X-Received: by 2002:a1f:e9c3:: with SMTP id
	g186-v6mr4715796vkh.194.1527789619453; 
	Thu, 31 May 2018 11:00:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Thu, 31 May 2018 11:00:19 -0700 (PDT)
In-Reply-To: <1527756958-16824-1-git-send-email-liu.ming50@gmail.com>
References: <1527756958-16824-1-git-send-email-liu.ming50@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 31 May 2018 11:00:19 -0700
Message-ID: <CAJ86T=UsqCs=O8SqTaS5qrKcShkzr0emc_i0W+OcSsvT_pNskQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devicetree.bbclass: replace KERNEL_IMAGETYPE_FOR_MAKE with KERNEL_IMAGETYPE
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
X-List-Received-Date: Thu, 31 May 2018 18:00:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 31, 2018 at 1:55 AM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> It should be KERNEL_IMAGETYPE rather than KERNEL_IMAGETYPE_FOR_MAKE to

KERNEL_IMAGETYPE is a legacy variable, in the process of being
replaced by KERNEL_IMAGETYPES. You should probably use the new
variable if possible.

> be handled in do_install and do_deploy tasks, since we are having some
> special logic in kernel-uimage.bbclass and kernel-fitimage.bbclass to
> replace the real kernel image types during do_compile, like:
> in kernel-uimage.bbclass: uImage -> vmlinux
> in kernel-fitimage.bbclass: fitImage -> Image/bzImage/zImage...
>
> but the final images to be installed/deployed should still be uImage or
> fitImage.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/kernel-devicetree.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
> index 4f80cc6..04e6321 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -63,7 +63,7 @@ do_install_append() {
>                 DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
>                 DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>                 install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
> -               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +               for type in ${KERNEL_IMAGETYPE}; do
>                         symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>                         DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>                         ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> @@ -82,7 +82,7 @@ do_deploy_append() {
>                 DTB=`normalize_dtb "${DTB}"`
>                 DTB_EXT=${DTB##*.}
>                 DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
> -               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +               for type in ${KERNEL_IMAGETYPE}; do
>                         base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
>                         symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>                         DTB_NAME=`echo ${base_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

