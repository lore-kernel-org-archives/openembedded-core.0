Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4gw-0000mH-4s
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:19:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 21:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="174593049"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2012 21:08:26 -0700
Message-ID: <5008D9BA.6030205@linux.intel.com>
Date: Thu, 19 Jul 2012 21:08:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342704167-16196-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1342704167-16196-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH] Upadate upstream_tracking.inc
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
X-List-Received-Date: Fri, 20 Jul 2012 04:19:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2012 06:22 AM, Radu Moisan wrote:
> Added new info for tinylogin.
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../conf/distro/include/upstream_tracking.inc      |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
> index e795895..98e7d16 100644
> --- a/meta-yocto/conf/distro/include/upstream_tracking.inc
> +++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
> @@ -941,8 +941,9 @@ CHECK_DATE_pn-tiff = "Feb 27, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-time = "1.7"
>   RECIPE_UPSTREAM_DATE_pn-time = "Jul 01, 1996"
>   RECIPE_UPSTREAM_VERSION_pn-tinylogin = "1.4"
> -CHECK_DATE_pn-tinylogin = "Dec 24, 2011"
> +CHECK_DATE_pn-tinylogin = "Jul 19, 2012"
>   RECIPE_UPSTREAM_DATE_pn-tinylogin = "Jan 03, 2003"
> +RECIPE_NO_UPDATE_REASON_pn-tinylogin = "TinyLogin was merged into BusyBox."
>   RECIPE_UPSTREAM_DATE_pn-trace-cmd = "Nov 7, 2011"
>   RECIPE_UPSTREAM_VERSION_pn-transfig = "3.2.5d"
>   RECIPE_UPSTREAM_DATE_pn-transfig = "Jul 23, 2010"
>

Merged into Poky/Master

In the future changes to meta-yocto should go to poky@yoctoproject.org

Thanks
	Sau!


