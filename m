Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id ED59471A70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 21:43:38 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id s18so12902176wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gkgjdjDp4C5K4R0UO3PdWAkY0D17Dzpqqn2M48g8DxA=;
	b=V/aQB5he9TCpMFbS4dGl/OkaAa+QCwtDehzqsYTjt0ymVs7NDB/+C7pQ9UAmKdJA4N
	UMgk+SSF04SG6p2iCB5MG/5WdCy60+JMgmSIKZpggxl67yOxw7Oyis3lbHBHAxzwXB+W
	TSep4T4u0bja64BAlCx4+Li7latMVWStVZMSWOw74yQKnnJKQwPZhm2xosNCB2ukKg1P
	yWvzNZP5Lor38UANiHDMOqMVCEzekmMqC4z190O+bK3h5uhop/7LQn0ENu7YIo24d+Rv
	Yy3P6ScZKzwwu0VNN56dpY1TYD4dkkwxQwmgzv7buCNbi0qw2b/fT3qjSGTBX552wK+n
	Cs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gkgjdjDp4C5K4R0UO3PdWAkY0D17Dzpqqn2M48g8DxA=;
	b=rmMQziAyhmVj5aXxh5POoJJ4GFlSfpN8uULqvMV6qhiOdMdW03z/KahWNxTUCoVaQv
	xdDuXy3i6u7+YZm4Yr0ElqFBLpOlMbX2O26DbT9wreYLRsJm2x3ZT/neLpXL7pd+hQvt
	nVKTKELcNr/YoLqa699ZkDyVNmhkTWLYrXYjqTGRVyKT1CxWMwLrCqhDS9DjFgDFjENv
	Vzr0iKfJXd/sBkgmInWAAG8QLs/dZDKVkjPNjInQH23YlrqknNkTZsOKm9aO6WRvaNOm
	GijLcQeVsWebcLQcziH12ip8D7iK7ftkUjWI3pkrlQtKfLMG6+/6aMV+qLeRreVIFqhZ
	GrDw==
X-Gm-Message-State: AElRT7FWw3kEgQokw0kiINjmaGRzMgiBBA2FFU6TwhVpnk+yETdRTje8
	cEntzpvY/Rcdn2DFZh8IibGT0Vsz3Q/AAAkIuXs=
X-Google-Smtp-Source: AG47ELscygrZTL78SWoQ2UskM2H08rWZti/h2rVon6cuYISyengMfILwH7I+AkZRxNRDykacXAxb1+k52EPLYQ823nA=
X-Received: by 10.223.182.132 with SMTP id j4mr2857145wre.66.1521236619705;
	Fri, 16 Mar 2018 14:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Fri, 16 Mar 2018 14:43:39 -0700 (PDT)
In-Reply-To: <20180316214112.42299-1-raj.khem@gmail.com>
References: <20180316214112.42299-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 16 Mar 2018 14:43:39 -0700
Message-ID: <CAJ86T=XAYT18GHq=CfoQ2uMaw88j75eMXJ_GPkYUAer4j31aKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
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
X-List-Received-Date: Fri, 16 Mar 2018 21:43:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 16, 2018 at 2:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> We allow to set LINKER_HASH_STYLE to be empty so this would fail
> since --with-linker-hash-style needs an argument and cant be empty
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes in v3:
> - Fix typo in gcc option
>
> Changes in v2:
> - Use inline if statement instead of old syntax
>
>  meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
> index d56d2c5e06..a80926216b 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
> @@ -100,7 +100,7 @@ EXTRA_OECONF_BASE = "\
>      --disable-bootstrap \
>      --disable-libmudflap \
>      --with-system-zlib \
> -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
> +    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \

What are the rules about when to use d.getVar('FOO') -vs- when to use
${FOO} in python fragments like this?

>      --enable-linker-build-id \
>      --with-ppl=no \
>      --with-cloog=no \
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

