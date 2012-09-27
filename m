Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGSW-0000tX-9w
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:57:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Sep 2012 08:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="149885792"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 08:43:48 -0700
Message-ID: <50647433.9060104@linux.intel.com>
Date: Thu, 27 Sep 2012 08:43:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1348561895.git.liezhi.yang@windriver.com>
	<352cdca21cbdaec95d82f141f7fe0bd86615eedb.1348561895.git.liezhi.yang@windriver.com>
In-Reply-To: <352cdca21cbdaec95d82f141f7fe0bd86615eedb.1348561895.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] package_rpm.bbclass: change the arch's "-" to "_" for platform
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
X-List-Received-Date: Thu, 27 Sep 2012 15:57:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 06:38 AM, Robert Yang wrote:
> The platform and platform_extra will be written to /etc/rpm/platform,
> the rpm's arch has changed the "-" to "_", so the value in platform
> should also be updated.
>
> [YOCTO #3159]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/package_rpm.bbclass | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 64689d8..be6bd45 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -276,8 +276,8 @@ process_pkg_list_rpm() {
>   package_install_internal_rpm () {
>
>   	local target_rootfs="${INSTALL_ROOTFS_RPM}"
> -	local platform="${INSTALL_PLATFORM_RPM}"
> -	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
> +	local platform="`echo ${INSTALL_PLATFORM_RPM} | sed 's#-#_#g'`"
> +	local platform_extra="`echo ${INSTALL_PLATFORM_EXTRA_RPM} | sed 's#-#_#g'`"
>   	local confbase="${INSTALL_CONFBASE_RPM}"
>   	local package_to_install="${INSTALL_PACKAGES_RPM}"
>   	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
>

Merged into OE-Core

Thanks
	Sau!



