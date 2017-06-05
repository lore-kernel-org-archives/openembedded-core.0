Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E90E578082
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 20:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 74D4F20BD4;
	Mon,  5 Jun 2017 20:38:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yiACGtiUPc2S; Mon,  5 Jun 2017 20:38:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5421620072;
	Mon,  5 Jun 2017 20:38:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CFE7F1624E3; Mon,  5 Jun 2017 16:38:42 -0400 (EDT)
Date: Mon, 5 Jun 2017 16:38:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: jackie.huang@windriver.com
Message-ID: <20170605203842.GL28053@denix.org>
References: <20170605070557.10106-1-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20170605070557.10106-1-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmscube: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 05 Jun 2017 20:38:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2017 at 03:05:57PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> kmscube depends on virtual/libgles2, virtual/egl (provided
> by mesa) and gstreamer1.0 which require opengl in DISTRO_FEATURES.

libgles2 and egl are not only provided by mesa!


> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-graphics/kmscube/kmscube_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
> index 0ec5b2a7fa..9050671ab1 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -11,4 +11,6 @@ SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git
>  
>  S = "${WORKDIR}/git"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
> -- 
> 2.11.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

