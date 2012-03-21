Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SARaE-00086i-Uy
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:52:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 12:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121634814"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by azsmga001.ch.intel.com with ESMTP; 21 Mar 2012 12:42:39 -0700
Message-ID: <4F6A2F2F.2090607@linux.intel.com>
Date: Wed, 21 Mar 2012 12:42:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
In-Reply-To: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Wed, 21 Mar 2012 19:52:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
> * This move will allow the testing of meta-kde for users without meta-openembedded.
>
So what other layers are using giflib?

Your suggesting that we need to have it in oe-core so people don't need 
to add the meta-openembedded layer when using meta-kde?

I am just trying to get more data before making a decision.

Thanks
	Sau!


> Signed-off-by: Samuel Stirtzel<s.stirtzel@googlemail.com>
> ---
>   meta/recipes-devtools/giflib/giflib_4.1.6.bb |   20 ++++++++++++++++++++
>   1 files changed, 20 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/giflib/giflib_4.1.6.bb
>
> diff --git a/meta/recipes-devtools/giflib/giflib_4.1.6.bb b/meta/recipes-devtools/giflib/giflib_4.1.6.bb
> new file mode 100644
> index 0000000..bd7b495
> --- /dev/null
> +++ b/meta/recipes-devtools/giflib/giflib_4.1.6.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "shared library for GIF images"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
> +PR = "r2"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
> +
> +inherit autotools
> +
> +DEPENDS = "libsm"
> +
> +PACKAGES += "${PN}-utils"
> +FILES_${PN} = "${libdir}/libgif.so.*"
> +FILES_${PN}-utils = "${bindir}"
> +
> +BBCLASSEXTEND = "native"
> +
> +SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
> +SRC_URI[sha256sum] = "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"


