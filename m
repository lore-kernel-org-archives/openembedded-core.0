Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJAK8-0000bd-CD
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:43:44 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 13:37:43 -0700
Received: by wyg24 with SMTP id 24so2114261wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 13:37:42 -0700 (PDT)
Received: by 10.216.137.13 with SMTP id x13mr118456wei.52.1319661461993;
	Wed, 26 Oct 2011 13:37:41 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id gg13sm5286831wbb.8.2011.10.26.13.37.40
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 13:37:41 -0700 (PDT)
Message-ID: <4EA86F93.4080407@intel.com>
Date: Wed, 26 Oct 2011 22:37:39 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319576293.git.scott.a.garman@intel.com>
	<62b3eae763911554ab01754726ed7adacad1a8a4.1319576293.git.scott.a.garman@intel.com>
In-Reply-To: <62b3eae763911554ab01754726ed7adacad1a8a4.1319576293.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 5/5] distro_tracking_fields: updates for sudo, mtools, grep, and openssh
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
X-List-Received-Date: Wed, 26 Oct 2011 20:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2011 11:36 PM, Scott Garman wrote:
> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> ---
>   .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
>   1 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> index 1f3540e..936ef81 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -813,12 +813,12 @@ RECIPE_MAINTAINER_pn-pax-utils = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-sudo = "green"
>   RECIPE_DEPENDENCY_CHECK_pn-sudo = "not done"
> -RECIPE_LATEST_VERSION_pn-sudo = "1.8.1p2"
> +RECIPE_LATEST_VERSION_pn-sudo = "1.8.3"
>   RECIPE_INTEL_SECTION_pn-sudo = "base utils"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "1 month"
> -RECIPE_LATEST_RELEASE_DATE_pn-sudo = "2011/05/16"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "2 months"
> +RECIPE_LATEST_RELEASE_DATE_pn-sudo = "2011/10/21"
These date formats should be MMM DD, YYYY also, for all the data listed 
below also.

Thanks
	Sau!

>   RECIPE_COMMENTS_pn-sudo = ""
> -RECIPE_LAST_UPDATE_pn-sudo = "Jun 14, 2011"
> +RECIPE_LAST_UPDATE_pn-sudo = "Oct 25, 2011"
>   RECIPE_MAINTAINER_pn-sudo = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-blktool = "green"
> @@ -1290,12 +1290,12 @@ DISTRO_PN_ALIAS_pn-msynctool = "OpenSuse=msynctool Mandriva=msynctool"
>
>   RECIPE_STATUS_pn-mtools = "green"
>   RECIPE_DEPENDENCY_CHECK_pn-mtools = "not done"
> -RECIPE_LATEST_VERSION_pn-mtools = "4.0.16"
> +RECIPE_LATEST_VERSION_pn-mtools = "4.0.17"
>   RECIPE_INTEL_SECTION_pn-mtools = "optional"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mtools = "6 months"
> -RECIPE_LATEST_RELEASE_DATE_pn-mtools = "2011/04/16"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mtools = "2 months"
> +RECIPE_LATEST_RELEASE_DATE_pn-mtools = "2011/06/28"
>   RECIPE_COMMENTS_pn-mtools = ""
> -RECIPE_LAST_UPDATE_pn-mtools = "Jun 15, 2011"
> +RECIPE_LAST_UPDATE_pn-mtools = "Oct 25, 2011"
>   RECIPE_MAINTAINER_pn-mtools = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-pm-utils = "green"
> @@ -2016,22 +2016,22 @@ RECIPE_MAINTAINER_pn-cronie = "Dexuan Cui<dexuan.cui@intel.com>"
>
>   RECIPE_STATUS_pn-grep = "green"
>   RECIPE_DEPENDENCY_CHECK_pn-grep = "not done"
> -RECIPE_LATEST_VERSION_pn-grep = "2.8"
> +RECIPE_LATEST_VERSION_pn-grep = "2.9"
>   RECIPE_INTEL_SECTION_pn-grep = "base"
>   RECIPE_NO_OF_PATCHES_pn-grep = "0"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-grep = "8 months"
> -RECIPE_LATEST_RELEASE_DATE_pn-grep = "05/2011"
> -RECIPE_LAST_UPDATE_pn-grep = "Jun 5, 2011"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-grep = "1 month"
> +RECIPE_LATEST_RELEASE_DATE_pn-grep = "06/2011"
> +RECIPE_LAST_UPDATE_pn-grep = "Oct 25, 2011"
>   RECIPE_MAINTAINER_pn-grep = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-openssh = "green"
>   RECIPE_DEPENDENCY_CHECK_pn-openssh = "not done"
> -RECIPE_LATEST_VERSION_pn-openssh = "5.8p2"
> +RECIPE_LATEST_VERSION_pn-openssh = "5.9p1"
>   RECIPE_INTEL_SECTION_pn-openssh = "base"
>   RECIPE_NO_OF_PATCHES_pn-openssh = "1"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "3 months"
> -RECIPE_LATEST_RELEASE_DATE_pn-openssh = "05/2011"
> -RECIPE_LAST_UPDATE_pn-openssh = "Jun 5, 2011"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "4 months"
> +RECIPE_LATEST_RELEASE_DATE_pn-openssh = "09/2011"
> +RECIPE_LAST_UPDATE_pn-openssh = "Oct 25, 2011"
>   RECIPE_MAINTAINER_pn-openssh = "Scott Garman<scott.a.garman@intel.com>"
>
>   RECIPE_STATUS_pn-tar = "green"



