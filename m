Return-Path: <sbabic@denx.de>
X-Greylist: delayed 352 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Feb 2020 21:25:38 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 263C5613A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:25:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 48N9bQ6qxzz1qqkn;
	Wed, 19 Feb 2020 22:19:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 48N9bQ6VPnz1qyDT;
	Wed, 19 Feb 2020 22:19:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id o8WyavnY2o18; Wed, 19 Feb 2020 22:19:45 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Wed, 19 Feb 2020 22:19:45 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 64E57454048E;
	Wed, 19 Feb 2020 22:19:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id iiTWF2mpaILC; Wed, 19 Feb 2020 22:19:43 +0100 (CET)
Received: from [192.168.178.89] (stefano-MacBookPro.fritz.box [192.168.178.89])
	by babic.homelinux.org (Postfix) with ESMTPS id 8F3ED454033B;
	Wed, 19 Feb 2020 22:19:43 +0100 (CET)
To: Pierre-Jean Texier <pjtexier@koncepto.io>,
	openembedded-core@lists.openembedded.org
References: <1582146491-20965-1-git-send-email-pjtexier@koncepto.io>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <f3ea63bd-bd3a-03bb-e67b-4b85c073e5c0@denx.de>
Date: Wed, 19 Feb 2020 22:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1582146491-20965-1-git-send-email-pjtexier@koncepto.io>
Subject: Re: [PATCH] libubootenv: bump to revision ba952d0
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
X-List-Received-Date: Wed, 19 Feb 2020 21:25:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hallo Jean-Pierre,

On 19/02/20 22:08, Pierre-Jean Texier wrote:
> This includes following changes:
> 
> ba952d0 BUG: variable lists not released in close()
> 690f868 Variables are not removed when loading from file
> 9e3586a Make sure there's no file descriptor leakage in case of error
> 03647c4 Check config file defines a non-zero Sector size
> 3b2d4f1 Check environment size from fw_env.config
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> index f5b6059..ac49b68 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b36
>  SECTION = "libs"
>  
>  SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> -SRCREV = "879c0731fa0725785b9fa4499bbf6aacd04ee4c2"
> +SRCREV = "ba952d05ec9ab16029816a06d956bac7fb4e9832"
>  
>  S = "${WORKDIR}/git"
>  
> 

Acked-by: Stefano Babic <sbabic@denx.de>

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

