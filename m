Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8156BE32
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:35:07 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so4931361lab.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=K1pP9NRwZrBcvaRGgZrBmtZkV4WC3Nw+3jAbqjcdrsQ=;
	b=MMhbH6TA1R/mtRoVTxEN1vT/ne0VkL2/eJB5wK8uAWCRuz5T9SpFmo7TyLLq8cSIIV
	j1K9woSdZaUi+6ow1XIEoIRtiyceh4nbwkr1X+KMc8G6rAzqm6Sx1U4VC9wbHS+8Kofj
	KdAfmdSRGMxaA0jlZRHgQ79iafPKNb9+C7zloRikgDCNMecGIreMsamtYlYrRHOfdiW+
	MDZYkBRBmsZxWvT8aebmsThkfBRd0avKiR4++H3MP4e4rD8paLZNEnHRXH8PL+qGnjf5
	s3BrDtQ1dni4tTh64DaM0vDaDM4fQ6Gml5OiUcjCH1Nx6NZKC01BKPLZnGHGtWCExzTw
	7mKA==
MIME-Version: 1.0
X-Received: by 10.112.50.109 with SMTP id b13mr289404lbo.47.1378730108665;
	Mon, 09 Sep 2013 05:35:08 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 9 Sep 2013 05:35:08 -0700 (PDT)
In-Reply-To: <1378729667-40624-1-git-send-email-maxin.john@enea.com>
References: <1378729667-40624-1-git-send-email-maxin.john@enea.com>
Date: Mon, 9 Sep 2013 08:35:08 -0400
Message-ID: <CADkTA4MtzUr5UFEkzUmZbHU0oq4h_wsJCJXnOqF4mb+1C-USKQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: maxin.john@enea.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] beagleboard: update the dts location
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
X-List-Received-Date: Mon, 09 Sep 2013 12:35:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 9, 2013 at 8:27 AM,  <maxin.john@enea.com> wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
>
> Update the dts path for beagleboard
>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  meta-yocto-bsp/conf/machine/beagleboard.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-yocto-bsp/conf/machine/beagleboard.conf b/meta-yocto-bsp/conf/machine/beagleboard.conf
> index dd0c222..d034ee4 100644
> --- a/meta-yocto-bsp/conf/machine/beagleboard.conf
> +++ b/meta-yocto-bsp/conf/machine/beagleboard.conf
> @@ -32,7 +32,7 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "3.10%"
>
>  KERNEL_IMAGETYPE = "zImage"
> -KERNEL_DEVICETREE = "${S}/arch/powerpc/boot/dts/omap3-beagle.dts ${S}/arch/powerpc/boot/dts/omap3-beagle-xm.dts"
> +KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/omap3-beagle.dts ${S}/arch/arm/boot/dts/omap3-beagle-xm.dts"
>

ouch. how on earth did that slip by. I'm going to ping the patch's submitter to
find out how that could have been tested.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>  SPL_BINARY = "MLO"
>  UBOOT_SUFFIX = "img"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

