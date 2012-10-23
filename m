Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQjvG-0006S0-Sa
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 21:13:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Oct 2012 12:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="237295064"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2012 12:00:25 -0700
Message-ID: <5086E949.2070606@linux.intel.com>
Date: Tue, 23 Oct 2012 12:00:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, Damien.lespiau@intel.com
References: <cover.1350898066.git.ross.burton@intel.com>
	<81721346a29d0ac26f511328a1ea3eeba7e2f7df.1350898066.git.ross.burton@intel.com>
In-Reply-To: <81721346a29d0ac26f511328a1ea3eeba7e2f7df.1350898066.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] mtdev: New recipe for mtdev
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
X-List-Received-Date: Tue, 23 Oct 2012 19:13:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2012 02:30 AM, Ross Burton wrote:
> From: Damien Lespiau <damien.lespiau@intel.com>
>
> Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/wayland/mtdev_1.1.2.bb |   20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 meta/recipes-graphics/wayland/mtdev_1.1.2.bb
>
> diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
> new file mode 100644
> index 0000000..95d99ee
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
> @@ -0,0 +1,20 @@
> +inherit autotools pkgconfig
> +
> +SUMMARY = "Multitouch Protocol Translation Library"
> +
> +DESCRIPTION = " The mtdev is a stand-alone library which transforms all \
> +variants of kernel MT events to the slotted type B protocol. The events put \
> +into mtdev may be from any MT device, specifically type A without contact \
> +tracking, type A with contact tracking, or type B with contact tracking"
> +
> +HOMEPAGE = "http://bitmath.org/code/mtdev/"
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
> +
> +SRC_URI = "http://bitmath.org/code/mtdev/mtdev-1.1.2.tar.bz2"
> +SRC_URI[md5sum] = "d9c7700918fc392e29da7477ae20c5c2"
> +SRC_URI[sha256sum] = "698dd11ca08b3a73ad33d8a5076f6d9e018d97afad3eba36f540b8ea7b775a30"
> +
> +PR = "r0"
>

Merged into OE-Core


