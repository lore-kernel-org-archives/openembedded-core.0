Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id EEE8377DED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 19:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4F97208BA;
	Fri, 26 May 2017 19:58:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dvlcUIoBsGvV; Fri, 26 May 2017 19:58:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B20012079D;
	Fri, 26 May 2017 19:58:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 32E621624D3; Fri, 26 May 2017 15:58:55 -0400 (EDT)
Date: Fri, 26 May 2017 15:58:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Message-ID: <20170526195855.GD28053@denix.org>
References: <1495783966-95216-1-git-send-email-rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1495783966-95216-1-git-send-email-rebecca.swee.fun.chang@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [morty] [PATCH] cryptodev-linux: update SRC_URI
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
X-List-Received-Date: Fri, 26 May 2017 19:58:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Richard, Ross, Armin, et al,

Can we please expedite this change to morty and other stable releases? Thanks!

-- 
Denys


On Fri, May 26, 2017 at 03:32:46PM +0800, Chang Rebecca Swee Fun wrote:
> Gna! project announced that the download site from gna.org HTTP server
> will soon be closing down. We have verified that the site is no longer
> accessible without network proxy cache. We need to update SRC_URI to
> point to new alternative (nwl.cc HTTP server) in order to avoid fetcher
> issues in future.
> 
> [YOCTO #11575]
> 
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> index 160ab30..22c6977 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://cryptodev-linux.org/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
> +SRC_URI = "http://nwl.cc/pub/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
>             file://06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch \
>             file://cb186f682679383e8b5806240927903730ce85d9.patch"
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

