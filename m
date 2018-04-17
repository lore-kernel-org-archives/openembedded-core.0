Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 38DE47449D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 21:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EE7820B22;
	Tue, 17 Apr 2018 21:29:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id K1ikCONCkbX8; Tue, 17 Apr 2018 21:29:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 760062017D;
	Tue, 17 Apr 2018 21:29:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DCFE116343D; Tue, 17 Apr 2018 17:29:49 -0400 (EDT)
Date: Tue, 17 Apr 2018 17:29:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20180417212949.GK3228@denix.org>
References: <1523877787-28638-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1523877787-28638-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [PATCH] wayland: 1.14.0 -> 1.15.0
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
X-List-Received-Date: Tue, 17 Apr 2018 21:29:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Duplicate and incomplete!


On Mon, Apr 16, 2018 at 07:23:07PM +0800, Zheng Ruoqin wrote:
> Upgrade wayland from 1.14.0 to 1.15.0.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-graphics/wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb} (92%)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/wayland_1.14.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.15.0.bb
> index 1a9ff98..788105b 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
> @@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>  	   file://fixpathinpcfiles.patch \
>             "
> -SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
> -SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8"
> +SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
> +SRC_URI[sha256sum] = "eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0"
>  
>  inherit autotools pkgconfig
>  
> -- 
> 2.7.4
> 
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

