Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGbE-0001jz-F5
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:06:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Sep 2012 08:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="197977972"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by azsmga001.ch.intel.com with ESMTP; 27 Sep 2012 08:53:10 -0700
Message-ID: <50647666.9040003@linux.intel.com>
Date: Thu, 27 Sep 2012 08:53:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348660520.31293.104.camel@phil-desktop>
In-Reply-To: <1348660520.31293.104.camel@phil-desktop>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk: Remove spurious '-i' in grep command for log_check
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
X-List-Received-Date: Thu, 27 Sep 2012 16:06:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 04:55 AM, Phil Blundell wrote:
> ipk_log_check uses a case-sensitive grep (which is correct) when deciding
> whether there were any errors or not.  But if it decides that there were, it
> then uses a case-insensitive grep to display them.  This results in a large
> amount of irrelevant and confusing output which makes it hard to see the real
> errors amongst the noise.
>
> Suppress this by removing the unwanted -i.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/classes/package_ipk.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index efe299e..59cb856 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -182,7 +182,7 @@ ipk_log_check() {
>   		then
>   			echo "log_check: There were error messages in the logfile"
>   			printf "log_check: Matched keyword: [$keyword_die]\n\n"
> -			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
> +			echo "$lf_txt" | grep -v log_check | grep -C 5 "$keyword_die"
>   			echo ""
>   			do_exit=1
>   		fi
>

Merged into OE-Core

Thanks
	Sau!



