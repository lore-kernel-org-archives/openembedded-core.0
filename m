Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E65816DF23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 19:17:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2013 11:17:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,835,1378882800"; d="scan'208";a="439276575"
Received: from jbrandeb-mobl.amr.corp.intel.com (HELO [10.255.15.213])
	([10.255.15.213])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2013 11:11:22 -0800
Message-ID: <52A0CFDA.1060906@linux.intel.com>
Date: Thu, 05 Dec 2013 11:11:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Chong.Lu@windriver.com, openembedded-core@lists.openembedded.org
References: <1386224059-29263-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1386224059-29263-1-git-send-email-Chong.Lu@windriver.com>
Subject: Re: [PATCH V2 1/3] lttng-ust: update commit to fix compiling issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 19:17:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2013 10:14 PM, Chong.Lu@windriver.com wrote:
> From: Chong Lu <Chong.Lu@windriver.com>
>
> Update commit in order to add patches like below:
>
> 	doc/examples: error out when a subdir make fails
> 	fix: lttng-gen-tp: add missing spaces around flags
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
> index fed572a..f3a6b05 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
> @@ -18,7 +18,7 @@ RPROVIDES_${PN} = "lttng2-ust"
>   RREPLACES_${PN} = "lttng2-ust"
>   RCONFLICTS_${PN} = "lttng2-ust"
>
> -SRCREV = "9f00ce32b103eed13524c876757b6611c5922382"
> +SRCREV = "e6a8d841217f651e86c8e133e0edbbb667c11055"
>   PV = "2.3.0"
>   PE = "2"
>
>
lttng-ust was updated to 2.3.1, can you update your patches accordingly 
please.

Thanks
	Sau!


