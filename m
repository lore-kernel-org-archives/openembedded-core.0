Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7674374535
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:59:55 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id s23-v6so3008408vks.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kX1U3+2Pfadiek1A0ebyrDVfdCVTkbBLtjBI76tjTRY=;
	b=r7vFlLKe57UP+gbfKpgF4Y3tVtBpTJybWIFnxNC1XwxLfGB1L/BTtWsZ78gmAq7bYs
	uK7JQ9iwlMDjSEPtdF4a89Bek6zeDePSuB7pfGXAAQzLrnzs8i6NO0frsRdeVmVtWuRl
	tvpz2iUNNjdipXL2kRuPUZf26a8isTTy8/OfTQgGUMQIKYkyPJU9FFHrpHD7ggG8lJd4
	VsBMCSVQA8buM1b7Oizs0/WCa6s5droGex0j7LlOmF0NLm+TwxQSIx4iLE7IfXX6WgjF
	zn9EM74NKS+3XPcSXaiUvcUr3QIyEw6h7+A9yjTBb/ycdHsLtsFKqmdwpTXQUrkhwmhf
	+PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kX1U3+2Pfadiek1A0ebyrDVfdCVTkbBLtjBI76tjTRY=;
	b=PPhKQ4WRx5GLfiCvH4hLW4r8m8q/ES/cavrP0Rqh7TQ3vaya5hquGIJLfHNdBavrjO
	lTEYl5x4SlHqh4wLLHOYV4zdi9aMCkzCCuC7uBWNdJX0WWy0WQFaaT3MYPAMCJ0HCRGy
	yN1znRZD6jDLi1rKUaUyOU8xs7DHVQguE6cCD5hN0SI5NkRZ/taK+Wqm+Jp7BrFXtVE5
	3h6a93fNyXhv98+RHvL1gvIM4xgtZMz+RCZSrSed3mf5NSrAyke5GsMPEcxH/NosX9VJ
	6WXYBmf9DWCNFXo37H1DehBvXFflTQlDs8nu8e2HL8cF5qRTOEpEY3+/b7QGp9YjC6WK
	Wrrw==
X-Gm-Message-State: AOUpUlEbeMx736uyJbnRdNWUqEJPrt/XVMvucc0tlB5FqWlq39O7gV9a
	tkU6sS8MZ9wlgiqV1jfhxItPXhL5uuUviI8JY+BMzA==
X-Google-Smtp-Source: AAOMgpc5hrEHlu6eGQSJIdkmg5omR/tONXq4sGj0bHajS/k82Rp7UvDltODkEl+Dpt21qTCvvhfd4MGedvDOxtwocBc=
X-Received: by 2002:a1f:ce03:: with SMTP id e3-v6mr4864728vkg.22.1532721596383;
	Fri, 27 Jul 2018 12:59:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 27 Jul 2018 12:59:56 -0700 (PDT)
In-Reply-To: <1532696872.1070.2.camel@silicon-gears.com>
References: <1532696872.1070.2.camel@silicon-gears.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 27 Jul 2018 12:59:56 -0700
Message-ID: <CAJ86T=X+0Y1QkHJkgd3ajbnwhKALNkFq5+9wpO4daYmMhs2uQA@mail.gmail.com>
To: daniel.gomez@silicon-gears.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] Check libcc1 directory before disabling hardcoding of RPATHs
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
X-List-Received-Date: Fri, 27 Jul 2018 19:59:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 27, 2018 at 6:07 AM, Daniel Gomez
<daniel.gomez@silicon-gears.com> wrote:
> Check if libcc1 directory exits before disabling hardcode_into_libs
> configuration because of broken libtool in gcc recipes.

A patch for morty should either be a backport which has already been
merged into all applicable later branches (ie if the same fix is
needed in sumo, rocko or pyro it needs to be merged to those branches
first) or it should explain clearly why it's only applicable to morty.

> Signed-off-by: Daniel Gomez <daniel.gomez@silicon-gears.com>
> ---
>  meta/recipes-devtools/gcc/gcc_5.4.bb | 3 ++-
>  meta/recipes-devtools/gcc/gcc_6.4.bb | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc_5.4.bb b/meta/recipes-devtools/gcc/gcc_5.4.bb
> index b0a523c..9da8ece 100644
> --- a/meta/recipes-devtools/gcc/gcc_5.4.bb
> +++ b/meta/recipes-devtools/gcc/gcc_5.4.bb
> @@ -9,7 +9,8 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
>  do_configure_prepend() {
>         # Easiest way to stop bad RPATHs getting into the library since we have a
>         # broken libtool here
> -       sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
> +       if [ -d "${S}/libcc1" ]; then
> +               sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure

Missing fi ?

>  }
>
>  BBCLASSEXTEND = "nativesdk"
> diff --git a/meta/recipes-devtools/gcc/gcc_6.4.bb b/meta/recipes-devtools/gcc/gcc_6.4.bb
> index b0a523c..9da8ece 100644
> --- a/meta/recipes-devtools/gcc/gcc_6.4.bb
> +++ b/meta/recipes-devtools/gcc/gcc_6.4.bb
> @@ -9,7 +9,8 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
>  do_configure_prepend() {
>         # Easiest way to stop bad RPATHs getting into the library since we have a
>         # broken libtool here
> -       sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
> +       if [ -d "${S}/libcc1" ]; then
> +               sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
>  }
>
>  BBCLASSEXTEND = "nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

