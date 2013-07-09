Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DDAB760846
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 22:43:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2013 15:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1031,1363158000"; d="scan'208";a="367691896"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2013 15:43:26 -0700
Message-ID: <51DC920E.1040305@linux.intel.com>
Date: Tue, 09 Jul 2013 15:43:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <e01e4656b562f087f270dc1134e7501c8f6b169b.1373408128.git.dvhart@linux.intel.com>
In-Reply-To: <e01e4656b562f087f270dc1134e7501c8f6b169b.1373408128.git.dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] alsa-state: Provide an empty asound.conf by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jul 2013 22:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2013 03:15 PM, Darren Hart wrote:
> An empty asound.conf should work for most cases. The existing asound.conf
> uses plug dmix which causes arecord to fail without a special -D device
> specification on the command line (as no capture device is defined).
>
> Clear asound.conf for the default case. Any needed changes should be
> made in the BSP layers.
>
Does there need to be any corresponding change for the meta-yocto-bsps?


Sau!


> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   meta/recipes-bsp/alsa-state/alsa-state/asound.conf | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
> index 6be0242..03653cf 100644
> --- a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
> +++ b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
> @@ -1,12 +1 @@
> -# default dmix configuration
> -
> -pcm.!default {
> -    type plug
> -    slave.pcm "dmix"
> -}
> -
> -ctl.mixer0 {
> -    type hw
> -    card 0
> -}
> -
> +# Global alsa-lib configuration
>

