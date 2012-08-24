Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4yoV-0002tm-Vk
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:41:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2012 11:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="210739793"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2012 11:28:51 -0700
Message-ID: <5037C7E3.9080000@linux.intel.com>
Date: Fri, 24 Aug 2012 11:28:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1345458318-22072-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1345458318-22072-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
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
X-List-Received-Date: Fri, 24 Aug 2012 18:41:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 03:25 AM, Ross Burton wrote:
> Use machine overrides instead of machine features.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa-common.inc |    7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> index de171f0..cfe4a37 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,7 +12,7 @@ SECTION = "x11"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
>
> -INC_PR = "r2"
> +INC_PR = "r3"
>   PE = "2"
>
>   DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
> @@ -29,9 +29,8 @@ EXTRA_OECONF = "--enable-glu \
>                   --disable-glut \
>                   --enable-shared-glapi"
>
> -PACKAGECONFIG ??= "${@base_contains('MACHINE_FEATURES', 'x86', 'gles', '', d)} \
> -                   ${@base_contains('MACHINE_FEATURES', 'x86', 'egl', '', d)} \
> -                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG_append_x86 = " gles egl"
>
>   X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
>   PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
>

Merged into OE-Core

Thanks
	Sau!



