Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVrnI-0006wv-EK
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 22:34:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Nov 2011 13:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,273,1320652800"; d="scan'208";a="97160139"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2011 13:27:39 -0800
Message-ID: <4ED69FCB.5030809@linux.intel.com>
Date: Wed, 30 Nov 2011 13:27:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322608290.git.josh@linux.intel.com>
	<b1b16d8377588138a5e1111452c7937979297c5f.1322608290.git.josh@linux.intel.com>
In-Reply-To: <b1b16d8377588138a5e1111452c7937979297c5f.1322608290.git.josh@linux.intel.com>
Subject: Re: [PATCH 4/4] distro_tracking_fields: additions and updates
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
X-List-Received-Date: Wed, 30 Nov 2011 21:34:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2011 03:14 PM, Joshua Lock wrote:
> Update tracking info for gthumb and add untracked recipes mx, json-glib
> and xdg-utils.
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> ---
>   .../conf/distro/include/distro_tracking_fields.inc |   14 +++++++++++++-
>   1 files changed, 13 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> index c07341e..9338b30 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -5790,8 +5790,20 @@ DISTRO_PN_ALIAS_pn-lsbsetup = "Windriver"
>
>   RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
>   RECIPE_LATEST_VERSION_pn-talloc = "2.0.5"
> +
>   RECIPE_STATUS_pn-gthumb = "red"
> -RECIPE_LATEST_VERSION_pn-gthumb = "2.12.2"
> +RECIPE_LATEST_VERSION_pn-gthumb = "2.12.3"
> +RECIPE_LAST_UPDATE_pn-gthumb = "Nov 16, 2011"
> +
> +RECIPE_LATEST_VERSION_pn-mx = "1.3.2"
> +RECIPE_LAST_UPDATE_pn-mx = "Nov 16, 2011"
> +
> +RECIPE_LATEST_VERSION_pn-json-glib = "0.14.2"
> +RECIPE_LAST_UPDATE_pn-json-glib = "Nov 16, 2011"
> +
> +RECIPE_LATEST_VERSION_pn-xdg-utils = "1.0.2"
> +RECIPE_LAST_UPDATE_pn-xdg-utils = "Nov 16, 2011"
> +RECIPE_NO_UPDATE_REASON_pn-xdg-utils = "Latest release is a release candidate - 1.1.0rc1"
>
>   RECIPE_LATEST_VERSION_pn-libtheora = "1.2.0"
>   RECIPE_NO_UPDATE_REASON_pn-libtheora = "1.1.1 is latest stable release not 1.2.0alpha1"

Josh,

if you are picking up maintence of these recipes please add a 
RECIPE_MAINTAINER_pn- field.

Thanks	
Sau!


