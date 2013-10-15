Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 505BB6CF28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 18:50:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Oct 2013 11:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,501,1378882800"; d="scan'208";a="393368278"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by orsmga001.jf.intel.com with ESMTP; 15 Oct 2013 11:50:07 -0700
Message-ID: <525D8E5F.3020705@linux.intel.com>
Date: Tue, 15 Oct 2013 11:50:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Sujith H <sujith.h@gmail.com>
References: <1381292732-5090-1-git-send-email-sujith.h@gmail.com>
In-Reply-To: <1381292732-5090-1-git-send-email-sujith.h@gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fixing the warning
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
X-List-Received-Date: Tue, 15 Oct 2013 18:50:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2013 09:25 PM, Sujith H wrote:
> Warning: No GNU_HASH in the elf binary
>

The short commit message needs to be in the format similar to
nspr: Add LDFLAGS to TARGET_CC_ARCH to fix Warning

Then more details in the commit message.

Can you give more details about which target this is failing, I am not 
sure we have seen these.

1.5 is complete and will be released shortly.

Thanks
	Sau!

> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>   meta/recipes-support/nspr/nspr_4.10.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/nspr/nspr_4.10.bb b/meta/recipes-support/nspr/nspr_4.10.bb
> index fcecb95..4247fd0 100644
> --- a/meta/recipes-support/nspr/nspr_4.10.bb
> +++ b/meta/recipes-support/nspr/nspr_4.10.bb
> @@ -19,6 +19,7 @@ SRC_URI[sha256sum] = "0cfbe561676b92e5af3ddc7ac77452014e3da8885da66baec811e73541
>   S = "${WORKDIR}/nspr-${PV}/nspr"
>
>   RDEPENDS_${PN}-dev += "perl"
> +TARGET_CC_ARCH += "${LDFLAGS}"
>
>   TESTS = "runtests.pl \
>       runtests.sh \
>

