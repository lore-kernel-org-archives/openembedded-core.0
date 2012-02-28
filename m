Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2SBm-0002Ag-KE
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 19:54:18 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Feb 2012 10:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112346330"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by azsmga001.ch.intel.com with ESMTP; 28 Feb 2012 10:45:49 -0800
Message-ID: <4F4D20DC.2000605@linux.intel.com>
Date: Tue, 28 Feb 2012 10:45:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330371531-28803-1-git-send-email-msm@freescale.com>
In-Reply-To: <1330371531-28803-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH 1/4] multilib.bbclass: allow TARGET_VENDOR_virtclass-multilib to be overriden
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
X-List-Received-Date: Tue, 28 Feb 2012 18:54:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 11:38 AM, Matthew McClintock wrote:
> If we set this bit, we can override the ugly "pokymllib32" to back to
> "poky" (powerpc-pokymllib32-linux-gcc ->  powerpc-poky-linux-gcc). I've
> left this unset by default, but can be set by adding the following:
>
> TARGET_VENDOR_virtclass-multilib-lib32 = "-poky"
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta/classes/multilib.bbclass |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 87d0cd4..61b7765 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -26,7 +26,8 @@ python multilib_virtclass_handler () {
>       e.data.setVar("MLPREFIX", variant + "-")
>       e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
>       e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
> -    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
> +    if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + variant, False) is None:
> +	    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
>       e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
>   }
>

Patches 1, 2, and 4 from this series where pulled into OE-core

Thanks	
	Sau!


