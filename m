Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ2kY-0001mP-3k
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 22:35:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 13:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138609358"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2012 13:25:55 -0700
Message-ID: <4FA2E9D3.3070702@linux.intel.com>
Date: Thu, 03 May 2012 13:25:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335815880-7346-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1335815880-7346-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] nfs-utils: don't try to unload nfsd module
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
X-List-Received-Date: Thu, 03 May 2012 20:35:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2012 12:58 PM, Andreas Oberritter wrote:
> * When nfsserver get's stopped, "modprobe -r nfsd" may
>    hang indefinitely. As there's no need to unload the
>    module, just remove the call to modprobe.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../nfs-utils/nfs-utils/nfsserver                  |    8 --------
>   .../nfs-utils/nfs-utils_1.2.3.bb                   |    2 +-
>   2 files changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> index 69c8718..e460e26 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> @@ -105,14 +105,6 @@ stop_nfsd(){
>   	}
>   	then
>   		echo done
> -		# This will remove, recursively, dependencies
> -		echo -n 'removing nfsd kernel module: '
> -		if modprobe -r nfsd
> -		then
> -			echo done
> -		else
> -			echo failed
> -		fi
>   	else
>   		echo failed
>   	fi
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> index d047940..eb18aaa 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> @@ -12,7 +12,7 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
>   RDEPENDS_${PN} = "portmap"
>   RRECOMMENDS_${PN} = "kernel-module-nfsd"
>
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
>              file://nfs-utils-1.0.6-uclibc.patch \

Merged into OE-Core

Thanks
	Sau!


