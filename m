Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrO2-0004gH-F9
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 20:10:06 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2012 10:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="144312535"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2012 10:57:32 -0700
Message-ID: <5050CD0C.1030607@linux.intel.com>
Date: Wed, 12 Sep 2012 10:57:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347445428-15753-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347445428-15753-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa-xlib: remove, it serves no useful purpose
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
X-List-Received-Date: Wed, 12 Sep 2012 18:10:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2012 03:23 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa-xlib.inc      |    1 -
>   meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb |    5 -----
>   meta/recipes-graphics/mesa/mesa-xlib_git.bb   |    8 --------
>   3 files changed, 14 deletions(-)
>   delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
>   delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
>   delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_git.bb
>
Merged this and the mesa-dri patch to OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-graphics/mesa/mesa-xlib.inc
> deleted file mode 100644
> index b720e14..0000000
> --- a/meta/recipes-graphics/mesa/mesa-xlib.inc
> +++ /dev/null
> @@ -1 +0,0 @@
> -EXTRA_OECONF += " --with-driver=xlib --without-gallium-drivers"
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
> deleted file mode 100644
> index a89640e..0000000
> --- a/meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require mesa-common.inc
> -require mesa-${PV}.inc
> -require mesa-xlib.inc
> -PR = "${INC_PR}.2"
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_git.bb b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
> deleted file mode 100644
> index 6647120..0000000
> --- a/meta/recipes-graphics/mesa/mesa-xlib_git.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require mesa-common.inc
> -require mesa-git.inc
> -require mesa-xlib.inc
> -
> -# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
> -DEFAULT_PREFERENCE = "-2"
> -
> -PR = "${INC_PR}.1"
>


