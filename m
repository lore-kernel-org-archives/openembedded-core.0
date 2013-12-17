Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF6C60CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 16:47:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2013 08:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,502,1384329600"; d="scan'208";a="426108293"
Received: from paulonei-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.28])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2013 08:47:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>,
	Alexandru Niculita <alexnick87@gmail.com>
Date: Tue, 17 Dec 2013 16:47:01 +0000
Message-ID: <6803371.I0exNcVham@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libsdl: Add support for libsdl-native
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
X-List-Received-Date: Tue, 17 Dec 2013 16:47:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 December 2013 18:33:51 Andrei Gherzan wrote:
> From: Alexandru Niculita <alexnick87@gmail.com>
> 
> Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65
> Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb index 4b4ff63..84d3ad6
> 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -17,6 +17,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb',
> 'directfb', '', d)} \ ${@base_contains('DISTRO_FEATURES', 'x11',
> 'virtual/libx11 libxext libxrandr libxrender', '', d)} \ tslib"
>  DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11',
> 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender
> nativesdk-libxext', '', d)}" +DEPENDS_class-native =
> "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-native libxrandr-native
> libxrender-native libxext-native', '', d)}"
> 
>  PR = "r2"
> 
> @@ -63,4 +64,4 @@ do_configure_prepend() {
>          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>  }
> 
> -BBCLASSEXTEND = "nativesdk"
> +BBCLASSEXTEND = "nativesdk native"

Why do you want to do this? Usually, it's better to rely on the host distro 
providing SDL for native because building libsdl-native can lead to problems 
linking against a specific host OpenGL implementation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

