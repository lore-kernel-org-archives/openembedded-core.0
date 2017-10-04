Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id BCBFC6E5FB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 02:01:57 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k10so7107521wrk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Oct 2017 19:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J++YUSVg/es4FMopOM3vCY4HXMJI05GaYruxxR4txWc=;
	b=Ehy+P/zAVAD/AFG3fW1J/28hzz8uWO7cW1uElU1a2ObpWv5tEamyvJVS/NJb5SWPRZ
	BTQ13/mQxoOPwlAkBflUl2gAp+NVz94Yno6aHt9MCOLWFE0EflsnvDCztS72DEg9mB+f
	XSvXY3wv8lQzWHG8FZUy46MnCZLzHiGcYP740PhxmQGtEe6V/uXADAUMPgv+pVE+/LHu
	xNhYszcQPRJoJwCm9+1l5Q7qAt7b4hr7BEZSWfUj/E5fcZ+lyzeaFTpdt0ktBZHh4vfC
	3NhbTJqpMR/d7DFQuGRFbs9IMedg///DVZxqGtS1Pw0CdsqllHfW6xttCQJfvqUy3Btf
	nMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J++YUSVg/es4FMopOM3vCY4HXMJI05GaYruxxR4txWc=;
	b=SHjBIOMckRUik6F7tFcsEqWnhCzl5F1DYQi0oTDWuixPJZcDRujmJwCziofGMu2akF
	6+l1L7PpWPQuP0OGtB2q8atUpwzjzSd8yTzRpwhU4esbA+CNdWcnmD3sNlMFIzBd8x83
	mkDE0OQ9+4XV0BkITMpsv0B9UaVZoFhL2adyw2Xhz5Z7sLMJ4MyFm42H4vSxLowBe0eP
	5FJj1K+Z94MyvWKjQ+Wq+HI0zovmAp4PL2QnjRrZXheQzWWDqcH4Lf1SeEiZMN4heKfI
	sWRyWPxXRKma4v9gSaC0F6E6ILKqGJat7/o7wEdYiFsifc7iWvEHP6MjLmkSsGaShuFy
	vOGQ==
X-Gm-Message-State: AHPjjUjLvjPqmLD8/6EjJIhqT5EcQth1tayFqRoLUvBcR4CMq32l0DnT
	qZKIiQ6Ok1iChCgqpS9jzU8B7Lbe7qp0Tvg0w/g=
X-Google-Smtp-Source: AOwi7QD6aQz1y3N5yo6DrjDgCCUIHDoXr7z/rYVspBLToEduFHq1d/No0ssGqo6QWGP2vx451gjZUaPf/CDcb1JsH2Y=
X-Received: by 10.223.186.140 with SMTP id p12mr18582676wrg.235.1507082518849; 
	Tue, 03 Oct 2017 19:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 3 Oct 2017 19:01:58 -0700 (PDT)
In-Reply-To: <1507067652-27633-1-git-send-email-juro.bystricky@intel.com>
References: <1507067652-27633-1-git-send-email-juro.bystricky@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 3 Oct 2017 19:01:58 -0700
Message-ID: <CAJ86T=UdzPA4WyTELZjiLmfAtK4asKRN-SBd6tsinmi76FiV_A@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: marex@denx.de, Juro Bystricky <jurobystricky@hotmail.com>,
	yau.wai.gan@intel.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Wed, 04 Oct 2017 02:01:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 3, 2017 at 2:54 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
> With the commit f4e8e9242c5df095b52688b083df3c9d36e7144b

That revision doesn't exist in oe-core...

> some nios2 builds
> (uboot, core-image-minimal, etc) were broken due to db trying to use ARM instructions
> in mutexes. The reason was db "configure" used the cached entry from nios2-linux
> (which was incorrect). So the remedy was to remove the incorrect cached entry
> and let db "configure" figure out which is the proper mutex to use.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/site/nios2-linux | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
> index 2f4e570..5bae748 100644
> --- a/meta/site/nios2-linux
> +++ b/meta/site/nios2-linux
> @@ -33,7 +33,6 @@ db_cv_path_sh=${db_cv_path_sh=/bin/sh}
>  db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
>  db_cv_align_t=${db_cv_align_t='unsigned long long'}
>  db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
> -db_cv_mutex=${db_cv_mutex=ARM/gcc-assembly}
>  db_cv_posixmutexes=${db_cv_posixmutexes=no}
>  db_cv_uimutexes=${db_cv_uimutexes=no}
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

