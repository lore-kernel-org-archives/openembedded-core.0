Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id EA53471B99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 11:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 437DE20900;
	Thu, 22 Jun 2017 11:32:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QrU7kigR4pbD; Thu, 22 Jun 2017 11:32:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 20A83204D6;
	Thu, 22 Jun 2017 11:32:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A2DCD16250F; Thu, 22 Jun 2017 07:32:33 -0400 (EDT)
Date: Thu, 22 Jun 2017 07:32:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <20170622113226.GR28053@denix.org>
References: <1498105835-7580-1-git-send-email-fan.xin@jp.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1498105835-7580-1-git-send-email-fan.xin@jp.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libinput: 1.6.1 -> 1.7.3
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
X-List-Received-Date: Thu, 22 Jun 2017 11:32:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

One of the previously-submitted patches:
http://lists.openembedded.org/pipermail/openembedded-core/2017-June/138487.html


On Thu, Jun 22, 2017 at 01:30:35PM +0900, Fan Xin wrote:
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  .../recipes-graphics/wayland/{libinput_1.6.1.bb => libinput_1.7.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/wayland/{libinput_1.6.1.bb => libinput_1.7.3.bb} (85%)
> 
> diff --git a/meta/recipes-graphics/wayland/libinput_1.6.1.bb b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
> similarity index 85%
> rename from meta/recipes-graphics/wayland/libinput_1.6.1.bb
> rename to meta/recipes-graphics/wayland/libinput_1.7.3.bb
> index c8714f2..6194fba 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.6.1.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
> @@ -10,8 +10,8 @@ DEPENDS = "libevdev udev mtdev"
>  SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
>             file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
>  "
> -SRC_URI[md5sum] = "7e282344f8ed7ec5cf87ca9fc22674fb"
> -SRC_URI[sha256sum] = "9d816f13eee63bcca0e9c3bb652c52ab55f39be4d1b90b54e4bfd1dc92ef55a8"
> +SRC_URI[md5sum] = "f2993b477db8d7ec0e785ce04ffecb03"
> +SRC_URI[sha256sum] = "096d612d2711f0caa2de544976ff3729e6233511ab373808644cc2dd5affcb1d"
>  
>  inherit autotools pkgconfig
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

