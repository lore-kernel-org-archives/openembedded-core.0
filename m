Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C911E7FDB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:15:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so4544999wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=j883qXboHsGE3rnr71pNuKMN8kR5wGdWES9Vd7TypzE=;
	b=rsR5i4Aa9eiGRMsmCXV/lGOWwB4B/2cJgLCckYd3nWgvLGFFqKF/pb4A8WOuJMHI0s
	xq/vqSfDThsDh99UZrhb93Ua6usOG8/JF3qO6yxE1htLlIGehgZ7OqA360Ec7ggq1EAm
	/stcTBXRXj4MIFXSQdM4DU1FDzEnFrScrDSVzRot7yFxziAREBRGXOToQUNI+2uai604
	FPKz05Uh+mWE+DbBL7SgqenZDZQszotS3rC9QZC3WGVxQ1Hm1PPZYmluV6LB/+2uRPp6
	Lzcvp4DyiZ4zycHOLhgppZeTQIFj/Ll96kXJ6HKWBk5Z6ypWlKu6b49TLVvMNndKRZOc
	NF/w==
X-Gm-Message-State: APjAAAVV+6SNfri6gPZu6lJckmSN/h3sCeG8gsH4HnFnE5TmPCTPx8Ii
	PM4rr877eojD24GdgUT+vgJgldrh
X-Google-Smtp-Source: APXvYqyBy4tQSTBHLtOewmD3gbZiUv2C2eKwIy9CGWZRgcbnzKYAao4EfaqvEC13p+SvbQns42vaTQ==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr20314038wrr.116.1579810541358;
	Thu, 23 Jan 2020 12:15:41 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	j12sm4321265wrt.55.2020.01.23.12.15.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:15:40 -0800 (PST)
Message-ID: <9a860272881d3c0fff6be186e63063112d37cff0.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 20:15:39 +0000
In-Reply-To: <20200123173416.112832-3-alex.kanavin@gmail.com>
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
	<20200123173416.112832-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] default-distrovars.inc: add vfat to DISTRO_FEATURES
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
X-List-Received-Date: Thu, 23 Jan 2020 20:15:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2020-01-23 at 18:34 +0100, Alexander Kanavin wrote:
> This is beneficial for parted ptests in particular, as
> they expect vfat functionality to work.

Could you also update the parted ptests to skip or delete those
tests that depend on vfat, please? I.e. when the DISTRO_FEATURE
is not enabled.

For the benefit of those people that don't need / want vfat, but
still want to ensure that parted works by running the ptests.

Is that feasible?


Cheers,
Andre'

> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 10d86cf7b17..433d4b6651d 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
>  LOCALE_UTF8_IS_DEFAULT ?= "1"
>  LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
>  
> -DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs
> zeroconf pci 3g nfc x11"
> +DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs
> zeroconf pci 3g nfc x11 vfat"
>  DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
>  IMAGE_FEATURES ?= ""
>  
> -- 
> 2.17.1
> 


