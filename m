Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1025978E62
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 15:41:18 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id n6-v6so6607688qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=CImpJqKt1Dz78dL9R9TOdYnantj7jvuVmmSB9Fy/waI=;
	b=o/reS9QH8Ub8xheD11dL5mG62YJ2d9555NRwciJ/rM531T5Aw9Idv3nr9wAygm+qFx
	Kyi+Yj2lyX6n0oPWTo2Enzifde6p5AiFIuSvxAT8tDkunwAOJCbwJLXf0n2eLqe54/t2
	8fOrBnwxblw6phW38O3ODK3EZHpJMp6x7yuTJH/rp3Kwv9GpvYvzrlk6bK4wMNuINOgX
	0K1FBcEKwXmm/hltJM8FhUkKPDUSn+D6UvWQzG7P8SCoz2fkYUXR2174QX2+5Btx5nw0
	CSBT7a1ZXrdxT87azplXb6l+F5z37HcJ7bRKpNqXjA78vUTXq8NFSkUw6DSvGqMC/rne
	M6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=CImpJqKt1Dz78dL9R9TOdYnantj7jvuVmmSB9Fy/waI=;
	b=mCx9So10AuWhEUHZBNRx/AFI+YTiV40dH9irYAtgwr19RHvGe+rb4d1Sbnx3EI/37b
	wvdd7IOC4S1oRMXuWfaEptKkVy/C3C+yOCvOTYHEQgyD24MBgHJp6k2vVZZ36Rjv53qg
	KEsdcX1qvNe0uInP/GNzKimA5hIQUWFXo1Kao5Lt+fO9AjFG7zIa0xsmKoOh378deP+m
	2FtcwGSgCneesB2eaIjRtJ6DsgK3oA3Bmdj+Hs4ppiLSTsV5VBlCrLXfEHW0gAIJneFd
	bgDyvCP0hmatxa/nPstK2aVLyMMzbb4zERnqkbcgZZkDmlf5O8tyad1rPGBgfy3Pumi4
	a3Zg==
X-Gm-Message-State: AOUpUlGqvjAh8WVM2nz5BhAbacO2XRTkKjneFiDJILlxRL2qT9Dc+7Xq
	BUB2fcBap6qWs11x1REdY5hH7N4NG3AaH0QQx0ie2w==
X-Google-Smtp-Source: AAOMgpejdAlQb6YHmy7F/gpeia4lVg5dW14kNM6uE/VDmSZQ/SuFO5J1xwd8j5heAhKcKLQesX/k4ifUX0Zi7FE2qag=
X-Received: by 2002:a0c:d2f3:: with SMTP id
	x48-v6mr4021700qvh.214.1533310879510; 
	Fri, 03 Aug 2018 08:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180727210433.1580-1-raj.khem@gmail.com>
In-Reply-To: <20180727210433.1580-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2018 08:40:53 -0700
Message-ID: <CAMKF1srtPvMcUEiraSvL2Y2dTL5OVX_7SUeua-uMvz5T+LrPKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "gnutls: rationalise libunistring arguments"
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
X-List-Received-Date: Fri, 03 Aug 2018 15:41:19 -0000
Content-Type: text/plain; charset="UTF-8"

ping^1
On Fri, Jul 27, 2018 at 2:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This reverts commit 60fef4940de7f0440f1216eb2ea0ea683b3e8fdd.
> ---
>  meta/recipes-support/gnutls/gnutls.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index b62a137e59..98ec8d9667 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -41,6 +41,7 @@ EXTRA_OECONF = " \
>      --enable-local-libopts \
>      --enable-openssl-compatibility \
>      --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> +    --without-libunistring-prefix \
>  "
>
>  LDFLAGS_append_libc-musl = " -largp"
> --
> 2.18.0
>

