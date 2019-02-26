Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 800317CBA9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 18:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6751640A55;
	Tue, 26 Feb 2019 18:10:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3aJAfzKei6kW; Tue, 26 Feb 2019 18:10:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D8C140301;
	Tue, 26 Feb 2019 18:10:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6D75116B9E2; Tue, 26 Feb 2019 13:10:46 -0500 (EST)
Date: Tue, 26 Feb 2019 13:10:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Message-ID: <20190226181046.GU19169@denix.org>
References: <20190226060000.4210-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190226060000.4210-1-hongl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [PATCH] wayland:Upgrade to 1.16.91
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
X-List-Received-Date: Tue, 26 Feb 2019 18:10:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 26, 2019 at 02:00:00PM +0800, Hong Liu wrote:
> Upgrade wayland from 1.16.0 to 1.16.91.

NAK - this is the first alpha in a long road to official 17.0 release.


> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../wayland/{wayland_1.16.0.bb => wayland_1.16.91.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/wayland/{wayland_1.16.0.bb => wayland_1.16.91.bb} (92%)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland_1.16.0.bb b/meta/recipes-graphics/wayland/wayland_1.16.91.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/wayland_1.16.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.16.91.bb
> index 112ee1a25e..8d7a06cdde 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.16.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.16.91.bb
> @@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>  	   file://fixpathinpcfiles.patch \
>             "
> -SRC_URI[md5sum] = "0c215e53de71d6fb26f7102cdc6432d3"
> -SRC_URI[sha256sum] = "4e72c2b56109ccfb6610d776e465f4ca0af2280c9c2f7d5cc23f0ed2548752f5"
> +SRC_URI[md5sum] = "711fea532899f2de096ebafdc54d1e3f"
> +SRC_URI[sha256sum] = "d51b83a51034ed5474517e0b0bca2d4e7056e4c51d720ea885f0c34f243fee90"
>  
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>  
> -- 
> 2.17.2
> 
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

