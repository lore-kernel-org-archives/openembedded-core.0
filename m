Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QnwV4-0000fu-3Q
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:41:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2011 10:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,301,1309762800"; d="scan'208";a="34607923"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2011 10:37:36 -0700
Message-ID: <4E36E45F.4010307@linux.intel.com>
Date: Mon, 01 Aug 2011 10:37:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311708150-24226-1-git-send-email-msm@freescale.com>
	<1311708150-24226-2-git-send-email-msm@freescale.com>
In-Reply-To: <1311708150-24226-2-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>, openembedded-core@openembedded.org
Subject: Re: [PATCH] Update TERMCMD message to align with previous change
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
X-List-Received-Date: Mon, 01 Aug 2011 17:41:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2011 12:22 PM, Matthew McClintock wrote:
> A previous patch changed the default TERM to use xterm. This updates
> local.conf.sample to match the change
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta-yocto/conf/local.conf.sample |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
> index 499c48e..7a0fc89 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -205,7 +205,7 @@ ENABLE_BINARY_LOCALE_GENERATION = "1"
>   # out if that is desired
>   NO32LIBS = "1"
>
> -# If you do not use (or have installed) gnome-terminal you will need to
> +# If you do not use (or have installed) xterm you will need to
>   # uncomment these variables and set them to the terminal you wish to use
>   # when resolving patches which cannot be applied
>   # Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:

This patch was merged.

Thanks
	Sau!


