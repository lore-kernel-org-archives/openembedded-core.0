Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 81E6578AE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 10:23:50 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id q17-v6so23146502otg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 03:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8gv7sVrfip2Nx8NsE2x7Q/Dr8DFTlttm0jXNoqIg6J4=;
	b=EZ4xgJkdX8tFW0Iwr+eBcmDxfNL4ihKQRzHHgJaag84GfuERAqvnyyNlmdfZUvl1Ro
	yeO+G+WfDGvnpgx0XYqvX9B78wQzQftgbVTrbTyqd8KkasWJ62MKvqeH4fh46dTG+3FP
	lAYsEWiJOgQax7JL4rHpwP3ErE/aZTuo8DVPbO9hqcXV41soaGwGDjkUzwkQXthuN+ah
	Xt70wrj7Zr4FSP6V/1VMlnbp1q2ULW2iXcwVAT1k3QxJRhZBze/pvTUkm0yTx3Xj0Cxq
	m+ipKqHExNFHGY7vdEcO69ewV6lZwqZmi3bYUx2bJq3dtle+Z0d2EW5jl5rF5X3zIGed
	LiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8gv7sVrfip2Nx8NsE2x7Q/Dr8DFTlttm0jXNoqIg6J4=;
	b=jWji/WzUSJf7u8hNz1OU+ixLBfprGPV+XrW6+4EePHDlZxLqcV+jufYPHA09CLlTni
	eXk+5G8Pckz5SjlEIt2+xGc91lR+PImfwDifrXowGP+2dQSTGyDYOZISes7wqlHo4I2d
	PiGBrYKc0QIlHgdEeKAOzHkAFMJ2KJ66oKBherm8B0JMjGaq0mfaZGwQHFSVcytUaAHI
	NYFNNC4wZ4q73gNbT4eCk1nWC0d/1bDaZcn94+BJpjEqHGpi1ZWJh5BiwEhU1yxaS6mB
	XQI0ci3JsVWNXbN3QSD8JgmYh3qJCdc8YzKBe+WbR53sLiK4Aal7ebteZDAXPbAGHPmh
	bBtQ==
X-Gm-Message-State: APt69E0uv1GwhvUJIaz8gVpDl2rsbTJtD+Pv2pDd3pFMuazwnklY5sU9
	UZGImJhdFrTJaJgqxb60M818C694JQuWI2WW9heRBA==
X-Google-Smtp-Source: ADUXVKJmzvi/Cj6Mh5fSls0mk0Zuq0P7lEskcaIuqL2NX9tdhzmyvDCACb1/yoq/R+d66ZDAIPvQWx1wublqh6oCnqY=
X-Received: by 2002:a9d:2989:: with SMTP id
	n9-v6mr10145064otb.152.1528712631526; 
	Mon, 11 Jun 2018 03:23:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 03:23:30
	-0700 (PDT)
In-Reply-To: <1528657273-19021-1-git-send-email-jpuhlman@mvista.com>
References: <1528657273-19021-1-git-send-email-jpuhlman@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 11:23:30 +0100
Message-ID: <CAJTo0LZXRFZ2bEgtyjRUGiUyDt_TcyjVUBZjdmtWzGFAE4McEA@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorgproto: Install .pc files in ${libdir}/pkgconfig
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
X-List-Received-Date: Mon, 11 Jun 2018 10:23:50 -0000
Content-Type: text/plain; charset="UTF-8"

Upstream will (and do) argue that $datadir is the right location as
these headers are architecture-independent.

Would the package manager do the right thing if the files didn't have
the libdir line in, so where bit-identical?

Ross

On 10 June 2018 at 20:01, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> * --data dir config option is only used to install pkgconfig
> * Installing into ${datadir} causes mutlilib conficts on install
>
>   file /usr/share/pkgconfig/applewmproto.pc conflicts between attempted
> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
> xorgproto-dev-2018.4-r0.corei7_64
>   file /usr/share/pkgconfig/bigreqsproto.pc conflicts between attempted
> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
> xorgproto-dev-2018.4-r0.corei7_64
>
> and so on.
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta/recipes-graphics/xorg-proto/xorg-proto-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
> index 7a417c9..7377283 100644
> --- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
> +++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
> @@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>  DEPENDS = "util-macros"
>
>  inherit autotools pkgconfig
> -EXTRA_OECONF = "--without-fop"
> +EXTRA_OECONF = "--without-fop --datadir=${libdir}"
>
>  UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto --with-xmlto"
>
> --
> 2.6.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

