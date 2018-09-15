Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9EA274AF1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 17:45:58 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id d1-v6so1542172vsm.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TjCGkRt0+HInEZPL8qk7YVdx24k0hJZAgw6YsbNgJyo=;
	b=RBFDewl0yvByPIK8gllBhYr9mMLepf9g8MsvQ+YhThZwBIilnBoBaX16lJ2MU/7fj0
	YaqWHWSNjOCrjSgiQtpwA1IoRD0GN0GhQ3wQZewmHp6s/VSbQS55jc1HccUtC0LUEQZB
	ZtP7tfKIpYtDrFAX9b9gzZvdIKZhNEQqYO6ePXXoxb55C0YVlqLpmvto36GyRkmcmjzD
	IGVa0N5weS8AjJpPpF+4ZeN2MLtvvo1DSxo8sEXpAtVyD34fCDaVFc1QkT6kuE8PkkTY
	YZbCaK/Q41PJhE+P3YPqDGoKafdNkRN6OTtbJemu/NDbWzTeSINmm8inSyKo919yvSS3
	lNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TjCGkRt0+HInEZPL8qk7YVdx24k0hJZAgw6YsbNgJyo=;
	b=cYE0JCx/6FsZ6A7bq1Ll27l+8IGgnl+qFkSHnPOmOV+XBg0H+lNbC/2kP+7L0/HHNT
	b7b3jNJSm17MMYavRM7eewo/QxwUHw2M/fekqU9BPonwI3lvTRuND/X2RlnDcY0TNKT1
	u7pLCS1Kna0wHkql7jOl6LREuO8kVsDEPZ5qdgL5fzUlL8YdSwjnEl+JFa86o93A9IfZ
	5n9cgQMFTkZQ9c11V3mIO46LMC4Z50jP82/lZmXI0ERjXrkLvobE5HdddvtuByktRIM6
	76EABZgKkmcFbtZfs86q/swlQSx0lIYH+xA8Pjm8tG/z9gHHH2rXjcVShGkWp+uRhFZZ
	LKow==
X-Gm-Message-State: APzg51CDd50YtB2wSKP37Y221tw4XFp0Ft6dnr+eUqer4dy0rV40gy1e
	emS/3QWv9sNcld68AHt7ystPiT4+GdoIiEhqZ4OyqUEl
X-Google-Smtp-Source: ANB0VdbEQdz5B3z8fk2bjSnfLcXcmPZ1BGZcJ7dQ9EhdlHUQKiorLe1smGviO20N06Vjor3T65CHS3STqYk8oh6OxBU=
X-Received: by 2002:a67:80d2:: with SMTP id
	b201-v6mr5434466vsd.5.1537033559429; 
	Sat, 15 Sep 2018 10:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
In-Reply-To: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 15 Sep 2018 18:45:48 +0100
Message-ID: <CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
To: leon@sidebranch.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Sat, 15 Sep 2018 17:45:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg <leon@sidebranch.com> wrote:
>
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

This looks completely plausible, but the two "FIT" images that are
installed aren't identical... after this I end up with no FIT image
and only a bare image in the deploy dir.

Digging into it, the logic between the two classes is a bit odd... in
the case of a non initramfs build, the fitImage is actually installed
here. The one that's installed in kernel-fitimage is the bare
linux.bin, but named fitImage-...

I'll send a patch reverting this and removing the other one as I'd
agree that it appears to have no purpose (and if you did want it, I
guess you could list it in KERNEL_IMAGETYPES).

> ---
>  meta/classes/kernel.bbclass | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b57832c..1f69091 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -669,8 +669,11 @@ kernel_do_deploy() {
>         fi
>
>         for imageType in ${KERNEL_IMAGETYPES} ; do
> -               base_name=${imageType}-${KERNEL_IMAGE_NAME}
> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
> +               # kernel-fitimage class deploys fitImages, skip here
> +               if [ "$imageType" != "fitImage" ]; then
> +                       base_name=${imageType}-${KERNEL_IMAGE_NAME}
> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
> +               fi
>         done
>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>                 mkdir -p ${D}/lib
> @@ -687,10 +690,13 @@ kernel_do_deploy() {
>
>         if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
>                 for imageType in ${KERNEL_IMAGETYPES} ; do
> -                       initramfs_base_name=${imageType}-${INITRAMFS_NAME}
> -                       initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
> -                       ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> +                       # kernel-fitimage class deploys fitImages, skip here
> +                       if [ "$imageType" != "fitImage" ]; then
> +                               initramfs_base_name=${imageType}-${INITRAMFS_NAME}
> +                               initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
> +                               ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> +                       fi
>                 done
>         fi
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
Alex Kiernan

