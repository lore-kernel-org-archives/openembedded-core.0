Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9zlz-0000Bf-5h
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 16:43:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2012 07:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,387,1344236400"; d="scan'208";a="219418719"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2012 07:30:40 -0700
Message-ID: <504A0510.5020705@linux.intel.com>
Date: Fri, 07 Sep 2012 07:30:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1346937168-8200-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1346937168-8200-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/core-image: improve comments listing IMAGE_FEATURES
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
X-List-Received-Date: Fri, 07 Sep 2012 14:43:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 06:12 AM, Paul Eggleton wrote:
> Ensure this listing is complete. (Comment change only.)
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/classes/core-image.bbclass |    9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 2bfadb4..2e67018 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -15,14 +15,19 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>   # - x11                 - X server
>   # - x11-base            - X server with minimal environment
>   # - x11-sato            - OpenedHand Sato environment
> -# - tools-sdk           - SDK
>   # - tools-debug         - debugging tools
>   # - tools-profile       - profiling tools
>   # - tools-testapps      - tools usable to make some device tests
> +# - tools-sdk           - SDK (C/C++ compiler, autotools, etc.)
>   # - nfs-server          - NFS server
>   # - ssh-server-dropbear - SSH server (dropbear)
>   # - ssh-server-openssh  - SSH server (openssh)
> -# - debug-tweaks        - makes an image suitable for development
> +# - qt4-pkgs            - Qt4/X11 and demo applications
> +# - package-management  - installs package management tools and preserves the package manager database
> +# - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
> +# - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
> +# - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
> +# - doc-pkgs            - documentation packages for all installed packages in the rootfs
>   #
>   PACKAGE_GROUP_x11 = "packagegroup-core-x11"
>   PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
>
Merged into OE-Core

Thanks
	Sau!



