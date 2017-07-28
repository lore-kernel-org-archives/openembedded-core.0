Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC9B78585
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 23:47:39 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o33so20004618wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 16:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WL24TM32BaZ3eo8GUhA1FShlRiYGD3n/TeO34NxZUqc=;
	b=WtSEDaPEk9PM22HA5BSIWsYzvje2JdlhADIX4ToR4evBCw7L4hbEgzQrCX08ADxlhO
	V+j8eU6eC0Lrc9E5BUuqrQs3UsxoCiddaDH0RTZYdAJAIPkequZYxJe5o+Q9Xjd704OQ
	uTDIPZZPdhtdG4CdXT3m7ViTGJUCCch/SWV497aIsi3gI/dNmFKamJBoS3YGIIKY7fL8
	ofFFJ1TVFVxoEvDcVF86YRYxHsWk+hhSpzfUEE7yYN2oP34k0I+MdJBzLmYSPFF+nwMf
	/R0sLuKLKF5D+PQeG4DGXcMByB9ZUo2gEktt0yz6Wd2Tvaulsi00WXUxHP7SypfF5C4m
	TzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WL24TM32BaZ3eo8GUhA1FShlRiYGD3n/TeO34NxZUqc=;
	b=emjQic7Lm016akCWazWU4MEoqYk2xbf34ocNkQwcOufxVBd73gf4bHOv1qkmdCoTlo
	2I9rFgNdYibSyvH5vDnN4F04KUKuhMnKD2UEI+J3/DD9QJ7V0cEVzMx/C0XyEJpKa5Pa
	8lt25quGvnHzhJqZ/9R2o0yCnEGCKam4GHY1i03rQRclr46gXPFCYZ0JDv9t/HUnHrW5
	QbGgBKAwGcnA6AugvfmpMut6QN0siTRwaDwBiIHUmjZK2lHBXsiaXhBFxsEdK2tIVq4o
	7zKuJPqvBBcDPtb0cO6Uf5yCmSQ+YmU8+24wQiQeRjNgo4qNlK5vR34O3tKGNJnz4mtq
	9JWQ==
X-Gm-Message-State: AIVw112nNQqE+9csV5dMbqI1Uxi1nGFKK1UyzTg6n10EQKaVeeT0cXmz
	LJPOUSdAhJGpGmHvV39jrFfOeDaP4w==
X-Received: by 10.223.179.216 with SMTP id x24mr7252862wrd.7.1501285660938;
	Fri, 28 Jul 2017 16:47:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Fri, 28 Jul 2017 16:47:40 -0700 (PDT)
In-Reply-To: <1501273600-109472-1-git-send-email-denis@denix.org>
References: <1501273600-109472-1-git-send-email-denis@denix.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 28 Jul 2017 16:47:40 -0700
Message-ID: <CAJ86T=WdvrPzvz6325onhpMWxgdOz5weZ=hUSSVXo94NzoA7Cw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] autoconf: fix mistakes in SUMMARY and DESCRIPTION
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
X-List-Received-Date: Fri, 28 Jul 2017 23:47:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 1:26 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v1 - procude -> produce
> v2 - produce -> produces
>
>  meta/recipes-devtools/autoconf/autoconf.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
> index f1b2dfc..17ee50f 100644
> --- a/meta/recipes-devtools/autoconf/autoconf.inc
> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> @@ -1,5 +1,5 @@
> -SUMMARY = "A GNU tool that procude shell scripts to automatically configure software"
> -DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
> +SUMMARY = "A GNU tool that produces shell scripts to automatically configure software"
> +DESCRIPTION = "Autoconf is an extensible package of M4 macros that produces shell scripts to automatically \

The DESCRIPTION was correct originally (since it's the M4 macros which
produce the shell scripts, not the extensible package).

https://www.gnu.org/software/autoconf/autoconf.html

>  configure software source code packages. Autoconf creates a configuration script for a package from a template \
>  file that lists the operating system features that the package can use, in the form of M4 macro calls."
>  LICENSE = "GPLv3"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

