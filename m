Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1USt36-0003tU-N1
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 19:55:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Apr 2013 10:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,503,1363158000"; d="scan'208";a="228918711"
Received: from unknown (HELO [10.255.14.2]) ([10.255.14.2])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Apr 2013 10:37:33 -0700
Message-ID: <51702F5D.8000603@linux.intel.com>
Date: Thu, 18 Apr 2013 10:37:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1366300894-32484-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1366300894-32484-1-git-send-email-laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xf86-config: set DefaultDepth to 16 for qemumips
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
X-List-Received-Date: Thu, 18 Apr 2013 17:55:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2013 09:01 AM, Laurentiu Palcu wrote:
> Apparently, the default qemumips color depth was set to 8 and the colors were not
> displayed properly. cirrusfb driver doensn't seem to accept color depth
> as a kernel parameter, so we have to do it here.
>
> [YOCTO #4340]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

This make the image look much better!

Tested-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../xserver-xf86-config/qemumips/xorg.conf         |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
> index 629ae21..e6c8b51 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
> @@ -54,6 +54,7 @@ Section "Screen"
>       Identifier    "Default Screen"
>       Device        "Graphics Controller"
>       Monitor        "Generic Monitor"
> +    DefaultDepth  16
>       SubSection "Display"
>           Modes     "640x480"
>       EndSubSection
>


