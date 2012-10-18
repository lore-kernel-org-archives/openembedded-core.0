Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwih-0005qz-K0
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:29:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Oct 2012 13:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="229397754"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2012 13:16:10 -0700
Message-ID: <5080638A.4040206@linux.intel.com>
Date: Thu, 18 Oct 2012 13:16:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1349955886-6399-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1349955886-6399-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] sanity.bbclass: trigger network tests explicitly
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
X-List-Received-Date: Thu, 18 Oct 2012 20:29:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2012 04:44 AM, Bogdan Marinescu wrote:
> The network tests in sanity.bbclass can now be trigerred explicitly
> by firing the NetworkTest event. This is part of the fix for bug #3026.
>
> [YOCTO #3026]
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   meta/classes/sanity.bbclass |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index f2e9a74..3806bc5 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -639,6 +639,9 @@ python check_sanity_eventhandler() {
>           sanity_data.setVar("SANITY_USE_EVENTS", "1")
>           check_sanity(sanity_data)
>           bb.event.fire(bb.event.SanityCheckPassed(), e.data)
> +    elif bb.event.getName(e) == "NetworkTest":
> +        sanity_data = copy_data(e)
> +        bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity(sanity_data) else bb.event.NetworkTestPassed(), e.data)
>
>       return
>   }
>
Merged into OE-Core

Thanks
	Sau!



