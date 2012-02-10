Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvsze-00062S-6h
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:06:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2012 07:58:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="108720707"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2012 07:58:29 -0800
Message-ID: <4F353EA5.6020205@linux.intel.com>
Date: Fri, 10 Feb 2012 07:58:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328735214-1899-1-git-send-email-msm@freescale.com>
In-Reply-To: <1328735214-1899-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] distutils.bbclass: override LDSHARED so we use the linker for this build and not the one used in sstate-cache
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
X-List-Received-Date: Fri, 10 Feb 2012 16:06:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 01:06 PM, Matthew McClintock wrote:
> Without this fix, when packages are being built using distutils and
> the python packages were deployed from sstate-cache is it possible
> that the LD command will contain an invalid sysroot override.
>
> We can fix this by always exported LDSHARED, which is the env var
> that distutil looks for to override creating shared libraries.
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta/classes/distutils.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index 79b962a..18ae805 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -72,3 +72,5 @@ distutils_do_install() {
>   }
>
>   EXPORT_FUNCTIONS do_compile do_install
> +
> +export LDSHARED="${CCLD} -shared"

Merged into OE-core

Thanks
	Sau!


