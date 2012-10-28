Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TSHis-0004MN-DX
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:31:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Oct 2012 18:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,663,1344236400"; d="scan'208";a="210210034"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by azsmga001.ch.intel.com with ESMTP; 27 Oct 2012 18:17:44 -0700
Message-ID: <508C87B8.8080003@linux.intel.com>
Date: Sat, 27 Oct 2012 18:17:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
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
X-List-Received-Date: Sun, 28 Oct 2012 01:31:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2012 09:37 AM, Ross Burton wrote:
> Add explicit build-dependency on GConf as currently it's an implicit dependency
> and so vunerable to races at build time.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    2 +-
>   meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 463777d..ab70c7e 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>   DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
>              ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
>   # optional
> -DEPENDS += "udev alsa-lib glib-2.0 dbus \
> +DEPENDS += "udev alsa-lib glib-2.0 dbus gconf \
>              ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
>
>   SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> index a10b953..d25b424 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> @@ -1,6 +1,6 @@
>   require pulseaudio.inc
>
> -PR = "r7"
> +PR = "r8"
>
>   DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>
>

Merged this full set to OE-Core

Thanks
	Sau!



