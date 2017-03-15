Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1882A7315E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E598620BAF;
	Wed, 15 Mar 2017 16:25:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gch3OTlN0jBz; Wed, 15 Mar 2017 16:25:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BDD5920BAC;
	Wed, 15 Mar 2017 16:25:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 605EB1623E7; Wed, 15 Mar 2017 12:25:55 -0400 (EDT)
Date: Wed, 15 Mar 2017 12:25:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170315162555.GN15664@denix.org>
References: <20161110144409.8940-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161110144409.8940-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [krogoth][PATCH] gstreamer1.0-libav: Add 'valgrind' config option
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
X-List-Received-Date: Wed, 15 Mar 2017 16:25:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FWIW, it still doesn't seem to fully work...

I just got this exact error in my morty build. My packageconfigs are:

PACKAGECONFIG="orc yasm"
PACKAGECONFIG_CONFARGS=" --disable-gpl --enable-orc --disable-valgrind --enable-yasm"


On Thu, Nov 10, 2016 at 03:44:09PM +0100, Martin Jansa wrote:
> From: Otavio Salvador <otavio@ossystems.com.br>
> 
> This fixes following error:
> 
> ,----
> | src/libavutil/log.c:51:31: fatal error: valgrind/valgrind.h: No such file or directory
> |  #include <valgrind/valgrind.h>
> `----
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
> index 363101e..2814a58 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
> @@ -18,6 +18,7 @@ PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl,"
>  PACKAGECONFIG[libav] = "--with-system-libav,,libav"
>  PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
>  PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,yasm-native"
> +PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
>  
>  GSTREAMER_1_0_DEBUG ?= "--disable-debug"
>  
> -- 
> 2.10.2
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

