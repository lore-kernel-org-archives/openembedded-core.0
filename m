Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E4CC171984
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 17:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A70D620C69;
	Fri,  7 Sep 2018 17:38:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mOucFoL2-708; Fri,  7 Sep 2018 17:38:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89A6A2017C;
	Fri,  7 Sep 2018 17:38:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4FD9D16361D; Fri,  7 Sep 2018 13:38:55 -0400 (EDT)
Date: Fri, 7 Sep 2018 13:38:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180907173855.GX19965@denix.org>
References: <1535216938-3765-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1535216938-3765-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.16.0
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
X-List-Received-Date: Fri, 07 Sep 2018 17:38:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.


On Sat, Aug 25, 2018 at 01:08:57PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-graphics/wayland/{wayland_1.15.0.bb => wayland_1.16.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/wayland/{wayland_1.15.0.bb => wayland_1.16.0.bb} (92%)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland_1.15.0.bb b/meta/recipes-graphics/wayland/wayland_1.16.0.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/wayland_1.15.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.16.0.bb
> index d037dc4..112ee1a 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.15.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.16.0.bb
> @@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>  	   file://fixpathinpcfiles.patch \
>             "
> -SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
> -SRC_URI[sha256sum] = "eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0"
> +SRC_URI[md5sum] = "0c215e53de71d6fb26f7102cdc6432d3"
> +SRC_URI[sha256sum] = "4e72c2b56109ccfb6610d776e465f4ca0af2280c9c2f7d5cc23f0ed2548752f5"
>  
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

