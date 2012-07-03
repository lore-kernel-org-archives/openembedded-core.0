Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm7Ve-0003K0-2G
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:07:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jul 2012 10:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118575833"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2012 10:56:25 -0700
Message-ID: <4FF33249.3030804@linux.intel.com>
Date: Tue, 03 Jul 2012 10:56:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207010531450.30586@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207010531450.30586@oneiric>
Subject: Re: bitbake.conf: Tidy up a few comment typoes; no functional changes.
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
X-List-Received-Date: Tue, 03 Jul 2012 18:07:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2012 02:32 AM, Robert P. J. Day wrote:
>
> Signed-off-by: Robert P. J. Day<rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9377ee6..0a177c8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -368,7 +368,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>   PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
>
>   ##################################################################
> -# SDK variables,
> +# SDK variables.
>   ##################################################################
>
>   SDK_NAME_PREFIX ?= "oecore"
> @@ -395,9 +395,9 @@ IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
>   # This option allows for a percentage overage of the actual image size rather than a
>   # fixed extra space, this is space needed for initial startup and basic operations.
>   IMAGE_OVERHEAD_FACTOR ?= "1.3"
> -# This option allow for adding addition space in K above and beyond what the
> +# This option allows for adding additional space in K above and beyond what the
>   # IMAGE_OVERHEAD_FACTOR might add. This space is for additional packages, user data, ...
> -# To set a fixed size then overrideing IMAGE_ROOTFS_SIZE with the max size one wants
> +# To set a fixed size then overriding IMAGE_ROOTFS_SIZE with the max size one wants
>   # should do the trick
>   IMAGE_ROOTFS_EXTRA_SPACE ?= "0"
>
> @@ -418,7 +418,7 @@ CCACHE ??= ""
>   # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
>   # of ccache some distributions (e.g., Fedora 17).
>   export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
> -# Assign CCACHE_DIR a default vaule to fix a bug of ccache 3.1.7,
> +# Assign CCACHE_DIR a default value to fix a bug of ccache 3.1.7,
>   # since it would always create CCACHE_DIR/.ccache even if
>   # CCACHE_DISABLE = 1.
>   export CCACHE_DIR ??= "${@os.getenv('HOME')}"
>
Merged into OE-Core

Thanks
	Sau!



