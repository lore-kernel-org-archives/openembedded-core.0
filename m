Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TvHGp-0008Dc-BN
	for Openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 01:54:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jan 2013 16:39:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="244376503"
Received: from unknown (HELO [10.255.14.213]) ([10.255.14.213])
	by azsmga001.ch.intel.com with ESMTP; 15 Jan 2013 16:39:00 -0800
Message-ID: <50F5F6A3.4060101@linux.intel.com>
Date: Tue, 15 Jan 2013 16:38:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: nitin.a.kamble@intel.com
References: <cover.1358278958.git.nitin.a.kamble@intel.com>
	<8738a6efd777d20d444fc9b149ce75498b21202b.1358278958.git.nitin.a.kamble@intel.com>
In-Reply-To: <8738a6efd777d20d444fc9b149ce75498b21202b.1358278958.git.nitin.a.kamble@intel.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xf86-video-modesetting: new recipe for gma500
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
X-List-Received-Date: Wed, 16 Jan 2013 00:54:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2013 11:44 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> I am trying to use gma500 driver for the noemgd BSPs. The current best
> xf86 driver for it is modesetting. This recipe provides that
> driver.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   .../xorg-driver/xf86-video-modesetting_0.6.0.bb    |    8 ++++++++
>   1 files changed, 8 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
> new file mode 100644
> index 0000000..407ad1a
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
> @@ -0,0 +1,8 @@
> +require xorg-driver-video.inc
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
> +
This seems to be wrong relative the actual version.

> ERROR: Task 5428 (/intel/distro/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile) failed with exit code '1'
> ERROR: xf86-video-modesetting: md5 data is not matching for file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8
> ERROR: xf86-video-modesetting: The new md5 checksum is 5e53d3fcadb1c23d122ad63cb099a918
> ERROR: xf86-video-modesetting: Check if the license information has changed in
> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
> ERROR: Function failed: do_qa_configure
> ERROR: Logfile of failure stored in: /intel/builds/world/tmp/work/armv5te-poky-linux-gnueabi/xf86-video-modesetting/2_0.6.0-r21.0/temp/log.do_configure.9705
> ERROR: Task 3282 (/intel/distro/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb, do_configure) failed with exit code '1'

Sau!

> +DESCRIPTION = "X.Org X server -- modesetting display driver"
> +PR = "${INC_PR}.0"
> +
> +SRC_URI[md5sum] = "d8a771d5d2d75ea9d234c6928153c08b"
> +SRC_URI[sha256sum] = "852f9ddb213913f75e1e65ad7ce9c6b5bc7f43a93d8087b6e59666ea4eb3d0d6"
>


