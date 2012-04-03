Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCrS-0005zH-FJ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:10:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Apr 2012 16:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84979234"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Apr 2012 16:00:37 -0700
Message-ID: <4F7B8115.4050508@linux.intel.com>
Date: Tue, 03 Apr 2012 16:00:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332958352-12828-1-git-send-email-trini@ti.com>
	<1333041568-29343-1-git-send-email-trini@ti.com>
In-Reply-To: <1333041568-29343-1-git-send-email-trini@ti.com>
Cc: Tom Rini <trini@ti.com>
Subject: Re: [PATCH v3] qemu.inc: Use '+=' for IMAGE_FSTYPES
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
X-List-Received-Date: Tue, 03 Apr 2012 23:10:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2012 10:19 AM, Tom Rini wrote:
> As per
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
> a machine conf file should use '+=' to set IMAGE_FSTYPES.
>
> Signed-off-by: Tom Rini<trini@ti.com>
> ---
>   meta/conf/machine/include/qemu.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 10ab76e..66b0caa 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
>
>   MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
>
> -IMAGE_FSTYPES ?= "tar.bz2 ext3"
> +IMAGE_FSTYPES += "tar.bz2 ext3"
>
>   ROOT_FLASH_SIZE = "280"
>

This is the one that was really merged!  Sorry for the confusion

Sau!


