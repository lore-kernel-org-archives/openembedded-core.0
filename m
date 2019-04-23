Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id AE5877C4F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 11:59:03 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id q14so4737626itk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0py7NWHq33ssqbit06VgPb0OsKfKAkge47Z7GVeHJJw=;
	b=HIk1EFqUPBsVfcIccGrC5EBfupHJzZklieyB46RzLFct6QpNFRmZg4HuT27t5uZ1wZ
	Gt2ryVKchdaFYE4OqVvifz241/3/u8pMdX3Btq6J+jjuIX722Ns7X4gYDx+BjX6Ojyza
	k6ShvVr1s9+SfBC5cHeyOg5v5NKxoUb3+kQRmD+yFPmZf5uoH07n4x+sBbrIUnfU9whk
	4egVpXyIqxB6UneX9rhTSbsDUVAN3ruLa6VQ+5t+kVtTsHy+qBqgfTb4C+w+Vci8QxMc
	QnQuLWmO1CPjNPEnBMI7kspvnBcInKO2d0jkZmTXHskFafFaQv0ta+c67qoFygVc50b+
	8IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0py7NWHq33ssqbit06VgPb0OsKfKAkge47Z7GVeHJJw=;
	b=oxKsRjBDBmoc4LO8O9O3XdH3lBwXgPnB+OsnC6n+qoR94YYYvr1jsx29xiEy4rYzit
	RuaAnFd79ZgFz7O3BB2h+A4ynHwPZIpICYO8w1M+aBEKgCv3azjUH1yP46qB5MqYfTX9
	wM5PgFKUrY67ujbCj1GfOcmlq/RmUdBnRkMBy3iN6loJjuyMQUaIijxD+CdxE3+x4m23
	SlMbAfhNN5EwHr8bwFISOAkDC5zS+1x1FwKx+Fgqb1guk/pP3VQCRUOHqtjmV5G1CIgL
	uYCCImEp3cGFiF1losZrykwnCHHXPIev/cpET/gFmofHJfQph3w6K+1uOxxx//D9MM8E
	e9qQ==
X-Gm-Message-State: APjAAAVanaJw7nKkkzPa+tfUA/NCkXsfC9LP1/TAbkybFnsCL3BJHARs
	1wEcjQgooxgDkvpo/JPUQU7F1K9goKVxhhC0SHQx0g==
X-Google-Smtp-Source: APXvYqwkRiE7eBEj//Na0IXG1KC23w34zL1vuOi4k8tSlvQ16MV8O4SpadZz2rjCsuhAPC91G+ugCWDqYXsSKFYO368=
X-Received: by 2002:a24:52c5:: with SMTP id d188mr1809994itb.130.1556020744646;
	Tue, 23 Apr 2019 04:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190422225735.17275-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190422225735.17275-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 12:58:53 +0100
Message-ID: <CAJTo0LYTsFW1oOEz3TrNJZErzBbRGC407pF60VP7x2UsJ63Tpg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] libpsl: update to 0.21.0
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
X-List-Received-Date: Tue, 23 Apr 2019 11:59:03 -0000
Content-Type: text/plain; charset="UTF-8"

This release also supports using Meson, would you be willing to
follow-up with a change to that?

Ross

On Mon, 22 Apr 2019 at 23:57, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libpsl/{libpsl_0.20.2.bb => libpsl_0.21.0.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libpsl/{libpsl_0.20.2.bb => libpsl_0.21.0.bb} (80%)
>
> diff --git a/meta/recipes-support/libpsl/libpsl_0.20.2.bb b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
> similarity index 80%
> rename from meta/recipes-support/libpsl/libpsl_0.20.2.bb
> rename to meta/recipes-support/libpsl/libpsl_0.21.0.bb
> index 5cb20d46bc..f545ba076f 100644
> --- a/meta/recipes-support/libpsl/libpsl_0.20.2.bb
> +++ b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
>                      file://COPYING;md5=f41d10997a12da5ee3c24ceeb0148d18"
>
>  SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.tar.gz"
> -SRC_URI[md5sum] = "f604f7d30d64bc673870ecf84b860a1e"
> -SRC_URI[sha256sum] = "f8fd0aeb66252dfcc638f14d9be1e2362fdaf2ca86bde0444ff4d5cc961b560f"
> +SRC_URI[md5sum] = "171e96d887709e36a57f4ee627bf82d2"
> +SRC_URI[sha256sum] = "41bd1c75a375b85c337b59783f5deb93dbb443fb0a52d257f403df7bd653ee12"
>
>  UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

