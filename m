Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5327841B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 00:16:29 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id u207so79098382ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 17:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GNupCqo1oa7Ewqf2k8Fu370OcmPM9dpwT6xj0WWrvxw=;
	b=Ac7X5z4Nx/2JsbHpGhKiuGzi1PfUHoUWH3DGm67Di3JzGKfEEOXkpiXCZw4ZaYzfX/
	skx+sfhXYbgAZFoEN6FhvfrDOSg875UP4MxfDfB+2AmzDKA6krHY7SuCHktgGEYGWKQK
	WHYL8eZpBnSy4qRIRna8jABRhSdzUeXQRHf84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GNupCqo1oa7Ewqf2k8Fu370OcmPM9dpwT6xj0WWrvxw=;
	b=L6ZsL8LqMwvIhs7EiOnAo2PXLwbxPCtZtrG6kDMozXH26mNgK0B8PAuWAX/rskVw7h
	vy9BlT70xBvg/KOjS4MI3DRmsOePkdB1hdBeY8p23OLSAlb5gINYJotEVgIXglHIUE4w
	iOc7yzLyplkgssCVwqHGWgQOPeAQwJ3LLuhriUDUQVj1vL5D4+poADe7kRo5guKtg67b
	AlWEJV5YJIJp6WJiHMn+oj9qf7+1hIom59USL4QvpTGDY2BS82FAhgR9uWD+R577756s
	viS152VgvZmXduUcHZ+FqM4W0laDwxiLS1L6fa698nWKXu1BsVJhFQzWlHqnjfgZK9T1
	/ciQ==
X-Gm-Message-State: AIVw113Kg2b86sWT75NGzEMDeahjfacRh2ibwP1AoTopN8KXwLCtmvZo
	FX8rRmPt1Kn2EoGWLWb1CQ==
X-Received: by 10.129.173.36 with SMTP id l36mr10004960ywh.60.1501373790828;
	Sat, 29 Jul 2017 17:16:30 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:44a7:ffcc:4ce7:764c])
	by smtp.gmail.com with ESMTPSA id
	i71sm2641086ywg.47.2017.07.29.17.16.28
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 29 Jul 2017 17:16:29 -0700 (PDT)
Date: Sat, 29 Jul 2017 20:17:51 -0400
From: Tom Rini <trini@konsulko.com>
To: drew.moseley@northern.tech
Message-ID: <20170730001751.GB16135@bill-the-cat>
References: <1501348127-1506-1-git-send-email-drew.moseley@northern.tech>
MIME-Version: 1.0
In-Reply-To: <1501348127-1506-1-git-send-email-drew.moseley@northern.tech>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] documentation: Remove documentation of image_types_uboot.
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
X-List-Received-Date: Sun, 30 Jul 2017 00:16:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 29, 2017 at 01:08:47PM -0400, drew.moseley@northern.tech wrote:

> From: Drew Moseley <drew.moseley@northern.tech>
> 
> This class was removed with commit:
>      OE-Core rev: 65f27122950a35a67ce39ae4cfe93d0dca6b0dab
> 
> Remove unneeded references to it in documentation.
> 
> Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
> ---
>  documentation/ref-manual/ref-classes.xml  | 9 ---------
>  meta-poky/conf/local.conf.sample.extended | 3 ---
>  2 files changed, 12 deletions(-)
> 
> diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
> index 1801faf..292deb3 100644
> --- a/documentation/ref-manual/ref-classes.xml
> +++ b/documentation/ref-manual/ref-classes.xml
> @@ -1288,15 +1288,6 @@
>      </para>
>  </section>
>  
> -<section id='ref-classes-image_types_uboot'>
> -    <title><filename>image_types_uboot.bbclass</filename></title>
> -
> -    <para>
> -        The <filename>image_types_uboot</filename> class
> -        defines additional image types specifically for the U-Boot bootloader.
> -    </para>
> -</section>
> -
>  <section id='ref-classes-image-live'>
>      <title><filename>image-live.bbclass</filename></title>

This half I have taken care of in a patch to yocto-docs, that will be
applied when the rest of my image related changes land.

> diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
> index 0560de8..331fdd1 100644
> --- a/meta-poky/conf/local.conf.sample.extended
> +++ b/meta-poky/conf/local.conf.sample.extended
> @@ -168,9 +168,6 @@
>  
>  # Additional image generation features
>  #
> -# The following is a list of classes to import to use in the generation of images
> -# currently an example class is image_types_uboot
> -# IMAGE_CLASSES = " image_types_uboot"
>  
>  # The following options will build a companion 'debug filesystem' in addition
>  # to the normal deployable filesystem.  This companion system allows a

This is poky-centric and still applicable however.  Thanks!

-- 
Tom

