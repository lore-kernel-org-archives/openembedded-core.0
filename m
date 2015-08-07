Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9983576740
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 11:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77BYCuI023344; Fri, 7 Aug 2015 12:34:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Devp1m6ufU1R; Fri,  7 Aug 2015 12:34:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77BXuT9023327
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Aug 2015 12:34:09 +0100
Message-ID: <1438947235.30467.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 07 Aug 2015 06:33:55 -0500
In-Reply-To: <ad57644fc1b0a696025d1f85a1f86483432d9b1e.1438619216.git.alexander.kanavin@linux.intel.com>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<ad57644fc1b0a696025d1f85a1f86483432d9b1e.1438619216.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] xf86-video-omapfb: switch SRC_URI to debian git repo
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
X-List-Received-Date: Fri, 07 Aug 2015 11:34:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-03 at 19:29 +0300, Alexander Kanavin wrote:
> The previous upstream is no longer available.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> index 4ad2538..e649270 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> @@ -13,7 +13,7 @@ SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
>  PR = "${INC_PR}.7"
>  PV = "0.1.1+gitr${SRCPV}"
>  
> -SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
> +SRC_URI = "git://anonscm.debian.org/collab-maint/xf86-video-omapfb.git \
>    file://0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch \
>    file://0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch \
>    file://0003-force-plain-mode.patch \

This still doesn't work on the autobuilder:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/418/steps/BuildImages/logs/stdio

Cheers,

Richard


