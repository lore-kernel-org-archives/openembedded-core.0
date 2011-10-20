Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGnNU-0002Tj-Kx
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:49:24 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 00:43:27 -0700
Received: by wwe6 with SMTP id 6so2575082wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 00:43:26 -0700 (PDT)
Received: by 10.227.157.18 with SMTP id z18mr3564354wbw.85.1319096606395;
	Thu, 20 Oct 2011 00:43:26 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id b5sm14290007wbh.4.2011.10.20.00.43.23
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 00:43:25 -0700 (PDT)
Message-ID: <4E9FD119.4030307@intel.com>
Date: Thu, 20 Oct 2011 00:43:21 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319090166.git.wenzong.fan@windriver.com>
	<79447d2d8514eb75a5cda1a32d7b25d7fc66e50c.1319090166.git.wenzong.fan@windriver.com>
In-Reply-To: <79447d2d8514eb75a5cda1a32d7b25d7fc66e50c.1319090166.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 3/3 v2] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Thu, 20 Oct 2011 07:49:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 10:59 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> Update packages tracking fields including ccache, chkconfig.
>
> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
> ---
>   .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
>   1 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> index abc2cbf..a7c2db5 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -5914,6 +5914,18 @@ RECIPE_LATEST_RELEASE_DATE_pn-gettext = "Jun 06, 2010"
>   RECIPE_LAST_UPDATE_pn-gettext = "May 24, 2011"
>   RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Sep 29, 2011"
>
> +RECIPE_STATUS_pn-ccache = "green"
> +RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan<wenzong.fan@windriver.com>"
> +RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
> +RECIPE_LAST_UPDATE_pn-ccache = "June 24, 2011"
You just updated this package, so this should be today's date
Do you mean theis to be RECIPE_LATEST_RELEASE_DATE of June?  Is that 
when the 3.1.6 tarball was released?

> +RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 11, 2011"
> +
> +RECIPE_STATUS_pn-chkconfig = "green"
> +RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan<wenzong.fan@windriver.com>"
> +RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
> +RECIPE_LAST_UPDATE_pn-chkconfig = "May 24, 2011"
Same as above!

Sau!
> +RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "October 11, 2011"
> +
>   RECIPE_STATUS_pn-pseudo = "green"
>   RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
>   RECIPE_LAST_UPDATE_pn-pseudo = "Jun 06, 2011"



