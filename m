Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 078D179E88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 16:48:31 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id q1so10961174qkf.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ySgC27GjqgamQI21/l9XXtyINiGH7sMsN8Dup3+AiwE=;
	b=ka7opL0qXizDAlm3rLLRJiAyyEpj963qySrrGydcxZi+7nTnQhLiMAb4EmguIboJi4
	ej338DX1eylROgaDLUZAjmHLwxrmtn+6eJSCta1WpRk4Xg74C8TCsWZ5XQll5S9n64g3
	XVoouTPEfJZXZe07yto+LwUItdXqV8A7jLgVbIUgrJ9zfGQX2wAes9vuA3WQwdAKjjZv
	GIYEgyyDHWivAfW9L1LRzNci/6hNSioCHCTYX7fKSCtzsskFhUSMVJO7NcgkHx3L1j70
	ND1HHcbjjKZnhM2bEsb7gx55GtnmRVmq/smprLCEQTACE1yARBx5HJUjODHGpKzWZZdU
	QMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ySgC27GjqgamQI21/l9XXtyINiGH7sMsN8Dup3+AiwE=;
	b=Wi1VA1B6LEY9VewgHVBfKpNZmCB4bhTIRDcteeuPFWfCYY7CY6T9mGSxkfjUcGpT9k
	/x4Raswuosy0JjdJ1GhuEZV1h+WBzTEvTbMe2kmzl9O6mVWHnzXLEn15WOccKgVatt+/
	jfBR3W/Vgqzj1GRscvr6X4Qdd1qnxD+AYWUOUhsCef9GtWfwS0b+ahY2p9SrDUcdmjZD
	RT+4ovD9j36QJbmDo1g9yhWgziWlotT6W/YeZFb3IKwig8a3dojeUusijy3oEt0qeibP
	/O0moxHEVpWA8XpxvIHISR0VtFKWSoj1SzSIKmtyIKIKY5aDTWRv/Fc2ag4tTBh3Hppa
	d3Bg==
X-Gm-Message-State: AGRZ1gLHNGdF6MlEMEdde9WjPo7xLcqXNndbowwo2gIfN82mnOJ3uUkF
	Ay/ggktkUoInsTbiPPmHW7yeQAnVKj7hhEI2yuY=
X-Google-Smtp-Source: AJdET5d5zCGLHN7MxZfz6TwuBTWAutYQFTRMtVRmNJpJF5yL1ccihY7Tcj3x3qlmRJCGwfJ6QRWv21WTeAI3MgR+wsE=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr7459051qkm.102.1541090912513; 
	Thu, 01 Nov 2018 09:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <1541090053-1643-1-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1541090053-1643-1-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Nov 2018 09:48:06 -0700
Message-ID: <CAMKF1sqGsD3kF2afg=PPdry-3AeP0yFHh49zKNN+t=J8A3L9Wg@mail.gmail.com>
To: serhe.popovych@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [[PATCH] libgpg-error: Support build for native on ppc64/ppc64le hosts
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
X-List-Received-Date: Thu, 01 Nov 2018 16:48:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 1, 2018 at 9:35 AM Serhey Popovych <serhe.popovych@gmail.com> wrote:
>
> Both RHEL and SLES uses ppc64/ppc64le for powerpc 64 bit big/little
> endian targets instead of powerpc64/powerpc64le in libgpg-error.
>
> Also libgpg-error provides common target system names in form like
> <arch>-unknown-linux-gnu.
>
> Add mapping for ppc64/ppc64le targets to their libgpg-error equivalents
> to fix native builds.
>
> Cross build for arm64 tested on IBM Power 8 machine with RHEL7 for
> ppc64le variant only, but should work for ppc64 as well.
>
> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  meta/recipes-support/libgpg-error/libgpg-error_1.32.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> index 4f3e3d8..8fc95cc 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> @@ -48,6 +48,7 @@ do_compile_prepend() {
>           mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
>           mips*)      TUPLE=mips-unknown-linux-gnu ;;
>           x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
> +         ppc64*)     TUPLE=powerpc${TARGET_ARCH#ppc}-unknown-linux-gnu ;;

if this works with dash shell then its ok. Otherwise just being
explicit might be better and do we have a variable to indicate
endianness in siteinfo bbclass called SITEINFO_ENDIANNESS

>           *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
>         esac
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

