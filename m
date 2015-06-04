Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id AB5406AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:47:44 +0000 (UTC)
Received: by wibdt2 with SMTP id dt2so41043087wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pF1nsn8cyfkbBmRvAsjLTxM5iNtqGDn5m2DrdWUrcZA=;
	b=SZ2fL8eCDUtd0K0g9u4QMqvmwPqplPoKGHPn05dveunxthtcvVZxaJ0E1fyqB8yiDq
	qIGqUEV26V5wIx1/8emrV0sog1wwwriXKua7Wykvw/HB5oSIWaKUPcNbvlp8te4PpAbM
	idh0GntvIAdiHaagAAtAr39xOA39fbv3O1V2T+i5NnL6Esp4/Bdf1kW6/geYZD6hcoka
	OK50kV9ny29GOHEc32GYrHrljvwfyuDfUaGQj0oe91z9+mh3tqGjpoSwlbFMmjKFDhN2
	YVGrJofJhSC9z3FOXVedqxljGPKkP4vHNq1zCaqNqumeMaw6eJr6KDdfvPhTdD76qnKR
	i4dQ==
X-Received: by 10.180.73.10 with SMTP id h10mr5640030wiv.3.1433407665199;
	Thu, 04 Jun 2015 01:47:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id m2sm30177399wiy.7.2015.06.04.01.47.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 01:47:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 10:48:05 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150604084805.GF2376@jama>
References: <1432207476-32627-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1432207476-32627-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [fido][PATCH] squashfs-tools: build and install unsquashfs as well
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
X-List-Received-Date: Thu, 04 Jun 2015 08:47:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2015 at 01:24:36PM +0200, Martin Jansa wrote:
> * it's useful for debugging corrupt squashfs images from mksquashfs

ping

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
> index d36f0fe..19d555e1 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
> @@ -27,11 +27,12 @@ SPDX_S = "${WORKDIR}/squashfs${PV}"
>  EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
>  
>  do_compile() {
> -        oe_runmake mksquashfs
> +	oe_runmake mksquashfs unsquashfs
>  }
>  do_install () {
>          install -d ${D}${sbindir}
>          install -m 0755 mksquashfs ${D}${sbindir}/
> +	install -m 0755 unsquashfs ${D}${sbindir}/
>  }
>  
>  ARM_INSTRUCTION_SET = "arm"
> -- 
> 2.4.1
> 

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

