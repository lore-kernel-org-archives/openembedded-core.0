Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RvsxE-0005vG-Ea
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:04:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 07:56:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116345779"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 07:56:01 -0800
Message-ID: <4F353E11.6050807@linux.intel.com>
Date: Fri, 10 Feb 2012 07:56:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F33FF4F.2090309@linux.intel.com>
	<1328815824-5541-1-git-send-email-msm@freescale.com>
In-Reply-To: <1328815824-5541-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v2] powerpc64-linux: Update cached autoconf values for libpcap on powerpc64
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
X-List-Received-Date: Fri, 10 Feb 2012 16:04:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 11:30 AM, Matthew McClintock wrote:
> Without this fix, libpcap will fail to build on powerpc64
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
> v2: include filename is patch description
>
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

Merged into OE-core

Thanks
	Sau!


