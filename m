Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOxOg-00064C-HT
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 23:12:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Oct 2012 13:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="157836085"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Oct 2012 13:59:33 -0700
Message-ID: <50806DB3.6050705@linux.intel.com>
Date: Thu, 18 Oct 2012 13:59:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1349992001-3965-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1349992001-3965-1-git-send-email-otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Fix hostname print for 'No changes' case
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
X-List-Received-Date: Thu, 18 Oct 2012 21:12:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2012 02:46 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/classes/buildhistory.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 49f2ea5..0a5753f 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -403,9 +403,9 @@ END
>   		fi
>   		# Check if there are new/changed files to commit (other than metadata-revs)
>   		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
> +		HOSTNAME=`hostname 2>/dev/null || echo unknown`
>   		if [ "$repostatus" != "" ] ; then
>   			git add .
> -			HOSTNAME=`hostname 2>/dev/null || echo unknown`
>   			# porcelain output looks like "?? packages/foo/bar"
>   			# Ensure we commit metadata-revs with the first commit
>   			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
>
Merged into OE-Core

Thanks
	Sau!



