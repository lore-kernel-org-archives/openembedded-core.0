Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC686011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 20:54:35 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 13-v6so17993342ois.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zgtbMadfrHnr7L8ZKMbebl+UgabLSpzTh+zhIf2z7Q0=;
	b=PGTnoXMmTJrkk77zicsi2m19kU19DFYklFiEQa80zEFHwPL//hHrd0vapoL6qy1KwJ
	8MHHLSdPiefDohZcg0m0wvw7w7F112VHdZMYv5q2x7PXhzeC02TWdA3StDRVHbgtnRMr
	kq18aljh8Af8GnaXA3SLGhtoKAhxxB1Ldgrt5r2SasKOazOibJgc9xqRwgRX90/KyQQi
	yq1ewoObML5C4VeijI+tA2o/27UQhmIMw0TCKItYlGiRPCysrI3j70rl6BtTR2KkOXWz
	ueo5WbZxd3hyZcQYEDUjNTkAUBdUeDECrFtfC9080GfbE2rFbvXV6lwlcjv1Gn87OKRb
	5USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zgtbMadfrHnr7L8ZKMbebl+UgabLSpzTh+zhIf2z7Q0=;
	b=BsI5LqbP+lZDDvXDsB2/hueljDiLiI9Rv0U7pe0pGykPLa3p42bQV4yhN+T61yLy19
	a2S9LYw1Y/oD1LR+NGF//BQy7I2RA6F6IO0qmetLZNzJKPRZeaSgcWvnUp/XnQneEfKr
	a/3JiNVT4kGAovuHBrt+NsyYhzhTYPQ/bE8CPjuPN4zaWXWy8Fxxscp4QqWBkcLIcQbR
	rpgpbILJIlwo5ok72GTuuUVfKOUSPjFOF00MLr+JvB8kFzd7Uz7UlyS+Ufk1Xyi+tVGK
	yjvVg77HiXSleYIGAyA8z47y8R9OKqLgLZYRfDFk75o5v7kTfnMoPGIRuLVJ+Mlu1RAw
	uPNQ==
X-Gm-Message-State: APzg51DEK8RbX442pcHb+GwSTgjQ+OZRpjhUKj33CO+IBBfdsAAf+u52
	/F2LPuG7Dv1o8d6QRTCfE/RSayeqGi0wHvWPH5aQJLXc
X-Google-Smtp-Source: ANB0VdbaucGh3ksi2DisnaIL47wyOotozAuP4sulo51F209xACDy0Pm5U/45PsKYwXdpUk5xDdlsekLVcl48V/fvx+U=
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr4469500oif.23.1535662476391; 
	Thu, 30 Aug 2018 13:54:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7c0c:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 13:54:15
	-0700 (PDT)
In-Reply-To: <20180828094319.19765-2-hongl.fnst@cn.fujitsu.com>
References: <20180828094319.19765-1-hongl.fnst@cn.fujitsu.com>
	<20180828094319.19765-2-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2018 21:54:15 +0100
Message-ID: <CAJTo0LZbfaVyUL+JUDi5C6CPxuRGvaCP6FCmaWU15FdwFtbFZA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH]python-setuptools:upgrade to 40.2.0
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
X-List-Received-Date: Thu, 30 Aug 2018 20:54:35 -0000
Content-Type: text/plain; charset="UTF-8"

Remember to upgrade both python and python3 variations, otherwise you
break the other (the checksums are in the inc...)

Ross

On 28 August 2018 at 10:43, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-setuptools from 40.0.0 to 40.2.0
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
>  .../{python-setuptools_40.0.0.bb => python-setuptools_40.2.0.bb}      | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_40.0.0.bb => python-setuptools_40.2.0.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
> index 315ba31..c3924b0 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -10,8 +10,8 @@ inherit pypi
>
>  SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>
> -SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
> -SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
> +SRC_URI[md5sum] = "592efabea3a65d8e97a025ed52f69b12"
> +SRC_URI[sha256sum] = "47881d54ede4da9c15273bac65f9340f8929d4f0213193fa7894be384f2dcfa6"
>
>  DEPENDS += "${PYTHON_PN}"
>
> diff --git a/meta/recipes-devtools/python/python-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python-setuptools_40.2.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-setuptools_40.0.0.bb
> rename to meta/recipes-devtools/python/python-setuptools_40.2.0.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

