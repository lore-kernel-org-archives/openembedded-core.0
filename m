Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNscB-0008Tz-Jg
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:22:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2012 14:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93982962"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 14:12:26 -0700
Message-ID: <4F9B0BBA.2070408@linux.intel.com>
Date: Fri, 27 Apr 2012 14:12:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334960759.git.scott.a.garman@intel.com>
	<e415b599197e58873666197ddb4bb924a4239bc7.1334960759.git.scott.a.garman@intel.com>
In-Reply-To: <e415b599197e58873666197ddb4bb924a4239bc7.1334960759.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] distro_tracking: manual check updates
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
X-List-Received-Date: Fri, 27 Apr 2012 21:22:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2012 03:27 PM, Scott Garman wrote:
> Manual check updates for the following recipes:
>
> libpng
> libgdbus
> expat
> chrpath
> e2fsprogs
> opensp
> nfs-utils
>
Merged into OE-Core

Thanks
	Sau!

> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> ---
>   .../conf/distro/include/distro_tracking_fields.inc |   24 ++++++++++----------
>   1 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> index de6f3dd..a8cd10d 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -265,7 +265,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-expat = "17 months"
>   RECIPE_LATEST_RELEASE_DATE_pn-expat = "Jun 5, 2007"
>   RECIPE_COMMENTS_pn-expat = ""
>   RECIPE_LAST_UPDATE_pn-expat = "Jul 7, 2010"
> -RECIPE_MANUAL_CHECK_DATE_pn-expat = "Mar 15, 2012"
> +RECIPE_MANUAL_CHECK_DATE_pn-expat = "Apr 20, 2012"
>   RECIPE_MAINTAINER_pn-expat = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-dbus = "green"
> @@ -301,15 +301,15 @@ RECIPE_MAINTAINER_pn-neon = "Dongxiao Xu<dongxiao.xu@intel.com>"
>
>   RECIPE_STATUS_pn-libpng = "green"
>   RECIPE_DEPENDENCY_CHECK_pn-libpng = "not done"
> -RECIPE_LATEST_VERSION_pn-libpng = "1.5.9"
> +RECIPE_LATEST_VERSION_pn-libpng = "1.5.10"
>   RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 and later changes the API and breaks libmatchbox. Sticking with the 1.2.x series instead"
>   RECIPE_PATCH_pn-libpng+makefile = "by RP; 2008; to define ECHO explicitly for lbitool 2.2.2. need check whether it's still valide for new libtool. candidate for upstream"
>   RECIPE_INTEL_SECTION_pn-libpng = "base libs"
>   RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "unknown"
> -RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Mar 08, 2012"
> +RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Mar 29, 2012"
>   RECIPE_COMMENTS_pn-libpng = ""
>   RECIPE_LAST_UPDATE_pn-libpng = "Jul 18, 2011"
> -RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Mar 15, 2012"
> +RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Apr 20, 2012"
>   RECIPE_MAINTAINER_pn-libpng = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-libidn = "green"
> @@ -694,16 +694,16 @@ RECIPE_MAINTAINER_pn-dbus-wait= "Zhai Edwin<edwin.zhai@intel.com>"
>   RECIPE_STATUS_pn-e2fsprogs = "yellow"
>   # patch comment
>   RECIPE_DEPENDENCY_CHECK_pn-e2fsprogs = "not done"
> -RECIPE_LATEST_VERSION_pn-e2fsprogs = "1.42.1"
> +RECIPE_LATEST_VERSION_pn-e2fsprogs = "1.42.2"
>   RECIPE_PATCH_pn-e2fsprogs+quotefix = "to be pushed upstream"
>   RECIPE_PATCH_pn-e2fsprogs+mkdir = "to be pushed upstream; no comment; MKINSTALLDIRS is not supported in new version autotool"
>   RECIPE_PATCH_pn-e2fsprogs+acinclude = "to be pushed upstream;"
>   RECIPE_INTEL_SECTION_pn-e2fsprogs = "base utils"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "2 months"
> -RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "Feb 17, 2012"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "1 month"
> +RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "Mar 28, 2012"
>   RECIPE_COMMENTS_pn-e2fsprogs = ""
>   RECIPE_LAST_UPDATE_pn-e2fsprogs = "Mar 15, 2012"
> -RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Mar 15, 2012"
> +RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Apr 20, 2012"
>   RECIPE_MAINTAINER_pn-e2fsprogs = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-initramfs-boot = "green"
> @@ -1236,7 +1236,7 @@ RECIPE_NO_OF_PATCHES_pn-libgdbus = "0"
>   RECIPE_LATEST_RELEASE_DATE_pn-libgdbus = "Sep 01, 2008"
>   RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgdbus = "unknown"
>   RECIPE_LAST_UPDATE_pn-libgdbus = "Jan 4, 2011"
> -RECIPE_MANUAL_CHECK_DATE_pn-libgdbus = "Mar 15, 2012"
> +RECIPE_MANUAL_CHECK_DATE_pn-libgdbus = "Apr 20, 2012"
>   DISTRO_PN_ALIAS_pn-libgdbus = "Intel"
>   RECIPE_MAINTAINER_pn-libgdbus = "Scott Garman<scott.a.garman@intel.com>"
>
> @@ -1264,7 +1264,7 @@ RECIPE_LATEST_VERSION_pn-chrpath = "0.14"
>   RECIPE_LATEST_RELEASE_DATE_pn-chrpath = "Sep 27, 2011"
>   RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-chrpath = "unknown"
>   RECIPE_LAST_UPDATE_pn-chrpath = "Jan 12, 2012"
> -RECIPE_MANUAL_CHECK_DATE_pn-chrpath = "Mar 15, 2012"
> +RECIPE_MANUAL_CHECK_DATE_pn-chrpath = "Apr 20, 2012"
>   RECIPE_MAINTAINER_pn-chrpath = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-dosfstools = "red"
> @@ -1679,7 +1679,7 @@ RECIPE_PATCH_pn-nfs-utils+nfsserver = "init script"
>   RECIPE_INTEL_SECTION_pn-nfs-utils = "base utils"
>   RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-nfs-utils = "3 months"
>   RECIPE_LATEST_RELEASE_DATE_pn-nfs-utils = "Feb 01, 2010"
> -RECIPE_MANUAL_CHECK_DATE_pn-nfs-utils = "Mar 15, 2012"
> +RECIPE_MANUAL_CHECK_DATE_pn-nfs-utils = "Apr 20, 2012"
>   RECIPE_MAINTAINER_pn-nfs-utils = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-dropbear = "green"
> @@ -6226,7 +6226,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-opensp = "Dec 23, 2005"
>   RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opensp = "2 years"
>   RECIPE_COMMENTS_pn-opensp = ""
>   RECIPE_LAST_UPDATE_pn-opensp = "Jan 26, 2011"
> -RECIPE_MANUAL_CHECK_DATE_pn-opensp = "Mar 15, 2012"
> +RECIPE_MANUAL_CHECK_DATE_pn-opensp = "Apr 20, 2012"
>   RECIPE_MAINTAINER_pn-opensp = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-openjade = "green"


