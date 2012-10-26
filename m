Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRmxW-0002lN-34
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 18:40:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2012 09:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="211265754"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2012 09:27:02 -0700
Message-ID: <508AB9D5.1030902@linux.intel.com>
Date: Fri, 26 Oct 2012 09:27:01 -0700
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
X-List-Received-Date: Fri, 26 Oct 2012 16:40:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


My prior email about this being merged was wrong!!

see below
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
Maybe your missing the require xorg-lib-common.inc?

> +DEPENDS = "util-macros flex-native bison-native"
> +
You have a different DEPENDS set than the git version.

Should there be a libxkbcommon.inc that's shared between the git and 
"version" bb files for the generic header / license stuff?

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
The git version does not disable docs, any reason to do it here?

Sau!




