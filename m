Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaF7k-0008C4-Nx
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 00:17:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2011 15:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="85784121"
Received: from unknown (HELO [10.255.12.64]) ([10.255.12.64])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2011 15:10:36 -0800
Message-ID: <4EE689EB.70203@linux.intel.com>
Date: Mon, 12 Dec 2011 15:10:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323532392-15760-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1323532392-15760-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH] scripts/send-pull-request: fix typo
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
X-List-Received-Date: Mon, 12 Dec 2011 23:17:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2011 07:53 AM, Otavio Salvador wrote:
> s/No cover letter will be send./No cover letter will be sent./
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   scripts/send-pull-request |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 8d51ce2..09f4245 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -118,7 +118,7 @@ if [ -e $PDIR/0000-cover-letter.patch ]; then
>   		fi
>   	done
>   else
> -	echo "WARNING: No cover letter will be send."
> +	echo "WARNING: No cover letter will be sent."
>   fi
>
>   # Harvest emails from the generated patches and populate AUTO_CC.

Merged into OE-Core

Thanks
	Sau!


