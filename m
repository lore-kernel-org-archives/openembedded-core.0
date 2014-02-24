Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2AFB6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:44:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Feb 2014 06:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="461135816"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2014 06:44:35 -0800
Message-ID: <530B5AD0.5010708@intel.com>
Date: Mon, 24 Feb 2014 16:44:32 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1393233958.git.liezhi.yang@windriver.com>
	<641185084afb8d76865faa13879547f8e546e553.1393233958.git.liezhi.yang@windriver.com>
In-Reply-To: <641185084afb8d76865faa13879547f8e546e553.1393233958.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] weston: disable-egl when no wayland
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
X-List-Received-Date: Mon, 24 Feb 2014 14:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2014 11:26 AM, Robert Yang wrote:
> There was a configure error when build weston without wayland:
>
> configure: error: Package requirements (egl >= 7.10 glesv2 wayland-client wayland-egl) were not met:
>
> No package 'wayland-egl' found
>
> [YOCTO #5867]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-graphics/wayland/weston_1.4.0.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> index 5c389a0..e0c354d 100644
> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> @@ -39,7 +39,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev way
>   # Weston on KMS
>   PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
>   # Weston on Wayland (nested Weston)
> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
> +PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl --disable-wayland-compositor,virtual/mesa"
>   # Weston on X11
>   PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
>   # Headless Weston
How did you build weston without wayland?
Have you built wayland without libwayland-egl and then tried to build 
weston?

