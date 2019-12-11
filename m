Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 544CB7FA13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:59:38 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z12so17879466iln.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 16:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vSzvW50dxJq0lkIJQoz8NLj7lrf0yYXZLZGqPZp4kUE=;
	b=YaAzmgTGMKoCKUsZBVyWeKyokNuG5uc//ctmYPVYoY6ZFyKEhLx/wkeyP/V3dahyrr
	ynNJ2k0JQZkDzQhmnY7wcdMB4FQLD1f51OiAkpct0g1AWU7+d/EkIsrQ8BnoOGqqCINS
	L21VC5YV7g4zvXfWP0BSlAYhsYU800Rerd7NUpee55/XZo/DcrfJw5pU0XP1v04Gydoa
	YsscdgaWz5Y+lAOBYVELzyaT2k2etVAdLvjfq80xuVEnqnbGD18n1xyxuiLnwl5a/Dx4
	Vmr5K/xQ3saokGUPqrEm8DFcHPFeo20Roz8AhFNoSs3YijHyTjSK74oCJ0GXVvfLxUny
	CEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vSzvW50dxJq0lkIJQoz8NLj7lrf0yYXZLZGqPZp4kUE=;
	b=GaYLbEgpXpehnEUAaMgcpODUmFgIT2GKO62859VddVWPG1jMibmrl2uyrSz6/50e/v
	XR332Po7SZtayJoPK7juU7wA7g4RYLRlS3Rr3n/YJbp1nWozu/7ZcTi+z53y49yDRj9R
	L3lXyOl5dbARuksvVp4w9le+/BZw9INl4vHkpvwI6YkHasIjDkHznXtlfpMBYd05EfQK
	UlFZ0Qi4ns8aGn7FhSbdZPSXIOJBr5ED4tnvqkyjRHeXpOCiyK/ihT5I/XxiH6pOqIyp
	gmm1ekU0Bk+ksl92k7dYx0wbg9JNbLBy6h45Ie/Ogv1nV9Y7Kr7QGVSJbYhNErULvr0E
	2sew==
X-Gm-Message-State: APjAAAX6cWkfDRMNiP+XVJ+0Cpq7vrJ5BnB/H0Buxe1i1qh9st8bh8f5
	/oBZSpmjH4Kut0tEiwvK/Vjg65s80AEt9xq25yI=
X-Google-Smtp-Source: APXvYqwNw8UC3/gdMmGw1aqajqxp10eivwAqXBo1kLTO/JU3SsnCyEPGuIoH4+GQUATApkPAzHarDFCNrC4ziJO5zb8=
X-Received: by 2002:a92:1d53:: with SMTP id d80mr607112ild.224.1576025979378; 
	Tue, 10 Dec 2019 16:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20191210234517.3749201-1-raj.khem@gmail.com>
In-Reply-To: <20191210234517.3749201-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 11 Dec 2019 01:59:28 +0100
Message-ID: <CALbNGRRoz8UCLW3cSRbkHWM=wyLXOaofzgiFPkrNL+2cybFm1A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng: Correct SRC_URI path
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
X-List-Received-Date: Wed, 11 Dec 2019 00:59:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 11, 2019 at 12:45 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes fetcher warning
> WARNING: libpng-1.6.37-r0 do_fetch: Failed to fetch URL https://downloads.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.xz, attempting MIRRORS if available
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> index 78f3248d73..47287a0d55 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> @@ -7,11 +7,11 @@ DEPENDS = "zlib"
>
>  LIBV = "16"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/$${BPN}{LIBV}/${BP}.tar.xz"
^ is $$ intended?

Andreas

