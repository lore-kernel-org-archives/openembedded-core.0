Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2lL-0003xN-Np
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:20:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Oct 2012 08:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="159854852"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Oct 2012 08:07:27 -0700
Message-ID: <5088042E.8040603@linux.intel.com>
Date: Wed, 24 Oct 2012 08:07:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <1350478441-10596-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1350478441-10596-1-git-send-email-marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow-securetty: add ARM AMBA serial ports
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
X-List-Received-Date: Wed, 24 Oct 2012 15:20:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2012 05:54 AM, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/recipes-extended/shadow/files/securetty             |    6 ++++++
>   meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb |    2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
> index a06dc44..467fc04 100644
> --- a/meta/recipes-extended/shadow/files/securetty
> +++ b/meta/recipes-extended/shadow/files/securetty
> @@ -8,6 +8,12 @@ ttyS1
>   ttyS2
>   ttyS3
>
> +# ARM AMBA SoCs
> +ttyAMA0
> +ttyAMA1
> +ttyAMA2
> +ttyAMA3
> +
>   # Samsung ARM SoCs
>   ttySAC0
>   ttySAC1
> diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> index 40b52a9..86b5c89 100644
> --- a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>
>   INHIBIT_DEFAULT_DEPS = "1"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "file://securetty"
>
>

Merged into OE-Core

Thanks
	Sau!


