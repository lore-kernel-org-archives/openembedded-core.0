Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHSK-0005mE-8X
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:09:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2012 09:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120399484"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 09:57:49 -0700
Message-ID: <4FFB0D8C.50702@linux.intel.com>
Date: Mon, 09 Jul 2012 09:57:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341516191-31573-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341516191-31573-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] utils.bbclass: add helper function to add all multilib variants of a specific package
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
X-List-Received-Date: Mon, 09 Jul 2012 17:09:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 12:23 PM, Matthew McClintock wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> This is useful for the scenario where we want to add 'gcc' to
> the root file system for all multilib variants
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> RP was the author of this patch via pastebin only... I thought
> I would properly attribute it to him
>
>   meta/classes/utils.bbclass |    9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index fde8f44..cc3acfa 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -351,6 +351,15 @@ def extend_variants(d, var, extend, delim=':'):
>   			variants.append(eext[1])
>   	return " ".join(variants)
>
> +def multilib_pkg_extend(d, pkg):
> +	variants = (d.getVar("MULTILIB_VARIANTS", True) or "").split()
> +	if not variants:
> +	    return pkg
> +	pkgs = pkg
> +	for v in variants:
> +	    pkgs = pkgs + " " + v + "-" + pkg
> +	return pkgs
> +
>   def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
>   	"""Return a string of all ${var} in all multilib tune configuration"""
>   	values = []
>

Merged this along with the MakeMaker patch

Thanks
	Sau!




