Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 261637C945
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 00:51:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d18so8641867qtg.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 16:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Ua9qzQah6txm0TwI4U87PNABjV57UnuAcztFsc2Uc8k=;
	b=ZRTZbYp2zyzO82TSjrN6gMTW2d44L8vxPyDK0FG4K3BPFNz6qu1TDPrdYoOSzt+2cI
	6WKzGOZIjHeuJiOCCP9ebZrw8Qifa2A8j7arfCYEqSRpFwjEpzr9Dy97/p2q43mABv4j
	IN+5ZxSKtXfvLeZF8FTXnoekfEV81yqZoKvI/xoPJJGtFgIw1KEffIAOW3QVlJcP/g5h
	wTtg0e+jW7+pCJT77bq1vZwKmSzzeEHTceJu5zuDtEYXOs4uIxDZnxs6fkn9YvrV260j
	UCiBv88AtajhDMBj78pKNW0NcILZkbbyWydzGcYSGC+SFjEsF2LQoWRw9egDGB6+0N0B
	bj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Ua9qzQah6txm0TwI4U87PNABjV57UnuAcztFsc2Uc8k=;
	b=s7Y8aJ11+5vUpGEADKRr884LecjLtXFsV3Esc5FwuQ+C0ESvOjJB9FLp3v5cVr6hzm
	WPCJu59iTEOi23DkP0lJZ06xmXWZSdfjDlhk3wO8Zt2KxguSW+2A32NU++iKqqlNM3ZA
	L+snNsMKk2W6cEWNRD/AMvO3z8sbWlhKFQ0iZCks3V9PtCR8fY/n51IecaW+ngb9Esw8
	u18u8d9GI6mVzBOWkDVfa1BeLvCl/iYF4gbHkdKDPIRa/URHOex+V2miFsDJlADnva74
	0q/LxYf+ZgY3nPpvjxJfkaW6xWkmDEX9pEr1Kv3E6GaH7VX9rSgkuewzJeGNiDbTVQx6
	YZig==
X-Gm-Message-State: AHQUAuZQ5lyWQioa9uDBLjR+rjx6jNQjR3CboaYGrqmtEF76fhB+3no7
	oPFfwgQ8CwSSZur42h+BIA9gmGfceiVEDSPyKZMS9A==
X-Google-Smtp-Source: AHgI3IYkX9Q/L69gUUOOx0DHL2DRmjP8q2Ie/0zTpoC2bEKocgIc/8eHMVjhv1Tmdqw2RJE46HS9goaaMnMd+k2LqoM=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr5767612qte.196.1551055886742; 
	Sun, 24 Feb 2019 16:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20190223170835.6169-1-raj.khem@gmail.com>
In-Reply-To: <20190223170835.6169-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Feb 2019 16:51:00 -0800
Message-ID: <CAMKF1srbpXNo+jMyBCT0dU3uKFvDSNPbqGcEFt=p95+kQ_XczA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Update to latest beyond 1.21
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
X-List-Received-Date: Mon, 25 Feb 2019 00:51:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 23, 2019 at 9:08 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1691b23955590d1eb66a11158fdd91c86337e886..ad795d56ba3fb9d69f524ee676e3b1e2355cceb7
>

hold on to this yet. I am seeing some crashes in QT samples which is a
regression on ARM.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 73906d0f3c..f84c17d295 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>
> -SRCREV = "1691b23955590d1eb66a11158fdd91c86337e886"
> +SRCREV = "ad795d56ba3fb9d69f524ee676e3b1e2355cceb7"
>
>  BASEVER = "1.1.21"
>
> --
> 2.20.1
>

