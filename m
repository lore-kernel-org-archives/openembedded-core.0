Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 553B66B669
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:28:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Aug 2013 13:28:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,879,1367996400"; d="scan'208";a="346459954"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by azsmga001.ch.intel.com with ESMTP; 14 Aug 2013 13:28:20 -0700
Message-ID: <520BE863.2050608@linux.intel.com>
Date: Wed, 14 Aug 2013 13:28:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1376511209-11508-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1376511209-11508-1-git-send-email-mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] prelink: update to latest cross-prelink
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
X-List-Received-Date: Wed, 14 Aug 2013 20:28:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2013 01:13 PM, Mark Hatle wrote:
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/recipes-devtools/prelink/prelink_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index ae9931f..4d49026 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -8,7 +8,7 @@ and executables, so that far fewer relocations need to be resolved at \
>   runtime and thus programs come up faster."
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> -SRCREV = "4e313edb125db215d4c456ce62c74ee16841a365"
> +SRCREV = "6822ec76aa95f278195aeae59d4868ef224d7e4d"
>   PV = "1.0+git${SRCPV}"
>   PR = "r0"

Can you drop the PR please, we are trying to purge them when we can.

Thanks
	Sau!


>

