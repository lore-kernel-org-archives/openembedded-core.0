Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUk7V-000485-GG
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:38:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jun 2011 11:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="14284202"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2011 11:34:56 -0700
Message-ID: <4DF11250.7070603@linux.intel.com>
Date: Thu, 09 Jun 2011 11:34:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307405937.git.mark.hatle@windriver.com>
	<0d899ea302e9c441bc9748c71c57b5517526a49a.1307405937.git.mark.hatle@windriver.com>
In-Reply-To: <0d899ea302e9c441bc9748c71c57b5517526a49a.1307405937.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 2/2] distro_tracking_fields.inc: add pseudo
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
X-List-Received-Date: Thu, 09 Jun 2011 18:38:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2011 05:19 PM, Mark Hatle wrote:
> Add pseudo to tracking, with me as the maintainer.
>
> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
> ---
>   .../conf/distro/include/distro_tracking_fields.inc |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> index 73e6782..3452bcc 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -5734,4 +5734,8 @@ RECIPE_COMMENTS_pn-rxvt-unicode = ""
>   RECIPE_LAST_UPDATE_pn-rxvt-unicode = "May 25, 2011"
>   RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold<sgw@linux.intel.com>"
>
> -
> +RECIPE_STATUS_pn-pseudo = "green"
> +RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
> +RECIPE_LAST_UPDATE_pn-pseudo = "June 06, 2011"
> +RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle<mark.hatle@windriver.com>"
> +RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"

Merged into OE-core

Thanks
	Sau!


