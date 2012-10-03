Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJEBn-0007eH-Vh
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 03:55:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Oct 2012 18:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,525,1344236400"; d="scan'208";a="200874354"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga001.jf.intel.com with ESMTP; 02 Oct 2012 18:42:52 -0700
Message-ID: <506B981C.1090206@linux.intel.com>
Date: Tue, 02 Oct 2012 18:42:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, daniel@fooishbar.org
References: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: Remove Cairo dependency
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
X-List-Received-Date: Wed, 03 Oct 2012 01:55:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2012 04:56 AM, Ross Burton wrote:
> From: Daniel Stone <daniel@fooishbar.org>
>
> This causes a build loop, when DRM depends on Cairo depends on Mesa
> depends on DRM.  We can safely remove it as it's only one libdrm example
> program which uses Cairo, which we won't be needing.  At least it's not
> worth the build loop.
>
> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/drm/libdrm.inc |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
> index 5ddab85..cc09791 100644
> --- a/meta/recipes-graphics/drm/libdrm.inc
> +++ b/meta/recipes-graphics/drm/libdrm.inc
> @@ -9,9 +9,9 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
>   SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
>   PROVIDES = "drm"
> -DEPENDS = "libpthread-stubs udev cairo"
> +DEPENDS = "libpthread-stubs udev"
>
> -INC_PR = "r2"
> +INC_PR = "r3"
>
>   #libpciaccess is required starting from libdrm 2.4.26
>   DEPENDS += " libpciaccess"
>
Merged into OE-Core

Thanks
	Sau!



