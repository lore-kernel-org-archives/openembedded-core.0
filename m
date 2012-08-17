Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T2Px1-0003RQ-0e
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 19:03:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 09:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135465384"
Received: from costin-desktop (HELO [10.237.105.33]) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 09:50:06 -0700
Message-ID: <502E6953.8010709@intel.com>
Date: Fri, 17 Aug 2012 18:54:59 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1345218371-15230-1-git-send-email-constantinx.musca@intel.com>
	<1345218371-15230-2-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1345218371-15230-2-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-fluendo-mp3: upgrade to 0.10.19
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
X-List-Received-Date: Fri, 17 Aug 2012 17:03:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Only the copyright year changed in the license file.

On 08/17/2012 06:46 PM, Constantin Musca wrote:
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   ...o-mp3_0.10.16.bb => gst-fluendo-mp3_0.10.19.bb} |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.16.bb => gst-fluendo-mp3_0.10.19.bb} (46%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
> similarity index 46%
> rename from meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> rename to meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
> index 3f8c67e..a485994 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
> @@ -1,7 +1,7 @@
>   require gst-fluendo.inc
>   
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=98326cbb1723a5a97e9b1db62e9faa05"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=259a43dd1c9854b71fc396f74699f4d2"
>   LICENSE_FLAGS = "commercial"
>   
>   acpaths = "-I ${S}/common/m4 -I ${S}/m4"
> @@ -10,5 +10,5 @@ PR = "r0"
>   
>   DESCRIPTION = "Fluendo closed-format mp3 GStreamer plug-in"
>   
> -SRC_URI[md5sum] = "33df57590e3f21f945fe7bace6146fa0"
> -SRC_URI[sha256sum] = "12dbd307b25fed502a52666a9c956230da09ee140a18d987452492393340f442"
> +SRC_URI[md5sum] = "5d95a9a216dd15bc5c00c9414061115c"
> +SRC_URI[sha256sum] = "30c79d24d8926f75dd4ef0f572942ce155ad541734b36a95591b9c0524dcc0f3"



