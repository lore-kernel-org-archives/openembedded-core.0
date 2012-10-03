Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJL8D-0002wU-1F for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 11:20:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9397d7W025945;
	Wed, 3 Oct 2012 10:07:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25642-03; Wed,  3 Oct 2012 10:07:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9397UfA025939
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 10:07:30 +0100
Message-ID: <1349255253.18301.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Wed, 03 Oct 2012 10:07:33 +0100
In-Reply-To: <1349086731-2818-1-git-send-email-ross.burton@intel.com>
References: <1349086731-2818-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-intel: drop libxvmc dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 09:20:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-01 at 11:18 +0100, Ross Burton wrote:
> xvmc is explicitly disabled, so remove the dependency.

and also add some new dependencies. I'm left wondering if that was
intentional?

Cheers,

Richard


> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb |    4 ++--
>  meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb    |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
> index fe7408b..fe4dfbd 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
> @@ -9,9 +9,9 @@ Infrastructure (DRI)."
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
> -DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
> +DEPENDS += "virtual/libx11 drm xf86driproto glproto \
>  	    virtual/libgl xineramaproto xf86driproto libpciaccess"
>  
> 
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> index ed1f269..83a24ce 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> @@ -7,12 +7,12 @@ chipsets. The driver supports depths 8, 15, 16 and 24. On some chipsets, \
>  the driver supports hardware accelerated 3D via the Direct Rendering \
>  Infrastructure (DRI)."
>  
> -DEPENDS += "virtual/libx11 libxvmc drm dri2proto glproto \
> +DEPENDS += "virtual/libx11 drm dri2proto glproto \
>  	    virtual/libgl xineramaproto libpciaccess"
>  
>  SRCREV = "87ea531c5dc5b39809395b277c330854aaaaf019"
>  PV = "2.10.0+git${SRCPV}"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  EXTRA_OECONF += "--disable-xvmc --enable-dri --disable-static"
>  




