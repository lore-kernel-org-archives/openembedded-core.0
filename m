Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCPaD-0004Zl-SS
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 08:40:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2012 23:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,421,1344236400"; d="scan'208";a="192945201"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2012 23:28:22 -0700
Message-ID: <5052CE86.6030302@linux.intel.com>
Date: Thu, 13 Sep 2012 23:28:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1347534093.git.paul.eggleton@linux.intel.com>
	<6ccf7a1f517e37ce7a8467f4a2432b1ae957e837.1347534093.git.paul.eggleton@linux.intel.com>
In-Reply-To: <6ccf7a1f517e37ce7a8467f4a2432b1ae957e837.1347534093.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-ffmpeg: add LICENSE_FLAGS
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
X-List-Received-Date: Fri, 14 Sep 2012 06:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 04:03 AM, Paul Eggleton wrote:
> This likely requires some form of license to use in a commercial
> product.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> index efab2cf..2107704 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                       file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
>                       file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
>                       file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
> +LICENSE_FLAGS = "commercial"
>   HOMEPAGE = "http://www.gstreamer.net/"
>   DEPENDS = "gstreamer gst-plugins-base zlib bzip2"
>
>

Failures from MUT:


http://autobuilder.yoctoproject.org:8010/builders/meta-intel-gpl/builds/47/steps/shell_42/logs/stdio

Seems to add some new ERRORS:

ERROR: Nothing PROVIDES 'libcroco-native' (but 
virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/meta-intel-gpl/build/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb 
DEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gst-ffmpeg' (but 
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/meta-intel-gpl/build/yocto/meta-intel/common/recipes-multimedia/gstreamer/gst-va-intel.bb 
RDEPENDS on or otherwise requires it)
ERROR: gst-ffmpeg was skipped: because it has a restricted license not 
whitelisted in LICENSE_FLAGS_WHITELIST
NOTE: Runtime target 'gst-ffmpeg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gst-ffmpeg']
ERROR: Nothing RPROVIDES 'gst-va-intel-general' (but 
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/meta-intel-gpl/build/yocto/meta-intel/common/recipes-multimedia/gstreamer/gst-va-intel.bb 
RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'gst-va-intel-general'
NOTE: Runtime target 'gst-va-intel-general' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gst-va-intel-general']
ERROR: Nothing RPROVIDES 'gst-va-intel-video' (but 
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/meta-intel-gpl/build/yocto/meta-intel/common/recipes-multimedia/gstreamer/gst-va-intel.bb 
RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'gst-va-intel-video'
NOTE: Runtime target 'gst-va-intel-video' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gst-va-intel-video']


