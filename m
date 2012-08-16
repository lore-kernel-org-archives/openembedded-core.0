Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T25eS-0001FY-Vf
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 21:22:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 12:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="135095711"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 12:10:41 -0700
Message-ID: <502D45B1.50109@linux.intel.com>
Date: Thu, 16 Aug 2012 12:10:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344838459-26178-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1344838459-26178-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: Re: [PATCH] libdrm: package update 2.4.35 -> 2.4.37
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
X-List-Received-Date: Thu, 16 Aug 2012 19:22:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2012 11:14 PM, Constantin Musca wrote:
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../drm/{libdrm_2.4.35.bb => libdrm_2.4.37.bb}     |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-graphics/drm/{libdrm_2.4.35.bb => libdrm_2.4.37.bb} (50%)
>
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.35.bb b/meta/recipes-graphics/drm/libdrm_2.4.37.bb
> similarity index 50%
> rename from meta/recipes-graphics/drm/libdrm_2.4.35.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.37.bb
> index 58ee449..d704b90 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.35.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.37.bb
> @@ -6,5 +6,5 @@ SRC_URI += "file://installtests.patch \
>               file://GNU_SOURCE_definition.patch \
>              "
>
> -SRC_URI[md5sum] = "a40f5293dc0a7b49d2a1e959d7d60194"
> -SRC_URI[sha256sum] = "c390aee132f05910edb09398b70e108c6b53f9b69b21914a9ea3165eed6f1b21"
> +SRC_URI[md5sum] = "9765919c28d4a54887576db3680137cc"
> +SRC_URI[sha256sum] = "e4ea39a901d4a8e59064f10f413bb037dad7790f7c16a5986e7cc1453b36488f"
>
Merged into OE-Core

Thanks
	Sau!



