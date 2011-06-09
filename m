Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUk9j-0004ey-Pl
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:40:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jun 2011 11:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="14285483"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2011 11:37:14 -0700
Message-ID: <4DF112DA.1010707@linux.intel.com>
Date: Thu, 09 Jun 2011 11:37:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307406014.git.mark.hatle@windriver.com>
	<15dc7d03abd73179735de93624ec8453f36aed8b.1307406014.git.mark.hatle@windriver.com>
In-Reply-To: <15dc7d03abd73179735de93624ec8453f36aed8b.1307406014.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 3/3] create-pull-request: Add URL documentation
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
X-List-Received-Date: Thu, 09 Jun 2011 18:40:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2011 05:21 PM, Mark Hatle wrote:
> If we can't find the URL, tell the user how to correct the issue.
>
> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
> ---
>   scripts/create-pull-request |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index d52098e..7d021d3 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -94,6 +94,9 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
>   		REMOTE_URL=$(git config remote.$REMOTE.url)
>   		if [ $? -ne 0 ]; then
>   			echo "ERROR: git config failed to find a url for '$REMOTE'"
> +			echo
> +			echo "To add a remote url for $REMOTE, use:"
> +			echo "  git config remote.$REMOTE.url<url>"
>   			exit 1
>   		fi
>

Merged into OE-Core

Thanks
	Sau!


