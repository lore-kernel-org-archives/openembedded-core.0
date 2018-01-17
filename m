Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4342678726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 21:31:14 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id t16so6786465wrc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1t6jXl2qoeJ3H4ipZ5nX9e+7vaz8y+RkiuT55d9uHe0=;
	b=eNfEtu0mHqGHXUeF5iLlI7oRoCPrXPJbTMcXsLZ/CnbiyHN1wSELO34fAtcSNWt2QU
	5mNDlXnGAXo4pkAftj+BBiBZ7sgnehrD/76tYxpTZnMNZM5c0vKtjUy/6q6OxayBSq56
	1Dv9/GW1m8hqDxiPhu30Jf8dnAFMriU8b7wxOqjDZMPZZrTzmw6ylFO0Am7UUaM/EnjP
	2dt+gPSvhUoCYro5qNKEXTI1MeV7PRD+UCayIfr8Hn1mA8TxNsFYyxwa0FqmMvK78IyI
	5kRmku0WHh/YPKwyDFcuE0DXOisc5OF9OMTmXEHuq83BOWWBaGEV1HxExthI1IZuAPjU
	z9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1t6jXl2qoeJ3H4ipZ5nX9e+7vaz8y+RkiuT55d9uHe0=;
	b=jQ/FhtGeGh4y+0zVT5OCwqAkYjW3iBkSWLQzY+bl3LPZb/rquyvnAnWB9oW3L3L0oj
	Z1IPU067sX1YRQnJB37jTwOq6jPtM+jmdhDQlMjnP6+fgWZk27sKikOs5Dk5uzghie7Q
	xQRvYyIOLp/Zna/hyyXLUke1Qo3Y70ZSSVWRyAOxFITqQQdr/az2FGeU/Nmjijvj5/D2
	8MiA2cXJfJoG1mcV3LJvUtw5R6YuW1h3axISDyYhCH3Rshpew4vrS0Pg21OUe9hBL0K2
	/7+SfojuEeWqTlulUL42fvJQw3ibydNu6oX2XojlHxBdn4zW0wImx4NLVE4n3lFbZXF7
	BFoQ==
X-Gm-Message-State: AKwxyteersH0gew0MhJiVy1SnMvGyvEA2rDQk3sbYQi9CYwcdLSkx2MZ
	nzSEzXvSlYZatuc8CFczGaC+lGU49LHAQQhWSs7YNQ==
X-Google-Smtp-Source: ACJfBovxdmOGK5b33xlaaTRNj9h4fqpwz/92J/d6GuMLtvmqz1RU8qvyJRDCQCUj9Kdh5wgZUujpO0lsP3Qfi0faBjs=
X-Received: by 10.223.198.20 with SMTP id n20mr3864252wrg.191.1516224676002;
	Wed, 17 Jan 2018 13:31:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.190.132 with HTTP; Wed, 17 Jan 2018 13:31:15 -0800 (PST)
In-Reply-To: <20180117092159.19356-1-thomas.perrot@tupi.fr>
References: <20180117092159.19356-1-thomas.perrot@tupi.fr>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 17 Jan 2018 13:31:15 -0800
Message-ID: <CAJ86T=Va5HE+zYpKS29jfrB3R=yqTR1vkZuxmk21Uc_qQSzr4g@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use KERNEL_IMAGETYPE_FOR_MAKE in do_bundle_initramfs
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
X-List-Received-Date: Wed, 17 Jan 2018 21:31:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 1:21 AM, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
> In the case of a fitImage the this step should be done on the
> image use to assemble the fitImage.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index c42f85c665..ff09d4c4c7 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -231,7 +231,7 @@ do_bundle_initramfs () {
>                 copy_initramfs
>                 # Backing up kernel image relies on its type(regular file or symbolic link)
>                 tmp_path=""
> -               for type in ${KERNEL_IMAGETYPES} ; do
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do

The net result of this change is to no longer backup the non-initramfs
vmlinux.gz kernel image before creating the kernel image(s) containing
bundled initramfs (plus some other corner cases, depending on whether
the legacy KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE variables are
used and whether or not KERNEL_IMAGETYPES contains both vmlinux and
vmlinux.gz or vmlinux.gz only).

Can you explain a little how that's related to building fitImage kernels?

This code in do_bundle_initramfs() is extremely fragile and changes
may only break less well testing targets such as MIPS, so any changes
need to be very carefully reviewed and tested.

>                         if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
>                                 linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
>                                 realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

