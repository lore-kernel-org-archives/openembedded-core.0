Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24O1-0007sN-Vw
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:01:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2012 10:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181588929"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2012 10:49:20 -0700
Message-ID: <502D32A0.301@linux.intel.com>
Date: Thu, 16 Aug 2012 10:49:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CABcZANmT9RqSX=sBfzoBtVFcU5B+5wxA=FOVDP_rOVgE39YEvw@mail.gmail.com>
	<1343925909-7363-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1343925909-7363-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFCv3] bitbake.conf: store cooker logs in subdirectory of LOG_DIR
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
X-List-Received-Date: Thu, 16 Aug 2012 18:01:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2012 09:45 AM, Martin Jansa wrote:
> * we should probably wait until
>    http://git.openembedded.org/bitbake/commit/?id=1e06d8012868ba5a31503dc99cbf18570be629d9
>    is in next required bitbake version, but error message if the directory doesn't exist is quite clear
> * people with new enough bitbake could just change this in their local.conf
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/conf/bitbake.conf |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d5a43e9..8074684 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -753,8 +753,8 @@ DISTRO[unexport] = "1"
>   # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
>   TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
>
> -# Complete output from bitbake, if you're changing it, make sure to use existing directory
> -BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
> +# Complete output from bitbake
> +BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
>
>   # Setup our default hash policy
>   BB_SIGNATURE_HANDLER ?= "OEBasicHash"
>
Merged into OE-Core

Thanks
	Sau!



