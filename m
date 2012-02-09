Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RvXj3-0002vy-SE
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 18:24:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Feb 2012 09:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104984660"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by azsmga001.ch.intel.com with ESMTP; 09 Feb 2012 09:15:59 -0800
Message-ID: <4F33FF4F.2090309@linux.intel.com>
Date: Thu, 09 Feb 2012 09:15:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328733516-30021-1-git-send-email-msm@freescale.com>
In-Reply-To: <1328733516-30021-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] Update cached autoconf values for libpcap on powerpc64
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
X-List-Received-Date: Thu, 09 Feb 2012 17:24:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 12:38 PM, Matthew McClintock wrote:
> Without this fix, libpcap will fail to build on powerpc64
>
Matthew, can you please resubmit this with the patch file in the commit 
header per the guidelines

more along the lines of:
powerpc64-linux: update cached autoconf value for libpcap

Thanks
	Sau!

> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta/site/powerpc64-linux |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
> index a49c717..2b147d7 100644
> --- a/meta/site/powerpc64-linux
> +++ b/meta/site/powerpc64-linux
> @@ -31,4 +31,5 @@ screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
>   screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
>   screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
>
> -
> +# libpcap
> +ac_cv_linux_vers=${ac_cv_linux_vers=2}


