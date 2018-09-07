Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC8BA79703
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 22:10:10 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id i4-v6so13106717uak.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZEnjnDMt54fDeH1aLrO2Phs6rUnavTzYMcWYaE+VafU=;
	b=Iok+NZ85sKhXiU1SsBwRinsoKm0o9tuizT1wsl6rfQtyByRH6BaD8+flEXqtPV2sf2
	v5RurK3yJnYS4y1rezudGvvJROcXflW6MCNSBM2YSU5EH3lFDlqOBCp6nS5toh2vJHSI
	XGRpRMLSuufmeBpt9cnCM0UQ7bBED6Z+yb4ItDdW6J9WOLUBwYRZuv+NEiyXMYi9A5KX
	0UciEFAa6AA4bL9GrQyV+pjAC1doECzB+z0aIeqP1oExGlOs0BGYS2tEg+WiBYDve6iP
	0r9WJu9TeGmGUKznpVqyBV6buSV1fCVvg9S5BC9MS70I706VzL7clOclHgPNaWsSZwbm
	/HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZEnjnDMt54fDeH1aLrO2Phs6rUnavTzYMcWYaE+VafU=;
	b=LVDdL/6zbmhEkQbMatmy6c42Nk6MVKfY4Qecnop3N93VlQJ0hf8maPpuNz+cFb2hrI
	rr/VShP+k0fzdDm951XKZUA0ZSUAqVbXWQ7K5WN4wm/VBZmWh4/PIBRUoXkM9efTPitO
	hCtM5k6w/BjZbhFgqIo0WA/OqQV9iSVrXMgh3eW7yRAA8DksCp5g9c2zdzt1NIfF4UdR
	DGH6fcoFcllCppNQq4OudlGVtiVSWsRyHYguqQLQGkcippDrkarOAbQXiKMHCPVVLXsi
	MyknCqkyzZ5c6z1jbgGQmco7UyZwR4xF0nZYPi5WCgFllmYArDh7vYPV49qLLwpnefvf
	ITlA==
X-Gm-Message-State: APzg51Cir6EymJ6a48K00U381hPhCOKJeTgDHJZuXq74zY0LsnqmfwHt
	kYZM9qYR3LgLIe8LikE094PTZjf50fqsVsgErQGfPA==
X-Google-Smtp-Source: ANB0Vdar4z64TlNt+SapARTIu0rBpfJ6Vi7QfAPJJRxs0bAan3SZzv5H9EvV4AuCoJ4LwLGfr7QcvHvMIIROviofTvE=
X-Received: by 2002:a67:3dc2:: with SMTP id
	p63-v6mr3474239vsi.51.1536358211561; 
	Fri, 07 Sep 2018 15:10:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 15:10:11 -0700 (PDT)
In-Reply-To: <1536267962-5562-1-git-send-email-leon@sidebranch.com>
References: <1536267962-5562-1-git-send-email-leon@sidebranch.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 7 Sep 2018 15:10:11 -0700
Message-ID: <CAJ86T=V0fn4Mgbz0zsoVPjeW-gYutSj0zLHb7K1wefQPtB44fA@mail.gmail.com>
To: Leon Woestenberg <leon@sidebranch.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Fri, 07 Sep 2018 22:10:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 2:06 PM, Leon Woestenberg <leon@sidebranch.com> wrote:
> kernel-fitimage.bbclass replaces an occurance of "fitImage" in
> KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
> architecture (such as zImage). The kernel-fitimage.bbclass packs that
> image as sub-image in a flattened image tree image (fitImage) and
> deploys this fitImage along with the image tree source file (.its).
>
> kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
> also contains "fitImage", which kernel.bbclass will also deploy
> redundantly with different naming.
>
> The result is a dual deployment with slightly different naming,
> each with a set of symlinks.
>
> The solution chosen is to have fitImage deployment be handled by
> kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
> types during deployment.
>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> ---
>  meta/classes/kernel.bbclass | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b57832c..5d168e8 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -669,8 +669,11 @@ kernel_do_deploy() {
>         fi
>
>         for imageType in ${KERNEL_IMAGETYPES} ; do
> -               base_name=${imageType}-${KERNEL_IMAGE_NAME}
> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
> +       for imageType in ${KERNEL_IMAGETYPES} ; do
> +               if [ "$imageType" != "fitImage" ]; then
> +                       base_name=${imageType}-${KERNEL_IMAGE_NAME}
> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
> +               fi
>         done
>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>                 mkdir -p ${D}/lib
> @@ -686,12 +689,14 @@ kernel_do_deploy() {
>         done
>
>         if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> -               for imageType in ${KERNEL_IMAGETYPES} ; do
> -                       initramfs_base_name=${imageType}-${INITRAMFS_NAME}
> -                       initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
> -                       ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> -               done
> +               if [ "$imageType" != "fitImage" ]; then
> +                       for imageType in ${KERNEL_IMAGETYPES} ; do

This looks odd. You test imageType before the for loop which assigns a
value to it?

> +                               initramfs_base_name=${imageType}-${INITRAMFS_NAME}
> +                               initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
> +                               ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> +                       done
> +               fi
>         fi
>  }
>  do_deploy[cleandirs] = "${DEPLOYDIR}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

