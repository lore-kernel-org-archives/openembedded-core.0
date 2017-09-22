Return-Path: <matt@madison.systems>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id DB9C76FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 13:13:36 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id k23so1097564lfi.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WFlyqxcvRC64a6HkCgjCKER2Ng5y5c7DsF9NYNAHWlQ=;
	b=peFEaWleWbBV4T5v/g7gpWwi8UwK11f7sigl914DoqaCTx2IX1Fa/MSIeNZ/n9xHYo
	N4xWb6KVBkZuMtVEdQ5Aiw/JGE+/BylIkctFUDp6cn7LM75Wqa4aXdZi3OGhyuGrTgrl
	To9yyqtm3h3b4sqCH8m3FaFD0btGp8gYz+fxdQl3rOIJpfov3Yn4jK8uppE5u0GkX4+g
	3r3xoApr8g+1xBGigykizTQtJNspAQYTTzrPvA+15Kl1SbvQXL2La/wNmY7dZDtYx6Hm
	uo4LprZAt+B/mzTakDFzwPj9/P+Smf/mqKYZQr1tCbEWNT6ULCbYYcvIAESRSomUyP6w
	2Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WFlyqxcvRC64a6HkCgjCKER2Ng5y5c7DsF9NYNAHWlQ=;
	b=cqwojI1vAERF22FJ+u0hH8mKjopI0zXy/zakksAe7gHfCqjDcfsLr8mETMS3x+wvl3
	J11YMYNj0l6PIuNP8zDXlpS1LFtMFrZ89kL8M1W1ADGtbBa8Hf9pv9aUY27UgRaB4NjT
	xxCIac8pdwf3ntbx5MTzxWbKyZVNRYf1KS65uFplEAzn+sncTjArpBh2PB7aCG6+oAoW
	aKs7mdELHCTKZA6EN/V1q/fU+p/ufTFahS0/xfmWpj0DbXzXXfj0sGDULOZS/90YBADD
	aaduhpTeCfKigyRrYtu2gycZeyrg2igZEK2D3xzYWqlELH2En6mon806BcP0CTLlDl3N
	rSTg==
X-Gm-Message-State: AHPjjUiwDDxt2XJhayLDTxuIApZvZ9jMI9KQFQAEMml6Ki3FMD/FdRcI
	+i6d4fTVdrnaltc06EhwkSFOSoJPXbj7ufEIb5+aVw==
X-Google-Smtp-Source: AOwi7QAaR7FHhF/3EZ6J4Kep+ysvZDIa8QK0DSRNvLUY5zPWA1j4sOCGpXi4fJUI26r3gZA4PrbeN0+p3ayEV5upS30=
X-Received: by 10.46.31.9 with SMTP id f9mr2733345ljf.148.1506086017522; Fri,
	22 Sep 2017 06:13:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Fri, 22 Sep 2017 06:13:36 -0700 (PDT)
In-Reply-To: <20170922060533.943-1-raj.khem@gmail.com>
References: <20170922060533.943-1-raj.khem@gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Fri, 22 Sep 2017 06:13:36 -0700
Message-ID: <CAGgRHJqRxn6dYPs+3wh8RZuy_e-44+hTYT54FQ7zcjrHSrasRw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Fix build with hardening flags
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
X-List-Received-Date: Fri, 22 Sep 2017 13:13:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 11:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go-dep_0.3.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
> index abfeb48370..20ea792c52 100644
> --- a/meta/recipes-devtools/go/go-dep_0.3.0.bb
> +++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
> @@ -11,6 +11,10 @@ SRCREV = "7a91b794bbfbf1f3b8b79823799316451127801b"
>
>  inherit go
>
> +TUNE_CCARGS_remove = "-march=mips32r2"
> +SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_LDFLAGS = ""

The SECURITY* settings should go into go.bbclass, since every go
recipe will need them.

-Matt

> +
>  GO_INSTALL = "${GO_IMPORT}/cmd/dep"
>
>  RDEPENDS_${PN}-dev += "bash"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

