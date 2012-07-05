Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmqJw-0005AA-Is
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:58:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2012 10:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164443091"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2012 10:47:22 -0700
Message-ID: <4FF5D32A.10008@linux.intel.com>
Date: Thu, 05 Jul 2012 10:47:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH 00/10] package upgrades, about 10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 17:58:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 11:50 PM, Laurentiu Palcu wrote:
> Hi,
>
> This patchset upgrades the packages listed below. All packages were successfully
> built for all architectures with the exception of xf86-input-vmmouse which only supports
> x86 and x86-64 architectures. Basic sanity tests were also performed on an an atom based
> Lenovo S10-3t. No obvious issues spotted.
>
> Thanks,
> Laurentiu
>
> Laurentiu Palcu (10):
>    xf86-input-vmmouse: upgrade to 12.9.0
>    xf86-input-synaptics: upgrade to 1.6.2
>    xcb-util: upgrade to 0.3.9
>    libdrm: upgrade to 2.4.35
>    ethtool: upgrade to 3.4.1
>    libxft: upgrade to 2.3.1
>    xcb-util-wm: upgrade to 0.3.9
>    xcb-util-image: upgrade to 0.3.9
>    xcb-util-keysyms: upgrade to 0.3.9
>    lighttpd: upgrade to 1.4.31
>
>   .../ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb}   |    4 ++--
>   .../{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb}     |    6 +++---
>   .../drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb}     |    4 ++--
>   ...util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} |    4 ++--
>   ...-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} |    4 ++--
>   .../{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} |    4 ++--
>   .../xcb/{xcb-util_0.3.8.bb => xcb-util_0.3.9.bb}   |    4 ++--
>   ...tics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} |    4 ++--
>   ...ouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} |    4 ++--
>   .../xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb}  |    4 ++--
>   10 files changed, 21 insertions(+), 21 deletions(-)
>   rename meta/recipes-extended/ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb} (79%)
>   rename meta/recipes-extended/lighttpd/{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb} (92%)
>   rename meta/recipes-graphics/drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb} (62%)
>   rename meta/recipes-graphics/xcb/{xcb-util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} (66%)
>   rename meta/recipes-graphics/xcb/{xcb-util-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} (52%)
>   rename meta/recipes-graphics/xcb/{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} (74%)
>   rename meta/recipes-graphics/xcb/{xcb-util_0.3.8.bb => xcb-util_0.3.9.bb} (62%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} (81%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} (75%)
>   rename meta/recipes-graphics/xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb} (88%)
>

Merged into OE-Core

Thanks
	Sau!



