Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2jl-0003p9-K3
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:19:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Oct 2012 08:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="159854154"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Oct 2012 08:05:47 -0700
Message-ID: <508803CB.1090103@linux.intel.com>
Date: Wed, 24 Oct 2012 08:05:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1351022257-15219-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1351022257-15219-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxkbcommon: new window system-independent XKB library
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
X-List-Received-Date: Wed, 24 Oct 2012 15:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2012 12:57 PM, Ross Burton wrote:
> Used by Wayland, Clutter, and more.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb |   18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
> new file mode 100644
> index 0000000..7304080
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Generic XKB keymap library"
> +DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
> +processes a reduced subset of keymaps as defined by the XKB specification."
> +HOMEPAGE = "http://www.xkbcommon.org"
> +
> +LICENSE = "MIT & MIT-style"
> +
> +DEPENDS = "util-macros flex-native bison-native"
> +
> +SRC_URI = "http://xkbcommon.org/download/${PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "2be3d4a255d02c7d46fc6a9486f21f6a"
> +SRC_URI[sha256sum] = "74eb0a121ca3998015fd687591426bb15c524645a72cf602831b2e729172fb42"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
> +
> +PR = "r0"
> +
> +EXTRA_OECONF = "--disable-docs"
>
Merged into OE-Core

Thanks
	Sau!



